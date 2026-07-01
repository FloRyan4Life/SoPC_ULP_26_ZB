
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
  c0:	80818593          	addi	a1,gp,-2040 # 80000008 <gen_counter.0>
  c4:	85418613          	addi	a2,gp,-1964 # 80000054 <__BSS_END__>

000000c8 <__crt0_clear_bss_loop>:
  c8:	00c5d863          	bge	a1,a2,d8 <__crt0_clear_bss_loop_end>
  cc:	00058023          	sb	zero,0(a1)
  d0:	00158593          	addi	a1,a1,1
  d4:	ff5ff06f          	j	c8 <__crt0_clear_bss_loop>

000000d8 <__crt0_clear_bss_loop_end>:
  d8:	00001597          	auipc	a1,0x1
  dc:	af458593          	addi	a1,a1,-1292 # bcc <__crt0_copy_data_src_begin>
  e0:	80000617          	auipc	a2,0x80000
  e4:	f2060613          	addi	a2,a2,-224 # 80000000 <__ctr0_io_space_begin+0x80000200>
  e8:	80818693          	addi	a3,gp,-2040 # 80000008 <gen_counter.0>

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
 178:	fd010113          	addi	sp,sp,-48
 17c:	00a00513          	li	a0,10
 180:	02112623          	sw	ra,44(sp)
 184:	02812423          	sw	s0,40(sp)
 188:	02912223          	sw	s1,36(sp)
 18c:	03212023          	sw	s2,32(sp)
 190:	01312e23          	sw	s3,28(sp)
 194:	01412c23          	sw	s4,24(sp)
 198:	01512a23          	sw	s5,20(sp)
 19c:	76c000ef          	jal	ra,908 <neorv32_cpu_delay_ms>
 1a0:	800004b7          	lui	s1,0x80000
 1a4:	00048593          	mv	a1,s1
 1a8:	81018513          	addi	a0,gp,-2032 # 80000010 <grid_1>
 1ac:	134000ef          	jal	ra,2e0 <load_pattern_to_grid>
 1b0:	00012423          	sw	zero,8(sp)
 1b4:	00012623          	sw	zero,12(sp)
 1b8:	00100513          	li	a0,1
 1bc:	048000ef          	jal	ra,204 <iceduino_button_get>
 1c0:	fe050ce3          	beqz	a0,1b8 <main+0x40>
 1c4:	00048613          	mv	a2,s1
 1c8:	84418593          	addi	a1,gp,-1980 # 80000044 <tx_buffer>
 1cc:	83418513          	addi	a0,gp,-1996 # 80000034 <rx_buffer>
 1d0:	664000ef          	jal	ra,834 <mmcp_master_fsm>
 1d4:	00a00513          	li	a0,10
 1d8:	730000ef          	jal	ra,908 <neorv32_cpu_delay_ms>
 1dc:	81018513          	addi	a0,gp,-2032 # 80000010 <grid_1>
 1e0:	84418793          	addi	a5,gp,-1980 # 80000044 <tx_buffer>
 1e4:	83418713          	addi	a4,gp,-1996 # 80000034 <rx_buffer>
 1e8:	00810693          	addi	a3,sp,8
 1ec:	82018613          	addi	a2,gp,-2016 # 80000020 <extended_grid>
 1f0:	81818593          	addi	a1,gp,-2024 # 80000018 <grid_2>
 1f4:	460000ef          	jal	ra,654 <mmcp_slave_fsm>
 1f8:	00a00513          	li	a0,10
 1fc:	70c000ef          	jal	ra,908 <neorv32_cpu_delay_ms>
 200:	fb9ff06f          	j	1b8 <main+0x40>

00000204 <iceduino_button_get>:
 204:	f00007b7          	lui	a5,0xf0000
 208:	0107c703          	lbu	a4,16(a5) # f0000010 <__ctr0_io_space_begin+0xf0000210>
 20c:	00f57513          	andi	a0,a0,15
 210:	00100793          	li	a5,1
 214:	0ff77713          	andi	a4,a4,255
 218:	00a79533          	sll	a0,a5,a0
 21c:	00a77533          	and	a0,a4,a0
 220:	00008067          	ret

00000224 <set_pixel>:
 224:	03f00793          	li	a5,63
 228:	02a7e463          	bltu	a5,a0,250 <set_pixel+0x2c>
 22c:	00861613          	slli	a2,a2,0x8
 230:	f00007b7          	lui	a5,0xf0000
 234:	00d66633          	or	a2,a2,a3
 238:	01059593          	slli	a1,a1,0x10
 23c:	00251513          	slli	a0,a0,0x2
 240:	10078793          	addi	a5,a5,256 # f0000100 <__ctr0_io_space_begin+0xf0000300>
 244:	00b66633          	or	a2,a2,a1
 248:	00f50533          	add	a0,a0,a5
 24c:	00c52023          	sw	a2,0(a0)
 250:	00008067          	ret

