
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
   4:	80000117          	auipc	sp,0x80000
   8:	7f810113          	addi	sp,sp,2040 # 800007fc <__ctr0_io_space_begin+0x800009fc>
   c:	80000197          	auipc	gp,0x80000
  10:	7f418193          	addi	gp,gp,2036 # 80000800 <__ctr0_io_space_begin+0x80000a00>

00000014 <__crt0_cpu_csr_init>:
  14:	00000517          	auipc	a0,0x0
  18:	0d450513          	addi	a0,a0,212 # e8 <__crt0_dummy_trap_handler>
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
  70:	f9448493          	addi	s1,s1,-108 # 0 <_start>

00000074 <__crt0_reset_io_loop>:
  74:	00042023          	sw	zero,0(s0)
  78:	00440413          	addi	s0,s0,4
  7c:	fe941ce3          	bne	s0,s1,74 <__crt0_reset_io_loop>

00000080 <__crt0_clear_bss>:
  80:	80000597          	auipc	a1,0x80000
  84:	f8058593          	addi	a1,a1,-128 # 80000000 <__ctr0_io_space_begin+0x80000200>
  88:	87818613          	addi	a2,gp,-1928 # 80000078 <__BSS_END__>

0000008c <__crt0_clear_bss_loop>:
  8c:	00c5d863          	bge	a1,a2,9c <__crt0_clear_bss_loop_end>
  90:	00058023          	sb	zero,0(a1)
  94:	00158593          	addi	a1,a1,1
  98:	ff5ff06f          	j	8c <__crt0_clear_bss_loop>

0000009c <__crt0_clear_bss_loop_end>:
  9c:	00001597          	auipc	a1,0x1
  a0:	b9058593          	addi	a1,a1,-1136 # c2c <__crt0_copy_data_src_begin>
  a4:	80000617          	auipc	a2,0x80000
  a8:	f5c60613          	addi	a2,a2,-164 # 80000000 <__ctr0_io_space_begin+0x80000200>
  ac:	80000697          	auipc	a3,0x80000
  b0:	f5468693          	addi	a3,a3,-172 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000b4 <__crt0_copy_data_loop>:
  b4:	00d65c63          	bge	a2,a3,cc <__crt0_copy_data_loop_end>
  b8:	00058703          	lb	a4,0(a1)
  bc:	00e60023          	sb	a4,0(a2)
  c0:	00158593          	addi	a1,a1,1
  c4:	00160613          	addi	a2,a2,1
  c8:	fedff06f          	j	b4 <__crt0_copy_data_loop>

000000cc <__crt0_copy_data_loop_end>:
  cc:	00000513          	li	a0,0
  d0:	00000593          	li	a1,0
  d4:	060000ef          	jal	ra,134 <main>

000000d8 <__crt0_main_aftermath>:
  d8:	34051073          	csrw	mscratch,a0

000000dc <__crt0_main_aftermath_end>:
  dc:	30047073          	csrci	mstatus,8

000000e0 <__crt0_main_aftermath_end_loop>:
  e0:	10500073          	wfi
  e4:	ffdff06f          	j	e0 <__crt0_main_aftermath_end_loop>

000000e8 <__crt0_dummy_trap_handler>:
  e8:	ff810113          	addi	sp,sp,-8
  ec:	00812023          	sw	s0,0(sp)
  f0:	00912223          	sw	s1,4(sp)
  f4:	34202473          	csrr	s0,mcause
  f8:	02044663          	bltz	s0,124 <__crt0_dummy_trap_handler_irq>
  fc:	34102473          	csrr	s0,mepc

00000100 <__crt0_dummy_trap_handler_exc_c_check>:
 100:	00041483          	lh	s1,0(s0)
 104:	0034f493          	andi	s1,s1,3
 108:	00240413          	addi	s0,s0,2
 10c:	34141073          	csrw	mepc,s0
 110:	00300413          	li	s0,3
 114:	00941863          	bne	s0,s1,124 <__crt0_dummy_trap_handler_irq>

00000118 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 118:	34102473          	csrr	s0,mepc
 11c:	00240413          	addi	s0,s0,2
 120:	34141073          	csrw	mepc,s0

00000124 <__crt0_dummy_trap_handler_irq>:
 124:	00012403          	lw	s0,0(sp)
 128:	00412483          	lw	s1,4(sp)
 12c:	00810113          	addi	sp,sp,8
 130:	30200073          	mret

