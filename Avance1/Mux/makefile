
all: verilog run GTKWave 


verilog:
	iverilog -o mux.vvp mux.v probador_mux.v t_b_mux.v

run:
	vvp mux.vvp

GTKWave:
	gtkwave mux.vcd
		
clean:
	rm -f mux.vvp mux.vcd
