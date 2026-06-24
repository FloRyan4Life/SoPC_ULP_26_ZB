
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
  e4:	33458593          	addi	a1,a1,820 # 414 <__crt0_copy_data_src_begin>
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
 188:	00912223          	sw	s1,4(sp)
 18c:	00112623          	sw	ra,12(sp)
 190:	00812423          	sw	s0,8(sp)
 194:	04000493          	li	s1,64
 198:	00000413          	li	s0,0
 19c:	00040513          	mv	a0,s0
 1a0:	00000693          	li	a3,0
 1a4:	00000613          	li	a2,0
 1a8:	0ff00593          	li	a1,255
 1ac:	00140413          	addi	s0,s0,1
 1b0:	064000ef          	jal	ra,214 <set_pixel>
 1b4:	fe9414e3          	bne	s0,s1,19c <main+0x18>
 1b8:	3e800513          	li	a0,1000
 1bc:	088000ef          	jal	ra,244 <neorv32_cpu_delay_ms>
 1c0:	00000413          	li	s0,0
 1c4:	00040513          	mv	a0,s0
 1c8:	00000693          	li	a3,0
 1cc:	0ff00613          	li	a2,255
 1d0:	00000593          	li	a1,0
 1d4:	00140413          	addi	s0,s0,1
 1d8:	03c000ef          	jal	ra,214 <set_pixel>
 1dc:	fe9414e3          	bne	s0,s1,1c4 <main+0x40>
 1e0:	3e800513          	li	a0,1000
 1e4:	060000ef          	jal	ra,244 <neorv32_cpu_delay_ms>
 1e8:	00000413          	li	s0,0
 1ec:	00040513          	mv	a0,s0
 1f0:	0ff00693          	li	a3,255
 1f4:	00000613          	li	a2,0
 1f8:	00000593          	li	a1,0
 1fc:	00140413          	addi	s0,s0,1
 200:	014000ef          	jal	ra,214 <set_pixel>
 204:	fe9414e3          	bne	s0,s1,1ec <main+0x68>
 208:	3e800513          	li	a0,1000
 20c:	038000ef          	jal	ra,244 <neorv32_cpu_delay_ms>
 210:	f89ff06f          	j	198 <main+0x14>

00000214 <set_pixel>:
 214:	03f00793          	li	a5,63
 218:	02a7e463          	bltu	a5,a0,240 <set_pixel+0x2c>
 21c:	00861613          	slli	a2,a2,0x8
 220:	f00007b7          	lui	a5,0xf0000
 224:	00d66633          	or	a2,a2,a3
 228:	01059593          	slli	a1,a1,0x10
 22c:	00251513          	slli	a0,a0,0x2
 230:	10078793          	addi	a5,a5,256 # f0000100 <__ctr0_io_space_begin+0xf0000300>
 234:	00b66633          	or	a2,a2,a1
 238:	00f50533          	add	a0,a0,a5
 23c:	00c52023          	sw	a2,0(a0)
 240:	00008067          	ret

00000244 <neorv32_cpu_delay_ms>:
 244:	fe010113          	addi	sp,sp,-32
 248:	00112e23          	sw	ra,28(sp)
 24c:	00050613          	mv	a2,a0
 250:	00055863          	bgez	a0,260 <neorv32_cpu_delay_ms+0x1c>
 254:	40a00633          	neg	a2,a0
 258:	01061613          	slli	a2,a2,0x10
 25c:	41065613          	srai	a2,a2,0x10
 260:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 264:	3e800593          	li	a1,1000
 268:	00c12623          	sw	a2,12(sp)
 26c:	0fc000ef          	jal	ra,368 <__udivsi3>
 270:	00c12603          	lw	a2,12(sp)
 274:	00000593          	li	a1,0
 278:	41f65693          	srai	a3,a2,0x1f
 27c:	054000ef          	jal	ra,2d0 <__muldi3>
 280:	01c59593          	slli	a1,a1,0x1c
 284:	00455513          	srli	a0,a0,0x4
 288:	00a5e533          	or	a0,a1,a0

0000028c <__neorv32_cpu_delay_ms_start>:
 28c:	00050a63          	beqz	a0,2a0 <__neorv32_cpu_delay_ms_end>
 290:	00050863          	beqz	a0,2a0 <__neorv32_cpu_delay_ms_end>
 294:	fff50513          	addi	a0,a0,-1
 298:	00000013          	nop
 29c:	ff1ff06f          	j	28c <__neorv32_cpu_delay_ms_start>

000002a0 <__neorv32_cpu_delay_ms_end>:
 2a0:	01c12083          	lw	ra,28(sp)
 2a4:	02010113          	addi	sp,sp,32
 2a8:	00008067          	ret

000002ac <__mulsi3>:
 2ac:	00050613          	mv	a2,a0
 2b0:	00000513          	li	a0,0
 2b4:	0015f693          	andi	a3,a1,1
 2b8:	00068463          	beqz	a3,2c0 <__mulsi3+0x14>
 2bc:	00c50533          	add	a0,a0,a2
 2c0:	0015d593          	srli	a1,a1,0x1
 2c4:	00161613          	slli	a2,a2,0x1
 2c8:	fe0596e3          	bnez	a1,2b4 <__mulsi3+0x8>
 2cc:	00008067          	ret

