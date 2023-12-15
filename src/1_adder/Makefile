
FILES := ./rtl/adder8.v ./tb/adder8_tb.v
VCS= vcs -sverilog -timescale=1ns/1ns +vpi -l build.log -full64 -LDFLAGS -Wl,-no-as-needed -debug_access+all -fsdb -l comp.log
SIMV = ./simv -l simv.log
ifndef TB_SEED
	TB_SEED = 1024
endif
all: comp run
comp:
	$(VCS) +define+TB_SEED=$(TB_SEED) +incdir+. \
	$(FILES)
run:
	$(SIMV) +fsdbfile+top.fsdb
dbg:
	verdi -f file.f -ssf top.fsdb &
clean:
	rm -rf core csrc simv* vc_hdrs.h ucli.key urg* *.log *.fsdb novas.* verdiLog