00000134 <main>:
 134:	00005537          	lui	a0,0x5
 138:	ff010113          	addi	sp,sp,-16
 13c:	00000613          	li	a2,0
 140:	00000593          	li	a1,0
 144:	b0050513          	addi	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3ed4>
 148:	00112623          	sw	ra,12(sp)
 14c:	118000ef          	jal	ra,264 <neorv32_uart_setup>
 150:	690000ef          	jal	ra,7e0 <neorv32_gpio_available>
 154:	00050c63          	beqz	a0,16c <main+0x38>
 158:	640000ef          	jal	ra,798 <neorv32_rte_setup>
 15c:	00001537          	lui	a0,0x1
 160:	98850513          	addi	a0,a0,-1656 # 988 <__etext+0x24>
 164:	170000ef          	jal	ra,2d4 <neorv32_uart_print>
 168:	020000ef          	jal	ra,188 <blink_led_c>
 16c:	00001537          	lui	a0,0x1
 170:	96450513          	addi	a0,a0,-1692 # 964 <__etext>
 174:	160000ef          	jal	ra,2d4 <neorv32_uart_print>
 178:	00c12083          	lw	ra,12(sp)
 17c:	00100513          	li	a0,1
 180:	01010113          	addi	sp,sp,16
 184:	00008067          	ret

00000188 <blink_led_c>:
 188:	ff010113          	addi	sp,sp,-16
 18c:	00000513          	li	a0,0
 190:	00000593          	li	a1,0
 194:	00112623          	sw	ra,12(sp)
 198:	00812423          	sw	s0,8(sp)
 19c:	654000ef          	jal	ra,7f0 <neorv32_gpio_port_set>
 1a0:	00000513          	li	a0,0
 1a4:	00150413          	addi	s0,a0,1
 1a8:	00000593          	li	a1,0
 1ac:	0ff57513          	andi	a0,a0,255
 1b0:	640000ef          	jal	ra,7f0 <neorv32_gpio_port_set>
 1b4:	0c800513          	li	a0,200
 1b8:	120000ef          	jal	ra,2d8 <neorv32_cpu_delay_ms>
 1bc:	00040513          	mv	a0,s0
 1c0:	fe5ff06f          	j	1a4 <blink_led_c+0x1c>

000001c4 <neorv32_uart0_available>:
 1c4:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 1c8:	01255513          	srli	a0,a0,0x12
 1cc:	00157513          	andi	a0,a0,1
 1d0:	00008067          	ret

000001d4 <neorv32_uart0_setup>:
 1d4:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 1d8:	fe002703          	lw	a4,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 1dc:	00151513          	slli	a0,a0,0x1
 1e0:	00000793          	li	a5,0
 1e4:	04a77463          	bgeu	a4,a0,22c <neorv32_uart0_setup+0x58>
 1e8:	000016b7          	lui	a3,0x1
 1ec:	00000713          	li	a4,0
 1f0:	ffe68693          	addi	a3,a3,-2 # ffe <__crt0_copy_data_src_begin+0x3d2>
 1f4:	04f6e663          	bltu	a3,a5,240 <neorv32_uart0_setup+0x6c>
 1f8:	00367613          	andi	a2,a2,3
 1fc:	0035f593          	andi	a1,a1,3
 200:	fff78793          	addi	a5,a5,-1
 204:	01461613          	slli	a2,a2,0x14
 208:	00c7e7b3          	or	a5,a5,a2
 20c:	01659593          	slli	a1,a1,0x16
 210:	01871713          	slli	a4,a4,0x18
 214:	00b7e7b3          	or	a5,a5,a1
 218:	00e7e7b3          	or	a5,a5,a4
 21c:	10000737          	lui	a4,0x10000
 220:	00e7e7b3          	or	a5,a5,a4
 224:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 228:	00008067          	ret
 22c:	00178793          	addi	a5,a5,1
 230:	01079793          	slli	a5,a5,0x10
 234:	40a70733          	sub	a4,a4,a0
 238:	0107d793          	srli	a5,a5,0x10
 23c:	fa9ff06f          	j	1e4 <neorv32_uart0_setup+0x10>
 240:	ffe70513          	addi	a0,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xffff3d2>
 244:	0fd57513          	andi	a0,a0,253
 248:	00051a63          	bnez	a0,25c <neorv32_uart0_setup+0x88>
 24c:	0037d793          	srli	a5,a5,0x3
 250:	00170713          	addi	a4,a4,1
 254:	0ff77713          	andi	a4,a4,255
 258:	f9dff06f          	j	1f4 <neorv32_uart0_setup+0x20>
 25c:	0017d793          	srli	a5,a5,0x1
 260:	ff1ff06f          	j	250 <neorv32_uart0_setup+0x7c>

00000264 <neorv32_uart_setup>:
 264:	f71ff06f          	j	1d4 <neorv32_uart0_setup>

00000268 <neorv32_uart0_putc>:
 268:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 26c:	fe07cee3          	bltz	a5,268 <neorv32_uart0_putc>
 270:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
 274:	00008067          	ret

00000278 <neorv32_uart_putc>:
 278:	ff1ff06f          	j	268 <neorv32_uart0_putc>

