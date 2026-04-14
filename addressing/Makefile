SRC = rtl/slave.vhd rtl/master.vhd rtl/addressing.vhd
TB = sim/addressing_tb.vhd
TB_ENTITY = addressing_tb

GHDL = ghdl
FLAGS = --std=08 --workdir=work

.PHONY: all compile sim view clean

all: compile sim view

compile:
	@mkdir -p work
	$(GHDL) -a $(FLAGS) $(SRC)
	$(GHDL) -a $(FLAGS) $(TB)
	$(GHDL) -e $(FLAGS) $(TB_ENTITY)

sim: compile
	$(GHDL) -r $(FLAGS) $(TB_ENTITY) --vcd=work/waveform.vcd

view:
	gtkwave work/waveform.vcd &

clean:
	rm -rf work
