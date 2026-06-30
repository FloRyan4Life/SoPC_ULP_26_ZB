
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
  18:	11850513          	addi	a0,a0,280 # 12c <__crt0_dummy_trap_handler>
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
  b0:	f5448493          	addi	s1,s1,-172 # 0 <_start>

000000b4 <__crt0_reset_io_loop>:
  b4:	00042023          	sw	zero,0(s0)
  b8:	00440413          	addi	s0,s0,4
  bc:	fe941ce3          	bne	s0,s1,b4 <__crt0_reset_io_loop>

000000c0 <__crt0_clear_bss>:
  c0:	80818593          	addi	a1,gp,-2040 # 80000008 <grid_switch.0>
  c4:	81c18613          	addi	a2,gp,-2020 # 8000001c <__BSS_END__>

000000c8 <__crt0_clear_bss_loop>:
  c8:	00c5d863          	bge	a1,a2,d8 <__crt0_clear_bss_loop_end>
  cc:	00058023          	sb	zero,0(a1)
  d0:	00158593          	addi	a1,a1,1
  d4:	ff5ff06f          	j	c8 <__crt0_clear_bss_loop>

000000d8 <__crt0_clear_bss_loop_end>:
  d8:	00000597          	auipc	a1,0x0
  dc:	61058593          	addi	a1,a1,1552 # 6e8 <__crt0_copy_data_src_begin>
  e0:	80000617          	auipc	a2,0x80000
  e4:	f2060613          	addi	a2,a2,-224 # 80000000 <__ctr0_io_space_begin+0x80000200>
  e8:	80818693          	addi	a3,gp,-2040 # 80000008 <grid_switch.0>

000000ec <__crt0_copy_data_loop>:
  ec:	00d65c63          	bge	a2,a3,104 <__crt0_copy_data_loop_end>
  f0:	00058703          	lb	a4,0(a1)
  f4:	00e60023          	sb	a4,0(a2)
  f8:	00158593          	addi	a1,a1,1
  fc:	00160613          	addi	a2,a2,1
 100:	fedff06f          	j	ec <__crt0_copy_data_loop>

00000104 <__crt0_copy_data_loop_end>:
 104:	00000513          	li	a0,0
 108:	00000593          	li	a1,0
 10c:	06c000ef          	jal	ra,178 <main>

00000110 <__crt0_main_aftermath>:
 110:	34051073          	csrw	mscratch,a0
 114:	00000093          	li	ra,0
 118:	00008463          	beqz	ra,120 <__crt0_main_aftermath_end>
 11c:	000080e7          	jalr	ra

00000120 <__crt0_main_aftermath_end>:
 120:	30047073          	csrci	mstatus,8

00000124 <__crt0_main_aftermath_end_loop>:
 124:	10500073          	wfi
 128:	ffdff06f          	j	124 <__crt0_main_aftermath_end_loop>

0000012c <__crt0_dummy_trap_handler>:
 12c:	ff810113          	addi	sp,sp,-8
 130:	00812023          	sw	s0,0(sp)
 134:	00912223          	sw	s1,4(sp)
 138:	34202473          	csrr	s0,mcause
 13c:	02044663          	bltz	s0,168 <__crt0_dummy_trap_handler_irq>
 140:	34102473          	csrr	s0,mepc

00000144 <__crt0_dummy_trap_handler_exc_c_check>:
 144:	00041483          	lh	s1,0(s0)
 148:	0034f493          	andi	s1,s1,3
 14c:	00240413          	addi	s0,s0,2
 150:	34141073          	csrw	mepc,s0
 154:	00300413          	li	s0,3
 158:	00941863          	bne	s0,s1,168 <__crt0_dummy_trap_handler_irq>

0000015c <__crt0_dummy_trap_handler_exc_uncrompressed>:
 15c:	34102473          	csrr	s0,mepc
 160:	00240413          	addi	s0,s0,2
 164:	34141073          	csrw	mepc,s0

00000168 <__crt0_dummy_trap_handler_irq>:
 168:	00012403          	lw	s0,0(sp)
 16c:	00412483          	lw	s1,4(sp)
 170:	00810113          	addi	sp,sp,8
 174:	30200073          	mret

