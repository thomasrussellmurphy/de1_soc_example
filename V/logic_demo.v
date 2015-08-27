// A simple demonstration of Verilog features and logic
module logic_demo(
         input [ 3: 0 ] in_values,
         output [ 3: 0 ] out_values
       );
// Temporary register for logic assignment
reg [ 2: 0 ] temp;

// Continuous assignment of logic values
assign out_values[ 0 ] = in_values[ 0 ] & in_values[ 1 ];
assign out_values[ 3: 1 ] = temp;

// Behavioral implomentation of the remaining logic
always @( * ) begin
  temp[ 0 ] = in_values[ 2 ] | ~in_values[ 1 ];
  temp[ 2: 1 ] = { in_values[ 3 ] , in_values[ 2 ] ^ ~in_values[ 0 ] };
end

endmodule
