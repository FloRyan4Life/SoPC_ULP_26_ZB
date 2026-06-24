
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
  a0:	55458593          	addi	a1,a1,1364 # 15f0 <__crt0_copy_data_src_begin>
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
 134:	ff010113          	addi	sp,sp,-16
 138:	00112623          	sw	ra,12(sp)
 13c:	0c5000ef          	jal	ra,a00 <neorv32_rte_setup>
 140:	00005537          	lui	a0,0x5
 144:	00000613          	li	a2,0
 148:	00000593          	li	a1,0
 14c:	b0050513          	addi	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3510>
 150:	210000ef          	jal	ra,360 <neorv32_uart_setup>
 154:	00000513          	li	a0,0
 158:	1ed000ef          	jal	ra,b44 <neorv32_rte_check_isa>
 15c:	0ed000ef          	jal	ra,a48 <neorv32_rte_print_logo>
 160:	00001537          	lui	a0,0x1
 164:	d8050513          	addi	a0,a0,-640 # d80 <__etext>
 168:	268000ef          	jal	ra,3d0 <neorv32_uart_print>
 16c:	00c12083          	lw	ra,12(sp)
 170:	00000513          	li	a0,0
 174:	01010113          	addi	sp,sp,16
 178:	00008067          	ret

0000017c <__neorv32_uart_itoa>:
 17c:	fd010113          	addi	sp,sp,-48
 180:	02812423          	sw	s0,40(sp)
 184:	02912223          	sw	s1,36(sp)
 188:	03212023          	sw	s2,32(sp)
 18c:	01312e23          	sw	s3,28(sp)
 190:	01412c23          	sw	s4,24(sp)
 194:	02112623          	sw	ra,44(sp)
 198:	01512a23          	sw	s5,20(sp)
 19c:	00001a37          	lui	s4,0x1
 1a0:	00050493          	mv	s1,a0
 1a4:	00058413          	mv	s0,a1
 1a8:	00058523          	sb	zero,10(a1)
 1ac:	00000993          	li	s3,0
 1b0:	00410913          	addi	s2,sp,4
 1b4:	d94a0a13          	addi	s4,s4,-620 # d94 <numbers.1>
 1b8:	00a00593          	li	a1,10
 1bc:	00048513          	mv	a0,s1
 1c0:	235000ef          	jal	ra,bf4 <__umodsi3>
 1c4:	00aa0533          	add	a0,s4,a0
 1c8:	00054783          	lbu	a5,0(a0)
 1cc:	01390ab3          	add	s5,s2,s3
 1d0:	00048513          	mv	a0,s1
 1d4:	00fa8023          	sb	a5,0(s5)
 1d8:	00a00593          	li	a1,10
 1dc:	1d1000ef          	jal	ra,bac <__udivsi3>
 1e0:	00198993          	addi	s3,s3,1
 1e4:	00a00793          	li	a5,10
 1e8:	00050493          	mv	s1,a0
 1ec:	fcf996e3          	bne	s3,a5,1b8 <__neorv32_uart_itoa+0x3c>
 1f0:	00090693          	mv	a3,s2
 1f4:	00900713          	li	a4,9
 1f8:	03000613          	li	a2,48
 1fc:	0096c583          	lbu	a1,9(a3)
 200:	00070793          	mv	a5,a4
 204:	fff70713          	addi	a4,a4,-1
 208:	01071713          	slli	a4,a4,0x10
 20c:	01075713          	srli	a4,a4,0x10
 210:	00c59a63          	bne	a1,a2,224 <__neorv32_uart_itoa+0xa8>
 214:	000684a3          	sb	zero,9(a3)
 218:	fff68693          	addi	a3,a3,-1
 21c:	fe0710e3          	bnez	a4,1fc <__neorv32_uart_itoa+0x80>
 220:	00000793          	li	a5,0
 224:	00f907b3          	add	a5,s2,a5
 228:	00000593          	li	a1,0
 22c:	0007c703          	lbu	a4,0(a5)
 230:	00070c63          	beqz	a4,248 <__neorv32_uart_itoa+0xcc>
 234:	00158693          	addi	a3,a1,1
 238:	00b405b3          	add	a1,s0,a1
 23c:	00e58023          	sb	a4,0(a1)
 240:	01069593          	slli	a1,a3,0x10
 244:	0105d593          	srli	a1,a1,0x10
 248:	fff78713          	addi	a4,a5,-1
 24c:	02f91863          	bne	s2,a5,27c <__neorv32_uart_itoa+0x100>
 250:	00b40433          	add	s0,s0,a1
 254:	00040023          	sb	zero,0(s0)
 258:	02c12083          	lw	ra,44(sp)
 25c:	02812403          	lw	s0,40(sp)
 260:	02412483          	lw	s1,36(sp)
 264:	02012903          	lw	s2,32(sp)
 268:	01c12983          	lw	s3,28(sp)
 26c:	01812a03          	lw	s4,24(sp)
 270:	01412a83          	lw	s5,20(sp)
 274:	03010113          	addi	sp,sp,48
 278:	00008067          	ret
 27c:	00070793          	mv	a5,a4
 280:	fadff06f          	j	22c <__neorv32_uart_itoa+0xb0>

00000284 <__neorv32_uart_tohex>:
 284:	00001637          	lui	a2,0x1
 288:	00758693          	addi	a3,a1,7
 28c:	00000713          	li	a4,0
 290:	da060613          	addi	a2,a2,-608 # da0 <symbols.0>
 294:	02000813          	li	a6,32
 298:	00e557b3          	srl	a5,a0,a4
 29c:	00f7f793          	andi	a5,a5,15
 2a0:	00f607b3          	add	a5,a2,a5
 2a4:	0007c783          	lbu	a5,0(a5)
 2a8:	00470713          	addi	a4,a4,4
 2ac:	fff68693          	addi	a3,a3,-1
 2b0:	00f680a3          	sb	a5,1(a3)
 2b4:	ff0712e3          	bne	a4,a6,298 <__neorv32_uart_tohex+0x14>
 2b8:	00058423          	sb	zero,8(a1)
 2bc:	00008067          	ret

000002c0 <neorv32_uart0_available>:
 2c0:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 2c4:	01255513          	srli	a0,a0,0x12
 2c8:	00157513          	andi	a0,a0,1
 2cc:	00008067          	ret