00000178 <main>:
 178:	ff010113          	addi	sp,sp,-16
 17c:	00a00513          	li	a0,10
 180:	00112623          	sw	ra,12(sp)
 184:	00812423          	sw	s0,8(sp)
 188:	00912223          	sw	s1,4(sp)
 18c:	2b0000ef          	jal	ra,43c <neorv32_cpu_delay_ms>
 190:	800005b7          	lui	a1,0x80000
 194:	00058593          	mv	a1,a1
 198:	80c18513          	addi	a0,gp,-2036 # 8000000c <grid_1>
 19c:	110000ef          	jal	ra,2ac <load_pattern_to_grid>
 1a0:	00200593          	li	a1,2
 1a4:	80c18513          	addi	a0,gp,-2036 # 8000000c <grid_1>
 1a8:	078000ef          	jal	ra,220 <write_grid_to_matrix>
 1ac:	00200513          	li	a0,2
 1b0:	020000ef          	jal	ra,1d0 <iceduino_button_get>
 1b4:	fe050ce3          	beqz	a0,1ac <main+0x34>
 1b8:	1f400513          	li	a0,500
 1bc:	280000ef          	jal	ra,43c <neorv32_cpu_delay_ms>
 1c0:	81418593          	addi	a1,gp,-2028 # 80000014 <grid_2>
 1c4:	80c18513          	addi	a0,gp,-2036 # 8000000c <grid_1>
 1c8:	114000ef          	jal	ra,2dc <compute_next_generation>
 1cc:	fe1ff06f          	j	1ac <main+0x34>

000001d0 <iceduino_button_get>:
 1d0:	f00007b7          	lui	a5,0xf0000
 1d4:	0107c703          	lbu	a4,16(a5) # f0000010 <__ctr0_io_space_begin+0xf0000210>
 1d8:	00f57513          	andi	a0,a0,15
 1dc:	00100793          	li	a5,1
 1e0:	0ff77713          	andi	a4,a4,255
 1e4:	00a79533          	sll	a0,a5,a0
 1e8:	00a77533          	and	a0,a4,a0
 1ec:	00008067          	ret

000001f0 <set_pixel>:
 1f0:	03f00793          	li	a5,63
 1f4:	02a7e463          	bltu	a5,a0,21c <set_pixel+0x2c>
 1f8:	00861613          	slli	a2,a2,0x8
 1fc:	f00007b7          	lui	a5,0xf0000
 200:	00d66633          	or	a2,a2,a3
 204:	01059593          	slli	a1,a1,0x10
 208:	00251513          	slli	a0,a0,0x2
 20c:	10078793          	addi	a5,a5,256 # f0000100 <__ctr0_io_space_begin+0xf0000300>
 210:	00b66633          	or	a2,a2,a1
 214:	00f50533          	add	a0,a0,a5
 218:	00c52023          	sw	a2,0(a0)
 21c:	00008067          	ret

00000220 <write_grid_to_matrix>:
 220:	fe010113          	addi	sp,sp,-32
 224:	00912a23          	sw	s1,20(sp)
 228:	01059493          	slli	s1,a1,0x10
 22c:	00812c23          	sw	s0,24(sp)
 230:	01212823          	sw	s2,16(sp)
 234:	01312623          	sw	s3,12(sp)
 238:	00112e23          	sw	ra,28(sp)
 23c:	00050913          	mv	s2,a0
 240:	00000413          	li	s0,0
 244:	4104d493          	srai	s1,s1,0x10
 248:	04000993          	li	s3,64
 24c:	40345793          	srai	a5,s0,0x3
 250:	00f907b3          	add	a5,s2,a5
 254:	0007c783          	lbu	a5,0(a5)
 258:	00747713          	andi	a4,s0,7
 25c:	00000693          	li	a3,0
 260:	40e7d7b3          	sra	a5,a5,a4
 264:	0017f793          	andi	a5,a5,1
 268:	00000613          	li	a2,0
 26c:	0ff00593          	li	a1,255
 270:	00079463          	bnez	a5,278 <write_grid_to_matrix+0x58>
 274:	00000593          	li	a1,0
 278:	00040513          	mv	a0,s0
 27c:	f75ff0ef          	jal	ra,1f0 <set_pixel>
 280:	00048513          	mv	a0,s1
 284:	00140413          	addi	s0,s0,1
 288:	1b4000ef          	jal	ra,43c <neorv32_cpu_delay_ms>
 28c:	fd3410e3          	bne	s0,s3,24c <write_grid_to_matrix+0x2c>
 290:	01c12083          	lw	ra,28(sp)
 294:	01812403          	lw	s0,24(sp)
 298:	01412483          	lw	s1,20(sp)
 29c:	01012903          	lw	s2,16(sp)
 2a0:	00c12983          	lw	s3,12(sp)
 2a4:	02010113          	addi	sp,sp,32
 2a8:	00008067          	ret

