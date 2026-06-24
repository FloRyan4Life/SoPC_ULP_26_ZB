
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
  a4:	0e058593          	addi	a1,a1,224 # 180 <__crt0_copy_data_src_begin>
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
 140:	00912223          	sw	s1,4(sp)
 144:	00112623          	sw	ra,12(sp)
 148:	00000413          	li	s0,0
 14c:	04000493          	li	s1,64
 150:	00040513          	mv	a0,s0
 154:	00000693          	li	a3,0
 158:	00000613          	li	a2,0
 15c:	0ff00593          	li	a1,255
 160:	00140413          	addi	s0,s0,1
 164:	00c000ef          	jal	ra,170 <update_matrix>
 168:	fe9414e3          	bne	s0,s1,150 <main+0x18>
 16c:	0000006f          	j	16c <main+0x34>

00000170 <update_matrix>:
 170:	0ff6f693          	andi	a3,a3,255
 174:	f00007b7          	lui	a5,0xf0000
 178:	08d78423          	sb	a3,136(a5) # f0000088 <__ctr0_io_space_begin+0xf0000288>
 17c:	00008067          	ret
