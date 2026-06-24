
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
  18:	12450513          	addi	a0,a0,292 # 138 <__crt0_dummy_trap_handler>
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
  64:	00000813          	li	a6,0
  68:	00000893          	li	a7,0
  6c:	00000913          	li	s2,0
  70:	00000993          	li	s3,0
  74:	00000a13          	li	s4,0
  78:	00000a93          	li	s5,0
  7c:	00000b13          	li	s6,0
  80:	00000b93          	li	s7,0
  84:	00000c13          	li	s8,0
  88:	00000c93          	li	s9,0
  8c:	00000d13          	li	s10,0
  90:	00000d93          	li	s11,0
  94:	00000e13          	li	t3,0
  98:	00000e93          	li	t4,0
  9c:	00000f13          	li	t5,0
  a0:	00000f93          	li	t6,0

000000a4 <__crt0_reset_io>:
  a4:	00000417          	auipc	s0,0x0
  a8:	d5c40413          	addi	s0,s0,-676 # fffffe00 <__ctr0_io_space_begin+0x0>
  ac:	00000497          	auipc	s1,0x0
  b0:	f5448493          	addi	s1,s1,-172 # 0 <__ctr0_io_space_end>

000000b4 <__crt0_reset_io_loop>:
  b4:	00042023          	sw	zero,0(s0)
  b8:	00440413          	addi	s0,s0,4
  bc:	fe941ce3          	bne	s0,s1,b4 <__crt0_reset_io_loop>

000000c0 <__crt0_clear_bss>:
  c0:	80000597          	auipc	a1,0x80000
  c4:	f4058593          	addi	a1,a1,-192 # 80000000 <__ctr0_io_space_begin+0x80000200>
  c8:	80000617          	auipc	a2,0x80000
  cc:	f3860613          	addi	a2,a2,-200 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000d0 <__crt0_clear_bss_loop>:
  d0:	00c5d863          	bge	a1,a2,e0 <__crt0_clear_bss_loop_end>
  d4:	00058023          	sb	zero,0(a1)
  d8:	00158593          	addi	a1,a1,1
  dc:	ff5ff06f          	j	d0 <__crt0_clear_bss_loop>

000000e0 <__crt0_clear_bss_loop_end>:
  e0:	00000597          	auipc	a1,0x0
  e4:	37c58593          	addi	a1,a1,892 # 45c <__crt0_copy_data_src_begin>
  e8:	80000617          	auipc	a2,0x80000
  ec:	f1860613          	addi	a2,a2,-232 # 80000000 <__ctr0_io_space_begin+0x80000200>
  f0:	80000697          	auipc	a3,0x80000
  f4:	f1068693          	addi	a3,a3,-240 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000f8 <__crt0_copy_data_loop>:
  f8:	00d65c63          	bge	a2,a3,110 <__crt0_copy_data_loop_end>
  fc:	00058703          	lb	a4,0(a1)
 100:	00e60023          	sb	a4,0(a2)
 104:	00158593          	addi	a1,a1,1
 108:	00160613          	addi	a2,a2,1
 10c:	fedff06f          	j	f8 <__crt0_copy_data_loop>

00000110 <__crt0_copy_data_loop_end>:
 110:	00000513          	li	a0,0
 114:	00000593          	li	a1,0
 118:	06c000ef          	jal	ra,184 <main>

0000011c <__crt0_main_aftermath>:
 11c:	34051073          	csrw	mscratch,a0
 120:	00000093          	li	ra,0
 124:	00008463          	beqz	ra,12c <__crt0_main_aftermath_end>
 128:	000080e7          	jalr	ra

0000012c <__crt0_main_aftermath_end>:
 12c:	30047073          	csrci	mstatus,8

00000130 <__crt0_main_aftermath_end_loop>:
 130:	10500073          	wfi
 134:	ffdff06f          	j	130 <__crt0_main_aftermath_end_loop>

00000138 <__crt0_dummy_trap_handler>:
 138:	ff810113          	addi	sp,sp,-8
 13c:	00812023          	sw	s0,0(sp)
 140:	00912223          	sw	s1,4(sp)
 144:	34202473          	csrr	s0,mcause
 148:	02044663          	bltz	s0,174 <__crt0_dummy_trap_handler_irq>
 14c:	34102473          	csrr	s0,mepc

