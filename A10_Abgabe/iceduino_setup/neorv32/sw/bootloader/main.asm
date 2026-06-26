
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

ffff0000 <_start>:
ffff0000:	00000037          	lui	zero,0x0

ffff0004 <__crt0_pointer_init>:
ffff0004:	80010117          	auipc	sp,0x80010
ffff0008:	1f810113          	addi	sp,sp,504 # 800001fc <__crt0_stack_begin>
ffff000c:	80010197          	auipc	gp,0x80010
ffff0010:	7f418193          	addi	gp,gp,2036 # 80000800 <__global_pointer$>

ffff0014 <__crt0_cpu_csr_init>:
ffff0014:	00000517          	auipc	a0,0x0
ffff0018:	0d450513          	addi	a0,a0,212 # ffff00e8 <__crt0_dummy_trap_handler>
ffff001c:	30551073          	csrw	mtvec,a0
ffff0020:	34151073          	csrw	mepc,a0
ffff0024:	30001073          	csrw	mstatus,zero
ffff0028:	30401073          	csrw	mie,zero
ffff002c:	30601073          	csrw	mcounteren,zero
ffff0030:	ffa00593          	li	a1,-6
ffff0034:	32059073          	csrw	mcountinhibit,a1
ffff0038:	b0001073          	csrw	mcycle,zero
ffff003c:	b8001073          	csrw	mcycleh,zero
ffff0040:	b0201073          	csrw	minstret,zero
ffff0044:	b8201073          	csrw	minstreth,zero

ffff0048 <__crt0_reg_file_clear>:
ffff0048:	00000093          	li	ra,0
ffff004c:	00000213          	li	tp,0
ffff0050:	00000293          	li	t0,0
ffff0054:	00000313          	li	t1,0
ffff0058:	00000393          	li	t2,0
ffff005c:	00000713          	li	a4,0
ffff0060:	00000793          	li	a5,0

ffff0064 <__crt0_reset_io>:
ffff0064:	00010417          	auipc	s0,0x10
ffff0068:	d9c40413          	addi	s0,s0,-612 # fffffe00 <__ctr0_io_space_begin>
ffff006c:	00010497          	auipc	s1,0x10
ffff0070:	f9448493          	addi	s1,s1,-108 # 0 <__ctr0_io_space_begin+0x200>

ffff0074 <__crt0_reset_io_loop>:
ffff0074:	00042023          	sw	zero,0(s0)
ffff0078:	00440413          	addi	s0,s0,4
ffff007c:	fe941ce3          	bne	s0,s1,ffff0074 <__crt0_reset_io_loop>

ffff0080 <__crt0_clear_bss>:
ffff0080:	80010597          	auipc	a1,0x80010
ffff0084:	f8058593          	addi	a1,a1,-128 # 80000000 <exe_available>
ffff0088:	80818613          	addi	a2,gp,-2040 # 80000008 <__BSS_END__>

ffff008c <__crt0_clear_bss_loop>:
ffff008c:	00c5d863          	bge	a1,a2,ffff009c <__crt0_clear_bss_loop_end>
ffff0090:	00058023          	sb	zero,0(a1)
ffff0094:	00158593          	addi	a1,a1,1
ffff0098:	ff5ff06f          	j	ffff008c <__crt0_clear_bss_loop>

ffff009c <__crt0_clear_bss_loop_end>:
ffff009c:	00001597          	auipc	a1,0x1
ffff00a0:	e3058593          	addi	a1,a1,-464 # ffff0ecc <__crt0_copy_data_src_begin>
ffff00a4:	80010617          	auipc	a2,0x80010
ffff00a8:	f5c60613          	addi	a2,a2,-164 # 80000000 <exe_available>
ffff00ac:	80010697          	auipc	a3,0x80010
ffff00b0:	f5468693          	addi	a3,a3,-172 # 80000000 <exe_available>

ffff00b4 <__crt0_copy_data_loop>:
ffff00b4:	00d65c63          	bge	a2,a3,ffff00cc <__crt0_copy_data_loop_end>
ffff00b8:	00058703          	lb	a4,0(a1)
ffff00bc:	00e60023          	sb	a4,0(a2)
ffff00c0:	00158593          	addi	a1,a1,1
ffff00c4:	00160613          	addi	a2,a2,1
ffff00c8:	fedff06f          	j	ffff00b4 <__crt0_copy_data_loop>

ffff00cc <__crt0_copy_data_loop_end>:
ffff00cc:	00000513          	li	a0,0
ffff00d0:	00000593          	li	a1,0
ffff00d4:	060000ef          	jal	ra,ffff0134 <main>

ffff00d8 <__crt0_main_aftermath>:
ffff00d8:	34051073          	csrw	mscratch,a0

ffff00dc <__crt0_main_aftermath_end>:
ffff00dc:	30047073          	csrci	mstatus,8

ffff00e0 <__crt0_main_aftermath_end_loop>:
ffff00e0:	10500073          	wfi
ffff00e4:	ffdff06f          	j	ffff00e0 <__crt0_main_aftermath_end_loop>

ffff00e8 <__crt0_dummy_trap_handler>:
ffff00e8:	ff810113          	addi	sp,sp,-8
ffff00ec:	00812023          	sw	s0,0(sp)
ffff00f0:	00912223          	sw	s1,4(sp)
ffff00f4:	34202473          	csrr	s0,mcause
ffff00f8:	02044663          	bltz	s0,ffff0124 <__crt0_dummy_trap_handler_irq>
ffff00fc:	34102473          	csrr	s0,mepc

ffff0100 <__crt0_dummy_trap_handler_exc_c_check>:
ffff0100:	00041483          	lh	s1,0(s0)
ffff0104:	0034f493          	andi	s1,s1,3
ffff0108:	00240413          	addi	s0,s0,2
ffff010c:	34141073          	csrw	mepc,s0
ffff0110:	00300413          	li	s0,3
ffff0114:	00941863          	bne	s0,s1,ffff0124 <__crt0_dummy_trap_handler_irq>

ffff0118 <__crt0_dummy_trap_handler_exc_uncrompressed>:
ffff0118:	34102473          	csrr	s0,mepc
ffff011c:	00240413          	addi	s0,s0,2
ffff0120:	34141073          	csrw	mepc,s0

ffff0124 <__crt0_dummy_trap_handler_irq>:
ffff0124:	00012403          	lw	s0,0(sp)
ffff0128:	00412483          	lw	s1,4(sp)
ffff012c:	00810113          	addi	sp,sp,8
ffff0130:	30200073          	mret

