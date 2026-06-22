MAKEFILE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SILVERPATH = $(MAKEFILE_DIR)/../../../SILVER

all: 
	cd $(SILVERPATH); ./bin/verify --verilog 1 --verilog-libname NANG45 --verilog-design_file $(MAKEFILE_DIR)/netlists/SQ_2SHARE_SILVERWRAP.v --verilog-module_name SQ_2SHARE_SILVERWRAP --insfile ins2.nl
	cd $(SILVERPATH); ./bin/verify --verilog 1 --verilog-libname NANG45 --verilog-design_file $(MAKEFILE_DIR)/netlists/SQ_3SHARE_SILVERWRAP.v --verilog-module_name SQ_3SHARE_SILVERWRAP --insfile ins3.nl
	cd $(SILVERPATH); ./bin/verify --verilog 1 --verilog-libname NANG45 --verilog-design_file $(MAKEFILE_DIR)/netlists/SQ_4SHARE_SILVERWRAP.v --verilog-module_name SQ_4SHARE_SILVERWRAP --insfile ins4.nl