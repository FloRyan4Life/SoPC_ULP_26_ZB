
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
  18:	12050513          	addi	a0,a0,288 # 134 <__crt0_dummy_trap_handler>
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
  c0:	80000597          	auipc	a1,0x80000
  c4:	f4058593          	addi	a1,a1,-192 # 80000000 <__ctr0_io_space_begin+0x80000200>
  c8:	81418613          	addi	a2,gp,-2028 # 80000014 <__BSS_END__>

000000cc <__crt0_clear_bss_loop>:
  cc:	00c5d863          	bge	a1,a2,dc <__crt0_clear_bss_loop_end>
  d0:	00058023          	sb	zero,0(a1)
  d4:	00158593          	addi	a1,a1,1
  d8:	ff5ff06f          	j	cc <__crt0_clear_bss_loop>

000000dc <__crt0_clear_bss_loop_end>:
  dc:	00000597          	auipc	a1,0x0
  e0:	62858593          	addi	a1,a1,1576 # 704 <__crt0_copy_data_src_begin>
  e4:	80000617          	auipc	a2,0x80000
  e8:	f1c60613          	addi	a2,a2,-228 # 80000000 <__ctr0_io_space_begin+0x80000200>
  ec:	80000697          	auipc	a3,0x80000
  f0:	f1468693          	addi	a3,a3,-236 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000f4 <__crt0_copy_data_loop>:
  f4:	00d65c63          	bge	a2,a3,10c <__crt0_copy_data_loop_end>
  f8:	00058703          	lb	a4,0(a1)
  fc:	00e60023          	sb	a4,0(a2)
 100:	00158593          	addi	a1,a1,1
 104:	00160613          	addi	a2,a2,1
 108:	fedff06f          	j	f4 <__crt0_copy_data_loop>

0000010c <__crt0_copy_data_loop_end>:
 10c:	00000513          	li	a0,0
 110:	00000593          	li	a1,0
 114:	06c000ef          	jal	ra,180 <main>

00000118 <__crt0_main_aftermath>:
 118:	34051073          	csrw	mscratch,a0
 11c:	00000093          	li	ra,0
 120:	00008463          	beqz	ra,128 <__crt0_main_aftermath_end>
 124:	000080e7          	jalr	ra

00000128 <__crt0_main_aftermath_end>:
 128:	30047073          	csrci	mstatus,8

0000012c <__crt0_main_aftermath_end_loop>:
 12c:	10500073          	wfi
 130:	ffdff06f          	j	12c <__crt0_main_aftermath_end_loop>

00000134 <__crt0_dummy_trap_handler>:
 134:	ff810113          	addi	sp,sp,-8
 138:	00812023          	sw	s0,0(sp)
 13c:	00912223          	sw	s1,4(sp)
 140:	34202473          	csrr	s0,mcause
 144:	02044663          	bltz	s0,170 <__crt0_dummy_trap_handler_irq>
 148:	34102473          	csrr	s0,mepc

0000014c <__crt0_dummy_trap_handler_exc_c_check>:
 14c:	00041483          	lh	s1,0(s0)
 150:	0034f493          	andi	s1,s1,3
 154:	00240413          	addi	s0,s0,2
 158:	34141073          	csrw	mepc,s0
 15c:	00300413          	li	s0,3
 160:	00941863          	bne	s0,s1,170 <__crt0_dummy_trap_handler_irq>

00000164 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 164:	34102473          	csrr	s0,mepc
 168:	00240413          	addi	s0,s0,2
 16c:	34141073          	csrw	mepc,s0

00000170 <__crt0_dummy_trap_handler_irq>:
 170:	00012403          	lw	s0,0(sp)
 174:	00412483          	lw	s1,4(sp)
 178:	00810113          	addi	sp,sp,8
 17c:	30200073          	mret