ffff0134 <main>:
ffff0134:	fd010113          	addi	sp,sp,-48
ffff0138:	02912223          	sw	s1,36(sp)
ffff013c:	800004b7          	lui	s1,0x80000
ffff0140:	00048793          	mv	a5,s1
ffff0144:	02112623          	sw	ra,44(sp)
ffff0148:	02812423          	sw	s0,40(sp)
ffff014c:	03212023          	sw	s2,32(sp)
ffff0150:	01312e23          	sw	s3,28(sp)
ffff0154:	01412c23          	sw	s4,24(sp)
ffff0158:	01512a23          	sw	s5,20(sp)
ffff015c:	01612823          	sw	s6,16(sp)
ffff0160:	01712623          	sw	s7,12(sp)
ffff0164:	01812423          	sw	s8,8(sp)
ffff0168:	01912223          	sw	s9,4(sp)
ffff016c:	0007a023          	sw	zero,0(a5)
ffff0170:	8001a223          	sw	zero,-2044(gp) # 80000004 <getting_exe>
ffff0174:	ffff07b7          	lui	a5,0xffff0
ffff0178:	43078793          	addi	a5,a5,1072 # ffff0430 <__ctr0_io_space_begin+0xffff0630>
ffff017c:	30579073          	csrw	mtvec,a5
ffff0180:	00000613          	li	a2,0
ffff0184:	00000593          	li	a1,0
ffff0188:	00200513          	li	a0,2
ffff018c:	2f5000ef          	jal	ra,ffff0c80 <neorv32_spi_setup>
ffff0190:	00005537          	lui	a0,0x5
ffff0194:	00000613          	li	a2,0
ffff0198:	00000593          	li	a1,0
ffff019c:	b0050513          	addi	a0,a0,-1280 # 4b00 <make_bootloader+0x4aff>
ffff01a0:	151000ef          	jal	ra,ffff0af0 <neorv32_uart0_setup>
ffff01a4:	261000ef          	jal	ra,ffff0c04 <neorv32_mtime_available>
ffff01a8:	00048493          	mv	s1,s1
ffff01ac:	02050a63          	beqz	a0,ffff01e0 <main+0xac>
ffff01b0:	265000ef          	jal	ra,ffff0c14 <neorv32_mtime_get_time>
ffff01b4:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
ffff01b8:	0027d793          	srli	a5,a5,0x2
ffff01bc:	00a78533          	add	a0,a5,a0
ffff01c0:	00f537b3          	sltu	a5,a0,a5
ffff01c4:	00b785b3          	add	a1,a5,a1
ffff01c8:	279000ef          	jal	ra,ffff0c40 <neorv32_mtime_set_timecmp>
ffff01cc:	08000793          	li	a5,128
ffff01d0:	30479073          	csrw	mie,a5
ffff01d4:	30046073          	csrsi	mstatus,8
ffff01d8:	00000013          	nop
ffff01dc:	00000013          	nop
ffff01e0:	ffff1537          	lui	a0,0xffff1
ffff01e4:	e2450513          	addi	a0,a0,-476 # ffff0e24 <__ctr0_io_space_begin+0xffff1024>
ffff01e8:	1c5000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff01ec:	f1302573          	csrr	a0,mimpid
ffff01f0:	1d0000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff01f4:	ffff1537          	lui	a0,0xffff1
ffff01f8:	e5c50513          	addi	a0,a0,-420 # ffff0e5c <__ctr0_io_space_begin+0xffff105c>
ffff01fc:	1b1000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0200:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
ffff0204:	1bc000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0208:	ffff1537          	lui	a0,0xffff1
ffff020c:	e6450513          	addi	a0,a0,-412 # ffff0e64 <__ctr0_io_space_begin+0xffff1064>
ffff0210:	19d000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0214:	30102573          	csrr	a0,misa
ffff0218:	1a8000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff021c:	ffff1537          	lui	a0,0xffff1
ffff0220:	e6c50513          	addi	a0,a0,-404 # ffff0e6c <__ctr0_io_space_begin+0xffff106c>
ffff0224:	189000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0228:	fe402503          	lw	a0,-28(zero) # ffffffe4 <__ctr0_io_space_begin+0x1e4>
ffff022c:	ffff1437          	lui	s0,0xffff1
ffff0230:	ffff19b7          	lui	s3,0xffff1
ffff0234:	18c000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0238:	ffff1537          	lui	a0,0xffff1
ffff023c:	e7450513          	addi	a0,a0,-396 # ffff0e74 <__ctr0_io_space_begin+0xffff1074>
ffff0240:	16d000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0244:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
ffff0248:	ffff1a37          	lui	s4,0xffff1
ffff024c:	07200a93          	li	s5,114
ffff0250:	170000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0254:	ffff1537          	lui	a0,0xffff1
ffff0258:	e7c50513          	addi	a0,a0,-388 # ffff0e7c <__ctr0_io_space_begin+0xffff107c>
ffff025c:	151000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0260:	ff802503          	lw	a0,-8(zero) # fffffff8 <__ctr0_io_space_begin+0x1f8>
ffff0264:	06800b13          	li	s6,104
ffff0268:	07500b93          	li	s7,117
ffff026c:	154000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0270:	e8440513          	addi	a0,s0,-380 # ffff0e84 <__ctr0_io_space_begin+0xffff1084>
ffff0274:	139000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0278:	ff002503          	lw	a0,-16(zero) # fffffff0 <__ctr0_io_space_begin+0x1f0>
ffff027c:	07300c13          	li	s8,115
ffff0280:	ffff1937          	lui	s2,0xffff1
ffff0284:	13c000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0288:	ffff1537          	lui	a0,0xffff1
ffff028c:	e9050513          	addi	a0,a0,-368 # ffff0e90 <__ctr0_io_space_begin+0xffff1090>
ffff0290:	11d000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0294:	ffc02503          	lw	a0,-4(zero) # fffffffc <__ctr0_io_space_begin+0x1fc>
ffff0298:	ffff1cb7          	lui	s9,0xffff1
ffff029c:	124000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff02a0:	e8440513          	addi	a0,s0,-380
ffff02a4:	109000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff02a8:	ff402503          	lw	a0,-12(zero) # fffffff4 <__ctr0_io_space_begin+0x1f4>
ffff02ac:	114000ef          	jal	ra,ffff03c0 <print_hex_word>
ffff02b0:	ffff1537          	lui	a0,0xffff1
ffff02b4:	e9850513          	addi	a0,a0,-360 # ffff0e98 <__ctr0_io_space_begin+0xffff1098>
ffff02b8:	0f5000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff02bc:	08c000ef          	jal	ra,ffff0348 <print_help>
ffff02c0:	ea498513          	addi	a0,s3,-348 # ffff0ea4 <__ctr0_io_space_begin+0xffff10a4>
ffff02c4:	0e9000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff02c8:	0d5000ef          	jal	ra,ffff0b9c <neorv32_uart0_getc>
ffff02cc:	00050413          	mv	s0,a0
ffff02d0:	0b1000ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff02d4:	eaca0513          	addi	a0,s4,-340 # ffff0eac <__ctr0_io_space_begin+0xffff10ac>
ffff02d8:	0d5000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff02dc:	01541863          	bne	s0,s5,ffff02ec <main+0x1b8>
ffff02e0:	ffff02b7          	lui	t0,0xffff0
ffff02e4:	00028067          	jr	t0 # ffff0000 <__ctr0_io_space_begin+0xffff0200>
ffff02e8:	fd9ff06f          	j	ffff02c0 <main+0x18c>
ffff02ec:	01641663          	bne	s0,s6,ffff02f8 <main+0x1c4>
ffff02f0:	058000ef          	jal	ra,ffff0348 <print_help>
ffff02f4:	fcdff06f          	j	ffff02c0 <main+0x18c>
ffff02f8:	00000513          	li	a0,0
ffff02fc:	01740e63          	beq	s0,s7,ffff0318 <main+0x1e4>
ffff0300:	01841663          	bne	s0,s8,ffff030c <main+0x1d8>
ffff0304:	660000ef          	jal	ra,ffff0964 <save_exe>
ffff0308:	fb9ff06f          	j	ffff02c0 <main+0x18c>
ffff030c:	06c00793          	li	a5,108
ffff0310:	00f41863          	bne	s0,a5,ffff0320 <main+0x1ec>
ffff0314:	00100513          	li	a0,1
ffff0318:	410000ef          	jal	ra,ffff0728 <get_exe>
ffff031c:	fa5ff06f          	j	ffff02c0 <main+0x18c>
ffff0320:	06500793          	li	a5,101
ffff0324:	00f41e63          	bne	s0,a5,ffff0340 <main+0x20c>
ffff0328:	0004a783          	lw	a5,0(s1) # 80000000 <__ctr0_io_space_begin+0x80000200>
ffff032c:	00079863          	bnez	a5,ffff033c <main+0x208>
ffff0330:	dccc8513          	addi	a0,s9,-564 # ffff0dcc <__ctr0_io_space_begin+0xffff0fcc>
ffff0334:	079000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0338:	f89ff06f          	j	ffff02c0 <main+0x18c>
ffff033c:	018000ef          	jal	ra,ffff0354 <start_app>
ffff0340:	eb090513          	addi	a0,s2,-336 # ffff0eb0 <__ctr0_io_space_begin+0xffff10b0>
ffff0344:	ff1ff06f          	j	ffff0334 <main+0x200>