00000254 <write_grid_to_matrix>:
 254:	fe010113          	addi	sp,sp,-32
 258:	00912a23          	sw	s1,20(sp)
 25c:	01059493          	slli	s1,a1,0x10
 260:	00812c23          	sw	s0,24(sp)
 264:	01212823          	sw	s2,16(sp)
 268:	01312623          	sw	s3,12(sp)
 26c:	00112e23          	sw	ra,28(sp)
 270:	00050913          	mv	s2,a0
 274:	00000413          	li	s0,0
 278:	4104d493          	srai	s1,s1,0x10
 27c:	04000993          	li	s3,64
 280:	40345793          	srai	a5,s0,0x3
 284:	00f907b3          	add	a5,s2,a5
 288:	0007c783          	lbu	a5,0(a5)
 28c:	00747713          	andi	a4,s0,7
 290:	00000693          	li	a3,0
 294:	40e7d7b3          	sra	a5,a5,a4
 298:	0017f793          	andi	a5,a5,1
 29c:	00000613          	li	a2,0
 2a0:	0ff00593          	li	a1,255
 2a4:	00079463          	bnez	a5,2ac <write_grid_to_matrix+0x58>
 2a8:	00000593          	li	a1,0
 2ac:	00040513          	mv	a0,s0
 2b0:	f75ff0ef          	jal	ra,224 <set_pixel>
 2b4:	00048513          	mv	a0,s1
 2b8:	00140413          	addi	s0,s0,1
 2bc:	64c000ef          	jal	ra,908 <neorv32_cpu_delay_ms>
 2c0:	fd3410e3          	bne	s0,s3,280 <write_grid_to_matrix+0x2c>
 2c4:	01c12083          	lw	ra,28(sp)
 2c8:	01812403          	lw	s0,24(sp)
 2cc:	01412483          	lw	s1,20(sp)
 2d0:	01012903          	lw	s2,16(sp)
 2d4:	00c12983          	lw	s3,12(sp)
 2d8:	02010113          	addi	sp,sp,32
 2dc:	00008067          	ret

000002e0 <load_pattern_to_grid>:
 2e0:	00000793          	li	a5,0
 2e4:	00800713          	li	a4,8
 2e8:	00f586b3          	add	a3,a1,a5
 2ec:	0006c603          	lbu	a2,0(a3)
 2f0:	00f506b3          	add	a3,a0,a5
 2f4:	00178793          	addi	a5,a5,1
 2f8:	00c68023          	sb	a2,0(a3)
 2fc:	fee796e3          	bne	a5,a4,2e8 <load_pattern_to_grid+0x8>
 300:	00008067          	ret

00000304 <reset_grid>:
 304:	00800613          	li	a2,8
 308:	00000593          	li	a1,0
 30c:	7cc0006f          	j	ad8 <memset>

00000310 <reset_extended_grid>:
 310:	01400613          	li	a2,20
 314:	00000593          	li	a1,0
 318:	7c00006f          	j	ad8 <memset>

0000031c <set_grid_from_sdu>:
 31c:	ff010113          	addi	sp,sp,-16
 320:	00812423          	sw	s0,8(sp)
 324:	00912223          	sw	s1,4(sp)
 328:	00050413          	mv	s0,a0
 32c:	00058493          	mv	s1,a1
 330:	00112623          	sw	ra,12(sp)
 334:	fd1ff0ef          	jal	ra,304 <reset_grid>
 338:	00040513          	mv	a0,s0
 33c:	00748693          	addi	a3,s1,7 # 80000007 <__ctr0_io_space_begin+0x80000207>
 340:	00700593          	li	a1,7
 344:	00100813          	li	a6,1
 348:	00800613          	li	a2,8
 34c:	00000793          	li	a5,0
 350:	0006c703          	lbu	a4,0(a3)
 354:	40f75733          	sra	a4,a4,a5
 358:	00177713          	andi	a4,a4,1
 35c:	00070c63          	beqz	a4,374 <set_grid_from_sdu+0x58>
 360:	00054883          	lbu	a7,0(a0)
 364:	40f58733          	sub	a4,a1,a5
 368:	00e81733          	sll	a4,a6,a4
 36c:	01176733          	or	a4,a4,a7
 370:	00e50023          	sb	a4,0(a0)
 374:	00178793          	addi	a5,a5,1
 378:	fcc79ce3          	bne	a5,a2,350 <set_grid_from_sdu+0x34>
 37c:	00150513          	addi	a0,a0,1
 380:	fff68793          	addi	a5,a3,-1
 384:	00d48663          	beq	s1,a3,390 <set_grid_from_sdu+0x74>
 388:	00078693          	mv	a3,a5
 38c:	fc1ff06f          	j	34c <set_grid_from_sdu+0x30>
 390:	00c12083          	lw	ra,12(sp)
 394:	00812403          	lw	s0,8(sp)
 398:	00412483          	lw	s1,4(sp)
 39c:	01010113          	addi	sp,sp,16
 3a0:	00008067          	ret