000002d0 <neorv32_uart0_setup>:
 2d0:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 2d4:	fe002703          	lw	a4,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 2d8:	00151513          	slli	a0,a0,0x1
 2dc:	00000793          	li	a5,0
 2e0:	04a77463          	bgeu	a4,a0,328 <neorv32_uart0_setup+0x58>
 2e4:	000016b7          	lui	a3,0x1
 2e8:	00000713          	li	a4,0
 2ec:	ffe68693          	addi	a3,a3,-2 # ffe <symbols.0+0x25e>
 2f0:	04f6e663          	bltu	a3,a5,33c <neorv32_uart0_setup+0x6c>
 2f4:	00367613          	andi	a2,a2,3
 2f8:	0035f593          	andi	a1,a1,3
 2fc:	fff78793          	addi	a5,a5,-1
 300:	01461613          	slli	a2,a2,0x14
 304:	00c7e7b3          	or	a5,a5,a2
 308:	01659593          	slli	a1,a1,0x16
 30c:	01871713          	slli	a4,a4,0x18
 310:	00b7e7b3          	or	a5,a5,a1
 314:	00e7e7b3          	or	a5,a5,a4
 318:	10000737          	lui	a4,0x10000
 31c:	00e7e7b3          	or	a5,a5,a4
 320:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 324:	00008067          	ret
 328:	00178793          	addi	a5,a5,1
 32c:	01079793          	slli	a5,a5,0x10
 330:	40a70733          	sub	a4,a4,a0
 334:	0107d793          	srli	a5,a5,0x10
 338:	fa9ff06f          	j	2e0 <neorv32_uart0_setup+0x10>
 33c:	ffe70513          	addi	a0,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xfffea0e>
 340:	0fd57513          	andi	a0,a0,253
 344:	00051a63          	bnez	a0,358 <neorv32_uart0_setup+0x88>
 348:	0037d793          	srli	a5,a5,0x3
 34c:	00170713          	addi	a4,a4,1
 350:	0ff77713          	andi	a4,a4,255
 354:	f9dff06f          	j	2f0 <neorv32_uart0_setup+0x20>
 358:	0017d793          	srli	a5,a5,0x1
 35c:	ff1ff06f          	j	34c <neorv32_uart0_setup+0x7c>

00000360 <neorv32_uart_setup>:
 360:	f71ff06f          	j	2d0 <neorv32_uart0_setup>

00000364 <neorv32_uart0_putc>:
 364:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 368:	fe07cee3          	bltz	a5,364 <neorv32_uart0_putc>
 36c:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
 370:	00008067          	ret

00000374 <neorv32_uart_putc>:
 374:	ff1ff06f          	j	364 <neorv32_uart0_putc>

00000378 <neorv32_uart0_print>:
 378:	ff010113          	addi	sp,sp,-16
 37c:	00812423          	sw	s0,8(sp)
 380:	01212023          	sw	s2,0(sp)
 384:	00112623          	sw	ra,12(sp)
 388:	00912223          	sw	s1,4(sp)
 38c:	00050413          	mv	s0,a0
 390:	00a00913          	li	s2,10
 394:	00044483          	lbu	s1,0(s0)
 398:	00140413          	addi	s0,s0,1
 39c:	00049e63          	bnez	s1,3b8 <neorv32_uart0_print+0x40>
 3a0:	00c12083          	lw	ra,12(sp)
 3a4:	00812403          	lw	s0,8(sp)
 3a8:	00412483          	lw	s1,4(sp)
 3ac:	00012903          	lw	s2,0(sp)
 3b0:	01010113          	addi	sp,sp,16
 3b4:	00008067          	ret
 3b8:	01249663          	bne	s1,s2,3c4 <neorv32_uart0_print+0x4c>
 3bc:	00d00513          	li	a0,13
 3c0:	fa5ff0ef          	jal	ra,364 <neorv32_uart0_putc>
 3c4:	00048513          	mv	a0,s1
 3c8:	f9dff0ef          	jal	ra,364 <neorv32_uart0_putc>
 3cc:	fc9ff06f          	j	394 <neorv32_uart0_print+0x1c>

000003d0 <neorv32_uart_print>:
 3d0:	fa9ff06f          	j	378 <neorv32_uart0_print>