0000027c <neorv32_uart0_print>:
 27c:	ff010113          	addi	sp,sp,-16
 280:	00812423          	sw	s0,8(sp)
 284:	01212023          	sw	s2,0(sp)
 288:	00112623          	sw	ra,12(sp)
 28c:	00912223          	sw	s1,4(sp)
 290:	00050413          	mv	s0,a0
 294:	00a00913          	li	s2,10
 298:	00044483          	lbu	s1,0(s0)
 29c:	00140413          	addi	s0,s0,1
 2a0:	00049e63          	bnez	s1,2bc <neorv32_uart0_print+0x40>
 2a4:	00c12083          	lw	ra,12(sp)
 2a8:	00812403          	lw	s0,8(sp)
 2ac:	00412483          	lw	s1,4(sp)
 2b0:	00012903          	lw	s2,0(sp)
 2b4:	01010113          	addi	sp,sp,16
 2b8:	00008067          	ret
 2bc:	01249663          	bne	s1,s2,2c8 <neorv32_uart0_print+0x4c>
 2c0:	00d00513          	li	a0,13
 2c4:	fa5ff0ef          	jal	ra,268 <neorv32_uart0_putc>
 2c8:	00048513          	mv	a0,s1
 2cc:	f9dff0ef          	jal	ra,268 <neorv32_uart0_putc>
 2d0:	fc9ff06f          	j	298 <neorv32_uart0_print+0x1c>

000002d4 <neorv32_uart_print>:
 2d4:	fa9ff06f          	j	27c <neorv32_uart0_print>

000002d8 <neorv32_cpu_delay_ms>:
 2d8:	fe010113          	addi	sp,sp,-32
 2dc:	00112e23          	sw	ra,28(sp)
 2e0:	00050613          	mv	a2,a0
 2e4:	00055863          	bgez	a0,2f4 <neorv32_cpu_delay_ms+0x1c>
 2e8:	40a00633          	neg	a2,a0
 2ec:	01061613          	slli	a2,a2,0x10
 2f0:	41065613          	srai	a2,a2,0x10
 2f4:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 2f8:	3e800593          	li	a1,1000
 2fc:	00c12623          	sw	a2,12(sp)
 300:	5b8000ef          	jal	ra,8b8 <__udivsi3>
 304:	00c12603          	lw	a2,12(sp)
 308:	00000593          	li	a1,0
 30c:	41f65693          	srai	a3,a2,0x1f
 310:	510000ef          	jal	ra,820 <__muldi3>
 314:	01c59593          	slli	a1,a1,0x1c
 318:	00455513          	srli	a0,a0,0x4
 31c:	00a5e533          	or	a0,a1,a0

00000320 <__neorv32_cpu_delay_ms_start>:
 320:	00050a63          	beqz	a0,334 <__neorv32_cpu_delay_ms_end>
 324:	00050863          	beqz	a0,334 <__neorv32_cpu_delay_ms_end>
 328:	fff50513          	addi	a0,a0,-1
 32c:	00000013          	nop
 330:	ff1ff06f          	j	320 <__neorv32_cpu_delay_ms_start>

00000334 <__neorv32_cpu_delay_ms_end>:
 334:	01c12083          	lw	ra,28(sp)
 338:	02010113          	addi	sp,sp,32
 33c:	00008067          	ret

