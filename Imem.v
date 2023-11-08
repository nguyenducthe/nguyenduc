module Imem(
    input [9:0] pc,
	 input clock_i,
	 input reset_ni,
    output reg [31:0] instr
);

reg [31:0] ROM [1023:0];

always @(posedge clock_i)
	begin
	if(reset_ni == 1)
		instr <= 0;
    else
	    instr <= ROM [pc];
	 end
`ifdef VERILATOR
 initial
	begin
       $readmemh("../mem/instmem.data.sim", ROM);
	end
 `else
  initial begin
  $readmemh("../mem/instmem.data.kit", ROM);
  end
  `endif

endmodule