000003d4 <neorv32_uart0_printf>:
 3d4:	fa010113          	addi	sp,sp,-96
 3d8:	04f12a23          	sw	a5,84(sp)
 3dc:	04410793          	addi	a5,sp,68
 3e0:	02812c23          	sw	s0,56(sp)
 3e4:	03212823          	sw	s2,48(sp)
 3e8:	03412423          	sw	s4,40(sp)
 3ec:	03512223          	sw	s5,36(sp)
 3f0:	03612023          	sw	s6,32(sp)
 3f4:	01712e23          	sw	s7,28(sp)
 3f8:	01812c23          	sw	s8,24(sp)
 3fc:	01912a23          	sw	s9,20(sp)
 400:	02112e23          	sw	ra,60(sp)
 404:	02912a23          	sw	s1,52(sp)
 408:	03312623          	sw	s3,44(sp)
 40c:	00050413          	mv	s0,a0
 410:	04b12223          	sw	a1,68(sp)
 414:	04c12423          	sw	a2,72(sp)
 418:	04d12623          	sw	a3,76(sp)
 41c:	04e12823          	sw	a4,80(sp)
 420:	05012c23          	sw	a6,88(sp)
 424:	05112e23          	sw	a7,92(sp)
 428:	00f12023          	sw	a5,0(sp)
 42c:	02500a13          	li	s4,37
 430:	00a00a93          	li	s5,10
 434:	07300913          	li	s2,115
 438:	07500b13          	li	s6,117
 43c:	07800b93          	li	s7,120
 440:	06300c13          	li	s8,99
 444:	06900c93          	li	s9,105
 448:	00044483          	lbu	s1,0(s0)
 44c:	02049c63          	bnez	s1,484 <neorv32_uart0_printf+0xb0>
 450:	03c12083          	lw	ra,60(sp)
 454:	03812403          	lw	s0,56(sp)
 458:	03412483          	lw	s1,52(sp)
 45c:	03012903          	lw	s2,48(sp)
 460:	02c12983          	lw	s3,44(sp)
 464:	02812a03          	lw	s4,40(sp)
 468:	02412a83          	lw	s5,36(sp)
 46c:	02012b03          	lw	s6,32(sp)
 470:	01c12b83          	lw	s7,28(sp)
 474:	01812c03          	lw	s8,24(sp)
 478:	01412c83          	lw	s9,20(sp)
 47c:	06010113          	addi	sp,sp,96
 480:	00008067          	ret
 484:	0d449863          	bne	s1,s4,554 <neorv32_uart0_printf+0x180>
 488:	00240993          	addi	s3,s0,2
 48c:	00144403          	lbu	s0,1(s0)
 490:	05240263          	beq	s0,s2,4d4 <neorv32_uart0_printf+0x100>
 494:	00896e63          	bltu	s2,s0,4b0 <neorv32_uart0_printf+0xdc>
 498:	05840c63          	beq	s0,s8,4f0 <neorv32_uart0_printf+0x11c>
 49c:	07940663          	beq	s0,s9,508 <neorv32_uart0_printf+0x134>
 4a0:	02500513          	li	a0,37
 4a4:	ec1ff0ef          	jal	ra,364 <neorv32_uart0_putc>
 4a8:	00040513          	mv	a0,s0
 4ac:	0540006f          	j	500 <neorv32_uart0_printf+0x12c>
 4b0:	09640663          	beq	s0,s6,53c <neorv32_uart0_printf+0x168>
 4b4:	ff7416e3          	bne	s0,s7,4a0 <neorv32_uart0_printf+0xcc>
 4b8:	00012783          	lw	a5,0(sp)
 4bc:	00410593          	addi	a1,sp,4
 4c0:	0007a503          	lw	a0,0(a5)
 4c4:	00478713          	addi	a4,a5,4
 4c8:	00e12023          	sw	a4,0(sp)
 4cc:	db9ff0ef          	jal	ra,284 <__neorv32_uart_tohex>
 4d0:	0640006f          	j	534 <neorv32_uart0_printf+0x160>
 4d4:	00012783          	lw	a5,0(sp)
 4d8:	0007a503          	lw	a0,0(a5)
 4dc:	00478713          	addi	a4,a5,4
 4e0:	00e12023          	sw	a4,0(sp)
 4e4:	e95ff0ef          	jal	ra,378 <neorv32_uart0_print>
 4e8:	00098413          	mv	s0,s3
 4ec:	f5dff06f          	j	448 <neorv32_uart0_printf+0x74>
 4f0:	00012783          	lw	a5,0(sp)
 4f4:	0007c503          	lbu	a0,0(a5)
 4f8:	00478713          	addi	a4,a5,4
 4fc:	00e12023          	sw	a4,0(sp)
 500:	e65ff0ef          	jal	ra,364 <neorv32_uart0_putc>
 504:	fe5ff06f          	j	4e8 <neorv32_uart0_printf+0x114>
 508:	00012783          	lw	a5,0(sp)
 50c:	0007a403          	lw	s0,0(a5)
 510:	00478713          	addi	a4,a5,4
 514:	00e12023          	sw	a4,0(sp)
 518:	00045863          	bgez	s0,528 <neorv32_uart0_printf+0x154>
 51c:	02d00513          	li	a0,45
 520:	40800433          	neg	s0,s0
 524:	e41ff0ef          	jal	ra,364 <neorv32_uart0_putc>
 528:	00410593          	addi	a1,sp,4
 52c:	00040513          	mv	a0,s0
 530:	c4dff0ef          	jal	ra,17c <__neorv32_uart_itoa>
 534:	00410513          	addi	a0,sp,4
 538:	fadff06f          	j	4e4 <neorv32_uart0_printf+0x110>
 53c:	00012783          	lw	a5,0(sp)
 540:	00410593          	addi	a1,sp,4
 544:	00478713          	addi	a4,a5,4
 548:	0007a503          	lw	a0,0(a5)
 54c:	00e12023          	sw	a4,0(sp)
 550:	fe1ff06f          	j	530 <neorv32_uart0_printf+0x15c>
 554:	01549663          	bne	s1,s5,560 <neorv32_uart0_printf+0x18c>
 558:	00d00513          	li	a0,13
 55c:	e09ff0ef          	jal	ra,364 <neorv32_uart0_putc>
 560:	00140993          	addi	s3,s0,1
 564:	00048513          	mv	a0,s1
 568:	f99ff06f          	j	500 <neorv32_uart0_printf+0x12c>

0000056c <neorv32_uart_printf>:
 56c:	fd010113          	addi	sp,sp,-48
 570:	00112623          	sw	ra,12(sp)
 574:	00b12a23          	sw	a1,20(sp)
 578:	00c12c23          	sw	a2,24(sp)
 57c:	00d12e23          	sw	a3,28(sp)
 580:	02e12023          	sw	a4,32(sp)
 584:	02f12223          	sw	a5,36(sp)
 588:	03012423          	sw	a6,40(sp)
 58c:	03112623          	sw	a7,44(sp)
 590:	e45ff0ef          	jal	ra,3d4 <neorv32_uart0_printf>
 594:	00c12083          	lw	ra,12(sp)
 598:	03010113          	addi	sp,sp,48
 59c:	00008067          	ret

