

VERILOGDEFINES := lib/xtrx/xtrxll_regs.vh
VERILOGFILES := $(wildcard lib/*/*.v)\
				top/xtrxr5/xlnx_lms7_lml_phy.v\
				top/xtrxr5/xlnx_pcie_clocking.v\
				top/xtrxr5/xtrxr4_top.v

SYNTH_FLAGS ?= 
TOP ?= xtrxr4_top
FAMILY ?= xc7

YOSYS_READ_VERILOG ?= read_verilog -sv #-noassert -noassume -norestrict -defer

synth: 
	yosys -p '$(YOSYS_READ_VERILOG) -Ilib/xtrx $(VERILOGFILES); synth_xilinx -top $(TOP) $(SYNTH_FLAGS) -blif build/$(TOP).blif'


.PHONY: synth