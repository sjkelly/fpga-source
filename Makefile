

VERILOGDEFINES := lib/xtrx/xtrxll_regs.vh
VERILOGFILES := $(wildcard lib/*/*.v)\
				top/xtrxr5/xlnx_lms7_lml_phy.v\
				top/xtrxr5/xlnx_pcie_clocking.v\
				top/xtrxr5/xtrxr4_top.v


YOSYS_READ_VERILOG ?= read_verilog -sv #-noassert -noassume -norestrict -defer

synth: 
	yosys -p '$(YOSYS_READ_VERILOG) -Ilib/xtrx $(VERILOGFILES)'


.PHONY: synth