00000340 <__neorv32_rte_core>:
 340:	fc010113          	addi	sp,sp,-64
 344:	02112e23          	sw	ra,60(sp)
 348:	02512c23          	sw	t0,56(sp)
 34c:	02612a23          	sw	t1,52(sp)
 350:	02712823          	sw	t2,48(sp)
 354:	02a12623          	sw	a0,44(sp)
 358:	02b12423          	sw	a1,40(sp)
 35c:	02c12223          	sw	a2,36(sp)
 360:	02d12023          	sw	a3,32(sp)
 364:	00e12e23          	sw	a4,28(sp)
 368:	00f12c23          	sw	a5,24(sp)
 36c:	01012a23          	sw	a6,20(sp)
 370:	01112823          	sw	a7,16(sp)
 374:	01c12623          	sw	t3,12(sp)
 378:	01d12423          	sw	t4,8(sp)
 37c:	01e12223          	sw	t5,4(sp)
 380:	01f12023          	sw	t6,0(sp)
 384:	34102773          	csrr	a4,mepc
 388:	34071073          	csrw	mscratch,a4
 38c:	342027f3          	csrr	a5,mcause
 390:	0807c863          	bltz	a5,420 <__neorv32_rte_core+0xe0>
 394:	00071683          	lh	a3,0(a4)
 398:	00300593          	li	a1,3
 39c:	0036f693          	andi	a3,a3,3
 3a0:	00270613          	addi	a2,a4,2
 3a4:	00b69463          	bne	a3,a1,3ac <__neorv32_rte_core+0x6c>
 3a8:	00470613          	addi	a2,a4,4
 3ac:	34161073          	csrw	mepc,a2
 3b0:	00b00713          	li	a4,11
 3b4:	04f77a63          	bgeu	a4,a5,408 <__neorv32_rte_core+0xc8>
 3b8:	5b800793          	li	a5,1464
 3bc:	000780e7          	jalr	a5
 3c0:	03c12083          	lw	ra,60(sp)
 3c4:	03812283          	lw	t0,56(sp)
 3c8:	03412303          	lw	t1,52(sp)
 3cc:	03012383          	lw	t2,48(sp)
 3d0:	02c12503          	lw	a0,44(sp)
 3d4:	02812583          	lw	a1,40(sp)
 3d8:	02412603          	lw	a2,36(sp)
 3dc:	02012683          	lw	a3,32(sp)
 3e0:	01c12703          	lw	a4,28(sp)
 3e4:	01812783          	lw	a5,24(sp)
 3e8:	01412803          	lw	a6,20(sp)
 3ec:	01012883          	lw	a7,16(sp)
 3f0:	00c12e03          	lw	t3,12(sp)
 3f4:	00812e83          	lw	t4,8(sp)
 3f8:	00412f03          	lw	t5,4(sp)
 3fc:	00012f83          	lw	t6,0(sp)
 400:	04010113          	addi	sp,sp,64
 404:	30200073          	mret
 408:	00001737          	lui	a4,0x1
 40c:	00279793          	slli	a5,a5,0x2
 410:	9a470713          	addi	a4,a4,-1628 # 9a4 <__etext+0x40>
 414:	00e787b3          	add	a5,a5,a4
 418:	0007a783          	lw	a5,0(a5)
 41c:	00078067          	jr	a5
 420:	80000737          	lui	a4,0x80000
 424:	00e787b3          	add	a5,a5,a4
 428:	01f00713          	li	a4,31
 42c:	f8f766e3          	bltu	a4,a5,3b8 <__neorv32_rte_core+0x78>
 430:	00001737          	lui	a4,0x1
 434:	00279793          	slli	a5,a5,0x2
 438:	9d470713          	addi	a4,a4,-1580 # 9d4 <__etext+0x70>
 43c:	00e787b3          	add	a5,a5,a4
 440:	0007a783          	lw	a5,0(a5)
 444:	00078067          	jr	a5
 448:	800007b7          	lui	a5,0x80000
 44c:	0007a783          	lw	a5,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 450:	f6dff06f          	j	3bc <__neorv32_rte_core+0x7c>
 454:	800007b7          	lui	a5,0x80000
 458:	0047a783          	lw	a5,4(a5) # 80000004 <__ctr0_io_space_begin+0x80000204>
 45c:	f61ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 460:	800007b7          	lui	a5,0x80000
 464:	0087a783          	lw	a5,8(a5) # 80000008 <__ctr0_io_space_begin+0x80000208>
 468:	f55ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 46c:	800007b7          	lui	a5,0x80000
 470:	00c7a783          	lw	a5,12(a5) # 8000000c <__ctr0_io_space_begin+0x8000020c>
 474:	f49ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 478:	8101a783          	lw	a5,-2032(gp) # 80000010 <__neorv32_rte_vector_lut+0x10>
 47c:	f41ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 480:	8141a783          	lw	a5,-2028(gp) # 80000014 <__neorv32_rte_vector_lut+0x14>
 484:	f39ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 488:	8181a783          	lw	a5,-2024(gp) # 80000018 <__neorv32_rte_vector_lut+0x18>
 48c:	f31ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 490:	81c1a783          	lw	a5,-2020(gp) # 8000001c <__neorv32_rte_vector_lut+0x1c>
 494:	f29ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 498:	8201a783          	lw	a5,-2016(gp) # 80000020 <__neorv32_rte_vector_lut+0x20>
 49c:	f21ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4a0:	8241a783          	lw	a5,-2012(gp) # 80000024 <__neorv32_rte_vector_lut+0x24>
 4a4:	f19ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4a8:	8281a783          	lw	a5,-2008(gp) # 80000028 <__neorv32_rte_vector_lut+0x28>
 4ac:	f11ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4b0:	82c1a783          	lw	a5,-2004(gp) # 8000002c <__neorv32_rte_vector_lut+0x2c>
 4b4:	f09ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4b8:	8301a783          	lw	a5,-2000(gp) # 80000030 <__neorv32_rte_vector_lut+0x30>
 4bc:	f01ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4c0:	8341a783          	lw	a5,-1996(gp) # 80000034 <__neorv32_rte_vector_lut+0x34>
 4c4:	ef9ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4c8:	8381a783          	lw	a5,-1992(gp) # 80000038 <__neorv32_rte_vector_lut+0x38>
 4cc:	ef1ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4d0:	83c1a783          	lw	a5,-1988(gp) # 8000003c <__neorv32_rte_vector_lut+0x3c>
 4d4:	ee9ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4d8:	8401a783          	lw	a5,-1984(gp) # 80000040 <__neorv32_rte_vector_lut+0x40>
 4dc:	ee1ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4e0:	8441a783          	lw	a5,-1980(gp) # 80000044 <__neorv32_rte_vector_lut+0x44>
 4e4:	ed9ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4e8:	8481a783          	lw	a5,-1976(gp) # 80000048 <__neorv32_rte_vector_lut+0x48>
 4ec:	ed1ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4f0:	84c1a783          	lw	a5,-1972(gp) # 8000004c <__neorv32_rte_vector_lut+0x4c>
 4f4:	ec9ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 4f8:	8501a783          	lw	a5,-1968(gp) # 80000050 <__neorv32_rte_vector_lut+0x50>
 4fc:	ec1ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 500:	8541a783          	lw	a5,-1964(gp) # 80000054 <__neorv32_rte_vector_lut+0x54>
 504:	eb9ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 508:	8581a783          	lw	a5,-1960(gp) # 80000058 <__neorv32_rte_vector_lut+0x58>
 50c:	eb1ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 510:	85c1a783          	lw	a5,-1956(gp) # 8000005c <__neorv32_rte_vector_lut+0x5c>
 514:	ea9ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 518:	8601a783          	lw	a5,-1952(gp) # 80000060 <__neorv32_rte_vector_lut+0x60>
 51c:	ea1ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 520:	8641a783          	lw	a5,-1948(gp) # 80000064 <__neorv32_rte_vector_lut+0x64>
 524:	e99ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 528:	8681a783          	lw	a5,-1944(gp) # 80000068 <__neorv32_rte_vector_lut+0x68>
 52c:	e91ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 530:	86c1a783          	lw	a5,-1940(gp) # 8000006c <__neorv32_rte_vector_lut+0x6c>
 534:	e89ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 538:	8701a783          	lw	a5,-1936(gp) # 80000070 <__neorv32_rte_vector_lut+0x70>
 53c:	e81ff06f          	j	3bc <__neorv32_rte_core+0x7c>
 540:	8741a783          	lw	a5,-1932(gp) # 80000074 <__neorv32_rte_vector_lut+0x74>
 544:	e79ff06f          	j	3bc <__neorv32_rte_core+0x7c>

