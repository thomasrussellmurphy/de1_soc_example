module counter(
         input clk,
         output counter_msb,
         output [ 7: 0 ] counter_internal_byte
       );

reg [ 22: 0 ] internal_counter = 23'b0;

assign counter_msb = internal_counter[ 22 ];
assign counter_internal_byte = internal_counter[ 10: 2 ];

always @( posedge clk ) begin
  internal_counter <= internal_counter + 1'b1;
end

endmodule