000005a0 <__neorv32_rte_core>:
 5a0:	fc010113          	addi	sp,sp,-64
 5a4:	02112e23          	sw	ra,60(sp)
 5a8:	02512c23          	sw	t0,56(sp)
 5ac:	02612a23          	sw	t1,52(sp)
 5b0:	02712823          	sw	t2,48(sp)
 5b4:	02a12623          	sw	a0,44(sp)
 5b8:	02b12423          	sw	a1,40(sp)
 5bc:	02c12223          	sw	a2,36(sp)
 5c0:	02d12023          	sw	a3,32(sp)
 5c4:	00e12e23          	sw	a4,28(sp)
 5c8:	00f12c23          	sw	a5,24(sp)
 5cc:	01012a23          	sw	a6,20(sp)
 5d0:	01112823          	sw	a7,16(sp)
 5d4:	01c12623          	sw	t3,12(sp)
 5d8:	01d12423          	sw	t4,8(sp)
 5dc:	01e12223          	sw	t5,4(sp)
 5e0:	01f12023          	sw	t6,0(sp)
 5e4:	34102773          	csrr	a4,mepc
 5e8:	34071073          	csrw	mscratch,a4
 5ec:	342027f3          	csrr	a5,mcause
 5f0:	0807ca63          	bltz	a5,684 <__neorv32_rte_core+0xe4>
 5f4:	00071683          	lh	a3,0(a4)
 5f8:	00300593          	li	a1,3
 5fc:	0036f693          	andi	a3,a3,3
 600:	00270613          	addi	a2,a4,2
 604:	00b69463          	bne	a3,a1,60c <__neorv32_rte_core+0x6c>
 608:	00470613          	addi	a2,a4,4
 60c:	34161073          	csrw	mepc,a2
 610:	00b00713          	li	a4,11
 614:	04f77c63          	bgeu	a4,a5,66c <__neorv32_rte_core+0xcc>
 618:	000017b7          	lui	a5,0x1
 61c:	81c78793          	addi	a5,a5,-2020 # 81c <__neorv32_rte_debug_exc_handler>
 620:	000780e7          	jalr	a5
 624:	03c12083          	lw	ra,60(sp)
 628:	03812283          	lw	t0,56(sp)
 62c:	03412303          	lw	t1,52(sp)
 630:	03012383          	lw	t2,48(sp)
 634:	02c12503          	lw	a0,44(sp)
 638:	02812583          	lw	a1,40(sp)
 63c:	02412603          	lw	a2,36(sp)
 640:	02012683          	lw	a3,32(sp)
 644:	01c12703          	lw	a4,28(sp)
 648:	01812783          	lw	a5,24(sp)
 64c:	01412803          	lw	a6,20(sp)
 650:	01012883          	lw	a7,16(sp)
 654:	00c12e03          	lw	t3,12(sp)
 658:	00812e83          	lw	t4,8(sp)
 65c:	00412f03          	lw	t5,4(sp)
 660:	00012f83          	lw	t6,0(sp)
 664:	04010113          	addi	sp,sp,64
 668:	30200073          	mret
 66c:	00001737          	lui	a4,0x1
 670:	00279793          	slli	a5,a5,0x2
 674:	db470713          	addi	a4,a4,-588 # db4 <symbols.0+0x14>
 678:	00e787b3          	add	a5,a5,a4
 67c:	0007a783          	lw	a5,0(a5)
 680:	00078067          	jr	a5
 684:	80000737          	lui	a4,0x80000
 688:	00e787b3          	add	a5,a5,a4
 68c:	01f00713          	li	a4,31
 690:	f8f764e3          	bltu	a4,a5,618 <__neorv32_rte_core+0x78>
 694:	00001737          	lui	a4,0x1
 698:	00279793          	slli	a5,a5,0x2
 69c:	de470713          	addi	a4,a4,-540 # de4 <symbols.0+0x44>
 6a0:	00e787b3          	add	a5,a5,a4
 6a4:	0007a783          	lw	a5,0(a5)
 6a8:	00078067          	jr	a5
 6ac:	800007b7          	lui	a5,0x80000
 6b0:	0007a783          	lw	a5,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 6b4:	f6dff06f          	j	620 <__neorv32_rte_core+0x80>
 6b8:	800007b7          	lui	a5,0x80000
 6bc:	0047a783          	lw	a5,4(a5) # 80000004 <__ctr0_io_space_begin+0x80000204>
 6c0:	f61ff06f          	j	620 <__neorv32_rte_core+0x80>
 6c4:	800007b7          	lui	a5,0x80000
 6c8:	0087a783          	lw	a5,8(a5) # 80000008 <__ctr0_io_space_begin+0x80000208>
 6cc:	f55ff06f          	j	620 <__neorv32_rte_core+0x80>
 6d0:	800007b7          	lui	a5,0x80000
 6d4:	00c7a783          	lw	a5,12(a5) # 8000000c <__ctr0_io_space_begin+0x8000020c>
 6d8:	f49ff06f          	j	620 <__neorv32_rte_core+0x80>
 6dc:	8101a783          	lw	a5,-2032(gp) # 80000010 <__neorv32_rte_vector_lut+0x10>
 6e0:	f41ff06f          	j	620 <__neorv32_rte_core+0x80>
 6e4:	8141a783          	lw	a5,-2028(gp) # 80000014 <__neorv32_rte_vector_lut+0x14>
 6e8:	f39ff06f          	j	620 <__neorv32_rte_core+0x80>
 6ec:	8181a783          	lw	a5,-2024(gp) # 80000018 <__neorv32_rte_vector_lut+0x18>
 6f0:	f31ff06f          	j	620 <__neorv32_rte_core+0x80>
 6f4:	81c1a783          	lw	a5,-2020(gp) # 8000001c <__neorv32_rte_vector_lut+0x1c>
 6f8:	f29ff06f          	j	620 <__neorv32_rte_core+0x80>
 6fc:	8201a783          	lw	a5,-2016(gp) # 80000020 <__neorv32_rte_vector_lut+0x20>
 700:	f21ff06f          	j	620 <__neorv32_rte_core+0x80>
 704:	8241a783          	lw	a5,-2012(gp) # 80000024 <__neorv32_rte_vector_lut+0x24>
 708:	f19ff06f          	j	620 <__neorv32_rte_core+0x80>
 70c:	8281a783          	lw	a5,-2008(gp) # 80000028 <__neorv32_rte_vector_lut+0x28>
 710:	f11ff06f          	j	620 <__neorv32_rte_core+0x80>
 714:	82c1a783          	lw	a5,-2004(gp) # 8000002c <__neorv32_rte_vector_lut+0x2c>
 718:	f09ff06f          	j	620 <__neorv32_rte_core+0x80>
 71c:	8301a783          	lw	a5,-2000(gp) # 80000030 <__neorv32_rte_vector_lut+0x30>
 720:	f01ff06f          	j	620 <__neorv32_rte_core+0x80>
 724:	8341a783          	lw	a5,-1996(gp) # 80000034 <__neorv32_rte_vector_lut+0x34>
 728:	ef9ff06f          	j	620 <__neorv32_rte_core+0x80>
 72c:	8381a783          	lw	a5,-1992(gp) # 80000038 <__neorv32_rte_vector_lut+0x38>
 730:	ef1ff06f          	j	620 <__neorv32_rte_core+0x80>
 734:	83c1a783          	lw	a5,-1988(gp) # 8000003c <__neorv32_rte_vector_lut+0x3c>
 738:	ee9ff06f          	j	620 <__neorv32_rte_core+0x80>
 73c:	8401a783          	lw	a5,-1984(gp) # 80000040 <__neorv32_rte_vector_lut+0x40>
 740:	ee1ff06f          	j	620 <__neorv32_rte_core+0x80>
 744:	8441a783          	lw	a5,-1980(gp) # 80000044 <__neorv32_rte_vector_lut+0x44>
 748:	ed9ff06f          	j	620 <__neorv32_rte_core+0x80>
 74c:	8481a783          	lw	a5,-1976(gp) # 80000048 <__neorv32_rte_vector_lut+0x48>
 750:	ed1ff06f          	j	620 <__neorv32_rte_core+0x80>
 754:	84c1a783          	lw	a5,-1972(gp) # 8000004c <__neorv32_rte_vector_lut+0x4c>
 758:	ec9ff06f          	j	620 <__neorv32_rte_core+0x80>
 75c:	8501a783          	lw	a5,-1968(gp) # 80000050 <__neorv32_rte_vector_lut+0x50>
 760:	ec1ff06f          	j	620 <__neorv32_rte_core+0x80>
 764:	8541a783          	lw	a5,-1964(gp) # 80000054 <__neorv32_rte_vector_lut+0x54>
 768:	eb9ff06f          	j	620 <__neorv32_rte_core+0x80>
 76c:	8581a783          	lw	a5,-1960(gp) # 80000058 <__neorv32_rte_vector_lut+0x58>
 770:	eb1ff06f          	j	620 <__neorv32_rte_core+0x80>
 774:	85c1a783          	lw	a5,-1956(gp) # 8000005c <__neorv32_rte_vector_lut+0x5c>
 778:	ea9ff06f          	j	620 <__neorv32_rte_core+0x80>
 77c:	8601a783          	lw	a5,-1952(gp) # 80000060 <__neorv32_rte_vector_lut+0x60>
 780:	ea1ff06f          	j	620 <__neorv32_rte_core+0x80>
 784:	8641a783          	lw	a5,-1948(gp) # 80000064 <__neorv32_rte_vector_lut+0x64>
 788:	e99ff06f          	j	620 <__neorv32_rte_core+0x80>
 78c:	8681a783          	lw	a5,-1944(gp) # 80000068 <__neorv32_rte_vector_lut+0x68>
 790:	e91ff06f          	j	620 <__neorv32_rte_core+0x80>
 794:	86c1a783          	lw	a5,-1940(gp) # 8000006c <__neorv32_rte_vector_lut+0x6c>
 798:	e89ff06f          	j	620 <__neorv32_rte_core+0x80>
 79c:	8701a783          	lw	a5,-1936(gp) # 80000070 <__neorv32_rte_vector_lut+0x70>
 7a0:	e81ff06f          	j	620 <__neorv32_rte_core+0x80>
 7a4:	8741a783          	lw	a5,-1932(gp) # 80000074 <__neorv32_rte_vector_lut+0x74>
 7a8:	e79ff06f          	j	620 <__neorv32_rte_core+0x80>

