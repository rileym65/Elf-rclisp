PROJECT = rclisp

$(PROJECT).prg: $(PROJECT).asm bios.inc
	../date.pl > date.inc
	rcasm -l -v -x -d1802 $(PROJECT)
	cat $(PROJECT).prg | sed -f adjust.sed > x.prg
	rm $(PROJECT).prg
	mv x.prg $(PROJECT).prg

elfos: $(PROJECT).asm
	../dateextended.pl > date.inc
	../build.pl > build.inc
	rcasm  -l -v -x -d 1802 -DELFOS $(PROJECT) 2>&1 | tee $(PROJECT).lst
	cat $(PROJECT).prg | sed -f adjust.sed > x.prg
	rm $(PROJECT).prg
	mv x.prg $(PROJECT).prg


picorom: $(PROJECT).asm bios.inc
	rcasm -l -v -x -d1802 $(PROJECT)
	
clean:
	-rm $(PROJECT).prg