000003a4 <count_living_neighbors>:
 3a4:	00159593          	slli	a1,a1,0x1
 3a8:	ffe58593          	addi	a1,a1,-2
 3ac:	00560813          	addi	a6,a2,5
 3b0:	00b508b3          	add	a7,a0,a1
 3b4:	00458593          	addi	a1,a1,4
 3b8:	00b505b3          	add	a1,a0,a1
 3bc:	0ff87793          	andi	a5,a6,255
 3c0:	00000513          	li	a0,0
 3c4:	00760613          	addi	a2,a2,7
 3c8:	02f65463          	bge	a2,a5,3f0 <count_living_neighbors+0x4c>
 3cc:	0028d783          	lhu	a5,2(a7)
 3d0:	40c7d633          	sra	a2,a5,a2
 3d4:	00167613          	andi	a2,a2,1
 3d8:	4107d7b3          	sra	a5,a5,a6
 3dc:	00c50533          	add	a0,a0,a2
 3e0:	0017f613          	andi	a2,a5,1
 3e4:	00c50533          	add	a0,a0,a2
 3e8:	0ff57513          	andi	a0,a0,255
 3ec:	00008067          	ret
 3f0:	0008d703          	lhu	a4,0(a7)
 3f4:	0005d683          	lhu	a3,0(a1)
 3f8:	40f75733          	sra	a4,a4,a5
 3fc:	40f6d6b3          	sra	a3,a3,a5
 400:	00177713          	andi	a4,a4,1
 404:	0016f693          	andi	a3,a3,1
 408:	00d70733          	add	a4,a4,a3
 40c:	00e50533          	add	a0,a0,a4
 410:	00178793          	addi	a5,a5,1
 414:	0ff57513          	andi	a0,a0,255
 418:	0ff7f793          	andi	a5,a5,255
 41c:	fadff06f          	j	3c8 <count_living_neighbors+0x24>

00000420 <merge_grid_with_edge>:
 420:	ff010113          	addi	sp,sp,-16
 424:	01212023          	sw	s2,0(sp)
 428:	00050913          	mv	s2,a0
 42c:	00058513          	mv	a0,a1
 430:	00812423          	sw	s0,8(sp)
 434:	00912223          	sw	s1,4(sp)
 438:	00060413          	mv	s0,a2
 43c:	00058493          	mv	s1,a1
 440:	00112623          	sw	ra,12(sp)
 444:	ecdff0ef          	jal	ra,310 <reset_extended_grid>
 448:	00000713          	li	a4,0
 44c:	00100593          	li	a1,1
 450:	00800613          	li	a2,8
 454:	00744783          	lbu	a5,7(s0)
 458:	00e596b3          	sll	a3,a1,a4
 45c:	00d7f7b3          	and	a5,a5,a3
 460:	40e006b3          	neg	a3,a4
 464:	00169693          	slli	a3,a3,0x1
 468:	00f68693          	addi	a3,a3,15
 46c:	00d797b3          	sll	a5,a5,a3
 470:	0004d683          	lhu	a3,0(s1)
 474:	00170713          	addi	a4,a4,1
 478:	00d7e7b3          	or	a5,a5,a3
 47c:	01079793          	slli	a5,a5,0x10
 480:	4107d793          	srai	a5,a5,0x10
 484:	00f49023          	sh	a5,0(s1)
 488:	fcc716e3          	bne	a4,a2,454 <merge_grid_with_edge+0x34>
 48c:	00644703          	lbu	a4,6(s0)
 490:	00248693          	addi	a3,s1,2
 494:	00300513          	li	a0,3
 498:	00771713          	slli	a4,a4,0x7
 49c:	0ff77713          	andi	a4,a4,255
 4a0:	00e7e7b3          	or	a5,a5,a4
 4a4:	00f49023          	sh	a5,0(s1)
 4a8:	00644703          	lbu	a4,6(s0)
 4ac:	00b00313          	li	t1,11
 4b0:	00100593          	li	a1,1
 4b4:	00571713          	slli	a4,a4,0x5
 4b8:	04077713          	andi	a4,a4,64
 4bc:	00e7e7b3          	or	a5,a5,a4
 4c0:	00f49023          	sh	a5,0(s1)
 4c4:	00400813          	li	a6,4
 4c8:	00000793          	li	a5,0
 4cc:	00500e13          	li	t3,5
 4d0:	00c00e93          	li	t4,12
 4d4:	00800893          	li	a7,8
 4d8:	06f54463          	blt	a0,a5,540 <merge_grid_with_edge+0x120>
 4dc:	00344603          	lbu	a2,3(s0)
 4e0:	40f50733          	sub	a4,a0,a5
 4e4:	00e59733          	sll	a4,a1,a4
 4e8:	00c77733          	and	a4,a4,a2
 4ec:	00c78613          	addi	a2,a5,12
 4f0:	00c71733          	sll	a4,a4,a2
 4f4:	0006d603          	lhu	a2,0(a3)
 4f8:	00c76733          	or	a4,a4,a2
 4fc:	00e69023          	sh	a4,0(a3)
 500:	00f90733          	add	a4,s2,a5
 504:	00074703          	lbu	a4,0(a4)
 508:	0006d603          	lhu	a2,0(a3)
 50c:	00771713          	slli	a4,a4,0x7
 510:	00c76733          	or	a4,a4,a2
 514:	01071713          	slli	a4,a4,0x10
 518:	41075713          	srai	a4,a4,0x10
 51c:	00e69023          	sh	a4,0(a3)
 520:	02f84c63          	blt	a6,a5,558 <merge_grid_with_edge+0x138>
 524:	00644f03          	lbu	t5,6(s0)
 528:	00278613          	addi	a2,a5,2
 52c:	00c59633          	sll	a2,a1,a2
 530:	01e67633          	and	a2,a2,t5
 534:	40f80f33          	sub	t5,a6,a5
 538:	01e61633          	sll	a2,a2,t5
 53c:	02c0006f          	j	568 <merge_grid_with_edge+0x148>
 540:	00444603          	lbu	a2,4(s0)
 544:	40f30733          	sub	a4,t1,a5
 548:	00e59733          	sll	a4,a1,a4
 54c:	00c77733          	and	a4,a4,a2
 550:	00478613          	addi	a2,a5,4
 554:	f9dff06f          	j	4f0 <merge_grid_with_edge+0xd0>
 558:	07c79663          	bne	a5,t3,5c4 <merge_grid_with_edge+0x1a4>
 55c:	00644603          	lbu	a2,6(s0)
 560:	08067613          	andi	a2,a2,128
 564:	40165613          	srai	a2,a2,0x1
 568:	00c76733          	or	a4,a4,a2
 56c:	00e69023          	sh	a4,0(a3)
 570:	00178793          	addi	a5,a5,1
 574:	00268693          	addi	a3,a3,2
 578:	f71790e3          	bne	a5,a7,4d8 <merge_grid_with_edge+0xb8>
 57c:	00444783          	lbu	a5,4(s0)
 580:	0124d703          	lhu	a4,18(s1)
 584:	00c12083          	lw	ra,12(sp)
 588:	00c79793          	slli	a5,a5,0xc
 58c:	00e7e7b3          	or	a5,a5,a4
 590:	01079793          	slli	a5,a5,0x10
 594:	4107d793          	srai	a5,a5,0x10
 598:	00f49923          	sh	a5,18(s1)
 59c:	00544703          	lbu	a4,5(s0)
 5a0:	00812403          	lw	s0,8(sp)
 5a4:	00012903          	lw	s2,0(sp)
 5a8:	00471713          	slli	a4,a4,0x4
 5ac:	fc077713          	andi	a4,a4,-64
 5b0:	00e7e7b3          	or	a5,a5,a4
 5b4:	00f49923          	sh	a5,18(s1)
 5b8:	00412483          	lw	s1,4(sp)
 5bc:	01010113          	addi	sp,sp,16
 5c0:	00008067          	ret
 5c4:	00544f03          	lbu	t5,5(s0)
 5c8:	ffa78613          	addi	a2,a5,-6
 5cc:	00c59633          	sll	a2,a1,a2
 5d0:	01e67633          	and	a2,a2,t5
 5d4:	40fe8f33          	sub	t5,t4,a5
 5d8:	f61ff06f          	j	538 <merge_grid_with_edge+0x118>

