@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xsim test_clt_behav -key {Behavioral:sim_1:Functional:test_clt} -tclbatch test_clt.tcl -view C:/Users/ece/Desktop/midsem/CLT_project/test_clt_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