00000180 <main>:
 180:	fd010113          	addi	sp,sp,-48
 184:	00a00513          	li	a0,10
 188:	02112623          	sw	ra,44(sp)
 18c:	02812423          	sw	s0,40(sp)
 190:	02912223          	sw	s1,36(sp)
 194:	03212023          	sw	s2,32(sp)
 198:	01312e23          	sw	s3,28(sp)
 19c:	01412c23          	sw	s4,24(sp)
 1a0:	01512a23          	sw	s5,20(sp)
 1a4:	01612823          	sw	s6,16(sp)
 1a8:	01712623          	sw	s7,12(sp)
 1ac:	01812423          	sw	s8,8(sp)
 1b0:	384000ef          	jal	ra,534 <neorv32_cpu_delay_ms>
 1b4:	80000637          	lui	a2,0x80000
 1b8:	00000793          	li	a5,0
 1bc:	00060613          	mv	a2,a2
 1c0:	00100513          	li	a0,1
 1c4:	04000593          	li	a1,64
 1c8:	0017f713          	andi	a4,a5,1
 1cc:	02071063          	bnez	a4,1ec <main+0x6c>
 1d0:	4037d693          	srai	a3,a5,0x3
 1d4:	00d606b3          	add	a3,a2,a3
 1d8:	0006c803          	lbu	a6,0(a3)
 1dc:	0077f713          	andi	a4,a5,7
 1e0:	00e51733          	sll	a4,a0,a4
 1e4:	01076733          	or	a4,a4,a6
 1e8:	00e68023          	sb	a4,0(a3)
 1ec:	00178793          	addi	a5,a5,1
 1f0:	fcb79ce3          	bne	a5,a1,1c8 <main+0x48>
 1f4:	80000437          	lui	s0,0x80000
 1f8:	00000493          	li	s1,0
 1fc:	00040413          	mv	s0,s0
 200:	04000913          	li	s2,64
 204:	4034d793          	srai	a5,s1,0x3
 208:	00f407b3          	add	a5,s0,a5
 20c:	0007c783          	lbu	a5,0(a5)
 210:	0074f713          	andi	a4,s1,7
 214:	00000693          	li	a3,0
 218:	40e7d7b3          	sra	a5,a5,a4
 21c:	0017f793          	andi	a5,a5,1
 220:	00000613          	li	a2,0
 224:	0ff00593          	li	a1,255
 228:	00079463          	bnez	a5,230 <main+0xb0>
 22c:	00000593          	li	a1,0
 230:	00048513          	mv	a0,s1
 234:	2d0000ef          	jal	ra,504 <set_pixel>
 238:	00400513          	li	a0,4
 23c:	00148493          	addi	s1,s1,1
 240:	2f4000ef          	jal	ra,534 <neorv32_cpu_delay_ms>
 244:	fd2490e3          	bne	s1,s2,204 <main+0x84>
 248:	80818493          	addi	s1,gp,-2040 # 80000008 <grid2>
 24c:	00648a93          	addi	s5,s1,6
 250:	00640b13          	addi	s6,s0,6 # 80000006 <__ctr0_io_space_begin+0x80000206>
 254:	00200513          	li	a0,2
 258:	28c000ef          	jal	ra,4e4 <iceduino_button_get>
 25c:	fe050ce3          	beqz	a0,254 <main+0xd4>
 260:	1f400513          	li	a0,500
 264:	2d0000ef          	jal	ra,534 <neorv32_cpu_delay_ms>
 268:	8101c783          	lbu	a5,-2032(gp) # 80000010 <grid_switch>
 26c:	81018913          	addi	s2,gp,-2032 # 80000010 <grid_switch>
 270:	81118693          	addi	a3,gp,-2031 # 80000011 <living_neighbors_cnt>
 274:	02078663          	beqz	a5,2a0 <main+0x120>
 278:	0006c383          	lbu	t2,0(a3)
 27c:	00048513          	mv	a0,s1
 280:	00040593          	mv	a1,s0
 284:	00100f13          	li	t5,1
 288:	00200313          	li	t1,2
 28c:	00300e93          	li	t4,3
 290:	00700e13          	li	t3,7
 294:	00154883          	lbu	a7,1(a0)
 298:	00100f93          	li	t6,1
 29c:	1440006f          	j	3e0 <main+0x260>
 2a0:	0006c283          	lbu	t0,0(a3)
 2a4:	00040513          	mv	a0,s0
 2a8:	00048593          	mv	a1,s1
 2ac:	00100f13          	li	t5,1
 2b0:	00200313          	li	t1,2
 2b4:	00300e93          	li	t4,3
 2b8:	00700e13          	li	t3,7
 2bc:	00154883          	lbu	a7,1(a0)
 2c0:	00100f93          	li	t6,1
 2c4:	00c0006f          	j	2d0 <main+0x150>
 2c8:	00000293          	li	t0,0
 2cc:	00080f93          	mv	t6,a6
 2d0:	ffff8713          	addi	a4,t6,-1
 2d4:	00070393          	mv	t2,a4
 2d8:	001f8813          	addi	a6,t6,1
 2dc:	05039c63          	bne	t2,a6,334 <main+0x1b4>
 2e0:	40e8d7b3          	sra	a5,a7,a4
 2e4:	4108d733          	sra	a4,a7,a6
 2e8:	00177713          	andi	a4,a4,1
 2ec:	0017f793          	andi	a5,a5,1
 2f0:	00e787b3          	add	a5,a5,a4
 2f4:	00f287b3          	add	a5,t0,a5
 2f8:	01ff1633          	sll	a2,t5,t6
 2fc:	01861613          	slli	a2,a2,0x18
 300:	0ff7f793          	andi	a5,a5,255
 304:	00158703          	lb	a4,1(a1)
 308:	41865613          	srai	a2,a2,0x18
 30c:	04678a63          	beq	a5,t1,360 <main+0x1e0>
 310:	05d79e63          	bne	a5,t4,36c <main+0x1ec>
 314:	00c76733          	or	a4,a4,a2
 318:	00e580a3          	sb	a4,1(a1)
 31c:	fbc816e3          	bne	a6,t3,2c8 <main+0x148>
 320:	00158593          	addi	a1,a1,1
 324:	00150513          	addi	a0,a0,1
 328:	04ba8863          	beq	s5,a1,378 <main+0x1f8>
 32c:	00000293          	li	t0,0
 330:	f8dff06f          	j	2bc <main+0x13c>
 334:	00054603          	lbu	a2,0(a0)
 338:	00254783          	lbu	a5,2(a0)
 33c:	40765633          	sra	a2,a2,t2
 340:	4077d7b3          	sra	a5,a5,t2
 344:	00167613          	andi	a2,a2,1
 348:	0017f793          	andi	a5,a5,1
 34c:	00f607b3          	add	a5,a2,a5
 350:	00f287b3          	add	a5,t0,a5
 354:	0ff7f293          	andi	t0,a5,255
 358:	00138393          	addi	t2,t2,1
 35c:	f81ff06f          	j	2dc <main+0x15c>
 360:	41f8dfb3          	sra	t6,a7,t6
 364:	001fff93          	andi	t6,t6,1
 368:	fa0f96e3          	bnez	t6,314 <main+0x194>
 36c:	fff64613          	not	a2,a2
 370:	00c77733          	and	a4,a4,a2
 374:	fa5ff06f          	j	318 <main+0x198>
 378:	00068023          	sb	zero,0(a3)
 37c:	00000b93          	li	s7,0
 380:	04000c13          	li	s8,64
 384:	403bd793          	srai	a5,s7,0x3
 388:	00f487b3          	add	a5,s1,a5
 38c:	0007c783          	lbu	a5,0(a5)
 390:	007bf713          	andi	a4,s7,7
 394:	00000693          	li	a3,0
 398:	40e7d7b3          	sra	a5,a5,a4
 39c:	0017f793          	andi	a5,a5,1
 3a0:	00000613          	li	a2,0
 3a4:	0ff00593          	li	a1,255
 3a8:	00079463          	bnez	a5,3b0 <main+0x230>
 3ac:	00000593          	li	a1,0
 3b0:	000b8513          	mv	a0,s7
 3b4:	150000ef          	jal	ra,504 <set_pixel>
 3b8:	00300513          	li	a0,3
 3bc:	001b8b93          	addi	s7,s7,1
 3c0:	174000ef          	jal	ra,534 <neorv32_cpu_delay_ms>
 3c4:	fd8b90e3          	bne	s7,s8,384 <main+0x204>
 3c8:	00100793          	li	a5,1
 3cc:	00042023          	sw	zero,0(s0)
 3d0:	00042223          	sw	zero,4(s0)
 3d4:	00f90023          	sb	a5,0(s2)
 3d8:	e7dff06f          	j	254 <main+0xd4>
 3dc:	00080f93          	mv	t6,a6
 3e0:	ffff8713          	addi	a4,t6,-1
 3e4:	00070293          	mv	t0,a4
 3e8:	001f8813          	addi	a6,t6,1
 3ec:	0b029a63          	bne	t0,a6,4a0 <main+0x320>
 3f0:	40e8d7b3          	sra	a5,a7,a4
 3f4:	4108d733          	sra	a4,a7,a6
 3f8:	00177713          	andi	a4,a4,1
 3fc:	0017f793          	andi	a5,a5,1
 400:	00e787b3          	add	a5,a5,a4
 404:	00f387b3          	add	a5,t2,a5
 408:	01ff1633          	sll	a2,t5,t6
 40c:	01861613          	slli	a2,a2,0x18
 410:	0ff7f793          	andi	a5,a5,255
 414:	00158703          	lb	a4,1(a1)
 418:	41865613          	srai	a2,a2,0x18
 41c:	0a678863          	beq	a5,t1,4cc <main+0x34c>
 420:	0bd79c63          	bne	a5,t4,4d8 <main+0x358>
 424:	00c76733          	or	a4,a4,a2
 428:	00e580a3          	sb	a4,1(a1)
 42c:	00000393          	li	t2,0
 430:	fbc816e3          	bne	a6,t3,3dc <main+0x25c>
 434:	00158593          	addi	a1,a1,1
 438:	00150513          	addi	a0,a0,1
 43c:	e4bb1ce3          	bne	s6,a1,294 <main+0x114>
 440:	00068023          	sb	zero,0(a3)
 444:	00000b93          	li	s7,0
 448:	04000c13          	li	s8,64
 44c:	403bd793          	srai	a5,s7,0x3
 450:	00f407b3          	add	a5,s0,a5
 454:	0007c783          	lbu	a5,0(a5)
 458:	007bf713          	andi	a4,s7,7
 45c:	00000693          	li	a3,0
 460:	40e7d7b3          	sra	a5,a5,a4
 464:	0017f793          	andi	a5,a5,1
 468:	00000613          	li	a2,0
 46c:	0ff00593          	li	a1,255
 470:	00079463          	bnez	a5,478 <main+0x2f8>
 474:	00000593          	li	a1,0
 478:	000b8513          	mv	a0,s7
 47c:	088000ef          	jal	ra,504 <set_pixel>
 480:	00300513          	li	a0,3
 484:	001b8b93          	addi	s7,s7,1
 488:	0ac000ef          	jal	ra,534 <neorv32_cpu_delay_ms>
 48c:	fd8b90e3          	bne	s7,s8,44c <main+0x2cc>
 490:	0004a023          	sw	zero,0(s1)
 494:	0004a223          	sw	zero,4(s1)
 498:	00090023          	sb	zero,0(s2)
 49c:	db9ff06f          	j	254 <main+0xd4>
 4a0:	00054603          	lbu	a2,0(a0)
 4a4:	00254783          	lbu	a5,2(a0)
 4a8:	40565633          	sra	a2,a2,t0
 4ac:	4057d7b3          	sra	a5,a5,t0
 4b0:	00167613          	andi	a2,a2,1
 4b4:	0017f793          	andi	a5,a5,1
 4b8:	00f607b3          	add	a5,a2,a5
 4bc:	00f387b3          	add	a5,t2,a5
 4c0:	0ff7f393          	andi	t2,a5,255
 4c4:	00128293          	addi	t0,t0,1
 4c8:	f25ff06f          	j	3ec <main+0x26c>
 4cc:	41f8dfb3          	sra	t6,a7,t6
 4d0:	001fff93          	andi	t6,t6,1
 4d4:	f40f98e3          	bnez	t6,424 <main+0x2a4>
 4d8:	fff64613          	not	a2,a2
 4dc:	00c77733          	and	a4,a4,a2
 4e0:	f49ff06f          	j	428 <main+0x2a8>