000005dc <build_mmcp_frame>:
 5dc:	ff010113          	addi	sp,sp,-16
 5e0:	00812423          	sw	s0,8(sp)
 5e4:	00112623          	sw	ra,12(sp)
 5e8:	00050023          	sb	zero,0(a0)
 5ec:	000500a3          	sb	zero,1(a0)
 5f0:	00050123          	sb	zero,2(a0)
 5f4:	000501a3          	sb	zero,3(a0)
 5f8:	00050223          	sb	zero,4(a0)
 5fc:	00b502a3          	sb	a1,5(a0)
 600:	00050413          	mv	s0,a0
 604:	02060e63          	beqz	a2,640 <build_mmcp_frame+0x64>
 608:	00000793          	li	a5,0
 60c:	00800713          	li	a4,8
 610:	00f606b3          	add	a3,a2,a5
 614:	0006c583          	lbu	a1,0(a3)
 618:	00f406b3          	add	a3,s0,a5
 61c:	00178793          	addi	a5,a5,1
 620:	00b68323          	sb	a1,6(a3)
 624:	fee796e3          	bne	a5,a4,610 <build_mmcp_frame+0x34>
 628:	00c12083          	lw	ra,12(sp)
 62c:	00040723          	sb	zero,14(s0)
 630:	000407a3          	sb	zero,15(s0)
 634:	00812403          	lw	s0,8(sp)
 638:	01010113          	addi	sp,sp,16
 63c:	00008067          	ret
 640:	00800613          	li	a2,8
 644:	00000593          	li	a1,0
 648:	00650513          	addi	a0,a0,6
 64c:	48c000ef          	jal	ra,ad8 <memset>
 650:	fd9ff06f          	j	628 <build_mmcp_frame+0x4c>