00000548 <__neorv32_rte_print_hex_word>:
 548:	fe010113          	addi	sp,sp,-32
 54c:	01212823          	sw	s2,16(sp)
 550:	00050913          	mv	s2,a0
 554:	00001537          	lui	a0,0x1
 558:	00912a23          	sw	s1,20(sp)
 55c:	a5450513          	addi	a0,a0,-1452 # a54 <__etext+0xf0>
 560:	000014b7          	lui	s1,0x1
 564:	00812c23          	sw	s0,24(sp)
 568:	01312623          	sw	s3,12(sp)
 56c:	00112e23          	sw	ra,28(sp)
 570:	01c00413          	li	s0,28
 574:	d09ff0ef          	jal	ra,27c <neorv32_uart0_print>
 578:	c1c48493          	addi	s1,s1,-996 # c1c <hex_symbols.0>
 57c:	ffc00993          	li	s3,-4
 580:	008957b3          	srl	a5,s2,s0
 584:	00f7f793          	andi	a5,a5,15
 588:	00f487b3          	add	a5,s1,a5
 58c:	0007c503          	lbu	a0,0(a5)
 590:	ffc40413          	addi	s0,s0,-4
 594:	cd5ff0ef          	jal	ra,268 <neorv32_uart0_putc>
 598:	ff3414e3          	bne	s0,s3,580 <__neorv32_rte_print_hex_word+0x38>
 59c:	01c12083          	lw	ra,28(sp)
 5a0:	01812403          	lw	s0,24(sp)
 5a4:	01412483          	lw	s1,20(sp)
 5a8:	01012903          	lw	s2,16(sp)
 5ac:	00c12983          	lw	s3,12(sp)
 5b0:	02010113          	addi	sp,sp,32
 5b4:	00008067          	ret