000002d0 <__muldi3>:
 2d0:	00050313          	mv	t1,a0
 2d4:	ff010113          	addi	sp,sp,-16
 2d8:	00060513          	mv	a0,a2
 2dc:	00068893          	mv	a7,a3
 2e0:	00112623          	sw	ra,12(sp)
 2e4:	00030613          	mv	a2,t1
 2e8:	00050693          	mv	a3,a0
 2ec:	00000713          	li	a4,0
 2f0:	00000793          	li	a5,0
 2f4:	00000813          	li	a6,0
 2f8:	0016fe13          	andi	t3,a3,1
 2fc:	00171e93          	slli	t4,a4,0x1
 300:	000e0c63          	beqz	t3,318 <__muldi3+0x48>
 304:	01060e33          	add	t3,a2,a6
 308:	010e3833          	sltu	a6,t3,a6
 30c:	00e787b3          	add	a5,a5,a4
 310:	00f807b3          	add	a5,a6,a5
 314:	000e0813          	mv	a6,t3
 318:	01f65713          	srli	a4,a2,0x1f
 31c:	0016d693          	srli	a3,a3,0x1
 320:	00eee733          	or	a4,t4,a4
 324:	00161613          	slli	a2,a2,0x1
 328:	fc0698e3          	bnez	a3,2f8 <__muldi3+0x28>
 32c:	00058663          	beqz	a1,338 <__muldi3+0x68>
 330:	f7dff0ef          	jal	ra,2ac <__mulsi3>
 334:	00a787b3          	add	a5,a5,a0
 338:	00088a63          	beqz	a7,34c <__muldi3+0x7c>
 33c:	00030513          	mv	a0,t1
 340:	00088593          	mv	a1,a7
 344:	f69ff0ef          	jal	ra,2ac <__mulsi3>
 348:	00f507b3          	add	a5,a0,a5
 34c:	00c12083          	lw	ra,12(sp)
 350:	00080513          	mv	a0,a6
 354:	00078593          	mv	a1,a5
 358:	01010113          	addi	sp,sp,16
 35c:	00008067          	ret

00000360 <__divsi3>:
 360:	06054063          	bltz	a0,3c0 <__umodsi3+0x10>
 364:	0605c663          	bltz	a1,3d0 <__umodsi3+0x20>

00000368 <__udivsi3>:
 368:	00058613          	mv	a2,a1
 36c:	00050593          	mv	a1,a0
 370:	fff00513          	li	a0,-1
 374:	02060c63          	beqz	a2,3ac <__udivsi3+0x44>
 378:	00100693          	li	a3,1
 37c:	00b67a63          	bgeu	a2,a1,390 <__udivsi3+0x28>
 380:	00c05863          	blez	a2,390 <__udivsi3+0x28>
 384:	00161613          	slli	a2,a2,0x1
 388:	00169693          	slli	a3,a3,0x1
 38c:	feb66ae3          	bltu	a2,a1,380 <__udivsi3+0x18>
 390:	00000513          	li	a0,0
 394:	00c5e663          	bltu	a1,a2,3a0 <__udivsi3+0x38>
 398:	40c585b3          	sub	a1,a1,a2
 39c:	00d56533          	or	a0,a0,a3
 3a0:	0016d693          	srli	a3,a3,0x1
 3a4:	00165613          	srli	a2,a2,0x1
 3a8:	fe0696e3          	bnez	a3,394 <__udivsi3+0x2c>
 3ac:	00008067          	ret

000003b0 <__umodsi3>:
 3b0:	00008293          	mv	t0,ra
 3b4:	fb5ff0ef          	jal	ra,368 <__udivsi3>
 3b8:	00058513          	mv	a0,a1
 3bc:	00028067          	jr	t0
 3c0:	40a00533          	neg	a0,a0
 3c4:	00b04863          	bgtz	a1,3d4 <__umodsi3+0x24>
 3c8:	40b005b3          	neg	a1,a1
 3cc:	f9dff06f          	j	368 <__udivsi3>
 3d0:	40b005b3          	neg	a1,a1
 3d4:	00008293          	mv	t0,ra
 3d8:	f91ff0ef          	jal	ra,368 <__udivsi3>
 3dc:	40a00533          	neg	a0,a0
 3e0:	00028067          	jr	t0

000003e4 <__modsi3>:
 3e4:	00008293          	mv	t0,ra
 3e8:	0005ca63          	bltz	a1,3fc <__modsi3+0x18>
 3ec:	00054c63          	bltz	a0,404 <__modsi3+0x20>
 3f0:	f79ff0ef          	jal	ra,368 <__udivsi3>
 3f4:	00058513          	mv	a0,a1
 3f8:	00028067          	jr	t0
 3fc:	40b005b3          	neg	a1,a1
 400:	fe0558e3          	bgez	a0,3f0 <__modsi3+0xc>
 404:	40a00533          	neg	a0,a0
 408:	f61ff0ef          	jal	ra,368 <__udivsi3>
 40c:	40b00533          	neg	a0,a1
 410:	00028067          	jr	t0