00000150 <__crt0_dummy_trap_handler_exc_c_check>:
 150:	00041483          	lh	s1,0(s0)
 154:	0034f493          	andi	s1,s1,3
 158:	00240413          	addi	s0,s0,2
 15c:	34141073          	csrw	mepc,s0
 160:	00300413          	li	s0,3
 164:	00941863          	bne	s0,s1,174 <__crt0_dummy_trap_handler_irq>

00000168 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 168:	34102473          	csrr	s0,mepc
 16c:	00240413          	addi	s0,s0,2
 170:	34141073          	csrw	mepc,s0

00000174 <__crt0_dummy_trap_handler_irq>:
 174:	00012403          	lw	s0,0(sp)
 178:	00412483          	lw	s1,4(sp)
 17c:	00810113          	addi	sp,sp,8
 180:	30200073          	mret

00000184 <main>:
 184:	ff010113          	addi	sp,sp,-16
 188:	00812423          	sw	s0,8(sp)
 18c:	00912223          	sw	s1,4(sp)
 190:	01212023          	sw	s2,0(sp)
 194:	00112623          	sw	ra,12(sp)
 198:	00000413          	li	s0,0
 19c:	00200913          	li	s2,2
 1a0:	04000493          	li	s1,64
 1a4:	00100513          	li	a0,1
 1a8:	094000ef          	jal	ra,23c <iceduino_button_get>
 1ac:	fe050ce3          	beqz	a0,1a4 <main+0x20>
 1b0:	4b000513          	li	a0,1200
 1b4:	0d8000ef          	jal	ra,28c <neorv32_cpu_delay_ms>
 1b8:	00100793          	li	a5,1
 1bc:	02f40863          	beq	s0,a5,1ec <main+0x68>
 1c0:	05240a63          	beq	s0,s2,214 <main+0x90>
 1c4:	fe0410e3          	bnez	s0,1a4 <main+0x20>
 1c8:	00040513          	mv	a0,s0
 1cc:	00000693          	li	a3,0
 1d0:	00000613          	li	a2,0
 1d4:	0ff00593          	li	a1,255
 1d8:	00140413          	addi	s0,s0,1
 1dc:	080000ef          	jal	ra,25c <set_pixel>
 1e0:	fe9414e3          	bne	s0,s1,1c8 <main+0x44>
 1e4:	00100413          	li	s0,1
 1e8:	fbdff06f          	j	1a4 <main+0x20>
 1ec:	00000413          	li	s0,0
 1f0:	00040513          	mv	a0,s0
 1f4:	00000693          	li	a3,0
 1f8:	0ff00613          	li	a2,255
 1fc:	00000593          	li	a1,0
 200:	00140413          	addi	s0,s0,1
 204:	058000ef          	jal	ra,25c <set_pixel>
 208:	fe9414e3          	bne	s0,s1,1f0 <main+0x6c>
 20c:	00200413          	li	s0,2
 210:	f95ff06f          	j	1a4 <main+0x20>
 214:	00000413          	li	s0,0
 218:	00040513          	mv	a0,s0
 21c:	00000693          	li	a3,0
 220:	0ff00613          	li	a2,255
 224:	00000593          	li	a1,0
 228:	00140413          	addi	s0,s0,1
 22c:	030000ef          	jal	ra,25c <set_pixel>
 230:	fe9414e3          	bne	s0,s1,218 <main+0x94>
 234:	00000413          	li	s0,0
 238:	f6dff06f          	j	1a4 <main+0x20>

0000023c <iceduino_button_get>:
 23c:	f00007b7          	lui	a5,0xf0000
 240:	0107c703          	lbu	a4,16(a5) # f0000010 <__ctr0_io_space_begin+0xf0000210>
 244:	00f57513          	andi	a0,a0,15
 248:	00100793          	li	a5,1
 24c:	0ff77713          	andi	a4,a4,255
 250:	00a79533          	sll	a0,a5,a0
 254:	00a77533          	and	a0,a4,a0
 258:	00008067          	ret

