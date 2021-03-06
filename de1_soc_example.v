
// The top-level Verilog file for de1_soc_example
// This code was initially generated by Terasic System Builder

module de1_soc_example(

         //////////// ADC //////////
         output ADC_CONVST,
         output ADC_DIN,
         input ADC_DOUT,
         output ADC_SCLK,

         //////////// CLOCK //////////
         input CLOCK_50,
         input CLOCK2_50,
         input CLOCK3_50,
         input CLOCK4_50,

         //////////// SEG7 //////////
         output [ 6: 0 ] HEX0,
         output [ 6: 0 ] HEX1,
         output [ 6: 0 ] HEX2,
         output [ 6: 0 ] HEX3,
         output [ 6: 0 ] HEX4,
         output [ 6: 0 ] HEX5,

         //////////// KEY //////////
         input [ 3: 0 ] KEY,

         //////////// LED //////////
         output [ 9: 0 ] LEDR,

         //////////// SW //////////
         input [ 9: 0 ] SW,

         //////////// VGA //////////
         output [ 7: 0 ] VGA_B,
         output VGA_BLANK_N,
         output VGA_CLK,
         output [ 7: 0 ] VGA_G,
         output VGA_HS,
         output [ 7: 0 ] VGA_R,
         output VGA_SYNC_N,
         output VGA_VS,

         //////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
         inout [ 35: 0 ] GPIO_0,

         //////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
         inout [ 35: 0 ] GPIO_1
       );

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [ 3: 0 ] hex_lowers;
wire hex_blink_lower;

//=======================================================
//  Structural coding
//=======================================================

// Send out the desired visible signals
assign LEDR = SW;
// Active low translation for lighting segments
assign { HEX3[ 3 ], HEX2[ 3 ], HEX1[ 3 ], HEX0[ 3 ] } = ~hex_lowers;
// HEX4 will have its lower segment lit, still
assign HEX4[ 3 ] = 1'b0;
assign HEX5[ 3 ] = hex_blink_lower;

// Turn off the unused 7-segment display segments
assign { HEX0[ 6: 4 ], HEX0[ 2: 0 ] } = ~6'b0;
assign { HEX1[ 6: 4 ], HEX1[ 2: 0 ] } = ~6'b0;
assign { HEX2[ 6: 4 ], HEX2[ 2: 0 ] } = ~6'b0;
assign { HEX3[ 6: 4 ], HEX3[ 2: 0 ] } = ~6'b0;
assign { HEX4[ 6: 4 ], HEX4[ 2: 0 ] } = ~6'b0;
assign { HEX5[ 6: 4 ], HEX5[ 2: 0 ] } = ~6'b0;

logic_demo demonstration(
             .in_values( KEY ),
             .out_values( hex_lowers )
           );
counter blink(
          .clk( CLOCK_50 ),
          .counter_msb( hex_blink_lower ),
          .counter_internal_byte( GPIO_0[ 7: 0 ] )
        );
endmodule
