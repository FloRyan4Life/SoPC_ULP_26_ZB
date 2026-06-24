
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__ctr0_io_space_end>:
   0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
   4:	80000117          	auipc	sp,0x80000
   8:	7f810113          	addi	sp,sp,2040 # 800007fc <__ctr0_io_space_begin+0x800009fc>
   c:	80000197          	auipc	gp,0x80000
  10:	7f418193          	addi	gp,gp,2036 # 80000800 <__ctr0_io_space_begin+0x80000a00>

00000014 <__crt0_cpu_csr_init>:
  14:	00000517          	auipc	a0,0x0
  18:	0d850513          	addi	a0,a0,216 # ec <__crt0_dummy_trap_handler>
  1c:	30551073          	csrw	mtvec,a0
  20:	34151073          	csrw	mepc,a0
  24:	30001073          	csrw	mstatus,zero
  28:	30401073          	csrw	mie,zero
  2c:	30601073          	csrw	mcounteren,zero
  30:	ffa00593          	li	a1,-6
  34:	32059073          	csrw	mcountinhibit,a1
  38:	b0001073          	csrw	mcycle,zero
  3c:	b8001073          	csrw	mcycleh,zero
  40:	b0201073          	csrw	minstret,zero
  44:	b8201073          	csrw	minstreth,zero

00000048 <__crt0_reg_file_clear>:
  48:	00000093          	li	ra,0
  4c:	00000213          	li	tp,0
  50:	00000293          	li	t0,0
  54:	00000313          	li	t1,0
  58:	00000393          	li	t2,0
  5c:	00000713          	li	a4,0
  60:	00000793          	li	a5,0

00000064 <__crt0_reset_io>:
  64:	00000417          	auipc	s0,0x0
  68:	d9c40413          	addi	s0,s0,-612 # fffffe00 <__ctr0_io_space_begin+0x0>
  6c:	00000497          	auipc	s1,0x0
  70:	f9448493          	addi	s1,s1,-108 # 0 <__ctr0_io_space_end>

00000074 <__crt0_reset_io_loop>:
  74:	00042023          	sw	zero,0(s0)
  78:	00440413          	addi	s0,s0,4
  7c:	fe941ce3          	bne	s0,s1,74 <__crt0_reset_io_loop>

00000080 <__crt0_clear_bss>:
  80:	80000597          	auipc	a1,0x80000
  84:	f8058593          	addi	a1,a1,-128 # 80000000 <__ctr0_io_space_begin+0x80000200>
  88:	80000617          	auipc	a2,0x80000
  8c:	f7860613          	addi	a2,a2,-136 # 80000000 <__ctr0_io_space_begin+0x80000200>

00000090 <__crt0_clear_bss_loop>:
  90:	00c5d863          	bge	a1,a2,a0 <__crt0_clear_bss_loop_end>
  94:	00058023          	sb	zero,0(a1)
  98:	00158593          	addi	a1,a1,1
  9c:	ff5ff06f          	j	90 <__crt0_clear_bss_loop>

000000a0 <__crt0_clear_bss_loop_end>:
  a0:	00000597          	auipc	a1,0x0
  a4:	2ac58593          	addi	a1,a1,684 # 34c <__crt0_copy_data_src_begin>
  a8:	80000617          	auipc	a2,0x80000
  ac:	f5860613          	addi	a2,a2,-168 # 80000000 <__ctr0_io_space_begin+0x80000200>
  b0:	80000697          	auipc	a3,0x80000
  b4:	f5068693          	addi	a3,a3,-176 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000b8 <__crt0_copy_data_loop>:
  b8:	00d65c63          	bge	a2,a3,d0 <__crt0_copy_data_loop_end>
  bc:	00058703          	lb	a4,0(a1)
  c0:	00e60023          	sb	a4,0(a2)
  c4:	00158593          	addi	a1,a1,1
  c8:	00160613          	addi	a2,a2,1
  cc:	fedff06f          	j	b8 <__crt0_copy_data_loop>

000000d0 <__crt0_copy_data_loop_end>:
  d0:	00000513          	li	a0,0
  d4:	00000593          	li	a1,0
  d8:	060000ef          	jal	ra,138 <main>

000000dc <__crt0_main_aftermath>:
  dc:	34051073          	csrw	mscratch,a0

000000e0 <__crt0_main_aftermath_end>:
  e0:	30047073          	csrci	mstatus,8

000000e4 <__crt0_main_aftermath_end_loop>:
  e4:	10500073          	wfi
  e8:	ffdff06f          	j	e4 <__crt0_main_aftermath_end_loop>

000000ec <__crt0_dummy_trap_handler>:
  ec:	ff810113          	addi	sp,sp,-8
  f0:	00812023          	sw	s0,0(sp)
  f4:	00912223          	sw	s1,4(sp)
  f8:	34202473          	csrr	s0,mcause
  fc:	02044663          	bltz	s0,128 <__crt0_dummy_trap_handler_irq>
 100:	34102473          	csrr	s0,mepc