000007ac <__neorv32_rte_print_hex_word>:
 7ac:	fe010113          	addi	sp,sp,-32
 7b0:	01212823          	sw	s2,16(sp)
 7b4:	00050913          	mv	s2,a0
 7b8:	00001537          	lui	a0,0x1
 7bc:	00912a23          	sw	s1,20(sp)
 7c0:	e6450513          	addi	a0,a0,-412 # e64 <symbols.0+0xc4>
 7c4:	000014b7          	lui	s1,0x1
 7c8:	00812c23          	sw	s0,24(sp)
 7cc:	01312623          	sw	s3,12(sp)
 7d0:	00112e23          	sw	ra,28(sp)
 7d4:	01c00413          	li	s0,28
 7d8:	ba1ff0ef          	jal	ra,378 <neorv32_uart0_print>
 7dc:	5e048493          	addi	s1,s1,1504 # 15e0 <hex_symbols.0>
 7e0:	ffc00993          	li	s3,-4
 7e4:	008957b3          	srl	a5,s2,s0
 7e8:	00f7f793          	andi	a5,a5,15
 7ec:	00f487b3          	add	a5,s1,a5
 7f0:	0007c503          	lbu	a0,0(a5)
 7f4:	ffc40413          	addi	s0,s0,-4
 7f8:	b6dff0ef          	jal	ra,364 <neorv32_uart0_putc>
 7fc:	ff3414e3          	bne	s0,s3,7e4 <__neorv32_rte_print_hex_word+0x38>
 800:	01c12083          	lw	ra,28(sp)
 804:	01812403          	lw	s0,24(sp)
 808:	01412483          	lw	s1,20(sp)
 80c:	01012903          	lw	s2,16(sp)
 810:	00c12983          	lw	s3,12(sp)
 814:	02010113          	addi	sp,sp,32
 818:	00008067          	ret

