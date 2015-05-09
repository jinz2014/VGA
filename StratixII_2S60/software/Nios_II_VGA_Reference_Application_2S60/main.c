
#include <stdio.h>
#include <sys/alt_alarm.h>
#include "system.h"
#include "alt_types.h"
#include "vga_controller.h"
#include "sys/alt_cache.h"
#include "graphics_lib/simple_graphics.h"
#include "vga_example.h"
#include "io.h"

int main()
{
  // VGA Device
  vga_controller_dev* vga;
 
  // VGA frame buffer
  display_frame_buffer_struct* vga_frame_buffer;

  printf("+-----------------------------------------+\n");
  printf("| Nios II VGA Controller Reference Design |\n");
  printf("+-----------------------------------------+\n");

  // Open the VGA controller peripheral and allocate the frame buffers on the heap.
  printf(" - Initializing VGA controller.\n");
  vga = (vga_controller_dev*)alt_vga_open_dev("/dev/vga_controller");
  vga_frame_buffer = vga_init_no_interrupt( vga, HEAP );
  
  // Run the cube rotation routine.    
  run_rotate( vga_frame_buffer );
  
  exit(1);
  return 0;
}

// Rotate a point in three dimentions on three axises
void rotate_point_deg( point_3d_struct* in_point, 
                       short rotx, short roty, short rotz, 
                       point_3d_struct axis_unit[3], 
                       point_3d_struct* out_point)
{
  point_3d_struct temp_point[3];
  
  rotate_point( in_point, rotx, &(axis_unit[0]), &(temp_point[0]) );
  rotate_point( &(temp_point[0]), roty, &(axis_unit[1]), &(temp_point[1]) );
  rotate_point( &(temp_point[1]), rotz, &(axis_unit[2]), out_point );
  
}

// Rotate a point in three dimentions on one axis
void rotate_point( point_3d_struct* in_point, int angle, point_3d_struct* r, point_3d_struct* out_point)
{
   short int_cos_angle, int_sin_angle;
   
   out_point->x = 0;
   out_point->y = 0;
   out_point->z = 0;
   int_cos_angle = int_cos(angle);
   int_sin_angle = int_sin(angle);

   out_point->x += (int_cos_angle + (((((1024 - int_cos_angle) * r->x)>>10) * r->x)>>10)) * in_point->x;
   out_point->x += ((((1024 - int_cos_angle) * r->x * r->y)>>20) - ((r->z * int_sin_angle)>>10)) * in_point->y;
   out_point->x += ((((1024 - int_cos_angle) * r->x * r->z)>>20) + ((r->y * int_sin_angle)>>10)) * in_point->z;
   out_point->x = out_point->x >> 10;

   out_point->y += ((((1024 - int_cos_angle) * r->x * r->y)>>20) + ((r->z * int_sin_angle)>>10)) * in_point->x;
   out_point->y += (int_cos_angle + (((((1024 - int_cos_angle) * r->y)>>10) * r->y)>>10)) * in_point->y;
   out_point->y += ((((1024 - int_cos_angle) * r->y * r->z)>>20) - ((r->x * int_sin_angle)>>10)) * in_point->z;
   out_point->y = out_point->y >> 10;

   out_point->z += ((((1024 - int_cos_angle) * r->x * r->z)>>20) - ((r->y * int_sin_angle)>>10)) * in_point->x;
   out_point->z += ((((1024 - int_cos_angle) * r->y * r->z)>>20) + ((r->x * int_sin_angle)>>10)) * in_point->y;
   out_point->z += (int_cos_angle + (((((1024 - int_cos_angle) * r->z)>>10) * r->z)>>10)) * in_point->z;
   out_point->z = out_point->z >> 10;

   return;
}

// Integer sin lookup
int int_sin( int deg )
{
  deg %= 360;
  if( deg < 0 )
    deg += 360;
  
  return(int_sin_array[deg]);
}

// Integer cos lookup
int int_cos( int deg )
{
  deg %= 360;
  if( deg < 0 )
    deg += 360;
  
  return(int_cos_array[deg]);
}

// Rotate the 8 points of a cube
void rotate_cube_points( point_3d_struct base_cube[8],
                         point_3d_struct rotated_cube[8],
                         point_3d_struct axis_unit[3],
                         short rotx, short roty, short rotz )
{
  alt_8 i;
  
  for( i = 0; i < 8; i++ )
  {
    rotate_point_deg( &(base_cube[i]), rotx, roty, rotz, axis_unit, &(rotated_cube[i]) );
  }
}