0000025c <set_pixel>:
 25c:	03f00793          	li	a5,63
 260:	02a7e463          	bltu	a5,a0,288 <set_pixel+0x2c>
 264:	00861613          	slli	a2,a2,0x8
 268:	f00007b7          	lui	a5,0xf0000
 26c:	00d66633          	or	a2,a2,a3
 270:	01059593          	slli	a1,a1,0x10
 274:	00251513          	slli	a0,a0,0x2
 278:	10078793          	addi	a5,a5,256 # f0000100 <__ctr0_io_space_begin+0xf0000300>
 27c:	00b66633          	or	a2,a2,a1
 280:	00f50533          	add	a0,a0,a5
 284:	00c52023          	sw	a2,0(a0)
 288:	00008067          	ret

0000028c <neorv32_cpu_delay_ms>:
 28c:	fe010113          	addi	sp,sp,-32
 290:	00112e23          	sw	ra,28(sp)
 294:	00050613          	mv	a2,a0
 298:	00055863          	bgez	a0,2a8 <neorv32_cpu_delay_ms+0x1c>
 29c:	40a00633          	neg	a2,a0
 2a0:	01061613          	slli	a2,a2,0x10
 2a4:	41065613          	srai	a2,a2,0x10
 2a8:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 2ac:	3e800593          	li	a1,1000
 2b0:	00c12623          	sw	a2,12(sp)
 2b4:	0fc000ef          	jal	ra,3b0 <__udivsi3>
 2b8:	00c12603          	lw	a2,12(sp)
 2bc:	00000593          	li	a1,0
 2c0:	41f65693          	srai	a3,a2,0x1f
 2c4:	054000ef          	jal	ra,318 <__muldi3>
 2c8:	01c59593          	slli	a1,a1,0x1c
 2cc:	00455513          	srli	a0,a0,0x4
 2d0:	00a5e533          	or	a0,a1,a0

000002d4 <__neorv32_cpu_delay_ms_start>:
 2d4:	00050a63          	beqz	a0,2e8 <__neorv32_cpu_delay_ms_end>
 2d8:	00050863          	beqz	a0,2e8 <__neorv32_cpu_delay_ms_end>
 2dc:	fff50513          	addi	a0,a0,-1
 2e0:	00000013          	nop
 2e4:	ff1ff06f          	j	2d4 <__neorv32_cpu_delay_ms_start>

000002e8 <__neorv32_cpu_delay_ms_end>:
 2e8:	01c12083          	lw	ra,28(sp)
 2ec:	02010113          	addi	sp,sp,32
 2f0:	00008067          	ret

000002f4 <__mulsi3>:
 2f4:	00050613          	mv	a2,a0
 2f8:	00000513          	li	a0,0
 2fc:	0015f693          	andi	a3,a1,1
 300:	00068463          	beqz	a3,308 <__mulsi3+0x14>
 304:	00c50533          	add	a0,a0,a2
 308:	0015d593          	srli	a1,a1,0x1
 30c:	00161613          	slli	a2,a2,0x1
 310:	fe0596e3          	bnez	a1,2fc <__mulsi3+0x8>
 314:	00008067          	ret