000002ac <load_pattern_to_grid>:
 2ac:	00000793          	li	a5,0
 2b0:	00800713          	li	a4,8
 2b4:	00f586b3          	add	a3,a1,a5
 2b8:	0006c603          	lbu	a2,0(a3)
 2bc:	00f506b3          	add	a3,a0,a5
 2c0:	00178793          	addi	a5,a5,1
 2c4:	00c68023          	sb	a2,0(a3)
 2c8:	fee796e3          	bne	a5,a4,2b4 <load_pattern_to_grid+0x8>
 2cc:	00008067          	ret

000002d0 <reset_grid>:
 2d0:	00800613          	li	a2,8
 2d4:	00000593          	li	a1,0
 2d8:	3340006f          	j	60c <memset>

000002dc <compute_next_generation>:
 2dc:	ff010113          	addi	sp,sp,-16
 2e0:	00912223          	sw	s1,4(sp)
 2e4:	8081c783          	lbu	a5,-2040(gp) # 80000008 <grid_switch.0>
 2e8:	00812423          	sw	s0,8(sp)
 2ec:	00112623          	sw	ra,12(sp)
 2f0:	00050413          	mv	s0,a0
 2f4:	80818493          	addi	s1,gp,-2040 # 80000008 <grid_switch.0>
 2f8:	00058513          	mv	a0,a1
 2fc:	00078663          	beqz	a5,308 <compute_next_generation+0x2c>
 300:	00040513          	mv	a0,s0
 304:	00058413          	mv	s0,a1
 308:	00050893          	mv	a7,a0
 30c:	00040e13          	mv	t3,s0
 310:	00000593          	li	a1,0
 314:	00700e93          	li	t4,7
 318:	00100f13          	li	t5,1
 31c:	00200f93          	li	t6,2
 320:	00300393          	li	t2,3
 324:	00800293          	li	t0,8
 328:	00000613          	li	a2,0
 32c:	0ff67793          	andi	a5,a2,255
 330:	00f03733          	snez	a4,a5
 334:	0077b813          	sltiu	a6,a5,7
 338:	40e787b3          	sub	a5,a5,a4
 33c:	0ff7f793          	andi	a5,a5,255
 340:	00000693          	li	a3,0
 344:	00c80833          	add	a6,a6,a2
 348:	0af85063          	bge	a6,a5,3e8 <compute_next_generation+0x10c>
 34c:	000e4303          	lbu	t1,0(t3)
 350:	00160093          	addi	ra,a2,1
 354:	00060e63          	beqz	a2,370 <compute_next_generation+0x94>
 358:	fff60793          	addi	a5,a2,-1
 35c:	40f357b3          	sra	a5,t1,a5
 360:	0017f793          	andi	a5,a5,1
 364:	00f686b3          	add	a3,a3,a5
 368:	0ff6f693          	andi	a3,a3,255
 36c:	01d60a63          	beq	a2,t4,380 <compute_next_generation+0xa4>
 370:	401357b3          	sra	a5,t1,ra
 374:	0017f793          	andi	a5,a5,1
 378:	00f686b3          	add	a3,a3,a5
 37c:	0ff6f693          	andi	a3,a3,255
 380:	00cf1733          	sll	a4,t5,a2
 384:	01871793          	slli	a5,a4,0x18
 388:	00088803          	lb	a6,0(a7)
 38c:	4187d793          	srai	a5,a5,0x18
 390:	09f68a63          	beq	a3,t6,424 <compute_next_generation+0x148>
 394:	08769e63          	bne	a3,t2,430 <compute_next_generation+0x154>
 398:	0107e7b3          	or	a5,a5,a6
 39c:	00f88023          	sb	a5,0(a7)
 3a0:	00008613          	mv	a2,ra
 3a4:	f85094e3          	bne	ra,t0,32c <compute_next_generation+0x50>
 3a8:	00158593          	addi	a1,a1,1 # 80000001 <__ctr0_io_space_begin+0x80000201>
 3ac:	00188893          	addi	a7,a7,1
 3b0:	001e0e13          	addi	t3,t3,1
 3b4:	f6159ae3          	bne	a1,ra,328 <compute_next_generation+0x4c>
 3b8:	00200593          	li	a1,2
 3bc:	e65ff0ef          	jal	ra,220 <write_grid_to_matrix>
 3c0:	00040513          	mv	a0,s0
 3c4:	f0dff0ef          	jal	ra,2d0 <reset_grid>
 3c8:	0004c783          	lbu	a5,0(s1)
 3cc:	00c12083          	lw	ra,12(sp)
 3d0:	00812403          	lw	s0,8(sp)
 3d4:	0017b793          	seqz	a5,a5
 3d8:	00f48023          	sb	a5,0(s1)
 3dc:	00412483          	lw	s1,4(sp)
 3e0:	01010113          	addi	sp,sp,16
 3e4:	00008067          	ret
 3e8:	00058e63          	beqz	a1,404 <compute_next_generation+0x128>
 3ec:	fffe4703          	lbu	a4,-1(t3)
 3f0:	40f75733          	sra	a4,a4,a5
 3f4:	00177713          	andi	a4,a4,1
 3f8:	00e686b3          	add	a3,a3,a4
 3fc:	0ff6f693          	andi	a3,a3,255
 400:	01d58c63          	beq	a1,t4,418 <compute_next_generation+0x13c>
 404:	001e4703          	lbu	a4,1(t3)
 408:	40f75733          	sra	a4,a4,a5
 40c:	00177713          	andi	a4,a4,1
 410:	00e686b3          	add	a3,a3,a4
 414:	0ff6f693          	andi	a3,a3,255
 418:	00178793          	addi	a5,a5,1
 41c:	0ff7f793          	andi	a5,a5,255
 420:	f29ff06f          	j	348 <compute_next_generation+0x6c>
 424:	40c35333          	sra	t1,t1,a2
 428:	00137313          	andi	t1,t1,1
 42c:	f60316e3          	bnez	t1,398 <compute_next_generation+0xbc>
 430:	fff7c793          	not	a5,a5
 434:	00f877b3          	and	a5,a6,a5
 438:	f65ff06f          	j	39c <compute_next_generation+0xc0>