000004e4 <iceduino_button_get>:
 4e4:	f00007b7          	lui	a5,0xf0000
 4e8:	0107c703          	lbu	a4,16(a5) # f0000010 <__ctr0_io_space_begin+0xf0000210>
 4ec:	00f57513          	andi	a0,a0,15
 4f0:	00100793          	li	a5,1
 4f4:	0ff77713          	andi	a4,a4,255
 4f8:	00a79533          	sll	a0,a5,a0
 4fc:	00a77533          	and	a0,a4,a0
 500:	00008067          	ret

00000504 <set_pixel>:
 504:	03f00793          	li	a5,63
 508:	02a7e463          	bltu	a5,a0,530 <set_pixel+0x2c>
 50c:	00861613          	slli	a2,a2,0x8
 510:	f00007b7          	lui	a5,0xf0000
 514:	00d66633          	or	a2,a2,a3
 518:	01059593          	slli	a1,a1,0x10
 51c:	00251513          	slli	a0,a0,0x2
 520:	10078793          	addi	a5,a5,256 # f0000100 <__ctr0_io_space_begin+0xf0000300>
 524:	00b66633          	or	a2,a2,a1
 528:	00f50533          	add	a0,a0,a5
 52c:	00c52023          	sw	a2,0(a0)
 530:	00008067          	ret