// Draw a cube with solid sides
void draw_filled_cube( point_3d_struct cube[8], 
                int color,
                display_frame_buffer_struct* vga_frame_buffer )
{
  
  triangle_struct tri[12];
  alt_8 sorted[12] = {0,1,2,3,4,5,6,7,8,9,10,11};
  
  alt_8 i, j;
  alt_8 temp;
  
  static unsigned int cube_side_color[3] = {RED_16, GREEN_16, BLUE_16};
  
  // Project each point of the cube to 2D
  for( i = 0; i < 8; i++ )
  {
    project( &cube[i], DISTANCE, vga_frame_buffer );
  }

  // plot the triangles that make up the sides
  for( i = 0; i < 12; i++ )
  {
    tri[i].vertex_x[0] = cube[cube_tris[i][0]].screen_x;
    tri[i].vertex_y[0] = cube[cube_tris[i][0]].screen_y;
    tri[i].vertex_x[1] = cube[cube_tris[i][1]].screen_x;
    tri[i].vertex_y[1] = cube[cube_tris[i][1]].screen_y;
    tri[i].vertex_x[2] = cube[cube_tris[i][2]].screen_x;
    tri[i].vertex_y[2] = cube[cube_tris[i][2]].screen_y;
    tri[i].center_z = (cube[cube_tris[i][0]].z +
                       cube[cube_tris[i][1]].z +
                       cube[cube_tris[i][2]].z ) / 3;
    tri[i].fill = DO_FILL;
  }

  // Make cube three colors.
  for( i = 0; i < 4; i++ )
  {
    tri[i].col = color & cube_side_color[0];
    tri[i+4].col = color & cube_side_color[1];
    tri[i+8].col = color & cube_side_color[2];
  }
  
  
  // Sort triangles by z center.  This lets us know which ones are in the foreground
  for( i = 0; i < 12-2; i+=2 )
  {
    for( j = i+2; j < 12; j+=2 )
    {
      short square_center_z_j = (tri[sorted[j]].center_z + tri[sorted[j+1]].center_z) / 2;
      short square_center_z_i = (tri[sorted[i]].center_z + tri[sorted[i+1]].center_z) / 2;
      if( square_center_z_j < square_center_z_i )
      {
        temp = sorted[i];
        sorted[i] = sorted[j];
        sorted[j] = temp;
        temp = sorted[i+1];
        sorted[i+1] = sorted[j+1];
        sorted[j+1] = temp;
      }
    }
  } 
  
  // Display the closest 6 triangles.  The others are hidden anyway, so dont draw them
  for( i = 5; i >= 0; i-- )
  {
    vid_draw_triangle( &tri[sorted[i]], vga_frame_buffer );
  }
}
  
// Draw a cube with just lines. 
void draw_cube_skeleton( point_3d_struct cube[8], 
                int color,
                display_frame_buffer_struct* vga_frame_buffer )
{
  alt_8 i;
  
  // Project each point of the cube to 2D
  for( i = 0; i < 8; i++ )
  {
    project( &cube[i], DISTANCE, vga_frame_buffer );
  }

  // Draw each edge of the cube (it has 12)
  for( i = 0; i < 12; i++ )
  {
    vid_draw_line( cube[cube_lines[i][0]].screen_x,
                   cube[cube_lines[i][0]].screen_y,
                   cube[cube_lines[i][1]].screen_x,
                   cube[cube_lines[i][1]].screen_y,
                   1, color , vga_frame_buffer);
  }
}

// Increase or decrease the size of a cube
int resize_cube( point_3d_struct cube[8], int magnitude )
{
  alt_8 i;
  
  // Define the 8 points of a cube
  for(i = 0; i < 8; i++ )
  {
    cube[i].x += (((i >> 0) & 0x1) * 2 * magnitude) + (-magnitude);
    cube[i].y += (((i >> 1) & 0x1) * 2 * magnitude) + (-magnitude);
    cube[i].z += (((i >> 2) & 0x1) * 2 * magnitude) + (-magnitude);
  }
  return 0;
}