00000654 <mmcp_slave_fsm>:
 654:	fb010113          	addi	sp,sp,-80
 658:	04912223          	sw	s1,68(sp)
 65c:	8091c783          	lbu	a5,-2039(gp) # 80000009 <grid_switch.2>
 660:	04812423          	sw	s0,72(sp)
 664:	05212023          	sw	s2,64(sp)
 668:	03412c23          	sw	s4,56(sp)
 66c:	04112623          	sw	ra,76(sp)
 670:	03312e23          	sw	s3,60(sp)
 674:	03512a23          	sw	s5,52(sp)
 678:	03612823          	sw	s6,48(sp)
 67c:	03712623          	sw	s7,44(sp)
 680:	03812423          	sw	s8,40(sp)
 684:	03912223          	sw	s9,36(sp)
 688:	03a12023          	sw	s10,32(sp)
 68c:	01b12e23          	sw	s11,28(sp)
 690:	00060913          	mv	s2,a2
 694:	00050413          	mv	s0,a0
 698:	00058a13          	mv	s4,a1
 69c:	00068613          	mv	a2,a3
 6a0:	80918493          	addi	s1,gp,-2039 # 80000009 <grid_switch.2>
 6a4:	00078663          	beqz	a5,6b0 <mmcp_slave_fsm+0x5c>
 6a8:	00050a13          	mv	s4,a0
 6ac:	00058413          	mv	s0,a1
 6b0:	00574783          	lbu	a5,5(a4)
 6b4:	00200693          	li	a3,2
 6b8:	06d78263          	beq	a5,a3,71c <mmcp_slave_fsm+0xc8>
 6bc:	00600693          	li	a3,6
 6c0:	0ed78e63          	beq	a5,a3,7bc <mmcp_slave_fsm+0x168>
 6c4:	00100693          	li	a3,1
 6c8:	10d79a63          	bne	a5,a3,7dc <mmcp_slave_fsm+0x188>
 6cc:	00040513          	mv	a0,s0
 6d0:	00670593          	addi	a1,a4,6
 6d4:	c49ff0ef          	jal	ra,31c <set_grid_from_sdu>
 6d8:	00040513          	mv	a0,s0
 6dc:	04812403          	lw	s0,72(sp)
 6e0:	04c12083          	lw	ra,76(sp)
 6e4:	04412483          	lw	s1,68(sp)
 6e8:	04012903          	lw	s2,64(sp)
 6ec:	03c12983          	lw	s3,60(sp)
 6f0:	03812a03          	lw	s4,56(sp)
 6f4:	03412a83          	lw	s5,52(sp)
 6f8:	03012b03          	lw	s6,48(sp)
 6fc:	02c12b83          	lw	s7,44(sp)
 700:	02812c03          	lw	s8,40(sp)
 704:	02412c83          	lw	s9,36(sp)
 708:	02012d03          	lw	s10,32(sp)
 70c:	01c12d83          	lw	s11,28(sp)
 710:	00300593          	li	a1,3
 714:	05010113          	addi	sp,sp,80
 718:	b3dff06f          	j	254 <write_grid_to_matrix>
 71c:	00090593          	mv	a1,s2
 720:	00040513          	mv	a0,s0
 724:	cfdff0ef          	jal	ra,420 <merge_grid_with_edge>
 728:	000a0993          	mv	s3,s4
 72c:	00100b13          	li	s6,1
 730:	00100c13          	li	s8,1
 734:	00200c93          	li	s9,2
 738:	00300d93          	li	s11,3
 73c:	00900d13          	li	s10,9
 740:	00100a93          	li	s5,1
 744:	0ffb7593          	andi	a1,s6,255
 748:	01640bb3          	add	s7,s0,s6
 74c:	0ffaf613          	andi	a2,s5,255
 750:	00090513          	mv	a0,s2
 754:	00b12623          	sw	a1,12(sp)
 758:	c4dff0ef          	jal	ra,3a4 <count_living_neighbors>
 75c:	fffa8613          	addi	a2,s5,-1
 760:	00cc1733          	sll	a4,s8,a2
 764:	01871793          	slli	a5,a4,0x18
 768:	00098683          	lb	a3,0(s3)
 76c:	00c12583          	lw	a1,12(sp)
 770:	4187d793          	srai	a5,a5,0x18
 774:	0b950263          	beq	a0,s9,818 <mmcp_slave_fsm+0x1c4>
 778:	0bb51863          	bne	a0,s11,828 <mmcp_slave_fsm+0x1d4>
 77c:	00d7e7b3          	or	a5,a5,a3
 780:	00f98023          	sb	a5,0(s3)
 784:	001a8a93          	addi	s5,s5,1
 788:	fdaa92e3          	bne	s5,s10,74c <mmcp_slave_fsm+0xf8>
 78c:	001b0b13          	addi	s6,s6,1
 790:	00198993          	addi	s3,s3,1
 794:	fb5b16e3          	bne	s6,s5,740 <mmcp_slave_fsm+0xec>
 798:	00300593          	li	a1,3
 79c:	000a0513          	mv	a0,s4
 7a0:	ab5ff0ef          	jal	ra,254 <write_grid_to_matrix>
 7a4:	00040513          	mv	a0,s0
 7a8:	b5dff0ef          	jal	ra,304 <reset_grid>
 7ac:	0004c783          	lbu	a5,0(s1)
 7b0:	0017b793          	seqz	a5,a5
 7b4:	00f48023          	sb	a5,0(s1)
 7b8:	0240006f          	j	7dc <mmcp_slave_fsm+0x188>
 7bc:	00600793          	li	a5,6
 7c0:	00e00693          	li	a3,14
 7c4:	00f705b3          	add	a1,a4,a5
 7c8:	0005c503          	lbu	a0,0(a1)
 7cc:	00f605b3          	add	a1,a2,a5
 7d0:	00178793          	addi	a5,a5,1
 7d4:	fea58d23          	sb	a0,-6(a1)
 7d8:	fed796e3          	bne	a5,a3,7c4 <mmcp_slave_fsm+0x170>
 7dc:	04c12083          	lw	ra,76(sp)
 7e0:	04812403          	lw	s0,72(sp)
 7e4:	04412483          	lw	s1,68(sp)
 7e8:	04012903          	lw	s2,64(sp)
 7ec:	03c12983          	lw	s3,60(sp)
 7f0:	03812a03          	lw	s4,56(sp)
 7f4:	03412a83          	lw	s5,52(sp)
 7f8:	03012b03          	lw	s6,48(sp)
 7fc:	02c12b83          	lw	s7,44(sp)
 800:	02812c03          	lw	s8,40(sp)
 804:	02412c83          	lw	s9,36(sp)
 808:	02012d03          	lw	s10,32(sp)
 80c:	01c12d83          	lw	s11,28(sp)
 810:	05010113          	addi	sp,sp,80
 814:	00008067          	ret
 818:	fffbc703          	lbu	a4,-1(s7)
 81c:	40c75733          	sra	a4,a4,a2
 820:	00177713          	andi	a4,a4,1
 824:	f4071ce3          	bnez	a4,77c <mmcp_slave_fsm+0x128>
 828:	fff7c793          	not	a5,a5
 82c:	00f6f7b3          	and	a5,a3,a5
 830:	f51ff06f          	j	780 <mmcp_slave_fsm+0x12c>