00000534 <neorv32_cpu_delay_ms>:
 534:	fe010113          	addi	sp,sp,-32
 538:	00112e23          	sw	ra,28(sp)
 53c:	00050613          	mv	a2,a0
 540:	00055863          	bgez	a0,550 <neorv32_cpu_delay_ms+0x1c>
 544:	40a00633          	neg	a2,a0
 548:	01061613          	slli	a2,a2,0x10
 54c:	41065613          	srai	a2,a2,0x10
 550:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 554:	3e800593          	li	a1,1000
 558:	00c12623          	sw	a2,12(sp)
 55c:	0fc000ef          	jal	ra,658 <__udivsi3>
 560:	00c12603          	lw	a2,12(sp)
 564:	00000593          	li	a1,0
 568:	41f65693          	srai	a3,a2,0x1f
 56c:	054000ef          	jal	ra,5c0 <__muldi3>
 570:	01c59593          	slli	a1,a1,0x1c
 574:	00455513          	srli	a0,a0,0x4
 578:	00a5e533          	or	a0,a1,a0

0000057c <__neorv32_cpu_delay_ms_start>:
 57c:	00050a63          	beqz	a0,590 <__neorv32_cpu_delay_ms_end>
 580:	00050863          	beqz	a0,590 <__neorv32_cpu_delay_ms_end>
 584:	fff50513          	addi	a0,a0,-1
 588:	00000013          	nop
 58c:	ff1ff06f          	j	57c <__neorv32_cpu_delay_ms_start>

