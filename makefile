default:
	yosys sintesis.ys
	sed -i 's/ClkGenerator/ClkGeneratorEstructural/g' ClkGeneratorEstructural.v
	iverilog ClkGen_BancoDePruebas.v 
	vvp a.out
	gtkwave ClkGen.vcd config.gtkw
clean:
	rm -f ClkGeneratorEstructural.v  rtlil.v *.vcd *.dot *.dot.pid *.out