ffff0348 <print_help>:
ffff0348:	ffff1537          	lui	a0,0xffff1
ffff034c:	d0c50513          	addi	a0,a0,-756 # ffff0d0c <__ctr0_io_space_begin+0xffff0f0c>
ffff0350:	05d0006f          	j	ffff0bac <neorv32_uart0_print>

ffff0354 <start_app>:
ffff0354:	ff010113          	addi	sp,sp,-16
ffff0358:	00112623          	sw	ra,12(sp)
ffff035c:	30047073          	csrci	mstatus,8
ffff0360:	00000013          	nop
ffff0364:	00000013          	nop
ffff0368:	ffff1537          	lui	a0,0xffff1
ffff036c:	d7050513          	addi	a0,a0,-656 # ffff0d70 <__ctr0_io_space_begin+0xffff0f70>
ffff0370:	03d000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0374:	01d000ef          	jal	ra,ffff0b90 <neorv32_uart0_tx_busy>
ffff0378:	fe051ee3          	bnez	a0,ffff0374 <start_app+0x20>
ffff037c:	ff002783          	lw	a5,-16(zero) # fffffff0 <__ctr0_io_space_begin+0x1f0>
ffff0380:	00078067          	jr	a5
ffff0384:	0000006f          	j	ffff0384 <start_app+0x30>

ffff0388 <system_error>:
ffff0388:	ff010113          	addi	sp,sp,-16
ffff038c:	00812423          	sw	s0,8(sp)
ffff0390:	00050413          	mv	s0,a0
ffff0394:	ffff1537          	lui	a0,0xffff1
ffff0398:	d8050513          	addi	a0,a0,-640 # ffff0d80 <__ctr0_io_space_begin+0xffff0f80>
ffff039c:	00112623          	sw	ra,12(sp)
ffff03a0:	00d000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff03a4:	03040513          	addi	a0,s0,48
ffff03a8:	0ff57513          	andi	a0,a0,255
ffff03ac:	7d4000ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff03b0:	30047073          	csrci	mstatus,8
ffff03b4:	00000013          	nop
ffff03b8:	00000013          	nop
ffff03bc:	0000006f          	j	ffff03bc <system_error+0x34>

ffff03c0 <print_hex_word>:
ffff03c0:	fe010113          	addi	sp,sp,-32
ffff03c4:	01212823          	sw	s2,16(sp)
ffff03c8:	00050913          	mv	s2,a0
ffff03cc:	ffff1537          	lui	a0,0xffff1
ffff03d0:	00912a23          	sw	s1,20(sp)
ffff03d4:	d8c50513          	addi	a0,a0,-628 # ffff0d8c <__ctr0_io_space_begin+0xffff0f8c>
ffff03d8:	ffff14b7          	lui	s1,0xffff1
ffff03dc:	00812c23          	sw	s0,24(sp)
ffff03e0:	01312623          	sw	s3,12(sp)
ffff03e4:	00112e23          	sw	ra,28(sp)
ffff03e8:	01c00413          	li	s0,28
ffff03ec:	7c0000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff03f0:	ebc48493          	addi	s1,s1,-324 # ffff0ebc <__ctr0_io_space_begin+0xffff10bc>
ffff03f4:	ffc00993          	li	s3,-4
ffff03f8:	008957b3          	srl	a5,s2,s0
ffff03fc:	00f7f793          	andi	a5,a5,15
ffff0400:	00f487b3          	add	a5,s1,a5
ffff0404:	0007c503          	lbu	a0,0(a5)
ffff0408:	ffc40413          	addi	s0,s0,-4
ffff040c:	774000ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff0410:	ff3414e3          	bne	s0,s3,ffff03f8 <print_hex_word+0x38>
ffff0414:	01c12083          	lw	ra,28(sp)
ffff0418:	01812403          	lw	s0,24(sp)
ffff041c:	01412483          	lw	s1,20(sp)
ffff0420:	01012903          	lw	s2,16(sp)
ffff0424:	00c12983          	lw	s3,12(sp)
ffff0428:	02010113          	addi	sp,sp,32
ffff042c:	00008067          	ret