00000834 <mmcp_master_fsm>:
 834:	ff010113          	addi	sp,sp,-16
 838:	00812423          	sw	s0,8(sp)
 83c:	80c18413          	addi	s0,gp,-2036 # 8000000c <mmcp_master_state.1>
 840:	00042703          	lw	a4,0(s0)
 844:	01212023          	sw	s2,0(sp)
 848:	00112623          	sw	ra,12(sp)
 84c:	00912223          	sw	s1,4(sp)
 850:	00100913          	li	s2,1
 854:	05270463          	beq	a4,s2,89c <mmcp_master_fsm+0x68>
 858:	80c18493          	addi	s1,gp,-2036 # 8000000c <mmcp_master_state.1>
 85c:	00200793          	li	a5,2
 860:	06f70463          	beq	a4,a5,8c8 <mmcp_master_fsm+0x94>
 864:	08071e63          	bnez	a4,900 <mmcp_master_fsm+0xcc>
 868:	00100593          	li	a1,1
 86c:	d71ff0ef          	jal	ra,5dc <build_mmcp_frame>
 870:	80818793          	addi	a5,gp,-2040 # 80000008 <gen_counter.0>
 874:	0007c703          	lbu	a4,0(a5)
 878:	01242023          	sw	s2,0(s0)
 87c:	00170713          	addi	a4,a4,1
 880:	00e78023          	sb	a4,0(a5)
 884:	00c12083          	lw	ra,12(sp)
 888:	00812403          	lw	s0,8(sp)
 88c:	00412483          	lw	s1,4(sp)
 890:	00012903          	lw	s2,0(sp)
 894:	01010113          	addi	sp,sp,16
 898:	00008067          	ret
 89c:	8081c783          	lbu	a5,-2040(gp) # 80000008 <gen_counter.0>
 8a0:	00001637          	lui	a2,0x1
 8a4:	bb460613          	addi	a2,a2,-1100 # bb4 <__etext>
 8a8:	fff78793          	addi	a5,a5,-1
 8ac:	00379793          	slli	a5,a5,0x3
 8b0:	00f60633          	add	a2,a2,a5
 8b4:	00600593          	li	a1,6
 8b8:	d25ff0ef          	jal	ra,5dc <build_mmcp_frame>
 8bc:	00200793          	li	a5,2
 8c0:	00f42023          	sw	a5,0(s0)
 8c4:	fc1ff06f          	j	884 <mmcp_master_fsm+0x50>
 8c8:	00000613          	li	a2,0
 8cc:	00200593          	li	a1,2
 8d0:	d0dff0ef          	jal	ra,5dc <build_mmcp_frame>
 8d4:	8081c703          	lbu	a4,-2040(gp) # 80000008 <gen_counter.0>
 8d8:	00300613          	li	a2,3
 8dc:	80818793          	addi	a5,gp,-2040 # 80000008 <gen_counter.0>
 8e0:	00100693          	li	a3,1
 8e4:	00c70663          	beq	a4,a2,8f0 <mmcp_master_fsm+0xbc>
 8e8:	00170713          	addi	a4,a4,1
 8ec:	0ff77693          	andi	a3,a4,255
 8f0:	00d78023          	sb	a3,0(a5)
 8f4:	00100793          	li	a5,1
 8f8:	00f4a023          	sw	a5,0(s1)
 8fc:	f89ff06f          	j	884 <mmcp_master_fsm+0x50>
 900:	00042023          	sw	zero,0(s0)
 904:	f81ff06f          	j	884 <mmcp_master_fsm+0x50>

