SIM = xrun## default sim

FILE_LIST_PATH := ../filelist.f		## file path
XRUN_TCL_PATH := ../run.tcl		## xrun tcl patch

################
OPTION_XRUN := -64bit -sv -notimingcheck -access +rwc -accessreg +rwc -debug -uvmlinedebug -classlinedebug -plidebug -fsmdebug -uvmaccess -date -dumpstack -negdelay -timescale 1ns/100ps -lwdgen -f $(FILE_LIST_PATH) -input $(XRUN_TCL_PATH) -l xrun.log


OPTION_VCS := -f $(FILE_LIST_PATH)	\
	-timescale=1ns/1ps	\
	+define+DUMP	\
	-fsdb -R -full64 +vc +v2k -sverilog -debug_acc+all	\
	-debug_region+cell+encrypt	\
	-P ${LD_LIBRARY_PATH}/novas.tab  ${LD_LIBRARY_PATH}/pli.a | tee  vcs.log &

OPTION_Verdi := -f $(FILE_LIST_PATH) -ssf *.fsdb &
################


sim	:
	@echo "Welcome!"
ifeq ($(SIM),xrun)
	@echo "SIM is $(SIM) and dubug support indago"
	@cd ./xrun && rm -rf *
	@cd ./xrun && xrun $(OPTION_XRUN)
else
    ifeq ($(SIM),vcs)
	@echo "SIM is $(SIM) and dubug support verdi"
	@cd ./vcs && rm -rf *
	@cd ./vcs && vcs $(OPTION_VCS)
     else
	@echo "SIM is $(SIM) and it not support now"
     endif
endif


indago	:
	@echo "Debug is indago"
	@cd ./xrun && indago
	@echo "Welcom indago !"

verdi	:
	@echo "Debug is verdi"
	@cd ./vcs && verdi $(OPTION_Verdi)
	@echo "Welcom verdi !"



cleanvcs	:
	@echo "all files in vcs folder are cleaned "
	@cd ./vcs && rm -rf *

cleanxrun	:
	@echo "all files in xrun folde are cleaned"
	@cd ./xrun && rm -rf *

help	:
	@echo "Welcome"
	@echo "commoand:"
	@echo "make vcs/make verdi /make xrun/make indago/make cleanvcs/make cleanxrun"
	@echo "this template support vcs and xrun and default sim is xrun"
	@echo "this template support verdi and indgo to debug"
	@echo "you can use 'make sim SIM=vcs'to sim your project,and use 'make verdi' to debug"
	@echo "you can use 'make xrun' to sim,and use 'make indago' to debug"
	@echo "any question,you can email me about this VM"