ffff0430 <bootloader_trap_handler>:
ffff0430:	fb010113          	addi	sp,sp,-80
ffff0434:	04112623          	sw	ra,76(sp)
ffff0438:	04512423          	sw	t0,72(sp)
ffff043c:	04612223          	sw	t1,68(sp)
ffff0440:	04712023          	sw	t2,64(sp)
ffff0444:	02812e23          	sw	s0,60(sp)
ffff0448:	02912c23          	sw	s1,56(sp)
ffff044c:	02a12a23          	sw	a0,52(sp)
ffff0450:	02b12823          	sw	a1,48(sp)
ffff0454:	02c12623          	sw	a2,44(sp)
ffff0458:	02d12423          	sw	a3,40(sp)
ffff045c:	02e12223          	sw	a4,36(sp)
ffff0460:	02f12023          	sw	a5,32(sp)
ffff0464:	01012e23          	sw	a6,28(sp)
ffff0468:	01112c23          	sw	a7,24(sp)
ffff046c:	01c12a23          	sw	t3,20(sp)
ffff0470:	01d12823          	sw	t4,16(sp)
ffff0474:	01e12623          	sw	t5,12(sp)
ffff0478:	01f12423          	sw	t6,8(sp)
ffff047c:	342024f3          	csrr	s1,mcause
ffff0480:	800007b7          	lui	a5,0x80000
ffff0484:	00778793          	addi	a5,a5,7 # 80000007 <__ctr0_io_space_begin+0x80000207>
ffff0488:	06f49c63          	bne	s1,a5,ffff0500 <bootloader_trap_handler+0xd0>
ffff048c:	778000ef          	jal	ra,ffff0c04 <neorv32_mtime_available>
ffff0490:	02050063          	beqz	a0,ffff04b0 <bootloader_trap_handler+0x80>
ffff0494:	780000ef          	jal	ra,ffff0c14 <neorv32_mtime_get_time>
ffff0498:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
ffff049c:	0027d793          	srli	a5,a5,0x2
ffff04a0:	00a78533          	add	a0,a5,a0
ffff04a4:	00f537b3          	sltu	a5,a0,a5
ffff04a8:	00b785b3          	add	a1,a5,a1
ffff04ac:	794000ef          	jal	ra,ffff0c40 <neorv32_mtime_set_timecmp>
ffff04b0:	03c12403          	lw	s0,60(sp)
ffff04b4:	04c12083          	lw	ra,76(sp)
ffff04b8:	04812283          	lw	t0,72(sp)
ffff04bc:	04412303          	lw	t1,68(sp)
ffff04c0:	04012383          	lw	t2,64(sp)
ffff04c4:	03812483          	lw	s1,56(sp)
ffff04c8:	03412503          	lw	a0,52(sp)
ffff04cc:	03012583          	lw	a1,48(sp)
ffff04d0:	02c12603          	lw	a2,44(sp)
ffff04d4:	02812683          	lw	a3,40(sp)
ffff04d8:	02412703          	lw	a4,36(sp)
ffff04dc:	02012783          	lw	a5,32(sp)
ffff04e0:	01c12803          	lw	a6,28(sp)
ffff04e4:	01812883          	lw	a7,24(sp)
ffff04e8:	01412e03          	lw	t3,20(sp)
ffff04ec:	01012e83          	lw	t4,16(sp)
ffff04f0:	00c12f03          	lw	t5,12(sp)
ffff04f4:	00812f83          	lw	t6,8(sp)
ffff04f8:	05010113          	addi	sp,sp,80
ffff04fc:	30200073          	mret
ffff0500:	00700793          	li	a5,7
ffff0504:	00f49a63          	bne	s1,a5,ffff0518 <bootloader_trap_handler+0xe8>
ffff0508:	8041a783          	lw	a5,-2044(gp) # 80000004 <getting_exe>
ffff050c:	00078663          	beqz	a5,ffff0518 <bootloader_trap_handler+0xe8>
ffff0510:	00100513          	li	a0,1
ffff0514:	e75ff0ef          	jal	ra,ffff0388 <system_error>
ffff0518:	34102473          	csrr	s0,mepc
ffff051c:	5c4000ef          	jal	ra,ffff0ae0 <neorv32_uart0_available>
ffff0520:	04050263          	beqz	a0,ffff0564 <bootloader_trap_handler+0x134>
ffff0524:	ffff1537          	lui	a0,0xffff1
ffff0528:	d9050513          	addi	a0,a0,-624 # ffff0d90 <__ctr0_io_space_begin+0xffff0f90>
ffff052c:	680000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0530:	00048513          	mv	a0,s1
ffff0534:	e8dff0ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0538:	02000513          	li	a0,32
ffff053c:	644000ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff0540:	00040513          	mv	a0,s0
ffff0544:	e7dff0ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0548:	02000513          	li	a0,32
ffff054c:	634000ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff0550:	34302573          	csrr	a0,mtval
ffff0554:	e6dff0ef          	jal	ra,ffff03c0 <print_hex_word>
ffff0558:	ffff1537          	lui	a0,0xffff1
ffff055c:	d9850513          	addi	a0,a0,-616 # ffff0d98 <__ctr0_io_space_begin+0xffff0f98>
ffff0560:	64c000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0564:	00440413          	addi	s0,s0,4
ffff0568:	34141073          	csrw	mepc,s0
ffff056c:	f45ff06f          	j	ffff04b0 <bootloader_trap_handler+0x80>

ffff0570 <spi_flash_read_1st_id>:
ffff0570:	ff010113          	addi	sp,sp,-16
ffff0574:	00000513          	li	a0,0
ffff0578:	00112623          	sw	ra,12(sp)
ffff057c:	00812423          	sw	s0,8(sp)
ffff0580:	734000ef          	jal	ra,ffff0cb4 <neorv32_spi_cs_en>
ffff0584:	09e00513          	li	a0,158
ffff0588:	770000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff058c:	00000513          	li	a0,0
ffff0590:	768000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff0594:	00050413          	mv	s0,a0
ffff0598:	00000513          	li	a0,0
ffff059c:	738000ef          	jal	ra,ffff0cd4 <neorv32_spi_cs_dis>
ffff05a0:	00c12083          	lw	ra,12(sp)
ffff05a4:	0ff47513          	andi	a0,s0,255
ffff05a8:	00812403          	lw	s0,8(sp)
ffff05ac:	01010113          	addi	sp,sp,16
ffff05b0:	00008067          	ret

ffff05b4 <spi_flash_write_wait>:
ffff05b4:	ff010113          	addi	sp,sp,-16
ffff05b8:	00112623          	sw	ra,12(sp)
ffff05bc:	00812423          	sw	s0,8(sp)
ffff05c0:	00000513          	li	a0,0
ffff05c4:	6f0000ef          	jal	ra,ffff0cb4 <neorv32_spi_cs_en>
ffff05c8:	00500513          	li	a0,5
ffff05cc:	72c000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff05d0:	00000513          	li	a0,0
ffff05d4:	724000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff05d8:	00050413          	mv	s0,a0
ffff05dc:	00147413          	andi	s0,s0,1
ffff05e0:	00000513          	li	a0,0
ffff05e4:	6f0000ef          	jal	ra,ffff0cd4 <neorv32_spi_cs_dis>
ffff05e8:	fc041ce3          	bnez	s0,ffff05c0 <spi_flash_write_wait+0xc>
ffff05ec:	00c12083          	lw	ra,12(sp)
ffff05f0:	00812403          	lw	s0,8(sp)
ffff05f4:	01010113          	addi	sp,sp,16
ffff05f8:	00008067          	ret

ffff05fc <spi_flash_write_enable>:
ffff05fc:	ff010113          	addi	sp,sp,-16
ffff0600:	00000513          	li	a0,0
ffff0604:	00112623          	sw	ra,12(sp)
ffff0608:	6ac000ef          	jal	ra,ffff0cb4 <neorv32_spi_cs_en>
ffff060c:	00600513          	li	a0,6
ffff0610:	6e8000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff0614:	00c12083          	lw	ra,12(sp)
ffff0618:	00000513          	li	a0,0
ffff061c:	01010113          	addi	sp,sp,16
ffff0620:	6b40006f          	j	ffff0cd4 <neorv32_spi_cs_dis>

ffff0624 <spi_flash_write_addr>:
ffff0624:	ff010113          	addi	sp,sp,-16
ffff0628:	00812423          	sw	s0,8(sp)
ffff062c:	00050413          	mv	s0,a0
ffff0630:	01055513          	srli	a0,a0,0x10
ffff0634:	0ff57513          	andi	a0,a0,255
ffff0638:	00112623          	sw	ra,12(sp)
ffff063c:	6bc000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff0640:	00845513          	srli	a0,s0,0x8
ffff0644:	0ff57513          	andi	a0,a0,255
ffff0648:	6b0000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff064c:	0ff47513          	andi	a0,s0,255
ffff0650:	00812403          	lw	s0,8(sp)
ffff0654:	00c12083          	lw	ra,12(sp)
ffff0658:	01010113          	addi	sp,sp,16
ffff065c:	69c0006f          	j	ffff0cf8 <neorv32_spi_trans>

ffff0660 <spi_flash_read_byte>:
ffff0660:	ff010113          	addi	sp,sp,-16
ffff0664:	00812423          	sw	s0,8(sp)
ffff0668:	00050413          	mv	s0,a0
ffff066c:	00000513          	li	a0,0
ffff0670:	00112623          	sw	ra,12(sp)
ffff0674:	640000ef          	jal	ra,ffff0cb4 <neorv32_spi_cs_en>
ffff0678:	00300513          	li	a0,3
ffff067c:	67c000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff0680:	00040513          	mv	a0,s0
ffff0684:	fa1ff0ef          	jal	ra,ffff0624 <spi_flash_write_addr>
ffff0688:	00000513          	li	a0,0
ffff068c:	66c000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff0690:	00050413          	mv	s0,a0
ffff0694:	00000513          	li	a0,0
ffff0698:	63c000ef          	jal	ra,ffff0cd4 <neorv32_spi_cs_dis>
ffff069c:	00c12083          	lw	ra,12(sp)
ffff06a0:	0ff47513          	andi	a0,s0,255
ffff06a4:	00812403          	lw	s0,8(sp)
ffff06a8:	01010113          	addi	sp,sp,16
ffff06ac:	00008067          	ret

