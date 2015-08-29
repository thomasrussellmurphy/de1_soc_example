module counter(
         input clk,
         output counter_msb
       );

reg [ 22: 0 ] internal_counter = 23'b0;

assign counter_msb = internal_counter[ 22 ];

always @( posedge clk ) begin
  internal_counter <= internal_counter + 1'b1;
end

endmodule