00000104 <__crt0_dummy_trap_handler_exc_c_check>:
 104:	00041483          	lh	s1,0(s0)
 108:	0034f493          	andi	s1,s1,3
 10c:	00240413          	addi	s0,s0,2
 110:	34141073          	csrw	mepc,s0
 114:	00300413          	li	s0,3
 118:	00941863          	bne	s0,s1,128 <__crt0_dummy_trap_handler_irq>

0000011c <__crt0_dummy_trap_handler_exc_uncrompressed>:
 11c:	34102473          	csrr	s0,mepc
 120:	00240413          	addi	s0,s0,2
 124:	34141073          	csrw	mepc,s0

00000128 <__crt0_dummy_trap_handler_irq>:
 128:	00012403          	lw	s0,0(sp)
 12c:	00412483          	lw	s1,4(sp)
 130:	00810113          	addi	sp,sp,8
 134:	30200073          	mret

00000138 <main>:
 138:	ff010113          	addi	sp,sp,-16
 13c:	00812423          	sw	s0,8(sp)
 140:	00112623          	sw	ra,12(sp)
 144:	00000413          	li	s0,0
 148:	028000ef          	jal	ra,170 <iceduino_gpio_clr>
 14c:	00040513          	mv	a0,s0
 150:	014000ef          	jal	ra,164 <iceduino_gpio_set>
 154:	06400513          	li	a0,100
 158:	024000ef          	jal	ra,17c <neorv32_cpu_delay_ms>
 15c:	00140413          	addi	s0,s0,1
 160:	fedff06f          	j	14c <main+0x14>

00000164 <iceduino_gpio_set>:
 164:	a00007b7          	lui	a5,0xa0000
 168:	00a7a223          	sw	a0,4(a5) # a0000004 <__ctr0_io_space_begin+0xa0000204>
 16c:	00008067          	ret

00000170 <iceduino_gpio_clr>:
 170:	a00007b7          	lui	a5,0xa0000
 174:	0007a223          	sw	zero,4(a5) # a0000004 <__ctr0_io_space_begin+0xa0000204>
 178:	00008067          	ret

0000017c <neorv32_cpu_delay_ms>:
 17c:	fe010113          	addi	sp,sp,-32
 180:	00112e23          	sw	ra,28(sp)
 184:	00050613          	mv	a2,a0
 188:	00055863          	bgez	a0,198 <neorv32_cpu_delay_ms+0x1c>
 18c:	40a00633          	neg	a2,a0
 190:	01061613          	slli	a2,a2,0x10
 194:	41065613          	srai	a2,a2,0x10
 198:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 19c:	3e800593          	li	a1,1000
 1a0:	00c12623          	sw	a2,12(sp)
 1a4:	0fc000ef          	jal	ra,2a0 <__udivsi3>
 1a8:	00c12603          	lw	a2,12(sp)
 1ac:	00000593          	li	a1,0
 1b0:	41f65693          	srai	a3,a2,0x1f
 1b4:	054000ef          	jal	ra,208 <__muldi3>
 1b8:	01c59593          	slli	a1,a1,0x1c
 1bc:	00455513          	srli	a0,a0,0x4
 1c0:	00a5e533          	or	a0,a1,a0

000001c4 <__neorv32_cpu_delay_ms_start>:
 1c4:	00050a63          	beqz	a0,1d8 <__neorv32_cpu_delay_ms_end>
 1c8:	00050863          	beqz	a0,1d8 <__neorv32_cpu_delay_ms_end>
 1cc:	fff50513          	addi	a0,a0,-1
 1d0:	00000013          	nop
 1d4:	ff1ff06f          	j	1c4 <__neorv32_cpu_delay_ms_start>

000001d8 <__neorv32_cpu_delay_ms_end>:
 1d8:	01c12083          	lw	ra,28(sp)
 1dc:	02010113          	addi	sp,sp,32
 1e0:	00008067          	ret

000001e4 <__mulsi3>:
 1e4:	00050613          	mv	a2,a0
 1e8:	00000513          	li	a0,0
 1ec:	0015f693          	andi	a3,a1,1
 1f0:	00068463          	beqz	a3,1f8 <__mulsi3+0x14>
 1f4:	00c50533          	add	a0,a0,a2
 1f8:	0015d593          	srli	a1,a1,0x1
 1fc:	00161613          	slli	a2,a2,0x1
 200:	fe0596e3          	bnez	a1,1ec <__mulsi3+0x8>
 204:	00008067          	ret