ffff06b0 <get_exe_word>:
ffff06b0:	fd010113          	addi	sp,sp,-48
ffff06b4:	02812423          	sw	s0,40(sp)
ffff06b8:	02912223          	sw	s1,36(sp)
ffff06bc:	03212023          	sw	s2,32(sp)
ffff06c0:	01312e23          	sw	s3,28(sp)
ffff06c4:	01412c23          	sw	s4,24(sp)
ffff06c8:	02112623          	sw	ra,44(sp)
ffff06cc:	00050913          	mv	s2,a0
ffff06d0:	00058993          	mv	s3,a1
ffff06d4:	00c10493          	addi	s1,sp,12
ffff06d8:	00000413          	li	s0,0
ffff06dc:	00400a13          	li	s4,4
ffff06e0:	02091e63          	bnez	s2,ffff071c <get_exe_word+0x6c>
ffff06e4:	4b8000ef          	jal	ra,ffff0b9c <neorv32_uart0_getc>
ffff06e8:	00a48023          	sb	a0,0(s1)
ffff06ec:	00140413          	addi	s0,s0,1
ffff06f0:	00148493          	addi	s1,s1,1
ffff06f4:	ff4416e3          	bne	s0,s4,ffff06e0 <get_exe_word+0x30>
ffff06f8:	02c12083          	lw	ra,44(sp)
ffff06fc:	02812403          	lw	s0,40(sp)
ffff0700:	00c12503          	lw	a0,12(sp)
ffff0704:	02412483          	lw	s1,36(sp)
ffff0708:	02012903          	lw	s2,32(sp)
ffff070c:	01c12983          	lw	s3,28(sp)
ffff0710:	01812a03          	lw	s4,24(sp)
ffff0714:	03010113          	addi	sp,sp,48
ffff0718:	00008067          	ret
ffff071c:	00898533          	add	a0,s3,s0
ffff0720:	f41ff0ef          	jal	ra,ffff0660 <spi_flash_read_byte>
ffff0724:	fc5ff06f          	j	ffff06e8 <get_exe_word+0x38>

ffff0728 <get_exe>:
ffff0728:	fd010113          	addi	sp,sp,-48
ffff072c:	01412c23          	sw	s4,24(sp)
ffff0730:	02812423          	sw	s0,40(sp)
ffff0734:	80418793          	addi	a5,gp,-2044 # 80000004 <getting_exe>
ffff0738:	02112623          	sw	ra,44(sp)
ffff073c:	02912223          	sw	s1,36(sp)
ffff0740:	03212023          	sw	s2,32(sp)
ffff0744:	01312e23          	sw	s3,28(sp)
ffff0748:	01512a23          	sw	s5,20(sp)
ffff074c:	01612823          	sw	s6,16(sp)
ffff0750:	01712623          	sw	s7,12(sp)
ffff0754:	01812423          	sw	s8,8(sp)
ffff0758:	00100713          	li	a4,1
ffff075c:	00e7a023          	sw	a4,0(a5)
ffff0760:	00050413          	mv	s0,a0
ffff0764:	80418a13          	addi	s4,gp,-2044 # 80000004 <getting_exe>
ffff0768:	02051863          	bnez	a0,ffff0798 <get_exe+0x70>
ffff076c:	ffff1537          	lui	a0,0xffff1
ffff0770:	d9c50513          	addi	a0,a0,-612 # ffff0d9c <__ctr0_io_space_begin+0xffff0f9c>
ffff0774:	438000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0778:	000305b7          	lui	a1,0x30
ffff077c:	00040513          	mv	a0,s0
ffff0780:	f31ff0ef          	jal	ra,ffff06b0 <get_exe_word>
ffff0784:	4788d7b7          	lui	a5,0x4788d
ffff0788:	afe78793          	addi	a5,a5,-1282 # 4788cafe <make_bootloader+0x4788cafd>
ffff078c:	02f50a63          	beq	a0,a5,ffff07c0 <get_exe+0x98>
ffff0790:	00000513          	li	a0,0
ffff0794:	01c0006f          	j	ffff07b0 <get_exe+0x88>
ffff0798:	ffff1537          	lui	a0,0xffff1
ffff079c:	dbc50513          	addi	a0,a0,-580 # ffff0dbc <__ctr0_io_space_begin+0xffff0fbc>
ffff07a0:	40c000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff07a4:	4cc000ef          	jal	ra,ffff0c70 <neorv32_spi_available>
ffff07a8:	00051663          	bnez	a0,ffff07b4 <get_exe+0x8c>
ffff07ac:	00300513          	li	a0,3
ffff07b0:	bd9ff0ef          	jal	ra,ffff0388 <system_error>
ffff07b4:	dbdff0ef          	jal	ra,ffff0570 <spi_flash_read_1st_id>
ffff07b8:	fc0510e3          	bnez	a0,ffff0778 <get_exe+0x50>
ffff07bc:	ff1ff06f          	j	ffff07ac <get_exe+0x84>
ffff07c0:	000309b7          	lui	s3,0x30
ffff07c4:	00498593          	addi	a1,s3,4 # 30004 <make_bootloader+0x30003>
ffff07c8:	00040513          	mv	a0,s0
ffff07cc:	ee5ff0ef          	jal	ra,ffff06b0 <get_exe_word>
ffff07d0:	00050a93          	mv	s5,a0
ffff07d4:	00898593          	addi	a1,s3,8
ffff07d8:	00040513          	mv	a0,s0
ffff07dc:	ed5ff0ef          	jal	ra,ffff06b0 <get_exe_word>
ffff07e0:	ff002c03          	lw	s8,-16(zero) # fffffff0 <__ctr0_io_space_begin+0x1f0>
ffff07e4:	00050b13          	mv	s6,a0
ffff07e8:	ffcafb93          	andi	s7,s5,-4
ffff07ec:	00000913          	li	s2,0
ffff07f0:	00000493          	li	s1,0
ffff07f4:	00c98993          	addi	s3,s3,12
ffff07f8:	013905b3          	add	a1,s2,s3
ffff07fc:	052b9c63          	bne	s7,s2,ffff0854 <get_exe+0x12c>
ffff0800:	016484b3          	add	s1,s1,s6
ffff0804:	00200513          	li	a0,2
ffff0808:	fa0494e3          	bnez	s1,ffff07b0 <get_exe+0x88>
ffff080c:	ffff1537          	lui	a0,0xffff1
ffff0810:	dc850513          	addi	a0,a0,-568 # ffff0dc8 <__ctr0_io_space_begin+0xffff0fc8>
ffff0814:	398000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0818:	02c12083          	lw	ra,44(sp)
ffff081c:	02812403          	lw	s0,40(sp)
ffff0820:	800007b7          	lui	a5,0x80000
ffff0824:	0157a023          	sw	s5,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
ffff0828:	000a2023          	sw	zero,0(s4)
ffff082c:	02412483          	lw	s1,36(sp)
ffff0830:	02012903          	lw	s2,32(sp)
ffff0834:	01c12983          	lw	s3,28(sp)
ffff0838:	01812a03          	lw	s4,24(sp)
ffff083c:	01412a83          	lw	s5,20(sp)
ffff0840:	01012b03          	lw	s6,16(sp)
ffff0844:	00c12b83          	lw	s7,12(sp)
ffff0848:	00812c03          	lw	s8,8(sp)
ffff084c:	03010113          	addi	sp,sp,48
ffff0850:	00008067          	ret
ffff0854:	00040513          	mv	a0,s0
ffff0858:	e59ff0ef          	jal	ra,ffff06b0 <get_exe_word>
ffff085c:	012c07b3          	add	a5,s8,s2
ffff0860:	00a484b3          	add	s1,s1,a0
ffff0864:	00a7a023          	sw	a0,0(a5)
ffff0868:	00490913          	addi	s2,s2,4
ffff086c:	f8dff06f          	j	ffff07f8 <get_exe+0xd0>