0000043c <neorv32_cpu_delay_ms>:
 43c:	fe010113          	addi	sp,sp,-32
 440:	00112e23          	sw	ra,28(sp)
 444:	00050613          	mv	a2,a0
 448:	00055863          	bgez	a0,458 <neorv32_cpu_delay_ms+0x1c>
 44c:	40a00633          	neg	a2,a0
 450:	01061613          	slli	a2,a2,0x10
 454:	41065613          	srai	a2,a2,0x10
 458:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 45c:	3e800593          	li	a1,1000
 460:	00c12623          	sw	a2,12(sp)
 464:	0fc000ef          	jal	ra,560 <__udivsi3>
 468:	00c12603          	lw	a2,12(sp)
 46c:	00000593          	li	a1,0
 470:	41f65693          	srai	a3,a2,0x1f
 474:	054000ef          	jal	ra,4c8 <__muldi3>
 478:	01c59593          	slli	a1,a1,0x1c
 47c:	00455513          	srli	a0,a0,0x4
 480:	00a5e533          	or	a0,a1,a0

00000484 <__neorv32_cpu_delay_ms_start>:
 484:	00050a63          	beqz	a0,498 <__neorv32_cpu_delay_ms_end>
 488:	00050863          	beqz	a0,498 <__neorv32_cpu_delay_ms_end>
 48c:	fff50513          	addi	a0,a0,-1
 490:	00000013          	nop
 494:	ff1ff06f          	j	484 <__neorv32_cpu_delay_ms_start>

00000498 <__neorv32_cpu_delay_ms_end>:
 498:	01c12083          	lw	ra,28(sp)
 49c:	02010113          	addi	sp,sp,32
 4a0:	00008067          	ret