00000590 <__neorv32_cpu_delay_ms_end>:
 590:	01c12083          	lw	ra,28(sp)
 594:	02010113          	addi	sp,sp,32
 598:	00008067          	ret

0000059c <__mulsi3>:
 59c:	00050613          	mv	a2,a0
 5a0:	00000513          	li	a0,0
 5a4:	0015f693          	andi	a3,a1,1
 5a8:	00068463          	beqz	a3,5b0 <__mulsi3+0x14>
 5ac:	00c50533          	add	a0,a0,a2
 5b0:	0015d593          	srli	a1,a1,0x1
 5b4:	00161613          	slli	a2,a2,0x1
 5b8:	fe0596e3          	bnez	a1,5a4 <__mulsi3+0x8>
 5bc:	00008067          	ret

000005c0 <__muldi3>:
 5c0:	00050313          	mv	t1,a0
 5c4:	ff010113          	addi	sp,sp,-16
 5c8:	00060513          	mv	a0,a2
 5cc:	00068893          	mv	a7,a3
 5d0:	00112623          	sw	ra,12(sp)
 5d4:	00030613          	mv	a2,t1
 5d8:	00050693          	mv	a3,a0
 5dc:	00000713          	li	a4,0
 5e0:	00000793          	li	a5,0
 5e4:	00000813          	li	a6,0
 5e8:	0016fe13          	andi	t3,a3,1
 5ec:	00171e93          	slli	t4,a4,0x1
 5f0:	000e0c63          	beqz	t3,608 <__muldi3+0x48>
 5f4:	01060e33          	add	t3,a2,a6
 5f8:	010e3833          	sltu	a6,t3,a6
 5fc:	00e787b3          	add	a5,a5,a4
 600:	00f807b3          	add	a5,a6,a5
 604:	000e0813          	mv	a6,t3
 608:	01f65713          	srli	a4,a2,0x1f
 60c:	0016d693          	srli	a3,a3,0x1
 610:	00eee733          	or	a4,t4,a4
 614:	00161613          	slli	a2,a2,0x1
 618:	fc0698e3          	bnez	a3,5e8 <__muldi3+0x28>
 61c:	00058663          	beqz	a1,628 <__muldi3+0x68>
 620:	f7dff0ef          	jal	ra,59c <__mulsi3>
 624:	00a787b3          	add	a5,a5,a0
 628:	00088a63          	beqz	a7,63c <__muldi3+0x7c>
 62c:	00030513          	mv	a0,t1
 630:	00088593          	mv	a1,a7
 634:	f69ff0ef          	jal	ra,59c <__mulsi3>
 638:	00f507b3          	add	a5,a0,a5
 63c:	00c12083          	lw	ra,12(sp)
 640:	00080513          	mv	a0,a6
 644:	00078593          	mv	a1,a5
 648:	01010113          	addi	sp,sp,16
 64c:	00008067          	ret