ffff0870 <spi_flash_write_byte>:
ffff0870:	ff010113          	addi	sp,sp,-16
ffff0874:	00112623          	sw	ra,12(sp)
ffff0878:	00812423          	sw	s0,8(sp)
ffff087c:	00912223          	sw	s1,4(sp)
ffff0880:	00058413          	mv	s0,a1
ffff0884:	00050493          	mv	s1,a0
ffff0888:	d75ff0ef          	jal	ra,ffff05fc <spi_flash_write_enable>
ffff088c:	00000513          	li	a0,0
ffff0890:	424000ef          	jal	ra,ffff0cb4 <neorv32_spi_cs_en>
ffff0894:	00200513          	li	a0,2
ffff0898:	460000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff089c:	00048513          	mv	a0,s1
ffff08a0:	d85ff0ef          	jal	ra,ffff0624 <spi_flash_write_addr>
ffff08a4:	00040513          	mv	a0,s0
ffff08a8:	450000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff08ac:	00000513          	li	a0,0
ffff08b0:	424000ef          	jal	ra,ffff0cd4 <neorv32_spi_cs_dis>
ffff08b4:	00812403          	lw	s0,8(sp)
ffff08b8:	00c12083          	lw	ra,12(sp)
ffff08bc:	00412483          	lw	s1,4(sp)
ffff08c0:	01010113          	addi	sp,sp,16
ffff08c4:	cf1ff06f          	j	ffff05b4 <spi_flash_write_wait>

ffff08c8 <spi_flash_write_word>:
ffff08c8:	fe010113          	addi	sp,sp,-32
ffff08cc:	00812c23          	sw	s0,24(sp)
ffff08d0:	00912a23          	sw	s1,20(sp)
ffff08d4:	01212823          	sw	s2,16(sp)
ffff08d8:	00112e23          	sw	ra,28(sp)
ffff08dc:	00050493          	mv	s1,a0
ffff08e0:	00b12623          	sw	a1,12(sp)
ffff08e4:	00000413          	li	s0,0
ffff08e8:	00400913          	li	s2,4
ffff08ec:	00c10793          	addi	a5,sp,12
ffff08f0:	008787b3          	add	a5,a5,s0
ffff08f4:	0007c583          	lbu	a1,0(a5)
ffff08f8:	00848533          	add	a0,s1,s0
ffff08fc:	00140413          	addi	s0,s0,1
ffff0900:	f71ff0ef          	jal	ra,ffff0870 <spi_flash_write_byte>
ffff0904:	ff2414e3          	bne	s0,s2,ffff08ec <spi_flash_write_word+0x24>
ffff0908:	01c12083          	lw	ra,28(sp)
ffff090c:	01812403          	lw	s0,24(sp)
ffff0910:	01412483          	lw	s1,20(sp)
ffff0914:	01012903          	lw	s2,16(sp)
ffff0918:	02010113          	addi	sp,sp,32
ffff091c:	00008067          	ret

ffff0920 <spi_flash_erase_sector>:
ffff0920:	ff010113          	addi	sp,sp,-16
ffff0924:	00112623          	sw	ra,12(sp)
ffff0928:	00812423          	sw	s0,8(sp)
ffff092c:	00050413          	mv	s0,a0
ffff0930:	ccdff0ef          	jal	ra,ffff05fc <spi_flash_write_enable>
ffff0934:	00000513          	li	a0,0
ffff0938:	37c000ef          	jal	ra,ffff0cb4 <neorv32_spi_cs_en>
ffff093c:	0d800513          	li	a0,216
ffff0940:	3b8000ef          	jal	ra,ffff0cf8 <neorv32_spi_trans>
ffff0944:	00040513          	mv	a0,s0
ffff0948:	cddff0ef          	jal	ra,ffff0624 <spi_flash_write_addr>
ffff094c:	00000513          	li	a0,0
ffff0950:	384000ef          	jal	ra,ffff0cd4 <neorv32_spi_cs_dis>
ffff0954:	00812403          	lw	s0,8(sp)
ffff0958:	00c12083          	lw	ra,12(sp)
ffff095c:	01010113          	addi	sp,sp,16
ffff0960:	c55ff06f          	j	ffff05b4 <spi_flash_write_wait>

