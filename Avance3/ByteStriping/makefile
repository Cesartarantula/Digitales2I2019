default:
	yosys sintesis.ys
	sed -i 's/ByteStriping/ByteStripingEstructural/g' ByteStripingEstructural.v
	iverilog ByteStrip_BancoDePruebas.v 
	vvp a.out
	gtkwave ByteStriping.vcd config.gtkw
clean:
	rm -f ByteStripingEstructural.v  rtlil.v *.vcd *.dot *.dot.pid *.out