0000081c <__neorv32_rte_debug_exc_handler>:
 81c:	ff010113          	addi	sp,sp,-16
 820:	00112623          	sw	ra,12(sp)
 824:	00812423          	sw	s0,8(sp)
 828:	00912223          	sw	s1,4(sp)
 82c:	a95ff0ef          	jal	ra,2c0 <neorv32_uart0_available>
 830:	18050463          	beqz	a0,9b8 <__neorv32_rte_debug_exc_handler+0x19c>
 834:	00001537          	lui	a0,0x1
 838:	e6850513          	addi	a0,a0,-408 # e68 <symbols.0+0xc8>
 83c:	b95ff0ef          	jal	ra,3d0 <neorv32_uart_print>
 840:	34202473          	csrr	s0,mcause
 844:	00900713          	li	a4,9
 848:	00f47793          	andi	a5,s0,15
 84c:	03078493          	addi	s1,a5,48
 850:	00f77463          	bgeu	a4,a5,858 <__neorv32_rte_debug_exc_handler+0x3c>
 854:	05778493          	addi	s1,a5,87
 858:	00b00793          	li	a5,11
 85c:	0087ee63          	bltu	a5,s0,878 <__neorv32_rte_debug_exc_handler+0x5c>
 860:	00001737          	lui	a4,0x1
 864:	00241793          	slli	a5,s0,0x2
 868:	ffc70713          	addi	a4,a4,-4 # ffc <symbols.0+0x25c>
 86c:	00e787b3          	add	a5,a5,a4
 870:	0007a783          	lw	a5,0(a5)
 874:	00078067          	jr	a5
 878:	800007b7          	lui	a5,0x80000
 87c:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 880:	12e40663          	beq	s0,a4,9ac <__neorv32_rte_debug_exc_handler+0x190>
 884:	02876663          	bltu	a4,s0,8b0 <__neorv32_rte_debug_exc_handler+0x94>
 888:	00378713          	addi	a4,a5,3
 88c:	10e40463          	beq	s0,a4,994 <__neorv32_rte_debug_exc_handler+0x178>
 890:	00778793          	addi	a5,a5,7
 894:	10f40663          	beq	s0,a5,9a0 <__neorv32_rte_debug_exc_handler+0x184>
 898:	00001537          	lui	a0,0x1
 89c:	fc850513          	addi	a0,a0,-56 # fc8 <symbols.0+0x228>
 8a0:	b31ff0ef          	jal	ra,3d0 <neorv32_uart_print>
 8a4:	00040513          	mv	a0,s0
 8a8:	f05ff0ef          	jal	ra,7ac <__neorv32_rte_print_hex_word>
 8ac:	0380006f          	j	8e4 <__neorv32_rte_debug_exc_handler+0xc8>
 8b0:	ff07c793          	xori	a5,a5,-16
 8b4:	00f407b3          	add	a5,s0,a5
 8b8:	00f00713          	li	a4,15
 8bc:	fcf76ee3          	bltu	a4,a5,898 <__neorv32_rte_debug_exc_handler+0x7c>
 8c0:	00001537          	lui	a0,0x1
 8c4:	fb850513          	addi	a0,a0,-72 # fb8 <symbols.0+0x218>
 8c8:	b09ff0ef          	jal	ra,3d0 <neorv32_uart_print>
 8cc:	00048513          	mv	a0,s1
 8d0:	aa5ff0ef          	jal	ra,374 <neorv32_uart_putc>
 8d4:	0100006f          	j	8e4 <__neorv32_rte_debug_exc_handler+0xc8>
 8d8:	00001537          	lui	a0,0x1
 8dc:	e7050513          	addi	a0,a0,-400 # e70 <symbols.0+0xd0>
 8e0:	af1ff0ef          	jal	ra,3d0 <neorv32_uart_print>
 8e4:	00001537          	lui	a0,0x1
 8e8:	fe050513          	addi	a0,a0,-32 # fe0 <symbols.0+0x240>
 8ec:	ae5ff0ef          	jal	ra,3d0 <neorv32_uart_print>
 8f0:	34002573          	csrr	a0,mscratch
 8f4:	eb9ff0ef          	jal	ra,7ac <__neorv32_rte_print_hex_word>
 8f8:	00001537          	lui	a0,0x1
 8fc:	fe850513          	addi	a0,a0,-24 # fe8 <symbols.0+0x248>
 900:	ad1ff0ef          	jal	ra,3d0 <neorv32_uart_print>
 904:	34302573          	csrr	a0,mtval
 908:	ea5ff0ef          	jal	ra,7ac <__neorv32_rte_print_hex_word>
 90c:	00812403          	lw	s0,8(sp)
 910:	00c12083          	lw	ra,12(sp)
 914:	00412483          	lw	s1,4(sp)
 918:	00001537          	lui	a0,0x1
 91c:	ff450513          	addi	a0,a0,-12 # ff4 <symbols.0+0x254>
 920:	01010113          	addi	sp,sp,16
 924:	aadff06f          	j	3d0 <neorv32_uart_print>
 928:	00001537          	lui	a0,0x1
 92c:	e9050513          	addi	a0,a0,-368 # e90 <symbols.0+0xf0>
 930:	fb1ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 934:	00001537          	lui	a0,0x1
 938:	eac50513          	addi	a0,a0,-340 # eac <symbols.0+0x10c>
 93c:	fa5ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 940:	00001537          	lui	a0,0x1
 944:	ec050513          	addi	a0,a0,-320 # ec0 <symbols.0+0x120>
 948:	f99ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 94c:	00001537          	lui	a0,0x1
 950:	ecc50513          	addi	a0,a0,-308 # ecc <symbols.0+0x12c>
 954:	f8dff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 958:	00001537          	lui	a0,0x1
 95c:	ee450513          	addi	a0,a0,-284 # ee4 <symbols.0+0x144>
 960:	f81ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 964:	00001537          	lui	a0,0x1
 968:	ef850513          	addi	a0,a0,-264 # ef8 <symbols.0+0x158>
 96c:	f75ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 970:	00001537          	lui	a0,0x1
 974:	f1450513          	addi	a0,a0,-236 # f14 <symbols.0+0x174>
 978:	f69ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 97c:	00001537          	lui	a0,0x1
 980:	f2850513          	addi	a0,a0,-216 # f28 <symbols.0+0x188>
 984:	f5dff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 988:	00001537          	lui	a0,0x1
 98c:	f4850513          	addi	a0,a0,-184 # f48 <symbols.0+0x1a8>
 990:	f51ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 994:	00001537          	lui	a0,0x1
 998:	f6850513          	addi	a0,a0,-152 # f68 <symbols.0+0x1c8>
 99c:	f45ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 9a0:	00001537          	lui	a0,0x1
 9a4:	f8450513          	addi	a0,a0,-124 # f84 <symbols.0+0x1e4>
 9a8:	f39ff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 9ac:	00001537          	lui	a0,0x1
 9b0:	f9c50513          	addi	a0,a0,-100 # f9c <symbols.0+0x1fc>
 9b4:	f2dff06f          	j	8e0 <__neorv32_rte_debug_exc_handler+0xc4>
 9b8:	00c12083          	lw	ra,12(sp)
 9bc:	00812403          	lw	s0,8(sp)
 9c0:	00412483          	lw	s1,4(sp)
 9c4:	01010113          	addi	sp,sp,16
 9c8:	00008067          	ret

000009cc <neorv32_rte_exception_uninstall>:
 9cc:	01f00793          	li	a5,31
 9d0:	02a7e463          	bltu	a5,a0,9f8 <neorv32_rte_exception_uninstall+0x2c>
 9d4:	800007b7          	lui	a5,0x80000
 9d8:	00078793          	mv	a5,a5
 9dc:	00251513          	slli	a0,a0,0x2
 9e0:	00a78533          	add	a0,a5,a0
 9e4:	000017b7          	lui	a5,0x1
 9e8:	81c78793          	addi	a5,a5,-2020 # 81c <__neorv32_rte_debug_exc_handler>
 9ec:	00f52023          	sw	a5,0(a0)
 9f0:	00000513          	li	a0,0
 9f4:	00008067          	ret
 9f8:	00100513          	li	a0,1
 9fc:	00008067          	ret

00000a00 <neorv32_rte_setup>:
 a00:	ff010113          	addi	sp,sp,-16
 a04:	00112623          	sw	ra,12(sp)
 a08:	00812423          	sw	s0,8(sp)
 a0c:	00912223          	sw	s1,4(sp)
 a10:	5a000793          	li	a5,1440
 a14:	30579073          	csrw	mtvec,a5
 a18:	00000413          	li	s0,0
 a1c:	01e00493          	li	s1,30
 a20:	00040513          	mv	a0,s0
 a24:	00140413          	addi	s0,s0,1
 a28:	0ff47413          	andi	s0,s0,255
 a2c:	fa1ff0ef          	jal	ra,9cc <neorv32_rte_exception_uninstall>
 a30:	fe9418e3          	bne	s0,s1,a20 <neorv32_rte_setup+0x20>
 a34:	00c12083          	lw	ra,12(sp)
 a38:	00812403          	lw	s0,8(sp)
 a3c:	00412483          	lw	s1,4(sp)
 a40:	01010113          	addi	sp,sp,16
 a44:	00008067          	ret