00000650 <__divsi3>:
 650:	06054063          	bltz	a0,6b0 <__umodsi3+0x10>
 654:	0605c663          	bltz	a1,6c0 <__umodsi3+0x20>

00000658 <__udivsi3>:
 658:	00058613          	mv	a2,a1
 65c:	00050593          	mv	a1,a0
 660:	fff00513          	li	a0,-1
 664:	02060c63          	beqz	a2,69c <__udivsi3+0x44>
 668:	00100693          	li	a3,1
 66c:	00b67a63          	bgeu	a2,a1,680 <__udivsi3+0x28>
 670:	00c05863          	blez	a2,680 <__udivsi3+0x28>
 674:	00161613          	slli	a2,a2,0x1
 678:	00169693          	slli	a3,a3,0x1
 67c:	feb66ae3          	bltu	a2,a1,670 <__udivsi3+0x18>
 680:	00000513          	li	a0,0
 684:	00c5e663          	bltu	a1,a2,690 <__udivsi3+0x38>
 688:	40c585b3          	sub	a1,a1,a2
 68c:	00d56533          	or	a0,a0,a3
 690:	0016d693          	srli	a3,a3,0x1
 694:	00165613          	srli	a2,a2,0x1
 698:	fe0696e3          	bnez	a3,684 <__udivsi3+0x2c>
 69c:	00008067          	ret

000006a0 <__umodsi3>:
 6a0:	00008293          	mv	t0,ra
 6a4:	fb5ff0ef          	jal	ra,658 <__udivsi3>
 6a8:	00058513          	mv	a0,a1
 6ac:	00028067          	jr	t0
 6b0:	40a00533          	neg	a0,a0
 6b4:	00b04863          	bgtz	a1,6c4 <__umodsi3+0x24>
 6b8:	40b005b3          	neg	a1,a1
 6bc:	f9dff06f          	j	658 <__udivsi3>
 6c0:	40b005b3          	neg	a1,a1
 6c4:	00008293          	mv	t0,ra
 6c8:	f91ff0ef          	jal	ra,658 <__udivsi3>
 6cc:	40a00533          	neg	a0,a0
 6d0:	00028067          	jr	t0

000006d4 <__modsi3>:
 6d4:	00008293          	mv	t0,ra
 6d8:	0005ca63          	bltz	a1,6ec <__modsi3+0x18>
 6dc:	00054c63          	bltz	a0,6f4 <__modsi3+0x20>
 6e0:	f79ff0ef          	jal	ra,658 <__udivsi3>
 6e4:	00058513          	mv	a0,a1
 6e8:	00028067          	jr	t0
 6ec:	40b005b3          	neg	a1,a1
 6f0:	fe0558e3          	bgez	a0,6e0 <__modsi3+0xc>
 6f4:	40a00533          	neg	a0,a0
 6f8:	f61ff0ef          	jal	ra,658 <__udivsi3>
 6fc:	40b00533          	neg	a0,a1
 700:	00028067          	jr	t0