000004a4 <__mulsi3>:
 4a4:	00050613          	mv	a2,a0
 4a8:	00000513          	li	a0,0
 4ac:	0015f693          	andi	a3,a1,1
 4b0:	00068463          	beqz	a3,4b8 <__mulsi3+0x14>
 4b4:	00c50533          	add	a0,a0,a2
 4b8:	0015d593          	srli	a1,a1,0x1
 4bc:	00161613          	slli	a2,a2,0x1
 4c0:	fe0596e3          	bnez	a1,4ac <__mulsi3+0x8>
 4c4:	00008067          	ret

000004c8 <__muldi3>:
 4c8:	00050313          	mv	t1,a0
 4cc:	ff010113          	addi	sp,sp,-16
 4d0:	00060513          	mv	a0,a2
 4d4:	00068893          	mv	a7,a3
 4d8:	00112623          	sw	ra,12(sp)
 4dc:	00030613          	mv	a2,t1
 4e0:	00050693          	mv	a3,a0
 4e4:	00000713          	li	a4,0
 4e8:	00000793          	li	a5,0
 4ec:	00000813          	li	a6,0
 4f0:	0016fe13          	andi	t3,a3,1
 4f4:	00171e93          	slli	t4,a4,0x1
 4f8:	000e0c63          	beqz	t3,510 <__muldi3+0x48>
 4fc:	01060e33          	add	t3,a2,a6
 500:	010e3833          	sltu	a6,t3,a6
 504:	00e787b3          	add	a5,a5,a4
 508:	00f807b3          	add	a5,a6,a5
 50c:	000e0813          	mv	a6,t3
 510:	01f65713          	srli	a4,a2,0x1f
 514:	0016d693          	srli	a3,a3,0x1
 518:	00eee733          	or	a4,t4,a4
 51c:	00161613          	slli	a2,a2,0x1
 520:	fc0698e3          	bnez	a3,4f0 <__muldi3+0x28>
 524:	00058663          	beqz	a1,530 <__muldi3+0x68>
 528:	f7dff0ef          	jal	ra,4a4 <__mulsi3>
 52c:	00a787b3          	add	a5,a5,a0
 530:	00088a63          	beqz	a7,544 <__muldi3+0x7c>
 534:	00030513          	mv	a0,t1
 538:	00088593          	mv	a1,a7
 53c:	f69ff0ef          	jal	ra,4a4 <__mulsi3>
 540:	00f507b3          	add	a5,a0,a5
 544:	00c12083          	lw	ra,12(sp)
 548:	00080513          	mv	a0,a6
 54c:	00078593          	mv	a1,a5
 550:	01010113          	addi	sp,sp,16
 554:	00008067          	ret

00000558 <__divsi3>:
 558:	06054063          	bltz	a0,5b8 <__umodsi3+0x10>
 55c:	0605c663          	bltz	a1,5c8 <__umodsi3+0x20>

00000560 <__udivsi3>:
 560:	00058613          	mv	a2,a1
 564:	00050593          	mv	a1,a0
 568:	fff00513          	li	a0,-1
 56c:	02060c63          	beqz	a2,5a4 <__udivsi3+0x44>
 570:	00100693          	li	a3,1
 574:	00b67a63          	bgeu	a2,a1,588 <__udivsi3+0x28>
 578:	00c05863          	blez	a2,588 <__udivsi3+0x28>
 57c:	00161613          	slli	a2,a2,0x1
 580:	00169693          	slli	a3,a3,0x1
 584:	feb66ae3          	bltu	a2,a1,578 <__udivsi3+0x18>
 588:	00000513          	li	a0,0
 58c:	00c5e663          	bltu	a1,a2,598 <__udivsi3+0x38>
 590:	40c585b3          	sub	a1,a1,a2
 594:	00d56533          	or	a0,a0,a3
 598:	0016d693          	srli	a3,a3,0x1
 59c:	00165613          	srli	a2,a2,0x1
 5a0:	fe0696e3          	bnez	a3,58c <__udivsi3+0x2c>
 5a4:	00008067          	ret

000005a8 <__umodsi3>:
 5a8:	00008293          	mv	t0,ra
 5ac:	fb5ff0ef          	jal	ra,560 <__udivsi3>
 5b0:	00058513          	mv	a0,a1
 5b4:	00028067          	jr	t0
 5b8:	40a00533          	neg	a0,a0
 5bc:	00b04863          	bgtz	a1,5cc <__umodsi3+0x24>
 5c0:	40b005b3          	neg	a1,a1
 5c4:	f9dff06f          	j	560 <__udivsi3>
 5c8:	40b005b3          	neg	a1,a1
 5cc:	00008293          	mv	t0,ra
 5d0:	f91ff0ef          	jal	ra,560 <__udivsi3>
 5d4:	40a00533          	neg	a0,a0
 5d8:	00028067          	jr	t0