00000908 <neorv32_cpu_delay_ms>:
 908:	fe010113          	addi	sp,sp,-32
 90c:	00112e23          	sw	ra,28(sp)
 910:	00050613          	mv	a2,a0
 914:	00055863          	bgez	a0,924 <neorv32_cpu_delay_ms+0x1c>
 918:	40a00633          	neg	a2,a0
 91c:	01061613          	slli	a2,a2,0x10
 920:	41065613          	srai	a2,a2,0x10
 924:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 928:	3e800593          	li	a1,1000
 92c:	00c12623          	sw	a2,12(sp)
 930:	0fc000ef          	jal	ra,a2c <__udivsi3>
 934:	00c12603          	lw	a2,12(sp)
 938:	00000593          	li	a1,0
 93c:	41f65693          	srai	a3,a2,0x1f
 940:	054000ef          	jal	ra,994 <__muldi3>
 944:	01c59593          	slli	a1,a1,0x1c
 948:	00455513          	srli	a0,a0,0x4
 94c:	00a5e533          	or	a0,a1,a0

00000950 <__neorv32_cpu_delay_ms_start>:
 950:	00050a63          	beqz	a0,964 <__neorv32_cpu_delay_ms_end>
 954:	00050863          	beqz	a0,964 <__neorv32_cpu_delay_ms_end>
 958:	fff50513          	addi	a0,a0,-1
 95c:	00000013          	nop
 960:	ff1ff06f          	j	950 <__neorv32_cpu_delay_ms_start>

00000964 <__neorv32_cpu_delay_ms_end>:
 964:	01c12083          	lw	ra,28(sp)
 968:	02010113          	addi	sp,sp,32
 96c:	00008067          	ret

00000970 <__mulsi3>:
 970:	00050613          	mv	a2,a0
 974:	00000513          	li	a0,0
 978:	0015f693          	andi	a3,a1,1
 97c:	00068463          	beqz	a3,984 <__mulsi3+0x14>
 980:	00c50533          	add	a0,a0,a2
 984:	0015d593          	srli	a1,a1,0x1
 988:	00161613          	slli	a2,a2,0x1
 98c:	fe0596e3          	bnez	a1,978 <__mulsi3+0x8>
 990:	00008067          	ret

00000994 <__muldi3>:
 994:	00050313          	mv	t1,a0
 998:	ff010113          	addi	sp,sp,-16
 99c:	00060513          	mv	a0,a2
 9a0:	00068893          	mv	a7,a3
 9a4:	00112623          	sw	ra,12(sp)
 9a8:	00030613          	mv	a2,t1
 9ac:	00050693          	mv	a3,a0
 9b0:	00000713          	li	a4,0
 9b4:	00000793          	li	a5,0
 9b8:	00000813          	li	a6,0
 9bc:	0016fe13          	andi	t3,a3,1
 9c0:	00171e93          	slli	t4,a4,0x1
 9c4:	000e0c63          	beqz	t3,9dc <__muldi3+0x48>
 9c8:	01060e33          	add	t3,a2,a6
 9cc:	010e3833          	sltu	a6,t3,a6
 9d0:	00e787b3          	add	a5,a5,a4
 9d4:	00f807b3          	add	a5,a6,a5
 9d8:	000e0813          	mv	a6,t3
 9dc:	01f65713          	srli	a4,a2,0x1f
 9e0:	0016d693          	srli	a3,a3,0x1
 9e4:	00eee733          	or	a4,t4,a4
 9e8:	00161613          	slli	a2,a2,0x1
 9ec:	fc0698e3          	bnez	a3,9bc <__muldi3+0x28>
 9f0:	00058663          	beqz	a1,9fc <__muldi3+0x68>
 9f4:	f7dff0ef          	jal	ra,970 <__mulsi3>
 9f8:	00a787b3          	add	a5,a5,a0
 9fc:	00088a63          	beqz	a7,a10 <__muldi3+0x7c>
 a00:	00030513          	mv	a0,t1
 a04:	00088593          	mv	a1,a7
 a08:	f69ff0ef          	jal	ra,970 <__mulsi3>
 a0c:	00f507b3          	add	a5,a0,a5
 a10:	00c12083          	lw	ra,12(sp)
 a14:	00080513          	mv	a0,a6
 a18:	00078593          	mv	a1,a5
 a1c:	01010113          	addi	sp,sp,16
 a20:	00008067          	ret

00000a24 <__divsi3>:
 a24:	06054063          	bltz	a0,a84 <__umodsi3+0x10>
 a28:	0605c663          	bltz	a1,a94 <__umodsi3+0x20>

00000a2c <__udivsi3>:
 a2c:	00058613          	mv	a2,a1
 a30:	00050593          	mv	a1,a0
 a34:	fff00513          	li	a0,-1
 a38:	02060c63          	beqz	a2,a70 <__udivsi3+0x44>
 a3c:	00100693          	li	a3,1
 a40:	00b67a63          	bgeu	a2,a1,a54 <__udivsi3+0x28>
 a44:	00c05863          	blez	a2,a54 <__udivsi3+0x28>
 a48:	00161613          	slli	a2,a2,0x1
 a4c:	00169693          	slli	a3,a3,0x1
 a50:	feb66ae3          	bltu	a2,a1,a44 <__udivsi3+0x18>
 a54:	00000513          	li	a0,0
 a58:	00c5e663          	bltu	a1,a2,a64 <__udivsi3+0x38>
 a5c:	40c585b3          	sub	a1,a1,a2
 a60:	00d56533          	or	a0,a0,a3
 a64:	0016d693          	srli	a3,a3,0x1
 a68:	00165613          	srli	a2,a2,0x1
 a6c:	fe0696e3          	bnez	a3,a58 <__udivsi3+0x2c>
 a70:	00008067          	ret

