


VERILOGFILES := $(wildcard top/xtrxr5/xtrxr5.gen/sources_1/ip/pcie_7x_0/source/*.v)\
				top/xtrxr5/xtrxr5/xtrxr5.gen/sources_1/ip/pcie_7x_0/pcie_7x_0_stub.v\
				$(wildcard lib/*/*.v)\
				top/xtrxr5/xlnx_lms7_lml_phy.v\
				top/xtrxr5/xlnx_pcie_clocking.v\
				top/xtrxr5/xtrxr4_top.v

TOP ?= xtrxr4_top
FAMILY ?= xc7
SYNTH_FLAGS ?= -family $(FAMILY) -top $(TOP) 

YOSYS_READ_VERILOG ?= read_verilog -sv -DNO_PPS=1 -DNO_GTIME=1 -DNO_SMART_CARD=1 #-noassert -noassume -norestrict -defer

synth: 
	yosys -p '$(YOSYS_READ_VERILOG) -Ilib/xtrx $(VERILOGFILES); synth_xilinx $(SYNTH_FLAGS) -blif build/$(TOP).blif'


.PHONY: synth