00000a48 <neorv32_rte_print_logo>:
 a48:	f2010113          	addi	sp,sp,-224
 a4c:	000015b7          	lui	a1,0x1
 a50:	0b000613          	li	a2,176
 a54:	53058593          	addi	a1,a1,1328 # 1530 <symbols.0+0x790>
 a58:	00010513          	mv	a0,sp
 a5c:	0c112e23          	sw	ra,220(sp)
 a60:	0c812c23          	sw	s0,216(sp)
 a64:	0c912a23          	sw	s1,212(sp)
 a68:	0d212823          	sw	s2,208(sp)
 a6c:	0d312623          	sw	s3,204(sp)
 a70:	0d412423          	sw	s4,200(sp)
 a74:	0d512223          	sw	s5,196(sp)
 a78:	0d612023          	sw	s6,192(sp)
 a7c:	0b712e23          	sw	s7,188(sp)
 a80:	1d8000ef          	jal	ra,c58 <memcpy>
 a84:	83dff0ef          	jal	ra,2c0 <neorv32_uart0_available>
 a88:	08050863          	beqz	a0,b18 <neorv32_rte_print_logo+0xd0>
 a8c:	00001ab7          	lui	s5,0x1
 a90:	00010413          	mv	s0,sp
 a94:	000a8b13          	mv	s6,s5
 a98:	00400b93          	li	s7,4
 a9c:	390a8513          	addi	a0,s5,912 # 1390 <symbols.0+0x5f0>
 aa0:	8d9ff0ef          	jal	ra,378 <neorv32_uart0_print>
 aa4:	00040913          	mv	s2,s0
 aa8:	00000493          	li	s1,0
 aac:	00092a03          	lw	s4,0(s2)
 ab0:	02000993          	li	s3,32
 ab4:	02300513          	li	a0,35
 ab8:	000a4463          	bltz	s4,ac0 <neorv32_rte_print_logo+0x78>
 abc:	02000513          	li	a0,32
 ac0:	fff98993          	addi	s3,s3,-1
 ac4:	8a1ff0ef          	jal	ra,364 <neorv32_uart0_putc>
 ac8:	001a1a13          	slli	s4,s4,0x1
 acc:	fe0994e3          	bnez	s3,ab4 <neorv32_rte_print_logo+0x6c>
 ad0:	00148493          	addi	s1,s1,1
 ad4:	00490913          	addi	s2,s2,4
 ad8:	fd749ae3          	bne	s1,s7,aac <neorv32_rte_print_logo+0x64>
 adc:	01040413          	addi	s0,s0,16
 ae0:	0b010793          	addi	a5,sp,176
 ae4:	fa879ce3          	bne	a5,s0,a9c <neorv32_rte_print_logo+0x54>
 ae8:	0d812403          	lw	s0,216(sp)
 aec:	0dc12083          	lw	ra,220(sp)
 af0:	0d412483          	lw	s1,212(sp)
 af4:	0d012903          	lw	s2,208(sp)
 af8:	0cc12983          	lw	s3,204(sp)
 afc:	0c812a03          	lw	s4,200(sp)
 b00:	0c412a83          	lw	s5,196(sp)
 b04:	0bc12b83          	lw	s7,188(sp)
 b08:	390b0513          	addi	a0,s6,912
 b0c:	0c012b03          	lw	s6,192(sp)
 b10:	0e010113          	addi	sp,sp,224
 b14:	865ff06f          	j	378 <neorv32_uart0_print>
 b18:	0dc12083          	lw	ra,220(sp)
 b1c:	0d812403          	lw	s0,216(sp)
 b20:	0d412483          	lw	s1,212(sp)
 b24:	0d012903          	lw	s2,208(sp)
 b28:	0cc12983          	lw	s3,204(sp)
 b2c:	0c812a03          	lw	s4,200(sp)
 b30:	0c412a83          	lw	s5,196(sp)
 b34:	0c012b03          	lw	s6,192(sp)
 b38:	0bc12b83          	lw	s7,188(sp)
 b3c:	0e010113          	addi	sp,sp,224
 b40:	00008067          	ret

00000b44 <neorv32_rte_check_isa>:
 b44:	30102673          	csrr	a2,misa
 b48:	400007b7          	lui	a5,0x40000
 b4c:	10078793          	addi	a5,a5,256 # 40000100 <__crt0_copy_data_src_begin+0x3fffeb10>
 b50:	00f67733          	and	a4,a2,a5
 b54:	04f70463          	beq	a4,a5,b9c <neorv32_rte_check_isa+0x58>
 b58:	fe010113          	addi	sp,sp,-32
 b5c:	00112e23          	sw	ra,28(sp)
 b60:	02051463          	bnez	a0,b88 <neorv32_rte_check_isa+0x44>
 b64:	400005b7          	lui	a1,0x40000
 b68:	00001537          	lui	a0,0x1
 b6c:	10058593          	addi	a1,a1,256 # 40000100 <__crt0_copy_data_src_begin+0x3fffeb10>
 b70:	4a850513          	addi	a0,a0,1192 # 14a8 <symbols.0+0x708>
 b74:	9f9ff0ef          	jal	ra,56c <neorv32_uart_printf>
 b78:	01c12083          	lw	ra,28(sp)
 b7c:	00100513          	li	a0,1
 b80:	02010113          	addi	sp,sp,32
 b84:	00008067          	ret
 b88:	00c12623          	sw	a2,12(sp)
 b8c:	f34ff0ef          	jal	ra,2c0 <neorv32_uart0_available>
 b90:	00c12603          	lw	a2,12(sp)
 b94:	fc0508e3          	beqz	a0,b64 <neorv32_rte_check_isa+0x20>
 b98:	fe1ff06f          	j	b78 <neorv32_rte_check_isa+0x34>
 b9c:	00000513          	li	a0,0
 ba0:	00008067          	ret

00000ba4 <__divsi3>:
 ba4:	06054063          	bltz	a0,c04 <__umodsi3+0x10>
 ba8:	0605c663          	bltz	a1,c14 <__umodsi3+0x20>

00000bac <__udivsi3>:
 bac:	00058613          	mv	a2,a1
 bb0:	00050593          	mv	a1,a0
 bb4:	fff00513          	li	a0,-1
 bb8:	02060c63          	beqz	a2,bf0 <__udivsi3+0x44>
 bbc:	00100693          	li	a3,1
 bc0:	00b67a63          	bgeu	a2,a1,bd4 <__udivsi3+0x28>
 bc4:	00c05863          	blez	a2,bd4 <__udivsi3+0x28>
 bc8:	00161613          	slli	a2,a2,0x1
 bcc:	00169693          	slli	a3,a3,0x1
 bd0:	feb66ae3          	bltu	a2,a1,bc4 <__udivsi3+0x18>
 bd4:	00000513          	li	a0,0
 bd8:	00c5e663          	bltu	a1,a2,be4 <__udivsi3+0x38>
 bdc:	40c585b3          	sub	a1,a1,a2
 be0:	00d56533          	or	a0,a0,a3
 be4:	0016d693          	srli	a3,a3,0x1
 be8:	00165613          	srli	a2,a2,0x1
 bec:	fe0696e3          	bnez	a3,bd8 <__udivsi3+0x2c>
 bf0:	00008067          	ret