00000318 <__muldi3>:
 318:	00050313          	mv	t1,a0
 31c:	ff010113          	addi	sp,sp,-16
 320:	00060513          	mv	a0,a2
 324:	00068893          	mv	a7,a3
 328:	00112623          	sw	ra,12(sp)
 32c:	00030613          	mv	a2,t1
 330:	00050693          	mv	a3,a0
 334:	00000713          	li	a4,0
 338:	00000793          	li	a5,0
 33c:	00000813          	li	a6,0
 340:	0016fe13          	andi	t3,a3,1
 344:	00171e93          	slli	t4,a4,0x1
 348:	000e0c63          	beqz	t3,360 <__muldi3+0x48>
 34c:	01060e33          	add	t3,a2,a6
 350:	010e3833          	sltu	a6,t3,a6
 354:	00e787b3          	add	a5,a5,a4
 358:	00f807b3          	add	a5,a6,a5
 35c:	000e0813          	mv	a6,t3
 360:	01f65713          	srli	a4,a2,0x1f
 364:	0016d693          	srli	a3,a3,0x1
 368:	00eee733          	or	a4,t4,a4
 36c:	00161613          	slli	a2,a2,0x1
 370:	fc0698e3          	bnez	a3,340 <__muldi3+0x28>
 374:	00058663          	beqz	a1,380 <__muldi3+0x68>
 378:	f7dff0ef          	jal	ra,2f4 <__mulsi3>
 37c:	00a787b3          	add	a5,a5,a0
 380:	00088a63          	beqz	a7,394 <__muldi3+0x7c>
 384:	00030513          	mv	a0,t1
 388:	00088593          	mv	a1,a7
 38c:	f69ff0ef          	jal	ra,2f4 <__mulsi3>
 390:	00f507b3          	add	a5,a0,a5
 394:	00c12083          	lw	ra,12(sp)
 398:	00080513          	mv	a0,a6
 39c:	00078593          	mv	a1,a5
 3a0:	01010113          	addi	sp,sp,16
 3a4:	00008067          	ret

000003a8 <__divsi3>:
 3a8:	06054063          	bltz	a0,408 <__umodsi3+0x10>
 3ac:	0605c663          	bltz	a1,418 <__umodsi3+0x20>

000003b0 <__udivsi3>:
 3b0:	00058613          	mv	a2,a1
 3b4:	00050593          	mv	a1,a0
 3b8:	fff00513          	li	a0,-1
 3bc:	02060c63          	beqz	a2,3f4 <__udivsi3+0x44>
 3c0:	00100693          	li	a3,1
 3c4:	00b67a63          	bgeu	a2,a1,3d8 <__udivsi3+0x28>
 3c8:	00c05863          	blez	a2,3d8 <__udivsi3+0x28>
 3cc:	00161613          	slli	a2,a2,0x1
 3d0:	00169693          	slli	a3,a3,0x1
 3d4:	feb66ae3          	bltu	a2,a1,3c8 <__udivsi3+0x18>
 3d8:	00000513          	li	a0,0
 3dc:	00c5e663          	bltu	a1,a2,3e8 <__udivsi3+0x38>
 3e0:	40c585b3          	sub	a1,a1,a2
 3e4:	00d56533          	or	a0,a0,a3
 3e8:	0016d693          	srli	a3,a3,0x1
 3ec:	00165613          	srli	a2,a2,0x1
 3f0:	fe0696e3          	bnez	a3,3dc <__udivsi3+0x2c>
 3f4:	00008067          	ret

000003f8 <__umodsi3>:
 3f8:	00008293          	mv	t0,ra
 3fc:	fb5ff0ef          	jal	ra,3b0 <__udivsi3>
 400:	00058513          	mv	a0,a1
 404:	00028067          	jr	t0
 408:	40a00533          	neg	a0,a0
 40c:	00b04863          	bgtz	a1,41c <__umodsi3+0x24>
 410:	40b005b3          	neg	a1,a1
 414:	f9dff06f          	j	3b0 <__udivsi3>
 418:	40b005b3          	neg	a1,a1
 41c:	00008293          	mv	t0,ra
 420:	f91ff0ef          	jal	ra,3b0 <__udivsi3>
 424:	40a00533          	neg	a0,a0
 428:	00028067          	jr	t0

0000042c <__modsi3>:
 42c:	00008293          	mv	t0,ra
 430:	0005ca63          	bltz	a1,444 <__modsi3+0x18>
 434:	00054c63          	bltz	a0,44c <__modsi3+0x20>
 438:	f79ff0ef          	jal	ra,3b0 <__udivsi3>
 43c:	00058513          	mv	a0,a1
 440:	00028067          	jr	t0
 444:	40b005b3          	neg	a1,a1
 448:	fe0558e3          	bgez	a0,438 <__modsi3+0xc>
 44c:	40a00533          	neg	a0,a0
 450:	f61ff0ef          	jal	ra,3b0 <__udivsi3>
 454:	40b00533          	neg	a0,a1
 458:	00028067          	jr	t0