000005b8 <__neorv32_rte_debug_exc_handler>:
 5b8:	ff010113          	addi	sp,sp,-16
 5bc:	00112623          	sw	ra,12(sp)
 5c0:	00812423          	sw	s0,8(sp)
 5c4:	00912223          	sw	s1,4(sp)
 5c8:	bfdff0ef          	jal	ra,1c4 <neorv32_uart0_available>
 5cc:	18050463          	beqz	a0,754 <__neorv32_rte_debug_exc_handler+0x19c>
 5d0:	00001537          	lui	a0,0x1
 5d4:	a5850513          	addi	a0,a0,-1448 # a58 <__etext+0xf4>
 5d8:	cfdff0ef          	jal	ra,2d4 <neorv32_uart_print>
 5dc:	34202473          	csrr	s0,mcause
 5e0:	00900713          	li	a4,9
 5e4:	00f47793          	andi	a5,s0,15
 5e8:	03078493          	addi	s1,a5,48
 5ec:	00f77463          	bgeu	a4,a5,5f4 <__neorv32_rte_debug_exc_handler+0x3c>
 5f0:	05778493          	addi	s1,a5,87
 5f4:	00b00793          	li	a5,11
 5f8:	0087ee63          	bltu	a5,s0,614 <__neorv32_rte_debug_exc_handler+0x5c>
 5fc:	00001737          	lui	a4,0x1
 600:	00241793          	slli	a5,s0,0x2
 604:	bec70713          	addi	a4,a4,-1044 # bec <__etext+0x288>
 608:	00e787b3          	add	a5,a5,a4
 60c:	0007a783          	lw	a5,0(a5)
 610:	00078067          	jr	a5
 614:	800007b7          	lui	a5,0x80000
 618:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 61c:	12e40663          	beq	s0,a4,748 <__neorv32_rte_debug_exc_handler+0x190>
 620:	02876663          	bltu	a4,s0,64c <__neorv32_rte_debug_exc_handler+0x94>
 624:	00378713          	addi	a4,a5,3
 628:	10e40463          	beq	s0,a4,730 <__neorv32_rte_debug_exc_handler+0x178>
 62c:	00778793          	addi	a5,a5,7
 630:	10f40663          	beq	s0,a5,73c <__neorv32_rte_debug_exc_handler+0x184>
 634:	00001537          	lui	a0,0x1
 638:	bb850513          	addi	a0,a0,-1096 # bb8 <__etext+0x254>
 63c:	c99ff0ef          	jal	ra,2d4 <neorv32_uart_print>
 640:	00040513          	mv	a0,s0
 644:	f05ff0ef          	jal	ra,548 <__neorv32_rte_print_hex_word>
 648:	0380006f          	j	680 <__neorv32_rte_debug_exc_handler+0xc8>
 64c:	ff07c793          	xori	a5,a5,-16
 650:	00f407b3          	add	a5,s0,a5
 654:	00f00713          	li	a4,15
 658:	fcf76ee3          	bltu	a4,a5,634 <__neorv32_rte_debug_exc_handler+0x7c>
 65c:	00001537          	lui	a0,0x1
 660:	ba850513          	addi	a0,a0,-1112 # ba8 <__etext+0x244>
 664:	c71ff0ef          	jal	ra,2d4 <neorv32_uart_print>
 668:	00048513          	mv	a0,s1
 66c:	c0dff0ef          	jal	ra,278 <neorv32_uart_putc>
 670:	0100006f          	j	680 <__neorv32_rte_debug_exc_handler+0xc8>
 674:	00001537          	lui	a0,0x1
 678:	a6050513          	addi	a0,a0,-1440 # a60 <__etext+0xfc>
 67c:	c59ff0ef          	jal	ra,2d4 <neorv32_uart_print>
 680:	00001537          	lui	a0,0x1
 684:	bd050513          	addi	a0,a0,-1072 # bd0 <__etext+0x26c>
 688:	c4dff0ef          	jal	ra,2d4 <neorv32_uart_print>
 68c:	34002573          	csrr	a0,mscratch
 690:	eb9ff0ef          	jal	ra,548 <__neorv32_rte_print_hex_word>
 694:	00001537          	lui	a0,0x1
 698:	bd850513          	addi	a0,a0,-1064 # bd8 <__etext+0x274>
 69c:	c39ff0ef          	jal	ra,2d4 <neorv32_uart_print>
 6a0:	34302573          	csrr	a0,mtval
 6a4:	ea5ff0ef          	jal	ra,548 <__neorv32_rte_print_hex_word>
 6a8:	00812403          	lw	s0,8(sp)
 6ac:	00c12083          	lw	ra,12(sp)
 6b0:	00412483          	lw	s1,4(sp)
 6b4:	00001537          	lui	a0,0x1
 6b8:	be450513          	addi	a0,a0,-1052 # be4 <__etext+0x280>
 6bc:	01010113          	addi	sp,sp,16
 6c0:	c15ff06f          	j	2d4 <neorv32_uart_print>
 6c4:	00001537          	lui	a0,0x1
 6c8:	a8050513          	addi	a0,a0,-1408 # a80 <__etext+0x11c>
 6cc:	fb1ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 6d0:	00001537          	lui	a0,0x1
 6d4:	a9c50513          	addi	a0,a0,-1380 # a9c <__etext+0x138>
 6d8:	fa5ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 6dc:	00001537          	lui	a0,0x1
 6e0:	ab050513          	addi	a0,a0,-1360 # ab0 <__etext+0x14c>
 6e4:	f99ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 6e8:	00001537          	lui	a0,0x1
 6ec:	abc50513          	addi	a0,a0,-1348 # abc <__etext+0x158>
 6f0:	f8dff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 6f4:	00001537          	lui	a0,0x1
 6f8:	ad450513          	addi	a0,a0,-1324 # ad4 <__etext+0x170>
 6fc:	f81ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 700:	00001537          	lui	a0,0x1
 704:	ae850513          	addi	a0,a0,-1304 # ae8 <__etext+0x184>
 708:	f75ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 70c:	00001537          	lui	a0,0x1
 710:	b0450513          	addi	a0,a0,-1276 # b04 <__etext+0x1a0>
 714:	f69ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 718:	00001537          	lui	a0,0x1
 71c:	b1850513          	addi	a0,a0,-1256 # b18 <__etext+0x1b4>
 720:	f5dff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 724:	00001537          	lui	a0,0x1
 728:	b3850513          	addi	a0,a0,-1224 # b38 <__etext+0x1d4>
 72c:	f51ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 730:	00001537          	lui	a0,0x1
 734:	b5850513          	addi	a0,a0,-1192 # b58 <__etext+0x1f4>
 738:	f45ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 73c:	00001537          	lui	a0,0x1
 740:	b7450513          	addi	a0,a0,-1164 # b74 <__etext+0x210>
 744:	f39ff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 748:	00001537          	lui	a0,0x1
 74c:	b8c50513          	addi	a0,a0,-1140 # b8c <__etext+0x228>
 750:	f2dff06f          	j	67c <__neorv32_rte_debug_exc_handler+0xc4>
 754:	00c12083          	lw	ra,12(sp)
 758:	00812403          	lw	s0,8(sp)
 75c:	00412483          	lw	s1,4(sp)
 760:	01010113          	addi	sp,sp,16
 764:	00008067          	ret