00000208 <__muldi3>:
 208:	00050313          	mv	t1,a0
 20c:	ff010113          	addi	sp,sp,-16
 210:	00060513          	mv	a0,a2
 214:	00068893          	mv	a7,a3
 218:	00112623          	sw	ra,12(sp)
 21c:	00030613          	mv	a2,t1
 220:	00050693          	mv	a3,a0
 224:	00000713          	li	a4,0
 228:	00000793          	li	a5,0
 22c:	00000813          	li	a6,0
 230:	0016fe13          	andi	t3,a3,1
 234:	00171e93          	slli	t4,a4,0x1
 238:	000e0c63          	beqz	t3,250 <__muldi3+0x48>
 23c:	01060e33          	add	t3,a2,a6
 240:	010e3833          	sltu	a6,t3,a6
 244:	00e787b3          	add	a5,a5,a4
 248:	00f807b3          	add	a5,a6,a5
 24c:	000e0813          	mv	a6,t3
 250:	01f65713          	srli	a4,a2,0x1f
 254:	0016d693          	srli	a3,a3,0x1
 258:	00eee733          	or	a4,t4,a4
 25c:	00161613          	slli	a2,a2,0x1
 260:	fc0698e3          	bnez	a3,230 <__muldi3+0x28>
 264:	00058663          	beqz	a1,270 <__muldi3+0x68>
 268:	f7dff0ef          	jal	ra,1e4 <__mulsi3>
 26c:	00a787b3          	add	a5,a5,a0
 270:	00088a63          	beqz	a7,284 <__muldi3+0x7c>
 274:	00030513          	mv	a0,t1
 278:	00088593          	mv	a1,a7
 27c:	f69ff0ef          	jal	ra,1e4 <__mulsi3>
 280:	00f507b3          	add	a5,a0,a5
 284:	00c12083          	lw	ra,12(sp)
 288:	00080513          	mv	a0,a6
 28c:	00078593          	mv	a1,a5
 290:	01010113          	addi	sp,sp,16
 294:	00008067          	ret

00000298 <__divsi3>:
 298:	06054063          	bltz	a0,2f8 <__umodsi3+0x10>
 29c:	0605c663          	bltz	a1,308 <__umodsi3+0x20>

000002a0 <__udivsi3>:
 2a0:	00058613          	mv	a2,a1
 2a4:	00050593          	mv	a1,a0
 2a8:	fff00513          	li	a0,-1
 2ac:	02060c63          	beqz	a2,2e4 <__udivsi3+0x44>
 2b0:	00100693          	li	a3,1
 2b4:	00b67a63          	bgeu	a2,a1,2c8 <__udivsi3+0x28>
 2b8:	00c05863          	blez	a2,2c8 <__udivsi3+0x28>
 2bc:	00161613          	slli	a2,a2,0x1
 2c0:	00169693          	slli	a3,a3,0x1
 2c4:	feb66ae3          	bltu	a2,a1,2b8 <__udivsi3+0x18>
 2c8:	00000513          	li	a0,0
 2cc:	00c5e663          	bltu	a1,a2,2d8 <__udivsi3+0x38>
 2d0:	40c585b3          	sub	a1,a1,a2
 2d4:	00d56533          	or	a0,a0,a3
 2d8:	0016d693          	srli	a3,a3,0x1
 2dc:	00165613          	srli	a2,a2,0x1
 2e0:	fe0696e3          	bnez	a3,2cc <__udivsi3+0x2c>
 2e4:	00008067          	ret

000002e8 <__umodsi3>:
 2e8:	00008293          	mv	t0,ra
 2ec:	fb5ff0ef          	jal	ra,2a0 <__udivsi3>
 2f0:	00058513          	mv	a0,a1
 2f4:	00028067          	jr	t0
 2f8:	40a00533          	neg	a0,a0
 2fc:	00b04863          	bgtz	a1,30c <__umodsi3+0x24>
 300:	40b005b3          	neg	a1,a1
 304:	f9dff06f          	j	2a0 <__udivsi3>
 308:	40b005b3          	neg	a1,a1
 30c:	00008293          	mv	t0,ra
 310:	f91ff0ef          	jal	ra,2a0 <__udivsi3>
 314:	40a00533          	neg	a0,a0
 318:	00028067          	jr	t0

0000031c <__modsi3>:
 31c:	00008293          	mv	t0,ra
 320:	0005ca63          	bltz	a1,334 <__modsi3+0x18>
 324:	00054c63          	bltz	a0,33c <__modsi3+0x20>
 328:	f79ff0ef          	jal	ra,2a0 <__udivsi3>
 32c:	00058513          	mv	a0,a1
 330:	00028067          	jr	t0
 334:	40b005b3          	neg	a1,a1
 338:	fe0558e3          	bgez	a0,328 <__modsi3+0xc>
 33c:	40a00533          	neg	a0,a0
 340:	f61ff0ef          	jal	ra,2a0 <__udivsi3>
 344:	40b00533          	neg	a0,a1
 348:	00028067          	jr	t0