ffff0964 <save_exe>:
ffff0964:	fe010113          	addi	sp,sp,-32
ffff0968:	800007b7          	lui	a5,0x80000
ffff096c:	00812c23          	sw	s0,24(sp)
ffff0970:	0007a403          	lw	s0,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
ffff0974:	00112e23          	sw	ra,28(sp)
ffff0978:	00912a23          	sw	s1,20(sp)
ffff097c:	01212823          	sw	s2,16(sp)
ffff0980:	01312623          	sw	s3,12(sp)
ffff0984:	01412423          	sw	s4,8(sp)
ffff0988:	01512223          	sw	s5,4(sp)
ffff098c:	02041863          	bnez	s0,ffff09bc <save_exe+0x58>
ffff0990:	ffff1537          	lui	a0,0xffff1
ffff0994:	dcc50513          	addi	a0,a0,-564 # ffff0dcc <__ctr0_io_space_begin+0xffff0fcc>
ffff0998:	01812403          	lw	s0,24(sp)
ffff099c:	01c12083          	lw	ra,28(sp)
ffff09a0:	01412483          	lw	s1,20(sp)
ffff09a4:	01012903          	lw	s2,16(sp)
ffff09a8:	00c12983          	lw	s3,12(sp)
ffff09ac:	00812a03          	lw	s4,8(sp)
ffff09b0:	00412a83          	lw	s5,4(sp)
ffff09b4:	02010113          	addi	sp,sp,32
ffff09b8:	1f40006f          	j	ffff0bac <neorv32_uart0_print>
ffff09bc:	ffff1537          	lui	a0,0xffff1
ffff09c0:	de850513          	addi	a0,a0,-536 # ffff0de8 <__ctr0_io_space_begin+0xffff0fe8>
ffff09c4:	1e8000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff09c8:	00040513          	mv	a0,s0
ffff09cc:	9f5ff0ef          	jal	ra,ffff03c0 <print_hex_word>
ffff09d0:	ffff1537          	lui	a0,0xffff1
ffff09d4:	df050513          	addi	a0,a0,-528 # ffff0df0 <__ctr0_io_space_begin+0xffff0ff0>
ffff09d8:	1d4000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff09dc:	00030537          	lui	a0,0x30
ffff09e0:	9e1ff0ef          	jal	ra,ffff03c0 <print_hex_word>
ffff09e4:	ffff1537          	lui	a0,0xffff1
ffff09e8:	e0850513          	addi	a0,a0,-504 # ffff0e08 <__ctr0_io_space_begin+0xffff1008>
ffff09ec:	1c0000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff09f0:	1ac000ef          	jal	ra,ffff0b9c <neorv32_uart0_getc>
ffff09f4:	00050493          	mv	s1,a0
ffff09f8:	188000ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff09fc:	07900793          	li	a5,121
ffff0a00:	0af49e63          	bne	s1,a5,ffff0abc <save_exe+0x158>
ffff0a04:	b6dff0ef          	jal	ra,ffff0570 <spi_flash_read_1st_id>
ffff0a08:	00051663          	bnez	a0,ffff0a14 <save_exe+0xb0>
ffff0a0c:	00300513          	li	a0,3
ffff0a10:	979ff0ef          	jal	ra,ffff0388 <system_error>
ffff0a14:	ffff1537          	lui	a0,0xffff1
ffff0a18:	e1450513          	addi	a0,a0,-492 # ffff0e14 <__ctr0_io_space_begin+0xffff1014>
ffff0a1c:	01045493          	srli	s1,s0,0x10
ffff0a20:	18c000ef          	jal	ra,ffff0bac <neorv32_uart0_print>
ffff0a24:	00148493          	addi	s1,s1,1
ffff0a28:	00030937          	lui	s2,0x30
ffff0a2c:	fff00993          	li	s3,-1
ffff0a30:	00010a37          	lui	s4,0x10
ffff0a34:	fff48493          	addi	s1,s1,-1
ffff0a38:	07349063          	bne	s1,s3,ffff0a98 <save_exe+0x134>
ffff0a3c:	4788d5b7          	lui	a1,0x4788d
ffff0a40:	afe58593          	addi	a1,a1,-1282 # 4788cafe <make_bootloader+0x4788cafd>
ffff0a44:	00030537          	lui	a0,0x30
ffff0a48:	e81ff0ef          	jal	ra,ffff08c8 <spi_flash_write_word>
ffff0a4c:	00030537          	lui	a0,0x30
ffff0a50:	00040593          	mv	a1,s0
ffff0a54:	00450513          	addi	a0,a0,4 # 30004 <make_bootloader+0x30003>
ffff0a58:	e71ff0ef          	jal	ra,ffff08c8 <spi_flash_write_word>
ffff0a5c:	ff002a03          	lw	s4,-16(zero) # fffffff0 <__ctr0_io_space_begin+0x1f0>
ffff0a60:	000309b7          	lui	s3,0x30
ffff0a64:	ffc47413          	andi	s0,s0,-4
ffff0a68:	00000493          	li	s1,0
ffff0a6c:	00000913          	li	s2,0
ffff0a70:	00c98a93          	addi	s5,s3,12 # 3000c <make_bootloader+0x3000b>
ffff0a74:	01548533          	add	a0,s1,s5
ffff0a78:	009a07b3          	add	a5,s4,s1
ffff0a7c:	02849663          	bne	s1,s0,ffff0aa8 <save_exe+0x144>
ffff0a80:	00898513          	addi	a0,s3,8
ffff0a84:	412005b3          	neg	a1,s2
ffff0a88:	e41ff0ef          	jal	ra,ffff08c8 <spi_flash_write_word>
ffff0a8c:	ffff1537          	lui	a0,0xffff1
ffff0a90:	dc850513          	addi	a0,a0,-568 # ffff0dc8 <__ctr0_io_space_begin+0xffff0fc8>
ffff0a94:	f05ff06f          	j	ffff0998 <save_exe+0x34>
ffff0a98:	00090513          	mv	a0,s2
ffff0a9c:	e85ff0ef          	jal	ra,ffff0920 <spi_flash_erase_sector>
ffff0aa0:	01490933          	add	s2,s2,s4
ffff0aa4:	f91ff06f          	j	ffff0a34 <save_exe+0xd0>
ffff0aa8:	0007a583          	lw	a1,0(a5)
ffff0aac:	00448493          	addi	s1,s1,4
ffff0ab0:	00b90933          	add	s2,s2,a1
ffff0ab4:	e15ff0ef          	jal	ra,ffff08c8 <spi_flash_write_word>
ffff0ab8:	fbdff06f          	j	ffff0a74 <save_exe+0x110>
ffff0abc:	01c12083          	lw	ra,28(sp)
ffff0ac0:	01812403          	lw	s0,24(sp)
ffff0ac4:	01412483          	lw	s1,20(sp)
ffff0ac8:	01012903          	lw	s2,16(sp)
ffff0acc:	00c12983          	lw	s3,12(sp)
ffff0ad0:	00812a03          	lw	s4,8(sp)
ffff0ad4:	00412a83          	lw	s5,4(sp)
ffff0ad8:	02010113          	addi	sp,sp,32
ffff0adc:	00008067          	ret

ffff0ae0 <neorv32_uart0_available>:
ffff0ae0:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
ffff0ae4:	01255513          	srli	a0,a0,0x12
ffff0ae8:	00157513          	andi	a0,a0,1
ffff0aec:	00008067          	ret

ffff0af0 <neorv32_uart0_setup>:
ffff0af0:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
ffff0af4:	fe002703          	lw	a4,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
ffff0af8:	00151513          	slli	a0,a0,0x1
ffff0afc:	00000793          	li	a5,0
ffff0b00:	04a77463          	bgeu	a4,a0,ffff0b48 <neorv32_uart0_setup+0x58>
ffff0b04:	000016b7          	lui	a3,0x1
ffff0b08:	00000713          	li	a4,0
ffff0b0c:	ffe68693          	addi	a3,a3,-2 # ffe <make_bootloader+0xffd>
ffff0b10:	04f6e663          	bltu	a3,a5,ffff0b5c <neorv32_uart0_setup+0x6c>
ffff0b14:	00367613          	andi	a2,a2,3
ffff0b18:	0035f593          	andi	a1,a1,3
ffff0b1c:	fff78793          	addi	a5,a5,-1
ffff0b20:	01461613          	slli	a2,a2,0x14
ffff0b24:	00c7e7b3          	or	a5,a5,a2
ffff0b28:	01659593          	slli	a1,a1,0x16
ffff0b2c:	01871713          	slli	a4,a4,0x18
ffff0b30:	00b7e7b3          	or	a5,a5,a1
ffff0b34:	00e7e7b3          	or	a5,a5,a4
ffff0b38:	10000737          	lui	a4,0x10000
ffff0b3c:	00e7e7b3          	or	a5,a5,a4
ffff0b40:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
ffff0b44:	00008067          	ret
ffff0b48:	00178793          	addi	a5,a5,1
ffff0b4c:	01079793          	slli	a5,a5,0x10
ffff0b50:	40a70733          	sub	a4,a4,a0
ffff0b54:	0107d793          	srli	a5,a5,0x10
ffff0b58:	fa9ff06f          	j	ffff0b00 <neorv32_uart0_setup+0x10>
ffff0b5c:	ffe70513          	addi	a0,a4,-2 # ffffffe <make_bootloader+0xffffffd>
ffff0b60:	0fd57513          	andi	a0,a0,253
ffff0b64:	00051a63          	bnez	a0,ffff0b78 <neorv32_uart0_setup+0x88>
ffff0b68:	0037d793          	srli	a5,a5,0x3
ffff0b6c:	00170713          	addi	a4,a4,1
ffff0b70:	0ff77713          	andi	a4,a4,255
ffff0b74:	f9dff06f          	j	ffff0b10 <neorv32_uart0_setup+0x20>
ffff0b78:	0017d793          	srli	a5,a5,0x1
ffff0b7c:	ff1ff06f          	j	ffff0b6c <neorv32_uart0_setup+0x7c>