00000768 <neorv32_rte_exception_uninstall>:
 768:	01f00793          	li	a5,31
 76c:	02a7e263          	bltu	a5,a0,790 <neorv32_rte_exception_uninstall+0x28>
 770:	800007b7          	lui	a5,0x80000
 774:	00078793          	mv	a5,a5
 778:	00251513          	slli	a0,a0,0x2
 77c:	00a78533          	add	a0,a5,a0
 780:	5b800793          	li	a5,1464
 784:	00f52023          	sw	a5,0(a0)
 788:	00000513          	li	a0,0
 78c:	00008067          	ret
 790:	00100513          	li	a0,1
 794:	00008067          	ret

00000798 <neorv32_rte_setup>:
 798:	ff010113          	addi	sp,sp,-16
 79c:	00112623          	sw	ra,12(sp)
 7a0:	00812423          	sw	s0,8(sp)
 7a4:	00912223          	sw	s1,4(sp)
 7a8:	34000793          	li	a5,832
 7ac:	30579073          	csrw	mtvec,a5
 7b0:	00000413          	li	s0,0
 7b4:	01e00493          	li	s1,30
 7b8:	00040513          	mv	a0,s0
 7bc:	00140413          	addi	s0,s0,1
 7c0:	0ff47413          	andi	s0,s0,255
 7c4:	fa5ff0ef          	jal	ra,768 <neorv32_rte_exception_uninstall>
 7c8:	fe9418e3          	bne	s0,s1,7b8 <neorv32_rte_setup+0x20>
 7cc:	00c12083          	lw	ra,12(sp)
 7d0:	00812403          	lw	s0,8(sp)
 7d4:	00412483          	lw	s1,4(sp)
 7d8:	01010113          	addi	sp,sp,16
 7dc:	00008067          	ret

000007e0 <neorv32_gpio_available>:
 7e0:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 7e4:	01055513          	srli	a0,a0,0x10
 7e8:	00157513          	andi	a0,a0,1
 7ec:	00008067          	ret

000007f0 <neorv32_gpio_port_set>:
 7f0:	fca02423          	sw	a0,-56(zero) # ffffffc8 <__ctr0_io_space_begin+0x1c8>
 7f4:	fcb02623          	sw	a1,-52(zero) # ffffffcc <__ctr0_io_space_begin+0x1cc>
 7f8:	00008067          	ret

000007fc <__mulsi3>:
 7fc:	00050613          	mv	a2,a0
 800:	00000513          	li	a0,0
 804:	0015f693          	andi	a3,a1,1
 808:	00068463          	beqz	a3,810 <__mulsi3+0x14>
 80c:	00c50533          	add	a0,a0,a2
 810:	0015d593          	srli	a1,a1,0x1
 814:	00161613          	slli	a2,a2,0x1
 818:	fe0596e3          	bnez	a1,804 <__mulsi3+0x8>
 81c:	00008067          	ret