00000bf4 <__umodsi3>:
 bf4:	00008293          	mv	t0,ra
 bf8:	fb5ff0ef          	jal	ra,bac <__udivsi3>
 bfc:	00058513          	mv	a0,a1
 c00:	00028067          	jr	t0
 c04:	40a00533          	neg	a0,a0
 c08:	00b04863          	bgtz	a1,c18 <__umodsi3+0x24>
 c0c:	40b005b3          	neg	a1,a1
 c10:	f9dff06f          	j	bac <__udivsi3>
 c14:	40b005b3          	neg	a1,a1
 c18:	00008293          	mv	t0,ra
 c1c:	f91ff0ef          	jal	ra,bac <__udivsi3>
 c20:	40a00533          	neg	a0,a0
 c24:	00028067          	jr	t0

00000c28 <__modsi3>:
 c28:	00008293          	mv	t0,ra
 c2c:	0005ca63          	bltz	a1,c40 <__modsi3+0x18>
 c30:	00054c63          	bltz	a0,c48 <__modsi3+0x20>
 c34:	f79ff0ef          	jal	ra,bac <__udivsi3>
 c38:	00058513          	mv	a0,a1
 c3c:	00028067          	jr	t0
 c40:	40b005b3          	neg	a1,a1
 c44:	fe0558e3          	bgez	a0,c34 <__modsi3+0xc>
 c48:	40a00533          	neg	a0,a0
 c4c:	f61ff0ef          	jal	ra,bac <__udivsi3>
 c50:	40b00533          	neg	a0,a1
 c54:	00028067          	jr	t0

00000c58 <memcpy>:
 c58:	00a5c7b3          	xor	a5,a1,a0
 c5c:	0037f793          	andi	a5,a5,3
 c60:	00c508b3          	add	a7,a0,a2
 c64:	06079663          	bnez	a5,cd0 <memcpy+0x78>
 c68:	00300793          	li	a5,3
 c6c:	06c7f263          	bgeu	a5,a2,cd0 <memcpy+0x78>
 c70:	00357793          	andi	a5,a0,3
 c74:	00050713          	mv	a4,a0
 c78:	0c079a63          	bnez	a5,d4c <memcpy+0xf4>
 c7c:	ffc8f613          	andi	a2,a7,-4
 c80:	40e606b3          	sub	a3,a2,a4
 c84:	02000793          	li	a5,32
 c88:	02000293          	li	t0,32
 c8c:	06d7c263          	blt	a5,a3,cf0 <memcpy+0x98>
 c90:	00058693          	mv	a3,a1
 c94:	00070793          	mv	a5,a4
 c98:	02c77863          	bgeu	a4,a2,cc8 <memcpy+0x70>
 c9c:	0006a803          	lw	a6,0(a3)
 ca0:	00478793          	addi	a5,a5,4
 ca4:	00468693          	addi	a3,a3,4
 ca8:	ff07ae23          	sw	a6,-4(a5)
 cac:	fec7e8e3          	bltu	a5,a2,c9c <memcpy+0x44>
 cb0:	fff60793          	addi	a5,a2,-1
 cb4:	40e787b3          	sub	a5,a5,a4
 cb8:	ffc7f793          	andi	a5,a5,-4
 cbc:	00478793          	addi	a5,a5,4
 cc0:	00f70733          	add	a4,a4,a5
 cc4:	00f585b3          	add	a1,a1,a5
 cc8:	01176863          	bltu	a4,a7,cd8 <memcpy+0x80>
 ccc:	00008067          	ret
 cd0:	00050713          	mv	a4,a0
 cd4:	ff157ce3          	bgeu	a0,a7,ccc <memcpy+0x74>
 cd8:	0005c783          	lbu	a5,0(a1)
 cdc:	00170713          	addi	a4,a4,1
 ce0:	00158593          	addi	a1,a1,1
 ce4:	fef70fa3          	sb	a5,-1(a4)
 ce8:	ff1768e3          	bltu	a4,a7,cd8 <memcpy+0x80>
 cec:	00008067          	ret
 cf0:	0045a683          	lw	a3,4(a1)
 cf4:	01c5a783          	lw	a5,28(a1)
 cf8:	0005af83          	lw	t6,0(a1)
 cfc:	0085af03          	lw	t5,8(a1)
 d00:	00c5ae83          	lw	t4,12(a1)
 d04:	0105ae03          	lw	t3,16(a1)
 d08:	0145a303          	lw	t1,20(a1)
 d0c:	0185a803          	lw	a6,24(a1)
 d10:	00d72223          	sw	a3,4(a4)
 d14:	0205a683          	lw	a3,32(a1)
 d18:	01f72023          	sw	t6,0(a4)
 d1c:	01e72423          	sw	t5,8(a4)
 d20:	01d72623          	sw	t4,12(a4)
 d24:	01c72823          	sw	t3,16(a4)
 d28:	00672a23          	sw	t1,20(a4)
 d2c:	01072c23          	sw	a6,24(a4)
 d30:	00f72e23          	sw	a5,28(a4)
 d34:	02470713          	addi	a4,a4,36
 d38:	40e607b3          	sub	a5,a2,a4
 d3c:	fed72e23          	sw	a3,-4(a4)
 d40:	02458593          	addi	a1,a1,36
 d44:	faf2c6e3          	blt	t0,a5,cf0 <memcpy+0x98>
 d48:	f49ff06f          	j	c90 <memcpy+0x38>
 d4c:	0005c683          	lbu	a3,0(a1)
 d50:	00170713          	addi	a4,a4,1
 d54:	00377793          	andi	a5,a4,3
 d58:	fed70fa3          	sb	a3,-1(a4)
 d5c:	00158593          	addi	a1,a1,1
 d60:	f0078ee3          	beqz	a5,c7c <memcpy+0x24>
 d64:	0005c683          	lbu	a3,0(a1)
 d68:	00170713          	addi	a4,a4,1
 d6c:	00377793          	andi	a5,a4,3
 d70:	fed70fa3          	sb	a3,-1(a4)
 d74:	00158593          	addi	a1,a1,1
 d78:	fc079ae3          	bnez	a5,d4c <memcpy+0xf4>
 d7c:	f01ff06f          	j	c7c <memcpy+0x24>