ffff0b80 <neorv32_uart0_putc>:
ffff0b80:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
ffff0b84:	fe07cee3          	bltz	a5,ffff0b80 <neorv32_uart0_putc>
ffff0b88:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
ffff0b8c:	00008067          	ret

ffff0b90 <neorv32_uart0_tx_busy>:
ffff0b90:	fa002503          	lw	a0,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
ffff0b94:	01f55513          	srli	a0,a0,0x1f
ffff0b98:	00008067          	ret

ffff0b9c <neorv32_uart0_getc>:
ffff0b9c:	fa402503          	lw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
ffff0ba0:	fe055ee3          	bgez	a0,ffff0b9c <neorv32_uart0_getc>
ffff0ba4:	0ff57513          	andi	a0,a0,255
ffff0ba8:	00008067          	ret

ffff0bac <neorv32_uart0_print>:
ffff0bac:	ff010113          	addi	sp,sp,-16
ffff0bb0:	00812423          	sw	s0,8(sp)
ffff0bb4:	01212023          	sw	s2,0(sp)
ffff0bb8:	00112623          	sw	ra,12(sp)
ffff0bbc:	00912223          	sw	s1,4(sp)
ffff0bc0:	00050413          	mv	s0,a0
ffff0bc4:	00a00913          	li	s2,10
ffff0bc8:	00044483          	lbu	s1,0(s0)
ffff0bcc:	00140413          	addi	s0,s0,1
ffff0bd0:	00049e63          	bnez	s1,ffff0bec <neorv32_uart0_print+0x40>
ffff0bd4:	00c12083          	lw	ra,12(sp)
ffff0bd8:	00812403          	lw	s0,8(sp)
ffff0bdc:	00412483          	lw	s1,4(sp)
ffff0be0:	00012903          	lw	s2,0(sp)
ffff0be4:	01010113          	addi	sp,sp,16
ffff0be8:	00008067          	ret
ffff0bec:	01249663          	bne	s1,s2,ffff0bf8 <neorv32_uart0_print+0x4c>
ffff0bf0:	00d00513          	li	a0,13
ffff0bf4:	f8dff0ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff0bf8:	00048513          	mv	a0,s1
ffff0bfc:	f85ff0ef          	jal	ra,ffff0b80 <neorv32_uart0_putc>
ffff0c00:	fc9ff06f          	j	ffff0bc8 <neorv32_uart0_print+0x1c>

ffff0c04 <neorv32_mtime_available>:
ffff0c04:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
ffff0c08:	01155513          	srli	a0,a0,0x11
ffff0c0c:	00157513          	andi	a0,a0,1
ffff0c10:	00008067          	ret

ffff0c14 <neorv32_mtime_get_time>:
ffff0c14:	ff010113          	addi	sp,sp,-16
ffff0c18:	f9402783          	lw	a5,-108(zero) # ffffff94 <__ctr0_io_space_begin+0x194>
ffff0c1c:	f9002703          	lw	a4,-112(zero) # ffffff90 <__ctr0_io_space_begin+0x190>
ffff0c20:	f9402683          	lw	a3,-108(zero) # ffffff94 <__ctr0_io_space_begin+0x194>
ffff0c24:	fed79ae3          	bne	a5,a3,ffff0c18 <neorv32_mtime_get_time+0x4>
ffff0c28:	00e12023          	sw	a4,0(sp)
ffff0c2c:	00f12223          	sw	a5,4(sp)
ffff0c30:	00012503          	lw	a0,0(sp)
ffff0c34:	00412583          	lw	a1,4(sp)
ffff0c38:	01010113          	addi	sp,sp,16
ffff0c3c:	00008067          	ret

ffff0c40 <neorv32_mtime_set_timecmp>:
ffff0c40:	ff010113          	addi	sp,sp,-16
ffff0c44:	00a12023          	sw	a0,0(sp)
ffff0c48:	00b12223          	sw	a1,4(sp)
ffff0c4c:	f9800793          	li	a5,-104
ffff0c50:	fff00713          	li	a4,-1
ffff0c54:	00e7a023          	sw	a4,0(a5)
ffff0c58:	00412703          	lw	a4,4(sp)
ffff0c5c:	f8e02e23          	sw	a4,-100(zero) # ffffff9c <__ctr0_io_space_begin+0x19c>
ffff0c60:	00012703          	lw	a4,0(sp)
ffff0c64:	00e7a023          	sw	a4,0(a5)
ffff0c68:	01010113          	addi	sp,sp,16
ffff0c6c:	00008067          	ret

ffff0c70 <neorv32_spi_available>:
ffff0c70:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
ffff0c74:	01355513          	srli	a0,a0,0x13
ffff0c78:	00157513          	andi	a0,a0,1
ffff0c7c:	00008067          	ret

ffff0c80 <neorv32_spi_setup>:
ffff0c80:	00757513          	andi	a0,a0,7
ffff0c84:	00367613          	andi	a2,a2,3
ffff0c88:	0015f593          	andi	a1,a1,1
ffff0c8c:	00a51513          	slli	a0,a0,0xa
ffff0c90:	00d61613          	slli	a2,a2,0xd
ffff0c94:	00c56533          	or	a0,a0,a2
ffff0c98:	00959593          	slli	a1,a1,0x9
ffff0c9c:	fa800793          	li	a5,-88
ffff0ca0:	00b56533          	or	a0,a0,a1
ffff0ca4:	0007a023          	sw	zero,0(a5)
ffff0ca8:	10056513          	ori	a0,a0,256
ffff0cac:	00a7a023          	sw	a0,0(a5)
ffff0cb0:	00008067          	ret

ffff0cb4 <neorv32_spi_cs_en>:
ffff0cb4:	fa800713          	li	a4,-88
ffff0cb8:	00072683          	lw	a3,0(a4)
ffff0cbc:	00757793          	andi	a5,a0,7
ffff0cc0:	00100513          	li	a0,1
ffff0cc4:	00f51533          	sll	a0,a0,a5
ffff0cc8:	00d56533          	or	a0,a0,a3
ffff0ccc:	00a72023          	sw	a0,0(a4)
ffff0cd0:	00008067          	ret

ffff0cd4 <neorv32_spi_cs_dis>:
ffff0cd4:	fa800713          	li	a4,-88
ffff0cd8:	00072683          	lw	a3,0(a4)
ffff0cdc:	00757513          	andi	a0,a0,7
ffff0ce0:	00100793          	li	a5,1
ffff0ce4:	00a797b3          	sll	a5,a5,a0
ffff0ce8:	fff7c793          	not	a5,a5
ffff0cec:	00d7f7b3          	and	a5,a5,a3
ffff0cf0:	00f72023          	sw	a5,0(a4)
ffff0cf4:	00008067          	ret

ffff0cf8 <neorv32_spi_trans>:
ffff0cf8:	faa02623          	sw	a0,-84(zero) # ffffffac <__ctr0_io_space_begin+0x1ac>
ffff0cfc:	fa802783          	lw	a5,-88(zero) # ffffffa8 <__ctr0_io_space_begin+0x1a8>
ffff0d00:	fe07cee3          	bltz	a5,ffff0cfc <neorv32_spi_trans+0x4>
ffff0d04:	fac02503          	lw	a0,-84(zero) # ffffffac <__ctr0_io_space_begin+0x1ac>
ffff0d08:	00008067          	ret