00000820 <__muldi3>:
 820:	00050313          	mv	t1,a0
 824:	ff010113          	addi	sp,sp,-16
 828:	00060513          	mv	a0,a2
 82c:	00068893          	mv	a7,a3
 830:	00112623          	sw	ra,12(sp)
 834:	00030613          	mv	a2,t1
 838:	00050693          	mv	a3,a0
 83c:	00000713          	li	a4,0
 840:	00000793          	li	a5,0
 844:	00000813          	li	a6,0
 848:	0016fe13          	andi	t3,a3,1
 84c:	00171e93          	slli	t4,a4,0x1
 850:	000e0c63          	beqz	t3,868 <__muldi3+0x48>
 854:	01060e33          	add	t3,a2,a6
 858:	010e3833          	sltu	a6,t3,a6
 85c:	00e787b3          	add	a5,a5,a4
 860:	00f807b3          	add	a5,a6,a5
 864:	000e0813          	mv	a6,t3
 868:	01f65713          	srli	a4,a2,0x1f
 86c:	0016d693          	srli	a3,a3,0x1
 870:	00eee733          	or	a4,t4,a4
 874:	00161613          	slli	a2,a2,0x1
 878:	fc0698e3          	bnez	a3,848 <__muldi3+0x28>
 87c:	00058663          	beqz	a1,888 <__muldi3+0x68>
 880:	f7dff0ef          	jal	ra,7fc <__mulsi3>
 884:	00a787b3          	add	a5,a5,a0
 888:	00088a63          	beqz	a7,89c <__muldi3+0x7c>
 88c:	00030513          	mv	a0,t1
 890:	00088593          	mv	a1,a7
 894:	f69ff0ef          	jal	ra,7fc <__mulsi3>
 898:	00f507b3          	add	a5,a0,a5
 89c:	00c12083          	lw	ra,12(sp)
 8a0:	00080513          	mv	a0,a6
 8a4:	00078593          	mv	a1,a5
 8a8:	01010113          	addi	sp,sp,16
 8ac:	00008067          	ret

000008b0 <__divsi3>:
 8b0:	06054063          	bltz	a0,910 <__umodsi3+0x10>
 8b4:	0605c663          	bltz	a1,920 <__umodsi3+0x20>

000008b8 <__udivsi3>:
 8b8:	00058613          	mv	a2,a1
 8bc:	00050593          	mv	a1,a0
 8c0:	fff00513          	li	a0,-1
 8c4:	02060c63          	beqz	a2,8fc <__udivsi3+0x44>
 8c8:	00100693          	li	a3,1
 8cc:	00b67a63          	bgeu	a2,a1,8e0 <__udivsi3+0x28>
 8d0:	00c05863          	blez	a2,8e0 <__udivsi3+0x28>
 8d4:	00161613          	slli	a2,a2,0x1
 8d8:	00169693          	slli	a3,a3,0x1
 8dc:	feb66ae3          	bltu	a2,a1,8d0 <__udivsi3+0x18>
 8e0:	00000513          	li	a0,0
 8e4:	00c5e663          	bltu	a1,a2,8f0 <__udivsi3+0x38>
 8e8:	40c585b3          	sub	a1,a1,a2
 8ec:	00d56533          	or	a0,a0,a3
 8f0:	0016d693          	srli	a3,a3,0x1
 8f4:	00165613          	srli	a2,a2,0x1
 8f8:	fe0696e3          	bnez	a3,8e4 <__udivsi3+0x2c>
 8fc:	00008067          	ret

00000900 <__umodsi3>:
 900:	00008293          	mv	t0,ra
 904:	fb5ff0ef          	jal	ra,8b8 <__udivsi3>
 908:	00058513          	mv	a0,a1
 90c:	00028067          	jr	t0
 910:	40a00533          	neg	a0,a0
 914:	00b04863          	bgtz	a1,924 <__umodsi3+0x24>
 918:	40b005b3          	neg	a1,a1
 91c:	f9dff06f          	j	8b8 <__udivsi3>
 920:	40b005b3          	neg	a1,a1
 924:	00008293          	mv	t0,ra
 928:	f91ff0ef          	jal	ra,8b8 <__udivsi3>
 92c:	40a00533          	neg	a0,a0
 930:	00028067          	jr	t0

00000934 <__modsi3>:
 934:	00008293          	mv	t0,ra
 938:	0005ca63          	bltz	a1,94c <__modsi3+0x18>
 93c:	00054c63          	bltz	a0,954 <__modsi3+0x20>
 940:	f79ff0ef          	jal	ra,8b8 <__udivsi3>
 944:	00058513          	mv	a0,a1
 948:	00028067          	jr	t0
 94c:	40b005b3          	neg	a1,a1
 950:	fe0558e3          	bgez	a0,940 <__modsi3+0xc>
 954:	40a00533          	neg	a0,a0
 958:	f61ff0ef          	jal	ra,8b8 <__udivsi3>
 95c:	40b00533          	neg	a0,a1
 960:	00028067          	jr	t0