// Run the cube rotation algorithm
void run_rotate( display_frame_buffer_struct* vga_frame_buffer )
{
  alt_8 i, j;
  int x, y, z;
  short rotx = 0, roty = 0, rotz = 0;

  point_3d_struct base_cube[8];
  point_3d_struct cube[3][8];
  point_3d_struct axis_unit[3];
  point_3d_struct base_axis_unit_vector;
  
  int ticks_now, msec_passed;
  int last_ticks = 0;
  int frames = 0;

  char frame_count_text[500];
  
  // Start things off
  alt_8 cube_to_draw = 0;
  alt_8 cube_to_erase = 1;
    
  // Define unit vectors for each axis x,y,z.
  axis_unit[0].x = 1024;
  axis_unit[0].y = 0;
  axis_unit[0].z = 0;
  
  axis_unit[1].x = 0;
  axis_unit[1].y = 1024;
  axis_unit[1].z = 0;
  
  axis_unit[2].x = 0;
  axis_unit[2].y = 0;
  axis_unit[2].z = 1024;
  
  base_axis_unit_vector.x = 1024;
  base_axis_unit_vector.y = 0;
  base_axis_unit_vector.z = 0;
  
  // Define the 8 points of a cube
  printf(" - Creating Cube.\n");
  for(i = 0; i < 8; i++ )
  {
    x = (((i >> 0) & 0x1) * 2 * SIDE_LENGTH) + (-SIDE_LENGTH);
    y = (((i >> 1) & 0x1) * 2 * SIDE_LENGTH) + (-SIDE_LENGTH);
    z = (((i >> 2) & 0x1) * 2 * SIDE_LENGTH) + (-SIDE_LENGTH);
    base_cube[i].x = x;     
    base_cube[i].y = y;    
    base_cube[i].z = z;
    for ( j = 0; j < 3; j++ )
    {
      cube[j][i].x = x;
      cube[j][i].y = y;
      cube[j][i].z = z;
    }
  }

  // Display Title at top of screen for both frame buffers
  for( i = 0; i < 2; i++ )
  {
    vid_print_string( TITLE_X, TITLE_Y, WHITE_16, cour10_font, vga_frame_buffer, "Nios II VGA Controller Reference Design" );
    vid_draw_box( TITLE_X - 15, TITLE_Y - 10, TITLE_X + 330, TITLE_Y + 20, BLUE_16, DO_NOT_FILL, vga_frame_buffer);

    // Flip the frame buffers.
    vga_flip_frame_buffers( vga_frame_buffer );
  }
  

  printf(" - Starting Cube Rotation.\n");
    while(1)
  {
    // Erase the last cube that was drawn in this buffer
    draw_filled_cube( cube[cube_to_erase], BLACK_16, vga_frame_buffer );

    // Keep track of time for calculating rotational speed
    ticks_now = alt_nticks();
    msec_passed = ( 1024 * (ticks_now - last_ticks)) / (alt_ticks_per_second());
    last_ticks = ticks_now; 
    
    // Move the axis of rotation at a constant rate
    rotx = (rotx + ((73 * msec_passed) / 1024)) % 360;
    roty = (roty + ((123 * msec_passed) / 1024)) % 360;
    rotz = (rotz + ((91 * msec_passed) / 1024)) % 360;
    
    // Rotate a new cube
    rotate_cube_points( base_cube, cube[cube_to_draw], axis_unit, rotx, roty, rotz );
      
    // And draw it
    draw_filled_cube( cube[cube_to_draw], WHITE_24, vga_frame_buffer );
      
   frames++;

    // Flip the double buffers.
    vga_flip_frame_buffers( vga_frame_buffer );

    // keep track of our old cubes so we can erase them when we get 
    // back around to that frame
    cube_to_draw = (( cube_to_draw + 1 ) % 3 );
    cube_to_erase = (( cube_to_erase + 1 ) % 3 );
    
    // Wait until frame being displayed is done so we dont write to it
    // at the same time.
    while( IORD_32DIRECT( vga_frame_buffer->vga_controller_base, 0xC ) != 
                         (int)vga_frame_buffer->frame0 );
  }
}

// Project a 3D point onto 2D space
void project(point_3d_struct* point, int dist, display_frame_buffer_struct* vga_fb) {

  // Prevent a divide by zero
  if(point->z == 0)
  { 
    // Project the point  
    point->screen_x = point->x + (vga_fb->width / 2);
    point->screen_y = -point->y + (vga_fb->height / 2);
  }
  else
  {
    // Project the point  
    point->screen_x = ((point->x * dist) / (point->z + dist)) + (vga_fb->width / 2);
    point->screen_y = -((point->y * dist) / (point->z + dist)) + (vga_fb->height / 2);
  }
}
