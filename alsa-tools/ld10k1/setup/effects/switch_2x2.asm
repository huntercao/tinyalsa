; Mikael Magnusson
    name "Switch 2 - 2 channels"
    include "emu_constants.asm"
    
Left0	IO
Right0	IO
Left1	IO
Right1	IO

tmp0	dyn 1
tmp1	dyn 1

switchL control 0,0,1
switchR control 0,0,1

switch	macro	dst, src, sw
	macints	dst, C_0, src, sw
	endm

switch_neg macro dst, src
	andxor	dst, src, C_1, C_1
	endm

switch2 macro dst, src0, src1, sw
	switch tmp0, src1, sw
	switch_neg tmp1, sw
	switch tmp1, src0, tmp1
	acc3 dst, tmp0, tmp1, C_0	
	endm

	switch2 Left0, Left0, Left1, switchL
	switch2 Right0, Right0, Right1, switchR

	end