000005dc <__modsi3>:
 5dc:	00008293          	mv	t0,ra
 5e0:	0005ca63          	bltz	a1,5f4 <__modsi3+0x18>
 5e4:	00054c63          	bltz	a0,5fc <__modsi3+0x20>
 5e8:	f79ff0ef          	jal	ra,560 <__udivsi3>
 5ec:	00058513          	mv	a0,a1
 5f0:	00028067          	jr	t0
 5f4:	40b005b3          	neg	a1,a1
 5f8:	fe0558e3          	bgez	a0,5e8 <__modsi3+0xc>
 5fc:	40a00533          	neg	a0,a0
 600:	f61ff0ef          	jal	ra,560 <__udivsi3>
 604:	40b00533          	neg	a0,a1
 608:	00028067          	jr	t0

0000060c <memset>:
 60c:	00f00313          	li	t1,15
 610:	00050713          	mv	a4,a0
 614:	02c37e63          	bgeu	t1,a2,650 <memset+0x44>
 618:	00f77793          	andi	a5,a4,15
 61c:	0a079063          	bnez	a5,6bc <memset+0xb0>
 620:	08059263          	bnez	a1,6a4 <memset+0x98>
 624:	ff067693          	andi	a3,a2,-16
 628:	00f67613          	andi	a2,a2,15
 62c:	00e686b3          	add	a3,a3,a4
 630:	00b72023          	sw	a1,0(a4)
 634:	00b72223          	sw	a1,4(a4)
 638:	00b72423          	sw	a1,8(a4)
 63c:	00b72623          	sw	a1,12(a4)
 640:	01070713          	addi	a4,a4,16
 644:	fed766e3          	bltu	a4,a3,630 <memset+0x24>
 648:	00061463          	bnez	a2,650 <memset+0x44>
 64c:	00008067          	ret
 650:	40c306b3          	sub	a3,t1,a2
 654:	00269693          	slli	a3,a3,0x2
 658:	00000297          	auipc	t0,0x0
 65c:	005686b3          	add	a3,a3,t0
 660:	00c68067          	jr	12(a3)
 664:	00b70723          	sb	a1,14(a4)
 668:	00b706a3          	sb	a1,13(a4)
 66c:	00b70623          	sb	a1,12(a4)
 670:	00b705a3          	sb	a1,11(a4)
 674:	00b70523          	sb	a1,10(a4)
 678:	00b704a3          	sb	a1,9(a4)
 67c:	00b70423          	sb	a1,8(a4)
 680:	00b703a3          	sb	a1,7(a4)
 684:	00b70323          	sb	a1,6(a4)
 688:	00b702a3          	sb	a1,5(a4)
 68c:	00b70223          	sb	a1,4(a4)
 690:	00b701a3          	sb	a1,3(a4)
 694:	00b70123          	sb	a1,2(a4)
 698:	00b700a3          	sb	a1,1(a4)
 69c:	00b70023          	sb	a1,0(a4)
 6a0:	00008067          	ret
 6a4:	0ff5f593          	andi	a1,a1,255
 6a8:	00859693          	slli	a3,a1,0x8
 6ac:	00d5e5b3          	or	a1,a1,a3
 6b0:	01059693          	slli	a3,a1,0x10
 6b4:	00d5e5b3          	or	a1,a1,a3
 6b8:	f6dff06f          	j	624 <memset+0x18>
 6bc:	00279693          	slli	a3,a5,0x2
 6c0:	00000297          	auipc	t0,0x0
 6c4:	005686b3          	add	a3,a3,t0
 6c8:	00008293          	mv	t0,ra
 6cc:	fa0680e7          	jalr	-96(a3)
 6d0:	00028093          	mv	ra,t0
 6d4:	ff078793          	addi	a5,a5,-16
 6d8:	40f70733          	sub	a4,a4,a5
 6dc:	00f60633          	add	a2,a2,a5
 6e0:	f6c378e3          	bgeu	t1,a2,650 <memset+0x44>
 6e4:	f3dff06f          	j	620 <memset+0x14>