00000a74 <__umodsi3>:
 a74:	00008293          	mv	t0,ra
 a78:	fb5ff0ef          	jal	ra,a2c <__udivsi3>
 a7c:	00058513          	mv	a0,a1
 a80:	00028067          	jr	t0
 a84:	40a00533          	neg	a0,a0
 a88:	00b04863          	bgtz	a1,a98 <__umodsi3+0x24>
 a8c:	40b005b3          	neg	a1,a1
 a90:	f9dff06f          	j	a2c <__udivsi3>
 a94:	40b005b3          	neg	a1,a1
 a98:	00008293          	mv	t0,ra
 a9c:	f91ff0ef          	jal	ra,a2c <__udivsi3>
 aa0:	40a00533          	neg	a0,a0
 aa4:	00028067          	jr	t0

00000aa8 <__modsi3>:
 aa8:	00008293          	mv	t0,ra
 aac:	0005ca63          	bltz	a1,ac0 <__modsi3+0x18>
 ab0:	00054c63          	bltz	a0,ac8 <__modsi3+0x20>
 ab4:	f79ff0ef          	jal	ra,a2c <__udivsi3>
 ab8:	00058513          	mv	a0,a1
 abc:	00028067          	jr	t0
 ac0:	40b005b3          	neg	a1,a1
 ac4:	fe0558e3          	bgez	a0,ab4 <__modsi3+0xc>
 ac8:	40a00533          	neg	a0,a0
 acc:	f61ff0ef          	jal	ra,a2c <__udivsi3>
 ad0:	40b00533          	neg	a0,a1
 ad4:	00028067          	jr	t0

00000ad8 <memset>:
 ad8:	00f00313          	li	t1,15
 adc:	00050713          	mv	a4,a0
 ae0:	02c37e63          	bgeu	t1,a2,b1c <memset+0x44>
 ae4:	00f77793          	andi	a5,a4,15
 ae8:	0a079063          	bnez	a5,b88 <memset+0xb0>
 aec:	08059263          	bnez	a1,b70 <memset+0x98>
 af0:	ff067693          	andi	a3,a2,-16
 af4:	00f67613          	andi	a2,a2,15
 af8:	00e686b3          	add	a3,a3,a4
 afc:	00b72023          	sw	a1,0(a4)
 b00:	00b72223          	sw	a1,4(a4)
 b04:	00b72423          	sw	a1,8(a4)
 b08:	00b72623          	sw	a1,12(a4)
 b0c:	01070713          	addi	a4,a4,16
 b10:	fed766e3          	bltu	a4,a3,afc <memset+0x24>
 b14:	00061463          	bnez	a2,b1c <memset+0x44>
 b18:	00008067          	ret
 b1c:	40c306b3          	sub	a3,t1,a2
 b20:	00269693          	slli	a3,a3,0x2
 b24:	00000297          	auipc	t0,0x0
 b28:	005686b3          	add	a3,a3,t0
 b2c:	00c68067          	jr	12(a3)
 b30:	00b70723          	sb	a1,14(a4)
 b34:	00b706a3          	sb	a1,13(a4)
 b38:	00b70623          	sb	a1,12(a4)
 b3c:	00b705a3          	sb	a1,11(a4)
 b40:	00b70523          	sb	a1,10(a4)
 b44:	00b704a3          	sb	a1,9(a4)
 b48:	00b70423          	sb	a1,8(a4)
 b4c:	00b703a3          	sb	a1,7(a4)
 b50:	00b70323          	sb	a1,6(a4)
 b54:	00b702a3          	sb	a1,5(a4)
 b58:	00b70223          	sb	a1,4(a4)
 b5c:	00b701a3          	sb	a1,3(a4)
 b60:	00b70123          	sb	a1,2(a4)
 b64:	00b700a3          	sb	a1,1(a4)
 b68:	00b70023          	sb	a1,0(a4)
 b6c:	00008067          	ret
 b70:	0ff5f593          	andi	a1,a1,255
 b74:	00859693          	slli	a3,a1,0x8
 b78:	00d5e5b3          	or	a1,a1,a3
 b7c:	01059693          	slli	a3,a1,0x10
 b80:	00d5e5b3          	or	a1,a1,a3
 b84:	f6dff06f          	j	af0 <memset+0x18>
 b88:	00279693          	slli	a3,a5,0x2
 b8c:	00000297          	auipc	t0,0x0
 b90:	005686b3          	add	a3,a3,t0
 b94:	00008293          	mv	t0,ra
 b98:	fa0680e7          	jalr	-96(a3)
 b9c:	00028093          	mv	ra,t0
 ba0:	ff078793          	addi	a5,a5,-16
 ba4:	40f70733          	sub	a4,a4,a5
 ba8:	00f60633          	add	a2,a2,a5
 bac:	f6c378e3          	bgeu	t1,a2,b1c <memset+0x44>
 bb0:	f3dff06f          	j	aec <memset+0x14>
