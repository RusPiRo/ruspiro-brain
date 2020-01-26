
target/aarch64-unknown-linux-gnu/debug/kernel:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000080000 <__boot>:
   80000:	d53800a0 	mrs	x0, mpidr_el1
   80004:	92400400 	and	x0, x0, #0x3
   80008:	58000701 	ldr	x1, 800e8 <.SwitchReturn+0x28>
   8000c:	58000722 	ldr	x2, 800f0 <.SwitchReturn+0x30>
   80010:	eb020021 	subs	x1, x1, x2
   80014:	9b007c22 	mul	x2, x1, x0
   80018:	58000701 	ldr	x1, 800f8 <.SwitchReturn+0x38>
   8001c:	cb22603f 	sub	sp, x1, x2
   80020:	b5000120 	cbnz	x0, 80044 <.bss_done>
   80024:	580006e0 	ldr	x0, 80100 <.SwitchReturn+0x40>
   80028:	58000702 	ldr	x2, 80108 <.SwitchReturn+0x48>
   8002c:	cb000042 	sub	x2, x2, x0
   80030:	d344fc42 	lsr	x2, x2, #4
   80034:	b4000082 	cbz	x2, 80044 <.bss_done>

0000000000080038 <.bss_zero_loop>:
   80038:	a8817c1f 	stp	xzr, xzr, [x0], #16
   8003c:	d1000442 	sub	x2, x2, #0x1
   80040:	b5ffffc2 	cbnz	x2, 80038 <.bss_zero_loop>

0000000000080044 <.bss_done>:
   80044:	9400000b 	bl	80070 <__switch_el2_to_el1>
   80048:	10023dc0 	adr	x0, 84800 <__ExceptionVectorTable>
   8004c:	d518c000 	msr	vbar_el1, x0
   80050:	d5381041 	mrs	x1, cpacr_el1
   80054:	d2a00600 	mov	x0, #0x300000              	// #3145728
   80058:	aa000020 	orr	x0, x1, x0
   8005c:	d5181040 	msr	cpacr_el1, x0
   80060:	d53800a0 	mrs	x0, mpidr_el1
   80064:	92400400 	and	x0, x0, #0x3
   80068:	140013f4 	b	85038 <__rust_entry>
   8006c:	14000fb2 	b	83f34 <__hang>

0000000000080070 <__switch_el2_to_el1>:
   80070:	d5384240 	mrs	x0, currentel
   80074:	f100101f 	cmp	x0, #0x4
   80078:	54000240 	b.eq	800c0 <.SwitchReturn>  // b.none
   8007c:	d518101f 	msr	sctlr_el1, xzr
   80080:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
   80084:	b27f0000 	orr	x0, x0, #0x2
   80088:	d51c1100 	msr	hcr_el2, x0
   8008c:	d53c1100 	mrs	x0, hcr_el2
   80090:	d53ce102 	mrs	x2, cnthctl_el2
   80094:	b2400442 	orr	x2, x2, #0x3
   80098:	d51ce102 	msr	cnthctl_el2, x2
   8009c:	d51ce07f 	msr	cntvoff_el2, xzr
   800a0:	d28078a2 	mov	x2, #0x3c5                 	// #965
   800a4:	d51c4002 	msr	spsr_el2, x2
   800a8:	d53c1100 	mrs	x0, hcr_el2
   800ac:	927af000 	and	x0, x0, #0xffffffffffffffc7
   800b0:	d51c1100 	msr	hcr_el2, x0
   800b4:	10000061 	adr	x1, 800c0 <.SwitchReturn>
   800b8:	d51c4021 	msr	elr_el2, x1
   800bc:	d69f03e0 	eret

00000000000800c0 <.SwitchReturn>:
   800c0:	58000281 	ldr	x1, 80110 <.SwitchReturn+0x50>
   800c4:	d53800a0 	mrs	x0, mpidr_el1
   800c8:	92400400 	and	x0, x0, #0x3
   800cc:	580000e2 	ldr	x2, 800e8 <.SwitchReturn+0x28>
   800d0:	58000103 	ldr	x3, 800f0 <.SwitchReturn+0x30>
   800d4:	eb030042 	subs	x2, x2, x3
   800d8:	9b007c42 	mul	x2, x2, x0
   800dc:	cb020020 	sub	x0, x1, x2
   800e0:	9100001f 	mov	sp, x0
   800e4:	d65f03c0 	ret
   800e8:	000d37c0 	.word	0x000d37c0
   800ec:	00000000 	.word	0x00000000
   800f0:	000c37c0 	.word	0x000c37c0
   800f4:	00000000 	.word	0x00000000
   800f8:	000c47c0 	.word	0x000c47c0
   800fc:	00000000 	.word	0x00000000
   80100:	0008f000 	.word	0x0008f000
   80104:	00000000 	.word	0x00000000
   80108:	000937a0 	.word	0x000937a0
   8010c:	00000000 	.word	0x00000000
   80110:	000d27c0 	.word	0x000d27c0
   80114:	00000000 	.word	0x00000000

0000000000080118 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE.llvm.14843948732551940918>:
   80118:	f81e0ff4 	str	x20, [sp, #-32]!
   8011c:	a9017bf3 	stp	x19, x30, [sp, #16]
   80120:	f9400008 	ldr	x8, [x0]
   80124:	aa0003f3 	mov	x19, x0
   80128:	c85f7d09 	ldxr	x9, [x8]
   8012c:	f1000529 	subs	x9, x9, #0x1
   80130:	c80afd09 	stlxr	w10, x9, [x8]
   80134:	35ffffaa 	cbnz	w10, 80128 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE.llvm.14843948732551940918+0x10>
   80138:	54000081 	b.ne	80148 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE.llvm.14843948732551940918+0x30>  // b.any
   8013c:	d50339bf 	dmb	ishld
   80140:	aa1303e0 	mov	x0, x19
   80144:	94000537 	bl	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   80148:	91002260 	add	x0, x19, #0x8
   8014c:	a9417bf3 	ldp	x19, x30, [sp, #16]
   80150:	f84207f4 	ldr	x20, [sp], #32
   80154:	14000b0f 	b	82d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>
   80158:	aa0003f4 	mov	x20, x0
   8015c:	91002260 	add	x0, x19, #0x8
   80160:	94000004 	bl	80170 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E.llvm.14843948732551940918>
   80164:	aa1403e0 	mov	x0, x20
   80168:	94000ee2 	bl	83cf0 <_Unwind_Resume>
   8016c:	d4200020 	brk	#0x1

0000000000080170 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E.llvm.14843948732551940918>:
   80170:	14000b08 	b	82d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>
   80174:	00000000 	.inst	0x00000000 ; undefined

0000000000080178 <_ZN4core3ptr18real_drop_in_place17h929d245683b059eeE>:
   80178:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
   8017c:	aa0003f3 	mov	x19, x0
   80180:	f9400000 	ldr	x0, [x0]
   80184:	b4000160 	cbz	x0, 801b0 <_ZN4core3ptr18real_drop_in_place17h929d245683b059eeE+0x38>
   80188:	f9400668 	ldr	x8, [x19, #8]
   8018c:	f9400108 	ldr	x8, [x8]
   80190:	d63f0100 	blr	x8
   80194:	f9400668 	ldr	x8, [x19, #8]
   80198:	f9400501 	ldr	x1, [x8, #8]
   8019c:	b40000a1 	cbz	x1, 801b0 <_ZN4core3ptr18real_drop_in_place17h929d245683b059eeE+0x38>
   801a0:	f9400260 	ldr	x0, [x19]
   801a4:	f9400902 	ldr	x2, [x8, #16]
   801a8:	a8c17bf3 	ldp	x19, x30, [sp], #16
   801ac:	140006f3 	b	81d78 <__rust_dealloc>
   801b0:	a8c17bf3 	ldp	x19, x30, [sp], #16
   801b4:	d65f03c0 	ret
   801b8:	a9400668 	ldp	x8, x1, [x19]
   801bc:	aa0003f3 	mov	x19, x0
   801c0:	aa0803e0 	mov	x0, x8
   801c4:	940000b7 	bl	804a0 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E>
   801c8:	aa1303e0 	mov	x0, x19
   801cc:	94000ec9 	bl	83cf0 <_Unwind_Resume>
   801d0:	d4200020 	brk	#0x1
   801d4:	00000000 	.inst	0x00000000 ; undefined

00000000000801d8 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E>:
   801d8:	a9bb6bfc 	stp	x28, x26, [sp, #-80]!
   801dc:	a90163f9 	stp	x25, x24, [sp, #16]
   801e0:	a9025bf7 	stp	x23, x22, [sp, #32]
   801e4:	a90353f5 	stp	x21, x20, [sp, #48]
   801e8:	a9047bf3 	stp	x19, x30, [sp, #64]
   801ec:	d10ac3ff 	sub	sp, sp, #0x2b0
   801f0:	aa0803f3 	mov	x19, x8
   801f4:	d0000068 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   801f8:	aa0303f4 	mov	x20, x3
   801fc:	aa0203f5 	mov	x21, x2
   80200:	aa0003f6 	mov	x22, x0
   80204:	f9448108 	ldr	x8, [x8, #2304]
   80208:	f9400017 	ldr	x23, [x0]
   8020c:	a9020fe2 	stp	x2, x3, [sp, #32]
   80210:	f900a3e1 	str	x1, [sp, #320]
   80214:	eb0802ff 	cmp	x23, x8
   80218:	54000060 	b.eq	80224 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x4c>  // b.none
   8021c:	f94006c8 	ldr	x8, [x22, #8]
   80220:	14000013 	b	8026c <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x94>
   80224:	9100c3e8 	add	x8, sp, #0x30
   80228:	52802102 	mov	w2, #0x108                 	// #264
   8022c:	91001100 	add	x0, x8, #0x4
   80230:	2a1f03e1 	mov	w1, wzr
   80234:	9400279d 	bl	8a0a8 <memset>
   80238:	52802300 	mov	w0, #0x118                 	// #280
   8023c:	52800101 	mov	w1, #0x8                   	// #8
   80240:	940006ca 	bl	81d68 <__rust_alloc>
   80244:	b4001000 	cbz	x0, 80444 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x26c>
   80248:	aa0003f7 	mov	x23, x0
   8024c:	91003000 	add	x0, x0, #0xc
   80250:	52802182 	mov	w2, #0x10c                 	// #268
   80254:	9100c3e1 	add	x1, sp, #0x30
   80258:	f90002ff 	str	xzr, [x23]
   8025c:	790016ff 	strh	wzr, [x23, #10]
   80260:	94002749 	bl	89f84 <memcpy>
   80264:	aa1f03e8 	mov	x8, xzr
   80268:	a9007ed7 	stp	x23, xzr, [x22]
   8026c:	a9035fe8 	stp	x8, x23, [sp, #48]
   80270:	f90023f6 	str	x22, [sp, #64]
   80274:	910683e8 	add	x8, sp, #0x1a0
   80278:	9100c3e0 	add	x0, sp, #0x30
   8027c:	910503e1 	add	x1, sp, #0x140
   80280:	940002aa 	bl	80d28 <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E>
   80284:	f940d3e8 	ldr	x8, [sp, #416]
   80288:	f100051f 	cmp	x8, #0x1
   8028c:	540004c1 	b.ne	80324 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x14c>  // b.any
   80290:	f9400ac8 	ldr	x8, [x22, #16]
   80294:	a95ba7ea 	ldp	x10, x9, [sp, #440]
   80298:	f940a3e1 	ldr	x1, [sp, #320]
   8029c:	a95aafec 	ldp	x12, x11, [sp, #424]
   802a0:	91000508 	add	x8, x8, #0x1
   802a4:	f9000ac8 	str	x8, [x22, #16]
   802a8:	a903abeb 	stp	x11, x10, [sp, #56]
   802ac:	f9001bec 	str	x12, [sp, #48]
   802b0:	f90027e9 	str	x9, [sp, #72]
   802b4:	910683e8 	add	x8, sp, #0x1a0
   802b8:	9100c3e0 	add	x0, sp, #0x30
   802bc:	aa1503e2 	mov	x2, x21
   802c0:	aa1403e3 	mov	x3, x20
   802c4:	940000ef 	bl	80680 <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E>
   802c8:	f940d3e8 	ldr	x8, [sp, #416]
   802cc:	f100051f 	cmp	x8, #0x1
   802d0:	54000a81 	b.ne	80420 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x248>  // b.any
   802d4:	a95b6bea 	ldp	x10, x26, [sp, #432]
   802d8:	a95c57f7 	ldp	x23, x21, [sp, #448]
   802dc:	a95d53f6 	ldp	x22, x20, [sp, #464]
   802e0:	f9400148 	ldr	x8, [x10]
   802e4:	b4000408 	cbz	x8, 80364 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x18c>
   802e8:	f940d7e9 	ldr	x9, [sp, #424]
   802ec:	7940114a 	ldrh	w10, [x10, #8]
   802f0:	f940f3e5 	ldr	x5, [sp, #480]
   802f4:	91000529 	add	x9, x9, #0x1
   802f8:	92403d4a 	and	x10, x10, #0xffff
   802fc:	a90323e9 	stp	x9, x8, [sp, #48]
   80300:	a9042bfa 	stp	x26, x10, [sp, #64]
   80304:	910683e8 	add	x8, sp, #0x1a0
   80308:	9100c3e0 	add	x0, sp, #0x30
   8030c:	aa1703e1 	mov	x1, x23
   80310:	aa1503e2 	mov	x2, x21
   80314:	aa1603e3 	mov	x3, x22
   80318:	aa1403e4 	mov	x4, x20
   8031c:	9400017b 	bl	80908 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E>
   80320:	17ffffea 	b	802c8 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0xf0>
   80324:	f940e3e8 	ldr	x8, [sp, #448]
   80328:	f940dbe9 	ldr	x9, [sp, #432]
   8032c:	8b081128 	add	x8, x9, x8, lsl #4
   80330:	f9403909 	ldr	x9, [x8, #112]
   80334:	f90007e9 	str	x9, [sp, #8]
   80338:	f9403509 	ldr	x9, [x8, #104]
   8033c:	f90003e9 	str	x9, [sp]
   80340:	3dc003e0 	ldr	q0, [sp]
   80344:	a906d115 	stp	x21, x20, [x8, #104]
   80348:	3d8007e0 	str	q0, [sp, #16]
   8034c:	f9400fe8 	ldr	x8, [sp, #24]
   80350:	f9000a68 	str	x8, [x19, #16]
   80354:	52800028 	mov	w8, #0x1                   	// #1
   80358:	f9400be9 	ldr	x9, [sp, #16]
   8035c:	f9000669 	str	x9, [x19, #8]
   80360:	14000031 	b	80424 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x24c>
   80364:	9100c3e8 	add	x8, sp, #0x30
   80368:	52802102 	mov	w2, #0x108                 	// #264
   8036c:	91001100 	add	x0, x8, #0x4
   80370:	2a1f03e1 	mov	w1, wzr
   80374:	9400274d 	bl	8a0a8 <memset>
   80378:	52802182 	mov	w2, #0x10c                 	// #268
   8037c:	910683e0 	add	x0, sp, #0x1a0
   80380:	9100c3e1 	add	x1, sp, #0x30
   80384:	94002700 	bl	89f84 <memcpy>
   80388:	6f00e400 	movi	v0.2d, #0x0
   8038c:	52802f00 	mov	w0, #0x178                 	// #376
   80390:	52800101 	mov	w1, #0x8                   	// #8
   80394:	ad0a03e0 	stp	q0, q0, [sp, #320]
   80398:	ad0b03e0 	stp	q0, q0, [sp, #352]
   8039c:	ad0c03e0 	stp	q0, q0, [sp, #384]
   803a0:	94000672 	bl	81d68 <__rust_alloc>
   803a4:	b4000580 	cbz	x0, 80454 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E+0x27c>
   803a8:	aa0003f8 	mov	x24, x0
   803ac:	91003000 	add	x0, x0, #0xc
   803b0:	52802182 	mov	w2, #0x10c                 	// #268
   803b4:	910683e1 	add	x1, sp, #0x1a0
   803b8:	f900031f 	str	xzr, [x24]
   803bc:	7900171f 	strh	wzr, [x24, #10]
   803c0:	940026f1 	bl	89f84 <memcpy>
   803c4:	91046319 	add	x25, x24, #0x118
   803c8:	910503e1 	add	x1, sp, #0x140
   803cc:	aa1903e0 	mov	x0, x25
   803d0:	52800c02 	mov	w2, #0x60                  	// #96
   803d4:	940026ec 	bl	89f84 <memcpy>
   803d8:	f9400348 	ldr	x8, [x26]
   803dc:	f9008f08 	str	x8, [x24, #280]
   803e0:	f9400749 	ldr	x9, [x26, #8]
   803e4:	91000529 	add	x9, x9, #0x1
   803e8:	a9002758 	stp	x24, x9, [x26]
   803ec:	f9000118 	str	x24, [x8]
   803f0:	7900111f 	strh	wzr, [x8, #8]
   803f4:	79401708 	ldrh	w8, [x24, #10]
   803f8:	8b080f09 	add	x9, x24, x8, lsl #3
   803fc:	8b08130a 	add	x10, x24, x8, lsl #4
   80400:	f9000937 	str	x23, [x9, #16]
   80404:	91000509 	add	x9, x8, #0x1
   80408:	11000508 	add	w8, w8, #0x1
   8040c:	a906d955 	stp	x21, x22, [x10, #104]
   80410:	f8297b34 	str	x20, [x25, x9, lsl #3]
   80414:	79001708 	strh	w8, [x24, #10]
   80418:	f9000298 	str	x24, [x20]
   8041c:	79001289 	strh	w9, [x20, #8]
   80420:	aa1f03e8 	mov	x8, xzr
   80424:	f9000268 	str	x8, [x19]
   80428:	910ac3ff 	add	sp, sp, #0x2b0
   8042c:	a9447bf3 	ldp	x19, x30, [sp, #64]
   80430:	a94353f5 	ldp	x21, x20, [sp, #48]
   80434:	a9425bf7 	ldp	x23, x22, [sp, #32]
   80438:	a94163f9 	ldp	x25, x24, [sp, #16]
   8043c:	a8c56bfc 	ldp	x28, x26, [sp], #80
   80440:	d65f03c0 	ret
   80444:	52802300 	mov	w0, #0x118                 	// #280
   80448:	52800101 	mov	w1, #0x8                   	// #8
   8044c:	94001bed 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   80450:	d4200020 	brk	#0x1
   80454:	52802f00 	mov	w0, #0x178                 	// #376
   80458:	52800101 	mov	w1, #0x8                   	// #8
   8045c:	94001be9 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   80460:	d4200020 	brk	#0x1
   80464:	aa0003f3 	mov	x19, x0
   80468:	aa1303e0 	mov	x0, x19
   8046c:	94000e21 	bl	83cf0 <_Unwind_Resume>
   80470:	d4200020 	brk	#0x1
   80474:	aa0003f3 	mov	x19, x0
   80478:	910083e0 	add	x0, sp, #0x20
   8047c:	97ffff3f 	bl	80178 <_ZN4core3ptr18real_drop_in_place17h929d245683b059eeE>
   80480:	aa1303e0 	mov	x0, x19
   80484:	94000e1b 	bl	83cf0 <_Unwind_Resume>
   80488:	d4200020 	brk	#0x1
   8048c:	aa0003f3 	mov	x19, x0
   80490:	aa1303e0 	mov	x0, x19
   80494:	94000e17 	bl	83cf0 <_Unwind_Resume>
   80498:	d4200020 	brk	#0x1
   8049c:	00000000 	.inst	0x00000000 ; undefined

00000000000804a0 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E>:
   804a0:	aa0103e8 	mov	x8, x1
   804a4:	f9400421 	ldr	x1, [x1, #8]
   804a8:	b4000061 	cbz	x1, 804b4 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E+0x14>
   804ac:	f9400902 	ldr	x2, [x8, #16]
   804b0:	14000632 	b	81d78 <__rust_dealloc>
   804b4:	d65f03c0 	ret

00000000000804b8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E>:
   804b8:	a9bc63f9 	stp	x25, x24, [sp, #-64]!
   804bc:	a9015bf7 	stp	x23, x22, [sp, #16]
   804c0:	a90253f5 	stp	x21, x20, [sp, #32]
   804c4:	a9037bf3 	stp	x19, x30, [sp, #48]
   804c8:	a9402015 	ldp	x21, x8, [x0]
   804cc:	f9400818 	ldr	x24, [x0, #16]
   804d0:	b4000088 	cbz	x8, 804e0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x28>
   804d4:	f9408eb5 	ldr	x21, [x21, #280]
   804d8:	f1000508 	subs	x8, x8, #0x1
   804dc:	54ffffc1 	b.ne	804d4 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x1c>  // b.any
   804e0:	b4000898 	cbz	x24, 805f0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x138>
   804e4:	aa1f03f9 	mov	x25, xzr
   804e8:	52802313 	mov	w19, #0x118                 	// #280
   804ec:	52802f14 	mov	w20, #0x178                 	// #376
   804f0:	794016a8 	ldrh	w8, [x21, #10]
   804f4:	eb08033f 	cmp	x25, x8
   804f8:	54000182 	b.cs	80528 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x70>  // b.hs, b.nlast
   804fc:	14000006 	b	80514 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x5c>
   80500:	d1000718 	sub	x24, x24, #0x1
   80504:	b4000778 	cbz	x24, 805f0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x138>
   80508:	794016a8 	ldrh	w8, [x21, #10]
   8050c:	eb08033f 	cmp	x25, x8
   80510:	540000c2 	b.cs	80528 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x70>  // b.hs, b.nlast
   80514:	8b1912a8 	add	x8, x21, x25, lsl #4
   80518:	91000739 	add	x25, x25, #0x1
   8051c:	a946dd16 	ldp	x22, x23, [x8, #104]
   80520:	b5000576 	cbnz	x22, 805cc <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x114>
   80524:	17fffff7 	b	80500 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x48>
   80528:	f94002b6 	ldr	x22, [x21]
   8052c:	b4000096 	cbz	x22, 8053c <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x84>
   80530:	794012b7 	ldrh	w23, [x21, #8]
   80534:	52800039 	mov	w25, #0x1                   	// #1
   80538:	14000003 	b	80544 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x8c>
   8053c:	aa1f03f7 	mov	x23, xzr
   80540:	aa1f03f9 	mov	x25, xzr
   80544:	aa1503e0 	mov	x0, x21
   80548:	aa1303e1 	mov	x1, x19
   8054c:	52800102 	mov	w2, #0x8                   	// #8
   80550:	9400060a 	bl	81d78 <__rust_dealloc>
   80554:	794016c8 	ldrh	w8, [x22, #10]
   80558:	eb0802ff 	cmp	x23, x8
   8055c:	54000182 	b.cs	8058c <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0xd4>  // b.hs, b.nlast
   80560:	14000010 	b	805a0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0xe8>
   80564:	794012d7 	ldrh	w23, [x22, #8]
   80568:	91000739 	add	x25, x25, #0x1
   8056c:	aa1603e0 	mov	x0, x22
   80570:	aa1403e1 	mov	x1, x20
   80574:	52800102 	mov	w2, #0x8                   	// #8
   80578:	94000600 	bl	81d78 <__rust_dealloc>
   8057c:	794016a8 	ldrh	w8, [x21, #10]
   80580:	aa1503f6 	mov	x22, x21
   80584:	eb0802ff 	cmp	x23, x8
   80588:	540000c3 	b.cc	805a0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0xe8>  // b.lo, b.ul, b.last
   8058c:	f94002d5 	ldr	x21, [x22]
   80590:	b5fffeb5 	cbnz	x21, 80564 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0xac>
   80594:	aa1f03f7 	mov	x23, xzr
   80598:	aa1f03f9 	mov	x25, xzr
   8059c:	17fffff4 	b	8056c <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0xb4>
   805a0:	8b1712c8 	add	x8, x22, x23, lsl #4
   805a4:	8b170ec9 	add	x9, x22, x23, lsl #3
   805a8:	a946dd16 	ldp	x22, x23, [x8, #104]
   805ac:	f9409135 	ldr	x21, [x9, #288]
   805b0:	f1000728 	subs	x8, x25, #0x1
   805b4:	54000080 	b.eq	805c4 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x10c>  // b.none
   805b8:	f9408eb5 	ldr	x21, [x21, #280]
   805bc:	f1000508 	subs	x8, x8, #0x1
   805c0:	54ffffc1 	b.ne	805b8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x100>  // b.any
   805c4:	aa1f03f9 	mov	x25, xzr
   805c8:	b4fff9d6 	cbz	x22, 80500 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x48>
   805cc:	f94002e8 	ldr	x8, [x23]
   805d0:	aa1603e0 	mov	x0, x22
   805d4:	d63f0100 	blr	x8
   805d8:	f94006e1 	ldr	x1, [x23, #8]
   805dc:	b4fff921 	cbz	x1, 80500 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x48>
   805e0:	f9400ae2 	ldr	x2, [x23, #16]
   805e4:	aa1603e0 	mov	x0, x22
   805e8:	940005e4 	bl	81d78 <__rust_dealloc>
   805ec:	17ffffc5 	b	80500 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x48>
   805f0:	d0000068 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   805f4:	f9448108 	ldr	x8, [x8, #2304]
   805f8:	eb0802bf 	cmp	x21, x8
   805fc:	540002a0 	b.eq	80650 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x198>  // b.none
   80600:	f94002b4 	ldr	x20, [x21]
   80604:	52802301 	mov	w1, #0x118                 	// #280
   80608:	aa1503e0 	mov	x0, x21
   8060c:	52800102 	mov	w2, #0x8                   	// #8
   80610:	940005da 	bl	81d78 <__rust_dealloc>
   80614:	b40001f4 	cbz	x20, 80650 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x198>
   80618:	f9400293 	ldr	x19, [x20]
   8061c:	52802f01 	mov	w1, #0x178                 	// #376
   80620:	aa1403e0 	mov	x0, x20
   80624:	52800102 	mov	w2, #0x8                   	// #8
   80628:	940005d4 	bl	81d78 <__rust_dealloc>
   8062c:	b4000133 	cbz	x19, 80650 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x198>
   80630:	52802f14 	mov	w20, #0x178                 	// #376
   80634:	f9400275 	ldr	x21, [x19]
   80638:	aa1303e0 	mov	x0, x19
   8063c:	aa1403e1 	mov	x1, x20
   80640:	52800102 	mov	w2, #0x8                   	// #8
   80644:	940005cd 	bl	81d78 <__rust_dealloc>
   80648:	aa1503f3 	mov	x19, x21
   8064c:	b5ffff55 	cbnz	x21, 80634 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E+0x17c>
   80650:	a9437bf3 	ldp	x19, x30, [sp, #48]
   80654:	a94253f5 	ldp	x21, x20, [sp, #32]
   80658:	a9415bf7 	ldp	x23, x22, [sp, #16]
   8065c:	a8c463f9 	ldp	x25, x24, [sp], #64
   80660:	d65f03c0 	ret
   80664:	aa0003f3 	mov	x19, x0
   80668:	aa1603e0 	mov	x0, x22
   8066c:	aa1703e1 	mov	x1, x23
   80670:	97ffff8c 	bl	804a0 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E>
   80674:	aa1303e0 	mov	x0, x19
   80678:	94000d9e 	bl	83cf0 <_Unwind_Resume>
   8067c:	d4200020 	brk	#0x1

0000000000080680 <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E>:
   80680:	d106c3ff 	sub	sp, sp, #0x1b0
   80684:	a9156ffc 	stp	x28, x27, [sp, #336]
   80688:	a91667fa 	stp	x26, x25, [sp, #352]
   8068c:	a9175ff8 	stp	x24, x23, [sp, #368]
   80690:	a91857f6 	stp	x22, x21, [sp, #384]
   80694:	a9194ff4 	stp	x20, x19, [sp, #400]
   80698:	a91a7bfd 	stp	x29, x30, [sp, #416]
   8069c:	f940041b 	ldr	x27, [x0, #8]
   806a0:	aa0803f3 	mov	x19, x8
   806a4:	aa0303f9 	mov	x25, x3
   806a8:	aa0203fa 	mov	x26, x2
   806ac:	aa0003f8 	mov	x24, x0
   806b0:	aa0103f7 	mov	x23, x1
   806b4:	aa1b03fc 	mov	x28, x27
   806b8:	7840af88 	ldrh	w8, [x28, #10]!
   806bc:	f100291f 	cmp	x8, #0xa
   806c0:	540003a8 	b.hi	80734 <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E+0xb4>  // b.pmore
   806c4:	f9400f14 	ldr	x20, [x24, #24]
   806c8:	91004369 	add	x9, x27, #0x10
   806cc:	91000695 	add	x21, x20, #0x1
   806d0:	8b140d36 	add	x22, x9, x20, lsl #3
   806d4:	cb140108 	sub	x8, x8, x20
   806d8:	aa1603e1 	mov	x1, x22
   806dc:	8b150d20 	add	x0, x9, x21, lsl #3
   806e0:	d37df102 	lsl	x2, x8, #3
   806e4:	94002647 	bl	8a000 <memmove>
   806e8:	f90002d7 	str	x23, [x22]
   806ec:	9101a369 	add	x9, x27, #0x68
   806f0:	79401768 	ldrh	w8, [x27, #10]
   806f4:	8b141137 	add	x23, x9, x20, lsl #4
   806f8:	8b151120 	add	x0, x9, x21, lsl #4
   806fc:	aa1703e1 	mov	x1, x23
   80700:	cb140108 	sub	x8, x8, x20
   80704:	d37ced02 	lsl	x2, x8, #4
   80708:	9400263e 	bl	8a000 <memmove>
   8070c:	a90066fa 	stp	x26, x25, [x23]
   80710:	79401768 	ldrh	w8, [x27, #10]
   80714:	a9402b09 	ldp	x9, x10, [x24]
   80718:	f9400b0b 	ldr	x11, [x24, #16]
   8071c:	11000508 	add	w8, w8, #0x1
   80720:	a900267f 	stp	xzr, x9, [x19]
   80724:	79001768 	strh	w8, [x27, #10]
   80728:	a9012e6a 	stp	x10, x11, [x19, #16]
   8072c:	f9001274 	str	x20, [x19, #32]
   80730:	14000069 	b	808d4 <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E+0x254>
   80734:	f9400308 	ldr	x8, [x24]
   80738:	52802102 	mov	w2, #0x108                 	// #264
   8073c:	f9400b09 	ldr	x9, [x24, #16]
   80740:	2a1f03e1 	mov	w1, wzr
   80744:	a90367fa 	stp	x26, x25, [sp, #48]
   80748:	a90223e9 	stp	x9, x8, [sp, #32]
   8074c:	910113e8 	add	x8, sp, #0x44
   80750:	91001100 	add	x0, x8, #0x4
   80754:	94002655 	bl	8a0a8 <memset>
   80758:	52802300 	mov	w0, #0x118                 	// #280
   8075c:	52800101 	mov	w1, #0x8                   	// #8
   80760:	94000582 	bl	81d68 <__rust_alloc>
   80764:	b4000ca0 	cbz	x0, 808f8 <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E+0x278>
   80768:	aa0003fd 	mov	x29, x0
   8076c:	aa0003f9 	mov	x25, x0
   80770:	aa0003f6 	mov	x22, x0
   80774:	91003000 	add	x0, x0, #0xc
   80778:	52802182 	mov	w2, #0x10c                 	// #268
   8077c:	910113e1 	add	x1, sp, #0x44
   80780:	f806873f 	str	xzr, [x25], #104
   80784:	7800aedf 	strh	wzr, [x22, #10]!
   80788:	940025ff 	bl	89f84 <memcpy>
   8078c:	f9402369 	ldr	x9, [x27, #64]
   80790:	910043ba 	add	x26, x29, #0x10
   80794:	79401768 	ldrh	w8, [x27, #10]
   80798:	91012361 	add	x1, x27, #0x48
   8079c:	aa1a03e0 	mov	x0, x26
   807a0:	f9000fe9 	str	x9, [sp, #24]
   807a4:	f9406769 	ldr	x9, [x27, #200]
   807a8:	d1001d14 	sub	x20, x8, #0x7
   807ac:	d37df282 	lsl	x2, x20, #3
   807b0:	f9000be9 	str	x9, [sp, #16]
   807b4:	f9406b69 	ldr	x9, [x27, #208]
   807b8:	f90007e9 	str	x9, [sp, #8]
   807bc:	940025f2 	bl	89f84 <memcpy>
   807c0:	91036361 	add	x1, x27, #0xd8
   807c4:	aa1903e0 	mov	x0, x25
   807c8:	d37cee82 	lsl	x2, x20, #4
   807cc:	940025ee 	bl	89f84 <memcpy>
   807d0:	f9400f15 	ldr	x21, [x24, #24]
   807d4:	528000c8 	mov	w8, #0x6                   	// #6
   807d8:	79001768 	strh	w8, [x27, #10]
   807dc:	f1001aa9 	subs	x9, x21, #0x6
   807e0:	790002d4 	strh	w20, [x22]
   807e4:	540002c8 	b.hi	8083c <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E+0x1bc>  // b.pmore
   807e8:	79400388 	ldrh	w8, [x28]
   807ec:	91004369 	add	x9, x27, #0x10
   807f0:	910006b4 	add	x20, x21, #0x1
   807f4:	8b150d38 	add	x24, x9, x21, lsl #3
   807f8:	aa1803e1 	mov	x1, x24
   807fc:	9101a376 	add	x22, x27, #0x68
   80800:	8b140d20 	add	x0, x9, x20, lsl #3
   80804:	cb150108 	sub	x8, x8, x21
   80808:	d37df102 	lsl	x2, x8, #3
   8080c:	940025fd 	bl	8a000 <memmove>
   80810:	f9000317 	str	x23, [x24]
   80814:	8b1512d7 	add	x23, x22, x21, lsl #4
   80818:	79400388 	ldrh	w8, [x28]
   8081c:	8b1412c0 	add	x0, x22, x20, lsl #4
   80820:	aa1703e1 	mov	x1, x23
   80824:	cb150108 	sub	x8, x8, x21
   80828:	d37ced02 	lsl	x2, x8, #4
   8082c:	940025f5 	bl	8a000 <memmove>
   80830:	f9401be9 	ldr	x9, [sp, #48]
   80834:	aa1703e8 	mov	x8, x23
   80838:	14000015 	b	8088c <_ZN5alloc11collections5btree4node210Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Leaf$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hcc5bd63ead71e416E+0x20c>
   8083c:	d1001eb5 	sub	x21, x21, #0x7
   80840:	92403e88 	and	x8, x20, #0xffff
   80844:	8b090f40 	add	x0, x26, x9, lsl #3
   80848:	cb150108 	sub	x8, x8, x21
   8084c:	8b150f58 	add	x24, x26, x21, lsl #3
   80850:	d37df102 	lsl	x2, x8, #3
   80854:	aa1803e1 	mov	x1, x24
   80858:	aa0903f4 	mov	x20, x9
   8085c:	940025e9 	bl	8a000 <memmove>
   80860:	f9000317 	str	x23, [x24]
   80864:	8b151337 	add	x23, x25, x21, lsl #4
   80868:	794002c8 	ldrh	w8, [x22]
   8086c:	8b141320 	add	x0, x25, x20, lsl #4
   80870:	aa1703e1 	mov	x1, x23
   80874:	cb150108 	sub	x8, x8, x21
   80878:	d37ced02 	lsl	x2, x8, #4
   8087c:	940025e1 	bl	8a000 <memmove>
   80880:	f9401be9 	ldr	x9, [sp, #48]
   80884:	aa1703e8 	mov	x8, x23
   80888:	aa1603fc 	mov	x28, x22
   8088c:	f8008509 	str	x9, [x8], #8
   80890:	f9401fea 	ldr	x10, [sp, #56]
   80894:	79400389 	ldrh	w9, [x28]
   80898:	f900010a 	str	x10, [x8]
   8089c:	52800028 	mov	w8, #0x1                   	// #1
   808a0:	11000529 	add	w9, w9, #0x1
   808a4:	f9000268 	str	x8, [x19]
   808a8:	a94223ea 	ldp	x10, x8, [sp, #32]
   808ac:	a9012a7b 	stp	x27, x10, [x19, #16]
   808b0:	f9000668 	str	x8, [x19, #8]
   808b4:	f9400fe8 	ldr	x8, [sp, #24]
   808b8:	79000389 	strh	w9, [x28]
   808bc:	f900227f 	str	xzr, [x19, #64]
   808c0:	f9001268 	str	x8, [x19, #32]
   808c4:	f9400be8 	ldr	x8, [sp, #16]
   808c8:	f9001668 	str	x8, [x19, #40]
   808cc:	f94007e8 	ldr	x8, [sp, #8]
   808d0:	a9037668 	stp	x8, x29, [x19, #48]
   808d4:	f9002677 	str	x23, [x19, #72]
   808d8:	a95a7bfd 	ldp	x29, x30, [sp, #416]
   808dc:	a9594ff4 	ldp	x20, x19, [sp, #400]
   808e0:	a95857f6 	ldp	x22, x21, [sp, #384]
   808e4:	a9575ff8 	ldp	x24, x23, [sp, #368]
   808e8:	a95667fa 	ldp	x26, x25, [sp, #352]
   808ec:	a9556ffc 	ldp	x28, x27, [sp, #336]
   808f0:	9106c3ff 	add	sp, sp, #0x1b0
   808f4:	d65f03c0 	ret
   808f8:	52802300 	mov	w0, #0x118                 	// #280
   808fc:	52800101 	mov	w1, #0x8                   	// #8
   80900:	94001ac0 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   80904:	d4200020 	brk	#0x1

0000000000080908 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E>:
   80908:	a9ba6ffc 	stp	x28, x27, [sp, #-96]!
   8090c:	a90167fa 	stp	x26, x25, [sp, #16]
   80910:	a9025ff8 	stp	x24, x23, [sp, #32]
   80914:	a90357f6 	stp	x22, x21, [sp, #48]
   80918:	a9044ff4 	stp	x20, x19, [sp, #64]
   8091c:	a9057bfd 	stp	x29, x30, [sp, #80]
   80920:	d10b43ff 	sub	sp, sp, #0x2d0
   80924:	f940041d 	ldr	x29, [x0, #8]
   80928:	aa0303f6 	mov	x22, x3
   8092c:	aa0003f8 	mov	x24, x0
   80930:	aa0203fc 	mov	x28, x2
   80934:	aa0803f3 	mov	x19, x8
   80938:	f90027e4 	str	x4, [sp, #72]
   8093c:	794017a9 	ldrh	w9, [x29, #10]
   80940:	f100293f 	cmp	x9, #0xa
   80944:	540006e8 	b.hi	80a20 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x118>  // b.pmore
   80948:	f9400f14 	ldr	x20, [x24, #24]
   8094c:	910043a8 	add	x8, x29, #0x10
   80950:	aa0103f9 	mov	x25, x1
   80954:	d37df297 	lsl	x23, x20, #3
   80958:	9100069a 	add	x26, x20, #0x1
   8095c:	8b170115 	add	x21, x8, x23
   80960:	d37df35b 	lsl	x27, x26, #3
   80964:	8b1b0100 	add	x0, x8, x27
   80968:	cb140128 	sub	x8, x9, x20
   8096c:	aa1503e1 	mov	x1, x21
   80970:	d37df102 	lsl	x2, x8, #3
   80974:	940025a3 	bl	8a000 <memmove>
   80978:	f90002b9 	str	x25, [x21]
   8097c:	9101a3a9 	add	x9, x29, #0x68
   80980:	794017a8 	ldrh	w8, [x29, #10]
   80984:	8b141135 	add	x21, x9, x20, lsl #4
   80988:	8b1a1120 	add	x0, x9, x26, lsl #4
   8098c:	aa1503e1 	mov	x1, x21
   80990:	cb140108 	sub	x8, x8, x20
   80994:	d37ced02 	lsl	x2, x8, #4
   80998:	9400259a 	bl	8a000 <memmove>
   8099c:	a9005abc 	stp	x28, x22, [x21]
   809a0:	910463a9 	add	x9, x29, #0x118
   809a4:	794017a8 	ldrh	w8, [x29, #10]
   809a8:	8b1b0135 	add	x21, x9, x27
   809ac:	8b0902e9 	add	x9, x23, x9
   809b0:	aa1503e1 	mov	x1, x21
   809b4:	91004120 	add	x0, x9, #0x10
   809b8:	11000508 	add	w8, w8, #0x1
   809bc:	92403d0a 	and	x10, x8, #0xffff
   809c0:	cb1a0149 	sub	x9, x10, x26
   809c4:	d37df122 	lsl	x2, x9, #3
   809c8:	790017a8 	strh	w8, [x29, #10]
   809cc:	9400258d 	bl	8a000 <memmove>
   809d0:	f94027e8 	ldr	x8, [sp, #72]
   809d4:	f90002a8 	str	x8, [x21]
   809d8:	794017a8 	ldrh	w8, [x29, #10]
   809dc:	eb08035f 	cmp	x26, x8
   809e0:	54000148 	b.hi	80a08 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x100>  // b.pmore
   809e4:	910483a9 	add	x9, x29, #0x120
   809e8:	aa1403ea 	mov	x10, x20
   809ec:	f86a792b 	ldr	x11, [x9, x10, lsl #3]
   809f0:	9100054c 	add	x12, x10, #0x1
   809f4:	aa0c03ea 	mov	x10, x12
   809f8:	eb08019f 	cmp	x12, x8
   809fc:	7900116c 	strh	w12, [x11, #8]
   80a00:	f900017d 	str	x29, [x11]
   80a04:	54ffff43 	b.cc	809ec <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0xe4>  // b.lo, b.ul, b.last
   80a08:	a9402b09 	ldp	x9, x10, [x24]
   80a0c:	aa1f03e8 	mov	x8, xzr
   80a10:	f9400b0b 	ldr	x11, [x24, #16]
   80a14:	a900aa69 	stp	x9, x10, [x19, #8]
   80a18:	a901d26b 	stp	x11, x20, [x19, #24]
   80a1c:	140000b6 	b	80cf4 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x3ec>
   80a20:	910713e8 	add	x8, sp, #0x1c4
   80a24:	f9400b09 	ldr	x9, [x24, #16]
   80a28:	f90007e1 	str	x1, [sp, #8]
   80a2c:	91001100 	add	x0, x8, #0x4
   80a30:	a902dbfc 	stp	x28, x22, [sp, #40]
   80a34:	52802102 	mov	w2, #0x108                 	// #264
   80a38:	f9400316 	ldr	x22, [x24]
   80a3c:	2a1f03e1 	mov	w1, wzr
   80a40:	f9001fe9 	str	x9, [sp, #56]
   80a44:	94002599 	bl	8a0a8 <memset>
   80a48:	52802182 	mov	w2, #0x10c                 	// #268
   80a4c:	9102e3e0 	add	x0, sp, #0xb8
   80a50:	910713e1 	add	x1, sp, #0x1c4
   80a54:	9400254c 	bl	89f84 <memcpy>
   80a58:	6f00e400 	movi	v0.2d, #0x0
   80a5c:	52802f00 	mov	w0, #0x178                 	// #376
   80a60:	52800101 	mov	w1, #0x8                   	// #8
   80a64:	ad0283e0 	stp	q0, q0, [sp, #80]
   80a68:	ad0383e0 	stp	q0, q0, [sp, #112]
   80a6c:	ad0483e0 	stp	q0, q0, [sp, #144]
   80a70:	940004be 	bl	81d68 <__rust_alloc>
   80a74:	b4001520 	cbz	x0, 80d18 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x410>
   80a78:	aa0003f5 	mov	x21, x0
   80a7c:	91003000 	add	x0, x0, #0xc
   80a80:	52802182 	mov	w2, #0x10c                 	// #268
   80a84:	9102e3e1 	add	x1, sp, #0xb8
   80a88:	f90002bf 	str	xzr, [x21]
   80a8c:	790016bf 	strh	wzr, [x21, #10]
   80a90:	9400253d 	bl	89f84 <memcpy>
   80a94:	910462ba 	add	x26, x21, #0x118
   80a98:	910143e1 	add	x1, sp, #0x50
   80a9c:	aa1a03e0 	mov	x0, x26
   80aa0:	52800c02 	mov	w2, #0x60                  	// #96
   80aa4:	94002538 	bl	89f84 <memcpy>
   80aa8:	f94023a9 	ldr	x9, [x29, #64]
   80aac:	910042bc 	add	x28, x21, #0x10
   80ab0:	794017a8 	ldrh	w8, [x29, #10]
   80ab4:	910123a1 	add	x1, x29, #0x48
   80ab8:	aa1c03e0 	mov	x0, x28
   80abc:	f9000be9 	str	x9, [sp, #16]
   80ac0:	f94067a9 	ldr	x9, [x29, #200]
   80ac4:	d1001d17 	sub	x23, x8, #0x7
   80ac8:	d37df2e2 	lsl	x2, x23, #3
   80acc:	d1001914 	sub	x20, x8, #0x6
   80ad0:	f9000fe9 	str	x9, [sp, #24]
   80ad4:	f9406ba9 	ldr	x9, [x29, #208]
   80ad8:	f90013e9 	str	x9, [sp, #32]
   80adc:	9400252a 	bl	89f84 <memcpy>
   80ae0:	9101a2bb 	add	x27, x21, #0x68
   80ae4:	910363a1 	add	x1, x29, #0xd8
   80ae8:	aa1b03e0 	mov	x0, x27
   80aec:	d37ceee2 	lsl	x2, x23, #4
   80af0:	94002525 	bl	89f84 <memcpy>
   80af4:	910543a1 	add	x1, x29, #0x150
   80af8:	aa1a03e0 	mov	x0, x26
   80afc:	d37df282 	lsl	x2, x20, #3
   80b00:	94002521 	bl	89f84 <memcpy>
   80b04:	528000c8 	mov	w8, #0x6                   	// #6
   80b08:	790017a8 	strh	w8, [x29, #10]
   80b0c:	790016b7 	strh	w23, [x21, #10]
   80b10:	b4000134 	cbz	x20, 80b34 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x22c>
   80b14:	aa1f03e8 	mov	x8, xzr
   80b18:	f8687b49 	ldr	x9, [x26, x8, lsl #3]
   80b1c:	9100050a 	add	x10, x8, #0x1
   80b20:	eb0a029f 	cmp	x20, x10
   80b24:	79001128 	strh	w8, [x9, #8]
   80b28:	aa0a03e8 	mov	x8, x10
   80b2c:	f9000135 	str	x21, [x9]
   80b30:	54ffff41 	b.ne	80b18 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x210>  // b.any
   80b34:	f9400f14 	ldr	x20, [x24, #24]
   80b38:	f90023f6 	str	x22, [sp, #64]
   80b3c:	f1001a97 	subs	x23, x20, #0x6
   80b40:	54000688 	b.hi	80c10 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x308>  // b.pmore
   80b44:	794017a9 	ldrh	w9, [x29, #10]
   80b48:	910043a8 	add	x8, x29, #0x10
   80b4c:	d37df29b 	lsl	x27, x20, #3
   80b50:	9100069c 	add	x28, x20, #0x1
   80b54:	8b1b0118 	add	x24, x8, x27
   80b58:	d37df396 	lsl	x22, x28, #3
   80b5c:	8b160100 	add	x0, x8, x22
   80b60:	aa1803e1 	mov	x1, x24
   80b64:	cb140128 	sub	x8, x9, x20
   80b68:	9101a3b7 	add	x23, x29, #0x68
   80b6c:	d37df102 	lsl	x2, x8, #3
   80b70:	910463ba 	add	x26, x29, #0x118
   80b74:	94002523 	bl	8a000 <memmove>
   80b78:	f94007e8 	ldr	x8, [sp, #8]
   80b7c:	8b1c12e0 	add	x0, x23, x28, lsl #4
   80b80:	f9000308 	str	x8, [x24]
   80b84:	8b1412f8 	add	x24, x23, x20, lsl #4
   80b88:	794017a8 	ldrh	w8, [x29, #10]
   80b8c:	aa1803e1 	mov	x1, x24
   80b90:	cb140108 	sub	x8, x8, x20
   80b94:	d37ced02 	lsl	x2, x8, #4
   80b98:	9400251a 	bl	8a000 <memmove>
   80b9c:	f94017e8 	ldr	x8, [sp, #40]
   80ba0:	8b160356 	add	x22, x26, x22
   80ba4:	8b1a036a 	add	x10, x27, x26
   80ba8:	aa1603e1 	mov	x1, x22
   80bac:	91004140 	add	x0, x10, #0x10
   80bb0:	f9000308 	str	x8, [x24]
   80bb4:	f9401be8 	ldr	x8, [sp, #48]
   80bb8:	f9000708 	str	x8, [x24, #8]
   80bbc:	794017a8 	ldrh	w8, [x29, #10]
   80bc0:	11000508 	add	w8, w8, #0x1
   80bc4:	92403d09 	and	x9, x8, #0xffff
   80bc8:	cb1c0129 	sub	x9, x9, x28
   80bcc:	d37df122 	lsl	x2, x9, #3
   80bd0:	790017a8 	strh	w8, [x29, #10]
   80bd4:	9400250b 	bl	8a000 <memmove>
   80bd8:	f94027e8 	ldr	x8, [sp, #72]
   80bdc:	f90002c8 	str	x8, [x22]
   80be0:	794017a8 	ldrh	w8, [x29, #10]
   80be4:	eb08029f 	cmp	x20, x8
   80be8:	54000702 	b.cs	80cc8 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x3c0>  // b.hs, b.nlast
   80bec:	910483a9 	add	x9, x29, #0x120
   80bf0:	f874792a 	ldr	x10, [x9, x20, lsl #3]
   80bf4:	9100068b 	add	x11, x20, #0x1
   80bf8:	aa0b03f4 	mov	x20, x11
   80bfc:	eb0b011f 	cmp	x8, x11
   80c00:	7900114b 	strh	w11, [x10, #8]
   80c04:	f900015d 	str	x29, [x10]
   80c08:	54ffff41 	b.ne	80bf0 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x2e8>  // b.any
   80c0c:	1400002f 	b	80cc8 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x3c0>
   80c10:	794016a8 	ldrh	w8, [x21, #10]
   80c14:	d1001e96 	sub	x22, x20, #0x7
   80c18:	d37df2f9 	lsl	x25, x23, #3
   80c1c:	8b190380 	add	x0, x28, x25
   80c20:	8b160f98 	add	x24, x28, x22, lsl #3
   80c24:	aa1803e1 	mov	x1, x24
   80c28:	cb160108 	sub	x8, x8, x22
   80c2c:	d37df102 	lsl	x2, x8, #3
   80c30:	940024f4 	bl	8a000 <memmove>
   80c34:	f94007e8 	ldr	x8, [sp, #8]
   80c38:	8b171360 	add	x0, x27, x23, lsl #4
   80c3c:	f9000308 	str	x8, [x24]
   80c40:	8b161378 	add	x24, x27, x22, lsl #4
   80c44:	794016a8 	ldrh	w8, [x21, #10]
   80c48:	aa1803e1 	mov	x1, x24
   80c4c:	cb160108 	sub	x8, x8, x22
   80c50:	d37ced02 	lsl	x2, x8, #4
   80c54:	940024eb 	bl	8a000 <memmove>
   80c58:	f94017e8 	ldr	x8, [sp, #40]
   80c5c:	8b190356 	add	x22, x26, x25
   80c60:	8b140f4a 	add	x10, x26, x20, lsl #3
   80c64:	aa1603e1 	mov	x1, x22
   80c68:	d100a140 	sub	x0, x10, #0x28
   80c6c:	f9000308 	str	x8, [x24]
   80c70:	f9401be8 	ldr	x8, [sp, #48]
   80c74:	f9000708 	str	x8, [x24, #8]
   80c78:	794016a8 	ldrh	w8, [x21, #10]
   80c7c:	11000508 	add	w8, w8, #0x1
   80c80:	92403d09 	and	x9, x8, #0xffff
   80c84:	cb170129 	sub	x9, x9, x23
   80c88:	d37df122 	lsl	x2, x9, #3
   80c8c:	790016a8 	strh	w8, [x21, #10]
   80c90:	940024dc 	bl	8a000 <memmove>
   80c94:	f94027e8 	ldr	x8, [sp, #72]
   80c98:	f90002c8 	str	x8, [x22]
   80c9c:	794016a8 	ldrh	w8, [x21, #10]
   80ca0:	eb0802ff 	cmp	x23, x8
   80ca4:	54000128 	b.hi	80cc8 <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x3c0>  // b.pmore
   80ca8:	9103a2a9 	add	x9, x21, #0xe8
   80cac:	f874792a 	ldr	x10, [x9, x20, lsl #3]
   80cb0:	d1001a8b 	sub	x11, x20, #0x6
   80cb4:	91000694 	add	x20, x20, #0x1
   80cb8:	eb08017f 	cmp	x11, x8
   80cbc:	f9000155 	str	x21, [x10]
   80cc0:	7900114b 	strh	w11, [x10, #8]
   80cc4:	54ffff43 	b.cc	80cac <_ZN5alloc11collections5btree4node214Handle$LT$alloc..collections..btree..node..NodeRef$LT$alloc..collections..btree..node..marker..Mut$C$K$C$V$C$alloc..collections..btree..node..marker..Internal$GT$$C$alloc..collections..btree..node..marker..Edge$GT$6insert17hb9ca022211a0c636E+0x3a4>  // b.lo, b.ul, b.last
   80cc8:	a943a7e8 	ldp	x8, x9, [sp, #56]
   80ccc:	f9000e68 	str	x8, [x19, #24]
   80cd0:	f9400be8 	ldr	x8, [sp, #16]
   80cd4:	a900f669 	stp	x9, x29, [x19, #8]
   80cd8:	f9002269 	str	x9, [x19, #64]
   80cdc:	f9001268 	str	x8, [x19, #32]
   80ce0:	f9400fe8 	ldr	x8, [sp, #24]
   80ce4:	f9001668 	str	x8, [x19, #40]
   80ce8:	f94013e8 	ldr	x8, [sp, #32]
   80cec:	a9035668 	stp	x8, x21, [x19, #48]
   80cf0:	52800028 	mov	w8, #0x1                   	// #1
   80cf4:	f9000268 	str	x8, [x19]
   80cf8:	910b43ff 	add	sp, sp, #0x2d0
   80cfc:	a9457bfd 	ldp	x29, x30, [sp, #80]
   80d00:	a9444ff4 	ldp	x20, x19, [sp, #64]
   80d04:	a94357f6 	ldp	x22, x21, [sp, #48]
   80d08:	a9425ff8 	ldp	x24, x23, [sp, #32]
   80d0c:	a94167fa 	ldp	x26, x25, [sp, #16]
   80d10:	a8c66ffc 	ldp	x28, x27, [sp], #96
   80d14:	d65f03c0 	ret
   80d18:	52802f00 	mov	w0, #0x178                 	// #376
   80d1c:	52800101 	mov	w1, #0x8                   	// #8
   80d20:	940019b8 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   80d24:	d4200020 	brk	#0x1

0000000000080d28 <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E>:
   80d28:	f940002c 	ldr	x12, [x1]
   80d2c:	a940240b 	ldp	x11, x9, [x0]
   80d30:	f940080a 	ldr	x10, [x0, #16]
   80d34:	7940152d 	ldrh	w13, [x9, #10]
   80d38:	5280004f 	mov	w15, #0x2                   	// #2
   80d3c:	d37df1b0 	lsl	x16, x13, #3
   80d40:	b4000190 	cbz	x16, 80d70 <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E+0x48>
   80d44:	f86f792e 	ldr	x14, [x9, x15, lsl #3]
   80d48:	910005ef 	add	x15, x15, #0x1
   80d4c:	eb0c01df 	cmp	x14, x12
   80d50:	1a9f07ee 	cset	w14, ne  // ne = any
   80d54:	da9f91ce 	csinv	x14, x14, xzr, ls  // ls = plast
   80d58:	b10005df 	cmn	x14, #0x1
   80d5c:	54000080 	b.eq	80d6c <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E+0x44>  // b.none
   80d60:	d1002210 	sub	x16, x16, #0x8
   80d64:	b5fffeee 	cbnz	x14, 80d40 <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E+0x18>
   80d68:	14000009 	b	80d8c <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E+0x64>
   80d6c:	d1000ded 	sub	x13, x15, #0x3
   80d70:	b400018b 	cbz	x11, 80da0 <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E+0x78>
   80d74:	8b0d0d29 	add	x9, x9, x13, lsl #3
   80d78:	d100056b 	sub	x11, x11, #0x1
   80d7c:	f9408d29 	ldr	x9, [x9, #280]
   80d80:	f900080a 	str	x10, [x0, #16]
   80d84:	a900240b 	stp	x11, x9, [x0]
   80d88:	17ffffeb 	b	80d34 <_ZN5alloc11collections5btree6search11search_tree17h98dfec08e1b8dbb8E+0xc>
   80d8c:	d1000ded 	sub	x13, x15, #0x3
   80d90:	a9002d0e 	stp	x14, x11, [x8]
   80d94:	a9012909 	stp	x9, x10, [x8, #16]
   80d98:	f900110d 	str	x13, [x8, #32]
   80d9c:	d65f03c0 	ret
   80da0:	5280002e 	mov	w14, #0x1                   	// #1
   80da4:	a9002d0e 	stp	x14, x11, [x8]
   80da8:	a9012909 	stp	x9, x10, [x8, #16]
   80dac:	f900110d 	str	x13, [x8, #32]
   80db0:	d65f03c0 	ret
   80db4:	00000000 	.inst	0x00000000 ; undefined

0000000000080db8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE>:
   80db8:	d10603ff 	sub	sp, sp, #0x180
   80dbc:	a9136bfc 	stp	x28, x26, [sp, #304]
   80dc0:	a91463f9 	stp	x25, x24, [sp, #320]
   80dc4:	a9155bf7 	stp	x23, x22, [sp, #336]
   80dc8:	a91653f5 	stp	x21, x20, [sp, #352]
   80dcc:	a9177bf3 	stp	x19, x30, [sp, #368]
   80dd0:	aa0103f4 	mov	x20, x1
   80dd4:	aa0003f3 	mov	x19, x0
   80dd8:	94001940 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   80ddc:	910123e0 	add	x0, sp, #0x48
   80de0:	aa1403e1 	mov	x1, x20
   80de4:	52800702 	mov	w2, #0x38                  	// #56
   80de8:	94002467 	bl	89f84 <memcpy>
   80dec:	aa1303f4 	mov	x20, x19
   80df0:	f8418e88 	ldr	x8, [x20, #24]!
   80df4:	b5000628 	cbnz	x8, 80eb8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x100>
   80df8:	910383e8 	add	x8, sp, #0xe0
   80dfc:	940013d5 	bl	85d50 <_ZN13ruspiro_timer8schedule9Schedules3new17haabb1e685a21967dE>
   80e00:	f9407be8 	ldr	x8, [sp, #240]
   80e04:	f9000be8 	str	x8, [sp, #16]
   80e08:	a94fa7e8 	ldp	x8, x9, [sp, #248]
   80e0c:	f9000fe8 	str	x8, [sp, #24]
   80e10:	f94073e8 	ldr	x8, [sp, #224]
   80e14:	f90003e8 	str	x8, [sp]
   80e18:	f94077e8 	ldr	x8, [sp, #232]
   80e1c:	f90007e8 	str	x8, [sp, #8]
   80e20:	ad4003e1 	ldp	q1, q0, [sp]
   80e24:	ad408e62 	ldp	q2, q3, [x19, #16]
   80e28:	f94087e8 	ldr	x8, [sp, #264]
   80e2c:	a9432e6a 	ldp	x10, x11, [x19, #48]
   80e30:	ad008261 	stp	q1, q0, [x19, #16]
   80e34:	a9032269 	stp	x9, x8, [x19, #48]
   80e38:	ad010be3 	stp	q3, q2, [sp, #32]
   80e3c:	f94013e8 	ldr	x8, [sp, #32]
   80e40:	a90cafea 	stp	x10, x11, [sp, #200]
   80e44:	aa0b03ea 	mov	x10, x11
   80e48:	f94067eb 	ldr	x11, [sp, #200]
   80e4c:	f9004be8 	str	x8, [sp, #144]
   80e50:	f94017e8 	ldr	x8, [sp, #40]
   80e54:	a90a2beb 	stp	x11, x10, [sp, #160]
   80e58:	f9004fe8 	str	x8, [sp, #152]
   80e5c:	a94327e8 	ldp	x8, x9, [sp, #48]
   80e60:	a90827e8 	stp	x8, x9, [sp, #128]
   80e64:	4e183c48 	mov	x8, v2.d[1]
   80e68:	b4000088 	cbz	x8, 80e78 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0xc0>
   80e6c:	910203e8 	add	x8, sp, #0x80
   80e70:	91002100 	add	x0, x8, #0x8
   80e74:	97fffd91 	bl	804b8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17he8bf8918e7498e61E>
   80e78:	d0000048 	adrp	x8, 8a000 <memmove>
   80e7c:	52800049 	mov	w9, #0x2                   	// #2
   80e80:	f9408108 	ldr	x8, [x8, #256]
   80e84:	b9000109 	str	w9, [x8]
   80e88:	d0000075 	adrp	x21, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   80e8c:	f94476b5 	ldr	x21, [x21, #2280]
   80e90:	aa1503e0 	mov	x0, x21
   80e94:	94001911 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   80e98:	910042a0 	add	x0, x21, #0x10
   80e9c:	52800021 	mov	w1, #0x1                   	// #1
   80ea0:	9400167e 	bl	86898 <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E>
   80ea4:	d0000060 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   80ea8:	f9447400 	ldr	x0, [x0, #2280]
   80eac:	94001915 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   80eb0:	f9400288 	ldr	x8, [x20]
   80eb4:	b4001448 	cbz	x8, 8113c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x384>
   80eb8:	f9401a68 	ldr	x8, [x19, #48]
   80ebc:	d1002295 	sub	x21, x20, #0x8
   80ec0:	f9401e69 	ldr	x9, [x19, #56]
   80ec4:	b40000c9 	cbz	x9, 80edc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x124>
   80ec8:	d1000508 	sub	x8, x8, #0x1
   80ecc:	eb09011f 	cmp	x8, x9
   80ed0:	54000061 	b.ne	80edc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x124>  // b.any
   80ed4:	aa1503e0 	mov	x0, x21
   80ed8:	940013a4 	bl	85d68 <_ZN13ruspiro_timer8schedule9Schedules6shrink17h1f1bfbc046d93201E>
   80edc:	f94027e8 	ldr	x8, [sp, #72]
   80ee0:	910383e0 	add	x0, sp, #0xe0
   80ee4:	52800602 	mov	w2, #0x30                  	// #48
   80ee8:	f9400116 	ldr	x22, [x8]
   80eec:	910123e8 	add	x8, sp, #0x48
   80ef0:	91002101 	add	x1, x8, #0x8
   80ef4:	94002424 	bl	89f84 <memcpy>
   80ef8:	52800600 	mov	w0, #0x30                  	// #48
   80efc:	52800101 	mov	w1, #0x8                   	// #8
   80f00:	9400039a 	bl	81d68 <__rust_alloc>
   80f04:	b4001480 	cbz	x0, 81194 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x3dc>
   80f08:	910383e1 	add	x1, sp, #0xe0
   80f0c:	52800602 	mov	w2, #0x30                  	// #48
   80f10:	aa0003f7 	mov	x23, x0
   80f14:	9400241c 	bl	89f84 <memcpy>
   80f18:	b0000063 	adrp	x3, 8d000 <GCC_except_table3+0xa5c>
   80f1c:	910383e8 	add	x8, sp, #0xe0
   80f20:	911b4063 	add	x3, x3, #0x6d0
   80f24:	aa1403e0 	mov	x0, x20
   80f28:	aa1603e1 	mov	x1, x22
   80f2c:	aa1703e2 	mov	x2, x23
   80f30:	97fffcaa 	bl	801d8 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$6insert17h7963dd2ba15c2205E>
   80f34:	f94073e8 	ldr	x8, [sp, #224]
   80f38:	b4000188 	cbz	x8, 80f68 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x1b0>
   80f3c:	f94077f6 	ldr	x22, [sp, #232]
   80f40:	b4000156 	cbz	x22, 80f68 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x1b0>
   80f44:	f9407bf7 	ldr	x23, [sp, #240]
   80f48:	f94002e8 	ldr	x8, [x23]
   80f4c:	aa1603e0 	mov	x0, x22
   80f50:	d63f0100 	blr	x8
   80f54:	f94006e1 	ldr	x1, [x23, #8]
   80f58:	b4000081 	cbz	x1, 80f68 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x1b0>
   80f5c:	f9400ae2 	ldr	x2, [x23, #16]
   80f60:	aa1603e0 	mov	x0, x22
   80f64:	94000385 	bl	81d78 <__rust_dealloc>
   80f68:	c8dffea9 	ldar	x9, [x21]
   80f6c:	b0000079 	adrp	x25, 8d000 <GCC_except_table3+0xa5c>
   80f70:	f94027e8 	ldr	x8, [sp, #72]
   80f74:	b0000018 	adrp	x24, 81000 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x248>
   80f78:	b0000017 	adrp	x23, 81000 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x248>
   80f7c:	b0000076 	adrp	x22, 8d000 <GCC_except_table3+0xa5c>
   80f80:	911c8339 	add	x25, x25, #0x720
   80f84:	91196318 	add	x24, x24, #0x658
   80f88:	911822f7 	add	x23, x23, #0x608
   80f8c:	911bc2d6 	add	x22, x22, #0x6f0
   80f90:	f9400108 	ldr	x8, [x8]
   80f94:	d1000529 	sub	x9, x9, #0x1
   80f98:	eb08013f 	cmp	x9, x8
   80f9c:	540006c3 	b.cc	81074 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x2bc>  // b.lo, b.ul, b.last
   80fa0:	c89ffea8 	stlr	x8, [x21]
   80fa4:	d0000048 	adrp	x8, 8a000 <memmove>
   80fa8:	f94027e9 	ldr	x9, [sp, #72]
   80fac:	d000006a 	adrp	x10, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   80fb0:	5280002b 	mov	w11, #0x1                   	// #1
   80fb4:	910323fa 	add	x26, sp, #0xc8
   80fb8:	f9408508 	ldr	x8, [x8, #264]
   80fbc:	f9400129 	ldr	x9, [x9]
   80fc0:	f9447d4a 	ldr	x10, [x10, #2296]
   80fc4:	b9000109 	str	w9, [x8]
   80fc8:	b0000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   80fcc:	f94027e9 	ldr	x9, [sp, #72]
   80fd0:	911cc108 	add	x8, x8, #0x730
   80fd4:	a90f7fff 	stp	xzr, xzr, [sp, #240]
   80fd8:	a9102ffa 	stp	x26, x11, [sp, #256]
   80fdc:	a90e2fe8 	stp	x8, x11, [sp, #224]
   80fe0:	a90cabe9 	stp	x9, x10, [sp, #200]
   80fe4:	910203e8 	add	x8, sp, #0x80
   80fe8:	910383e0 	add	x0, sp, #0xe0
   80fec:	910203f5 	add	x21, sp, #0x80
   80ff0:	9400190e 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   80ff4:	9e670320 	fmov	d0, x25
   80ff8:	f94043ea 	ldr	x10, [sp, #128]
   80ffc:	a948a3e9 	ldp	x9, x8, [sp, #136]
   81000:	a90fd7ff 	stp	xzr, x21, [sp, #248]
   81004:	a9095ffa 	stp	x26, x23, [sp, #144]
   81008:	a90ca7ea 	stp	x10, x9, [sp, #200]
   8100c:	52800069 	mov	w9, #0x3                   	// #3
   81010:	4e181f00 	mov	v0.d[1], x24
   81014:	a90ddbe8 	stp	x8, x22, [sp, #216]
   81018:	52800048 	mov	w8, #0x2                   	// #2
   8101c:	a90effe9 	stp	x9, xzr, [sp, #232]
   81020:	f90087e8 	str	x8, [sp, #264]
   81024:	3d8023e0 	str	q0, [sp, #128]
   81028:	9102c3e8 	add	x8, sp, #0xb0
   8102c:	910383e0 	add	x0, sp, #0xe0
   81030:	940018fe 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   81034:	f9406be1 	ldr	x1, [sp, #208]
   81038:	b4000081 	cbz	x1, 81048 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x290>
   8103c:	f94067e0 	ldr	x0, [sp, #200]
   81040:	52800022 	mov	w2, #0x1                   	// #1
   81044:	9400034d 	bl	81d78 <__rust_dealloc>
   81048:	a94b23f5 	ldp	x21, x8, [sp, #176]
   8104c:	f94063e1 	ldr	x1, [sp, #192]
   81050:	a90e23f5 	stp	x21, x8, [sp, #224]
   81054:	f9007be1 	str	x1, [sp, #240]
   81058:	aa1503e0 	mov	x0, x21
   8105c:	94001889 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81060:	f94077e1 	ldr	x1, [sp, #232]
   81064:	b4000081 	cbz	x1, 81074 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x2bc>
   81068:	aa1503e0 	mov	x0, x21
   8106c:	52800022 	mov	w2, #0x1                   	// #1
   81070:	94000342 	bl	81d78 <__rust_dealloc>
   81074:	b0000069 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   81078:	f9400a88 	ldr	x8, [x20, #16]
   8107c:	9000006b 	adrp	x11, 8d000 <GCC_except_table3+0xa5c>
   81080:	9102c3ea 	add	x10, sp, #0xb0
   81084:	911d016b 	add	x11, x11, #0x740
   81088:	5280002c 	mov	w12, #0x1                   	// #1
   8108c:	f9444929 	ldr	x9, [x9, #2192]
   81090:	910323f5 	add	x21, sp, #0xc8
   81094:	f9005be8 	str	x8, [sp, #176]
   81098:	a90e33eb 	stp	x11, x12, [sp, #224]
   8109c:	a90f7fff 	stp	xzr, xzr, [sp, #240]
   810a0:	a90ca7ea 	stp	x10, x9, [sp, #200]
   810a4:	a91033f5 	stp	x21, x12, [sp, #256]
   810a8:	910203e8 	add	x8, sp, #0x80
   810ac:	910383e0 	add	x0, sp, #0xe0
   810b0:	910203f4 	add	x20, sp, #0x80
   810b4:	940018dd 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   810b8:	9e670320 	fmov	d0, x25
   810bc:	f94043ea 	ldr	x10, [sp, #128]
   810c0:	a948a3e9 	ldp	x9, x8, [sp, #136]
   810c4:	a90fd3ff 	stp	xzr, x20, [sp, #248]
   810c8:	a9095ff5 	stp	x21, x23, [sp, #144]
   810cc:	a90ca7ea 	stp	x10, x9, [sp, #200]
   810d0:	52800069 	mov	w9, #0x3                   	// #3
   810d4:	4e181f00 	mov	v0.d[1], x24
   810d8:	a90ddbe8 	stp	x8, x22, [sp, #216]
   810dc:	52800048 	mov	w8, #0x2                   	// #2
   810e0:	a90effe9 	stp	x9, xzr, [sp, #232]
   810e4:	f90087e8 	str	x8, [sp, #264]
   810e8:	3d8023e0 	str	q0, [sp, #128]
   810ec:	9102c3e8 	add	x8, sp, #0xb0
   810f0:	910383e0 	add	x0, sp, #0xe0
   810f4:	940018cd 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   810f8:	f9406be1 	ldr	x1, [sp, #208]
   810fc:	b4000081 	cbz	x1, 8110c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x354>
   81100:	f94067e0 	ldr	x0, [sp, #200]
   81104:	52800022 	mov	w2, #0x1                   	// #1
   81108:	9400031c 	bl	81d78 <__rust_dealloc>
   8110c:	a94b23f4 	ldp	x20, x8, [sp, #176]
   81110:	f94063e1 	ldr	x1, [sp, #192]
   81114:	a90e23f4 	stp	x20, x8, [sp, #224]
   81118:	f9007be1 	str	x1, [sp, #240]
   8111c:	aa1403e0 	mov	x0, x20
   81120:	94001858 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81124:	f94077e1 	ldr	x1, [sp, #232]
   81128:	b4000241 	cbz	x1, 81170 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x3b8>
   8112c:	aa1403e0 	mov	x0, x20
   81130:	52800022 	mov	w2, #0x1                   	// #1
   81134:	94000311 	bl	81d78 <__rust_dealloc>
   81138:	1400000e 	b	81170 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x3b8>
   8113c:	910123e9 	add	x9, sp, #0x48
   81140:	f9402be8 	ldr	x8, [sp, #80]
   81144:	91002120 	add	x0, x9, #0x8
   81148:	c85f7d09 	ldxr	x9, [x8]
   8114c:	f1000529 	subs	x9, x9, #0x1
   81150:	c80afd09 	stlxr	w10, x9, [x8]
   81154:	35ffffaa 	cbnz	w10, 81148 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x390>
   81158:	54000061 	b.ne	81164 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x3ac>  // b.any
   8115c:	d50339bf 	dmb	ishld
   81160:	94000130 	bl	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   81164:	910123e8 	add	x8, sp, #0x48
   81168:	91004100 	add	x0, x8, #0x10
   8116c:	94000709 	bl	82d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>
   81170:	aa1303e0 	mov	x0, x19
   81174:	94001863 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   81178:	a9577bf3 	ldp	x19, x30, [sp, #368]
   8117c:	a95653f5 	ldp	x21, x20, [sp, #352]
   81180:	a9555bf7 	ldp	x23, x22, [sp, #336]
   81184:	a95463f9 	ldp	x25, x24, [sp, #320]
   81188:	a9536bfc 	ldp	x28, x26, [sp, #304]
   8118c:	910603ff 	add	sp, sp, #0x180
   81190:	d65f03c0 	ret
   81194:	52800600 	mov	w0, #0x30                  	// #48
   81198:	52800101 	mov	w1, #0x8                   	// #8
   8119c:	94001899 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   811a0:	d4200020 	brk	#0x1
   811a4:	910123e8 	add	x8, sp, #0x48
   811a8:	aa0003f3 	mov	x19, x0
   811ac:	91004100 	add	x0, x8, #0x10
   811b0:	94000108 	bl	815d0 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E>
   811b4:	14000030 	b	81274 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x4bc>
   811b8:	aa0003f3 	mov	x19, x0
   811bc:	aa1603e0 	mov	x0, x22
   811c0:	aa1703e1 	mov	x1, x23
   811c4:	9400010b 	bl	815f0 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E>
   811c8:	aa1303e0 	mov	x0, x19
   811cc:	94000ac9 	bl	83cf0 <_Unwind_Resume>
   811d0:	d4200020 	brk	#0x1
   811d4:	14000002 	b	811dc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x424>
   811d8:	14000001 	b	811dc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x424>
   811dc:	aa0003f3 	mov	x19, x0
   811e0:	1400001c 	b	81250 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x498>
   811e4:	aa0003f3 	mov	x19, x0
   811e8:	910383e0 	add	x0, sp, #0xe0
   811ec:	940000fb 	bl	815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   811f0:	14000021 	b	81274 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x4bc>
   811f4:	aa0003f3 	mov	x19, x0
   811f8:	910323e0 	add	x0, sp, #0xc8
   811fc:	940000f7 	bl	815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81200:	1400001d 	b	81274 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x4bc>
   81204:	aa0003f3 	mov	x19, x0
   81208:	910383e0 	add	x0, sp, #0xe0
   8120c:	940000f3 	bl	815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81210:	14000019 	b	81274 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x4bc>
   81214:	aa0003f3 	mov	x19, x0
   81218:	910323e0 	add	x0, sp, #0xc8
   8121c:	940000ef 	bl	815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81220:	14000015 	b	81274 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x4bc>
   81224:	aa0003f3 	mov	x19, x0
   81228:	aa1303e0 	mov	x0, x19
   8122c:	94000ab1 	bl	83cf0 <_Unwind_Resume>
   81230:	d4200020 	brk	#0x1
   81234:	aa0003f3 	mov	x19, x0
   81238:	aa1403e0 	mov	x0, x20
   8123c:	940000af 	bl	814f8 <_ZN4core3ptr18real_drop_in_place17h811c6e2bdfdb79d8E>
   81240:	aa1303e0 	mov	x0, x19
   81244:	94000aab 	bl	83cf0 <_Unwind_Resume>
   81248:	d4200020 	brk	#0x1
   8124c:	aa0003f3 	mov	x19, x0
   81250:	910123e8 	add	x8, sp, #0x48
   81254:	91002100 	add	x0, x8, #0x8
   81258:	940000c8 	bl	81578 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE>
   8125c:	14000006 	b	81274 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x4bc>
   81260:	aa0003f3 	mov	x19, x0
   81264:	aa1303e0 	mov	x0, x19
   81268:	94000aa2 	bl	83cf0 <_Unwind_Resume>
   8126c:	d4200020 	brk	#0x1
   81270:	aa0003f3 	mov	x19, x0
   81274:	aa1303e0 	mov	x0, x19
   81278:	94000a9e 	bl	83cf0 <_Unwind_Resume>
   8127c:	d4200020 	brk	#0x1

0000000000081280 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE>:
   81280:	d10283ff 	sub	sp, sp, #0xa0
   81284:	a906dbff 	stp	xzr, x22, [sp, #104]
   81288:	a90853f5 	stp	x21, x20, [sp, #128]
   8128c:	a9097bf3 	stp	x19, x30, [sp, #144]
   81290:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   81294:	52800034 	mov	w20, #0x1                   	// #1
   81298:	911dc108 	add	x8, x8, #0x770
   8129c:	aa0003f3 	mov	x19, x0
   812a0:	a9057fff 	stp	xzr, xzr, [sp, #80]
   812a4:	a90453e8 	stp	x8, x20, [sp, #64]
   812a8:	52800108 	mov	w8, #0x8                   	// #8
   812ac:	f90033e8 	str	x8, [sp, #96]
   812b0:	9100a3e8 	add	x8, sp, #0x28
   812b4:	910103e0 	add	x0, sp, #0x40
   812b8:	9400185c 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   812bc:	a942a3e9 	ldp	x9, x8, [sp, #40]
   812c0:	90000015 	adrp	x21, 81000 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x248>
   812c4:	90000076 	adrp	x22, 8d000 <GCC_except_table3+0xa5c>
   812c8:	911822b5 	add	x21, x21, #0x608
   812cc:	911d42d6 	add	x22, x22, #0x750
   812d0:	f9401fea 	ldr	x10, [sp, #56]
   812d4:	a90123e9 	stp	x9, x8, [sp, #16]
   812d8:	910043e8 	add	x8, sp, #0x10
   812dc:	52800049 	mov	w9, #0x2                   	// #2
   812e0:	a9057fff 	stp	xzr, xzr, [sp, #80]
   812e4:	a90057e8 	stp	x8, x21, [sp]
   812e8:	52800028 	mov	w8, #0x1                   	// #1
   812ec:	a90427f6 	stp	x22, x9, [sp, #64]
   812f0:	910003e9 	mov	x9, sp
   812f4:	f90013ea 	str	x10, [sp, #32]
   812f8:	a90623e9 	stp	x9, x8, [sp, #96]
   812fc:	9100a3e8 	add	x8, sp, #0x28
   81300:	910103e0 	add	x0, sp, #0x40
   81304:	94001849 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   81308:	f9400fe1 	ldr	x1, [sp, #24]
   8130c:	b4000081 	cbz	x1, 8131c <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x9c>
   81310:	f9400be0 	ldr	x0, [sp, #16]
   81314:	52800022 	mov	w2, #0x1                   	// #1
   81318:	94000298 	bl	81d78 <__rust_dealloc>
   8131c:	a942a3f4 	ldp	x20, x8, [sp, #40]
   81320:	f9401fe1 	ldr	x1, [sp, #56]
   81324:	a90423f4 	stp	x20, x8, [sp, #64]
   81328:	f9002be1 	str	x1, [sp, #80]
   8132c:	aa1403e0 	mov	x0, x20
   81330:	940017d4 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81334:	f94027e1 	ldr	x1, [sp, #72]
   81338:	b4000081 	cbz	x1, 81348 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0xc8>
   8133c:	aa1403e0 	mov	x0, x20
   81340:	52800022 	mov	w2, #0x1                   	// #1
   81344:	9400028d 	bl	81d78 <__rust_dealloc>
   81348:	f9400268 	ldr	x8, [x19]
   8134c:	52800029 	mov	w9, #0x1                   	// #1
   81350:	91004108 	add	x8, x8, #0x10
   81354:	085ffd0a 	ldaxrb	w10, [x8]
   81358:	080bfd09 	stlxrb	w11, w9, [x8]
   8135c:	7100017f 	cmp	w11, #0x0
   81360:	7a400940 	ccmp	w10, #0x0, #0x0, eq  // eq = none
   81364:	54ffff81 	b.ne	81354 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0xd4>  // b.any
   81368:	b9400509 	ldr	w9, [x8, #4]
   8136c:	11000529 	add	w9, w9, #0x1
   81370:	b9000509 	str	w9, [x8, #4]
   81374:	085ffd1f 	ldaxrb	wzr, [x8]
   81378:	0809fd1f 	stlxrb	w9, wzr, [x8]
   8137c:	35ffffc9 	cbnz	w9, 81374 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0xf4>
   81380:	91002261 	add	x1, x19, #0x8
   81384:	52800502 	mov	w2, #0x28                  	// #40
   81388:	910103e0 	add	x0, sp, #0x40
   8138c:	940022fe 	bl	89f84 <memcpy>
   81390:	910103e0 	add	x0, sp, #0x40
   81394:	2a1f03f4 	mov	w20, wzr
   81398:	9400066c 	bl	82d48 <_ZN13ruspiro_brain8thoughts5waker5Waker4wake17h808a975f295c8579E>
   8139c:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   813a0:	52800029 	mov	w9, #0x1                   	// #1
   813a4:	911e0108 	add	x8, x8, #0x780
   813a8:	5280010a 	mov	w10, #0x8                   	// #8
   813ac:	a9057fff 	stp	xzr, xzr, [sp, #80]
   813b0:	a90427e8 	stp	x8, x9, [sp, #64]
   813b4:	a9067fea 	stp	x10, xzr, [sp, #96]
   813b8:	9100a3e8 	add	x8, sp, #0x28
   813bc:	910103e0 	add	x0, sp, #0x40
   813c0:	2a1f03f4 	mov	w20, wzr
   813c4:	94001819 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   813c8:	a942a3e9 	ldp	x9, x8, [sp, #40]
   813cc:	f9401fea 	ldr	x10, [sp, #56]
   813d0:	a9057fff 	stp	xzr, xzr, [sp, #80]
   813d4:	a90123e9 	stp	x9, x8, [sp, #16]
   813d8:	910043e8 	add	x8, sp, #0x10
   813dc:	52800049 	mov	w9, #0x2                   	// #2
   813e0:	f90013ea 	str	x10, [sp, #32]
   813e4:	a90057e8 	stp	x8, x21, [sp]
   813e8:	52800028 	mov	w8, #0x1                   	// #1
   813ec:	a90427f6 	stp	x22, x9, [sp, #64]
   813f0:	910003e9 	mov	x9, sp
   813f4:	a90623e9 	stp	x9, x8, [sp, #96]
   813f8:	9100a3e8 	add	x8, sp, #0x28
   813fc:	910103e0 	add	x0, sp, #0x40
   81400:	9400180a 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   81404:	f9400fe1 	ldr	x1, [sp, #24]
   81408:	b4000081 	cbz	x1, 81418 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x198>
   8140c:	f9400be0 	ldr	x0, [sp, #16]
   81410:	52800022 	mov	w2, #0x1                   	// #1
   81414:	94000259 	bl	81d78 <__rust_dealloc>
   81418:	a942a3f4 	ldp	x20, x8, [sp, #40]
   8141c:	f9401fe1 	ldr	x1, [sp, #56]
   81420:	a90423f4 	stp	x20, x8, [sp, #64]
   81424:	f9002be1 	str	x1, [sp, #80]
   81428:	aa1403e0 	mov	x0, x20
   8142c:	94001795 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81430:	f94027e1 	ldr	x1, [sp, #72]
   81434:	b4000081 	cbz	x1, 81444 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x1c4>
   81438:	aa1403e0 	mov	x0, x20
   8143c:	52800022 	mov	w2, #0x1                   	// #1
   81440:	9400024e 	bl	81d78 <__rust_dealloc>
   81444:	f9400268 	ldr	x8, [x19]
   81448:	c85f7d09 	ldxr	x9, [x8]
   8144c:	f1000529 	subs	x9, x9, #0x1
   81450:	c80afd09 	stlxr	w10, x9, [x8]
   81454:	35ffffaa 	cbnz	w10, 81448 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x1c8>
   81458:	54000081 	b.ne	81468 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x1e8>  // b.any
   8145c:	aa1303e0 	mov	x0, x19
   81460:	d50339bf 	dmb	ishld
   81464:	9400006f 	bl	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   81468:	a9497bf3 	ldp	x19, x30, [sp, #144]
   8146c:	f9403bf6 	ldr	x22, [sp, #112]
   81470:	a94853f5 	ldp	x21, x20, [sp, #128]
   81474:	910283ff 	add	sp, sp, #0xa0
   81478:	d65f03c0 	ret
   8147c:	aa0003f4 	mov	x20, x0
   81480:	910103e0 	add	x0, sp, #0x40
   81484:	14000003 	b	81490 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x210>
   81488:	aa0003f4 	mov	x20, x0
   8148c:	910043e0 	add	x0, sp, #0x10
   81490:	94000052 	bl	815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81494:	aa1303e0 	mov	x0, x19
   81498:	9400002e 	bl	81550 <_ZN4core3ptr18real_drop_in_place17h97bdf1132a997260E>
   8149c:	aa1403e0 	mov	x0, x20
   814a0:	94000a14 	bl	83cf0 <_Unwind_Resume>
   814a4:	d4200020 	brk	#0x1
   814a8:	aa0003f4 	mov	x20, x0
   814ac:	910103e0 	add	x0, sp, #0x40
   814b0:	14000003 	b	814bc <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x23c>
   814b4:	aa0003f4 	mov	x20, x0
   814b8:	910043e0 	add	x0, sp, #0x10
   814bc:	94000047 	bl	815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   814c0:	aa1303e0 	mov	x0, x19
   814c4:	94000023 	bl	81550 <_ZN4core3ptr18real_drop_in_place17h97bdf1132a997260E>
   814c8:	14000006 	b	814e0 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x260>
   814cc:	aa1403f5 	mov	x21, x20
   814d0:	aa0003f4 	mov	x20, x0
   814d4:	aa1303e0 	mov	x0, x19
   814d8:	9400001e 	bl	81550 <_ZN4core3ptr18real_drop_in_place17h97bdf1132a997260E>
   814dc:	36000075 	tbz	w21, #0, 814e8 <_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17h20902b3a40784a5eE+0x268>
   814e0:	91002260 	add	x0, x19, #0x8
   814e4:	9400003b 	bl	815d0 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E>
   814e8:	aa1403e0 	mov	x0, x20
   814ec:	94000a01 	bl	83cf0 <_Unwind_Resume>
   814f0:	d4200020 	brk	#0x1
   814f4:	00000000 	.inst	0x00000000 ; undefined

00000000000814f8 <_ZN4core3ptr18real_drop_in_place17h811c6e2bdfdb79d8E>:
   814f8:	f81e0ff4 	str	x20, [sp, #-32]!
   814fc:	a9017bf3 	stp	x19, x30, [sp, #16]
   81500:	aa0003f3 	mov	x19, x0
   81504:	f8408c08 	ldr	x8, [x0, #8]!
   81508:	c85f7d09 	ldxr	x9, [x8]
   8150c:	f1000529 	subs	x9, x9, #0x1
   81510:	c80afd09 	stlxr	w10, x9, [x8]
   81514:	35ffffaa 	cbnz	w10, 81508 <_ZN4core3ptr18real_drop_in_place17h811c6e2bdfdb79d8E+0x10>
   81518:	54000061 	b.ne	81524 <_ZN4core3ptr18real_drop_in_place17h811c6e2bdfdb79d8E+0x2c>  // b.any
   8151c:	d50339bf 	dmb	ishld
   81520:	94000040 	bl	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   81524:	91004260 	add	x0, x19, #0x10
   81528:	a9417bf3 	ldp	x19, x30, [sp, #16]
   8152c:	f84207f4 	ldr	x20, [sp], #32
   81530:	14000618 	b	82d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>
   81534:	aa0003f4 	mov	x20, x0
   81538:	91004260 	add	x0, x19, #0x10
   8153c:	94000025 	bl	815d0 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E>
   81540:	aa1403e0 	mov	x0, x20
   81544:	940009eb 	bl	83cf0 <_Unwind_Resume>
   81548:	d4200020 	brk	#0x1
   8154c:	00000000 	.inst	0x00000000 ; undefined

0000000000081550 <_ZN4core3ptr18real_drop_in_place17h97bdf1132a997260E>:
   81550:	f9400008 	ldr	x8, [x0]
   81554:	c85f7d09 	ldxr	x9, [x8]
   81558:	f1000529 	subs	x9, x9, #0x1
   8155c:	c80afd09 	stlxr	w10, x9, [x8]
   81560:	35ffffaa 	cbnz	w10, 81554 <_ZN4core3ptr18real_drop_in_place17h97bdf1132a997260E+0x4>
   81564:	54000061 	b.ne	81570 <_ZN4core3ptr18real_drop_in_place17h97bdf1132a997260E+0x20>  // b.any
   81568:	d50339bf 	dmb	ishld
   8156c:	1400002d 	b	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   81570:	d65f03c0 	ret
   81574:	00000000 	.inst	0x00000000 ; undefined

0000000000081578 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE>:
   81578:	f81e0ff4 	str	x20, [sp, #-32]!
   8157c:	a9017bf3 	stp	x19, x30, [sp, #16]
   81580:	f9400008 	ldr	x8, [x0]
   81584:	aa0003f3 	mov	x19, x0
   81588:	c85f7d09 	ldxr	x9, [x8]
   8158c:	f1000529 	subs	x9, x9, #0x1
   81590:	c80afd09 	stlxr	w10, x9, [x8]
   81594:	35ffffaa 	cbnz	w10, 81588 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE+0x10>
   81598:	54000081 	b.ne	815a8 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE+0x30>  // b.any
   8159c:	d50339bf 	dmb	ishld
   815a0:	aa1303e0 	mov	x0, x19
   815a4:	9400001f 	bl	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   815a8:	91002260 	add	x0, x19, #0x8
   815ac:	a9417bf3 	ldp	x19, x30, [sp, #16]
   815b0:	f84207f4 	ldr	x20, [sp], #32
   815b4:	140005f7 	b	82d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>
   815b8:	aa0003f4 	mov	x20, x0
   815bc:	91002260 	add	x0, x19, #0x8
   815c0:	94000004 	bl	815d0 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E>
   815c4:	aa1403e0 	mov	x0, x20
   815c8:	940009ca 	bl	83cf0 <_Unwind_Resume>
   815cc:	d4200020 	brk	#0x1

00000000000815d0 <_ZN4core3ptr18real_drop_in_place17heb1faf21e92f2cd3E>:
   815d0:	140005f0 	b	82d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>
   815d4:	00000000 	.inst	0x00000000 ; undefined

00000000000815d8 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>:
   815d8:	f9400401 	ldr	x1, [x0, #8]
   815dc:	b4000081 	cbz	x1, 815ec <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE+0x14>
   815e0:	f9400000 	ldr	x0, [x0]
   815e4:	52800022 	mov	w2, #0x1                   	// #1
   815e8:	140001e4 	b	81d78 <__rust_dealloc>
   815ec:	d65f03c0 	ret

00000000000815f0 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E>:
   815f0:	aa0103e8 	mov	x8, x1
   815f4:	f9400421 	ldr	x1, [x1, #8]
   815f8:	b4000061 	cbz	x1, 81604 <_ZN5alloc5alloc8box_free17h3eaf163627febce4E+0x14>
   815fc:	f9400902 	ldr	x2, [x8, #16]
   81600:	140001de 	b	81d78 <__rust_dealloc>
   81604:	d65f03c0 	ret

0000000000081608 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   81608:	f9400008 	ldr	x8, [x0]
   8160c:	aa0103e2 	mov	x2, x1
   81610:	f9400809 	ldr	x9, [x0, #16]
   81614:	aa0803e0 	mov	x0, x8
   81618:	aa0903e1 	mov	x1, x9
   8161c:	1400210d 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000081620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>:
   81620:	f9400008 	ldr	x8, [x0]
   81624:	91002108 	add	x8, x8, #0x8
   81628:	c85f7d09 	ldxr	x9, [x8]
   8162c:	f1000529 	subs	x9, x9, #0x1
   81630:	c80afd09 	stlxr	w10, x9, [x8]
   81634:	35ffffaa 	cbnz	w10, 81628 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E+0x8>
   81638:	540000c1 	b.ne	81650 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E+0x30>  // b.any
   8163c:	d50339bf 	dmb	ishld
   81640:	52800401 	mov	w1, #0x20                  	// #32
   81644:	f9400000 	ldr	x0, [x0]
   81648:	52800202 	mov	w2, #0x10                  	// #16
   8164c:	140001cb 	b	81d78 <__rust_dealloc>
   81650:	d65f03c0 	ret
   81654:	00000000 	.inst	0x00000000 ; undefined

0000000000081658 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17he73225b2a7526953E>:
   81658:	a9402408 	ldp	x8, x9, [x0]
   8165c:	aa0103e2 	mov	x2, x1
   81660:	aa0803e0 	mov	x0, x8
   81664:	aa0903e1 	mov	x1, x9
   81668:	140020fa 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>
   8166c:	00000000 	.inst	0x00000000 ; undefined

0000000000081670 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>:
   81670:	f9400401 	ldr	x1, [x0, #8]
   81674:	b4000081 	cbz	x1, 81684 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE+0x14>
   81678:	f9400000 	ldr	x0, [x0]
   8167c:	52800022 	mov	w2, #0x1                   	// #1
   81680:	140001be 	b	81d78 <__rust_dealloc>
   81684:	d65f03c0 	ret

0000000000081688 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   81688:	f9400008 	ldr	x8, [x0]
   8168c:	aa0103e2 	mov	x2, x1
   81690:	f9400809 	ldr	x9, [x0, #16]
   81694:	aa0803e0 	mov	x0, x8
   81698:	aa0903e1 	mov	x1, x9
   8169c:	140020ed 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

00000000000816a0 <_ZN89_$LT$kernel.._brain_awake..AwakeThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc381061bd3f52af9E>:
   816a0:	d10243ff 	sub	sp, sp, #0x90
   816a4:	a906d3ff 	stp	xzr, x20, [sp, #104]
   816a8:	a9087bf3 	stp	x19, x30, [sp, #128]
   816ac:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   816b0:	52800033 	mov	w19, #0x1                   	// #1
   816b4:	911ec108 	add	x8, x8, #0x7b0
   816b8:	52800109 	mov	w9, #0x8                   	// #8
   816bc:	910103e0 	add	x0, sp, #0x40
   816c0:	a9057fff 	stp	xzr, xzr, [sp, #80]
   816c4:	9100a3f4 	add	x20, sp, #0x28
   816c8:	a9044fe8 	stp	x8, x19, [sp, #64]
   816cc:	9100a3e8 	add	x8, sp, #0x28
   816d0:	f90033e9 	str	x9, [sp, #96]
   816d4:	94001755 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   816d8:	90000008 	adrp	x8, 81000 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x248>
   816dc:	52800049 	mov	w9, #0x2                   	// #2
   816e0:	911a2108 	add	x8, x8, #0x688
   816e4:	a9057fff 	stp	xzr, xzr, [sp, #80]
   816e8:	a901a3f4 	stp	x20, x8, [sp, #24]
   816ec:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   816f0:	911e4108 	add	x8, x8, #0x790
   816f4:	a90427e8 	stp	x8, x9, [sp, #64]
   816f8:	910063e8 	add	x8, sp, #0x18
   816fc:	a9064fe8 	stp	x8, x19, [sp, #96]
   81700:	910003e8 	mov	x8, sp
   81704:	910103e0 	add	x0, sp, #0x40
   81708:	94001748 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   8170c:	f9401be1 	ldr	x1, [sp, #48]
   81710:	b4000081 	cbz	x1, 81720 <_ZN89_$LT$kernel.._brain_awake..AwakeThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc381061bd3f52af9E+0x80>
   81714:	f94017e0 	ldr	x0, [sp, #40]
   81718:	52800022 	mov	w2, #0x1                   	// #1
   8171c:	94000197 	bl	81d78 <__rust_dealloc>
   81720:	a94023f3 	ldp	x19, x8, [sp]
   81724:	f9400be1 	ldr	x1, [sp, #16]
   81728:	a90423f3 	stp	x19, x8, [sp, #64]
   8172c:	f9002be1 	str	x1, [sp, #80]
   81730:	aa1303e0 	mov	x0, x19
   81734:	940016d3 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81738:	f94027e1 	ldr	x1, [sp, #72]
   8173c:	b4000081 	cbz	x1, 8174c <_ZN89_$LT$kernel.._brain_awake..AwakeThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc381061bd3f52af9E+0xac>
   81740:	aa1303e0 	mov	x0, x19
   81744:	52800022 	mov	w2, #0x1                   	// #1
   81748:	9400018c 	bl	81d78 <__rust_dealloc>
   8174c:	52800400 	mov	w0, #0x20                  	// #32
   81750:	52800201 	mov	w1, #0x10                  	// #16
   81754:	94000185 	bl	81d68 <__rust_alloc>
   81758:	b40002e0 	cbz	x0, 817b4 <_ZN89_$LT$kernel.._brain_awake..AwakeThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc381061bd3f52af9E+0x114>
   8175c:	52800028 	mov	w8, #0x1                   	// #1
   81760:	394103e9 	ldrb	w9, [sp, #64]
   81764:	394107ea 	ldrb	w10, [sp, #65]
   81768:	aa0003e1 	mov	x1, x0
   8176c:	3900401f 	strb	wzr, [x0, #16]
   81770:	52800142 	mov	w2, #0xa                   	// #10
   81774:	4e080d00 	dup	v0.2d, x8
   81778:	39410be8 	ldrb	w8, [sp, #66]
   8177c:	39004409 	strb	w9, [x0, #17]
   81780:	3900480a 	strb	w10, [x0, #18]
   81784:	b900141f 	str	wzr, [x0, #20]
   81788:	39004c08 	strb	w8, [x0, #19]
   8178c:	b0000068 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   81790:	3d800000 	str	q0, [x0]
   81794:	f9445108 	ldr	x8, [x8, #2208]
   81798:	91004100 	add	x0, x8, #0x10
   8179c:	94000023 	bl	81828 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE>
   817a0:	a9487bf3 	ldp	x19, x30, [sp, #128]
   817a4:	52800020 	mov	w0, #0x1                   	// #1
   817a8:	f9403bf4 	ldr	x20, [sp, #112]
   817ac:	910243ff 	add	sp, sp, #0x90
   817b0:	d65f03c0 	ret
   817b4:	52800400 	mov	w0, #0x20                  	// #32
   817b8:	52800201 	mov	w1, #0x10                  	// #16
   817bc:	94001711 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   817c0:	d4200020 	brk	#0x1
   817c4:	aa0003f3 	mov	x19, x0
   817c8:	910103e0 	add	x0, sp, #0x40
   817cc:	97ffffa9 	bl	81670 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   817d0:	aa1303e0 	mov	x0, x19
   817d4:	94000947 	bl	83cf0 <_Unwind_Resume>
   817d8:	d4200020 	brk	#0x1
   817dc:	aa0003f3 	mov	x19, x0
   817e0:	9100a3e0 	add	x0, sp, #0x28
   817e4:	97ffffa3 	bl	81670 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   817e8:	aa1303e0 	mov	x0, x19
   817ec:	94000941 	bl	83cf0 <_Unwind_Resume>
   817f0:	d4200020 	brk	#0x1
   817f4:	00000000 	.inst	0x00000000 ; undefined

00000000000817f8 <_ZN4core3ptr18real_drop_in_place17h55595b44f6fa430bE>:
   817f8:	d65f03c0 	ret
   817fc:	00000000 	.inst	0x00000000 ; undefined

0000000000081800 <_ZN4core3ptr18real_drop_in_place17h938e1828e30449a3E>:
   81800:	f9400008 	ldr	x8, [x0]
   81804:	c85f7d09 	ldxr	x9, [x8]
   81808:	f1000529 	subs	x9, x9, #0x1
   8180c:	c80afd09 	stlxr	w10, x9, [x8]
   81810:	35ffffaa 	cbnz	w10, 81804 <_ZN4core3ptr18real_drop_in_place17h938e1828e30449a3E+0x4>
   81814:	54000061 	b.ne	81820 <_ZN4core3ptr18real_drop_in_place17h938e1828e30449a3E+0x20>  // b.any
   81818:	d50339bf 	dmb	ishld
   8181c:	17ffff81 	b	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   81820:	d65f03c0 	ret
   81824:	00000000 	.inst	0x00000000 ; undefined

0000000000081828 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE>:
   81828:	d101c3ff 	sub	sp, sp, #0x70
   8182c:	a90553f5 	stp	x21, x20, [sp, #80]
   81830:	a9067bf3 	stp	x19, x30, [sp, #96]
   81834:	f9400015 	ldr	x21, [x0]
   81838:	aa0103f3 	mov	x19, x1
   8183c:	f90003e1 	str	x1, [sp]
   81840:	b9000be2 	str	w2, [sp, #8]
   81844:	b4000595 	cbz	x21, 818f4 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0xcc>
   81848:	52800200 	mov	w0, #0x10                  	// #16
   8184c:	52800101 	mov	w1, #0x8                   	// #8
   81850:	2a0203f4 	mov	w20, w2
   81854:	94000145 	bl	81d68 <__rust_alloc>
   81858:	b4000660 	cbz	x0, 81924 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0xfc>
   8185c:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   81860:	f9000013 	str	x19, [x0]
   81864:	911f0108 	add	x8, x8, #0x7c0
   81868:	b9000814 	str	w20, [x0, #8]
   8186c:	3900c3ff 	strb	wzr, [sp, #48]
   81870:	a903a3e0 	stp	x0, x8, [sp, #56]
   81874:	c85f7ea8 	ldxr	x8, [x21]
   81878:	91000509 	add	x9, x8, #0x1
   8187c:	c80a7ea9 	stxr	w10, x9, [x21]
   81880:	35ffffaa 	cbnz	w10, 81874 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0x4c>
   81884:	b7f80588 	tbnz	x8, #63, 81934 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0x10c>
   81888:	ad4187e0 	ldp	q0, q1, [sp, #48]
   8188c:	52800800 	mov	w0, #0x40                  	// #64
   81890:	52800201 	mov	w1, #0x10                  	// #16
   81894:	ad0087e0 	stp	q0, q1, [sp, #16]
   81898:	94000134 	bl	81d68 <__rust_alloc>
   8189c:	b4000500 	cbz	x0, 8193c <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0x114>
   818a0:	52800028 	mov	w8, #0x1                   	// #1
   818a4:	aa0003f3 	mov	x19, x0
   818a8:	ad4087e2 	ldp	q2, q1, [sp, #16]
   818ac:	f9001815 	str	x21, [x0, #48]
   818b0:	4e080d00 	dup	v0.2d, x8
   818b4:	52800201 	mov	w1, #0x10                  	// #16
   818b8:	ad008402 	stp	q2, q1, [x0, #16]
   818bc:	3d800000 	str	q0, [x0]
   818c0:	52800200 	mov	w0, #0x10                  	// #16
   818c4:	94000129 	bl	81d68 <__rust_alloc>
   818c8:	b4000420 	cbz	x0, 8194c <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0x124>
   818cc:	9100a2a8 	add	x8, x21, #0x28
   818d0:	a9004c1f 	stp	xzr, x19, [x0]
   818d4:	c85ffd09 	ldaxr	x9, [x8]
   818d8:	c80afd00 	stlxr	w10, x0, [x8]
   818dc:	35ffffca 	cbnz	w10, 818d4 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0xac>
   818e0:	f9000120 	str	x0, [x9]
   818e4:	a9467bf3 	ldp	x19, x30, [sp, #96]
   818e8:	a94553f5 	ldp	x21, x20, [sp, #80]
   818ec:	9101c3ff 	add	sp, sp, #0x70
   818f0:	d65f03c0 	ret
   818f4:	c85f7e68 	ldxr	x8, [x19]
   818f8:	f1000508 	subs	x8, x8, #0x1
   818fc:	c809fe68 	stlxr	w9, x8, [x19]
   81900:	35ffffa9 	cbnz	w9, 818f4 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0xcc>
   81904:	54000081 	b.ne	81914 <_ZN75_$LT$ruspiro_brain..brain..Brain$u20$as$u20$ruspiro_brain..brain..Spawn$GT$5spawn17h810253d5586284caE+0xec>  // b.any
   81908:	910003e0 	mov	x0, sp
   8190c:	d50339bf 	dmb	ishld
   81910:	97ffff44 	bl	81620 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17h4b104dfef6354cb2E>
   81914:	a9467bf3 	ldp	x19, x30, [sp, #96]
   81918:	a94553f5 	ldp	x21, x20, [sp, #80]
   8191c:	9101c3ff 	add	sp, sp, #0x70
   81920:	d65f03c0 	ret
   81924:	52800200 	mov	w0, #0x10                  	// #16
   81928:	52800101 	mov	w1, #0x8                   	// #8
   8192c:	940016b5 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   81930:	d4200020 	brk	#0x1
   81934:	d4200020 	brk	#0x1
   81938:	d4200020 	brk	#0x1
   8193c:	52800800 	mov	w0, #0x40                  	// #64
   81940:	52800201 	mov	w1, #0x10                  	// #16
   81944:	940016af 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   81948:	d4200020 	brk	#0x1
   8194c:	52800200 	mov	w0, #0x10                  	// #16
   81950:	52800201 	mov	w1, #0x10                  	// #16
   81954:	940016ab 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   81958:	d4200020 	brk	#0x1
   8195c:	00000000 	.inst	0x00000000 ; undefined

0000000000081960 <_ZN4core3ptr18real_drop_in_place17hc7ade7f3276eaf51E>:
   81960:	f9400008 	ldr	x8, [x0]
   81964:	085ffd1f 	ldaxrb	wzr, [x8]
   81968:	0809fd1f 	stlxrb	w9, wzr, [x8]
   8196c:	35ffffc9 	cbnz	w9, 81964 <_ZN4core3ptr18real_drop_in_place17hc7ade7f3276eaf51E+0x4>
   81970:	d65f03c0 	ret
   81974:	00000000 	.inst	0x00000000 ; undefined

0000000000081978 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>:
   81978:	f9400401 	ldr	x1, [x0, #8]
   8197c:	b4000081 	cbz	x1, 8198c <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE+0x14>
   81980:	f9400000 	ldr	x0, [x0]
   81984:	52800022 	mov	w2, #0x1                   	// #1
   81988:	140000fc 	b	81d78 <__rust_dealloc>
   8198c:	d65f03c0 	ret

0000000000081990 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   81990:	f9400008 	ldr	x8, [x0]
   81994:	aa0103e2 	mov	x2, x1
   81998:	f9400809 	ldr	x9, [x0, #16]
   8199c:	aa0803e0 	mov	x0, x8
   819a0:	aa0903e1 	mov	x1, x9
   819a4:	1400202b 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

00000000000819a8 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE>:
   819a8:	d10383ff 	sub	sp, sp, #0xe0
   819ac:	a90b5bf7 	stp	x23, x22, [sp, #176]
   819b0:	a90c53f5 	stp	x21, x20, [sp, #192]
   819b4:	a90d7bf3 	stp	x19, x30, [sp, #208]
   819b8:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   819bc:	52800035 	mov	w21, #0x1                   	// #1
   819c0:	91214108 	add	x8, x8, #0x850
   819c4:	aa0003f3 	mov	x19, x0
   819c8:	9101e3e0 	add	x0, sp, #0x78
   819cc:	aa0103f4 	mov	x20, x1
   819d0:	a908ffff 	stp	xzr, xzr, [sp, #136]
   819d4:	9100e3f7 	add	x23, sp, #0x38
   819d8:	a907d7e8 	stp	x8, x21, [sp, #120]
   819dc:	52800108 	mov	w8, #0x8                   	// #8
   819e0:	a909ffe8 	stp	x8, xzr, [sp, #152]
   819e4:	9100e3e8 	add	x8, sp, #0x38
   819e8:	94001690 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   819ec:	90000016 	adrp	x22, 81000 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE+0x248>
   819f0:	52800048 	mov	w8, #0x2                   	// #2
   819f4:	912642d6 	add	x22, x22, #0x990
   819f8:	a908ffff 	stp	xzr, xzr, [sp, #136]
   819fc:	a906dbf7 	stp	x23, x22, [sp, #104]
   81a00:	90000077 	adrp	x23, 8d000 <GCC_except_table3+0xa5c>
   81a04:	9120c2f7 	add	x23, x23, #0x830
   81a08:	a907a3f7 	stp	x23, x8, [sp, #120]
   81a0c:	9101a3e8 	add	x8, sp, #0x68
   81a10:	a909d7e8 	stp	x8, x21, [sp, #152]
   81a14:	910043e8 	add	x8, sp, #0x10
   81a18:	9101e3e0 	add	x0, sp, #0x78
   81a1c:	94001683 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   81a20:	f94023e1 	ldr	x1, [sp, #64]
   81a24:	b4000081 	cbz	x1, 81a34 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x8c>
   81a28:	f9401fe0 	ldr	x0, [sp, #56]
   81a2c:	52800022 	mov	w2, #0x1                   	// #1
   81a30:	940000d2 	bl	81d78 <__rust_dealloc>
   81a34:	a94123f5 	ldp	x21, x8, [sp, #16]
   81a38:	f94013e1 	ldr	x1, [sp, #32]
   81a3c:	a907a3f5 	stp	x21, x8, [sp, #120]
   81a40:	f90047e1 	str	x1, [sp, #136]
   81a44:	aa1503e0 	mov	x0, x21
   81a48:	9400160e 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81a4c:	f94043e1 	ldr	x1, [sp, #128]
   81a50:	b4000081 	cbz	x1, 81a60 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0xb8>
   81a54:	aa1503e0 	mov	x0, x21
   81a58:	52800022 	mov	w2, #0x1                   	// #1
   81a5c:	940000c7 	bl	81d78 <__rust_dealloc>
   81a60:	f9400268 	ldr	x8, [x19]
   81a64:	91004115 	add	x21, x8, #0x10
   81a68:	52800028 	mov	w8, #0x1                   	// #1
   81a6c:	085ffea9 	ldaxrb	w9, [x21]
   81a70:	080afea8 	stlxrb	w10, w8, [x21]
   81a74:	7100015f 	cmp	w10, #0x0
   81a78:	7a400920 	ccmp	w9, #0x0, #0x0, eq  // eq = none
   81a7c:	54ffff81 	b.ne	81a6c <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0xc4>  // b.any
   81a80:	b94006a8 	ldr	w8, [x21, #4]
   81a84:	b9400a69 	ldr	w9, [x19, #8]
   81a88:	f90007f5 	str	x21, [sp, #8]
   81a8c:	6b09011f 	cmp	w8, w9
   81a90:	54000442 	b.cs	81b18 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x170>  // b.hs, b.nlast
   81a94:	f9400280 	ldr	x0, [x20]
   81a98:	910043e8 	add	x8, sp, #0x10
   81a9c:	940004af 	bl	82d58 <_ZN76_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..clone..Clone$GT$5clone17h606f4dbd22395a91E>
   81aa0:	f9400268 	ldr	x8, [x19]
   81aa4:	c85f7d09 	ldxr	x9, [x8]
   81aa8:	9100052a 	add	x10, x9, #0x1
   81aac:	c80b7d0a 	stxr	w11, x10, [x8]
   81ab0:	35ffffab 	cbnz	w11, 81aa4 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0xfc>
   81ab4:	b7f80969 	tbnz	x9, #63, 81be0 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x238>
   81ab8:	9100e3e9 	add	x9, sp, #0x38
   81abc:	52800502 	mov	w2, #0x28                  	// #40
   81ac0:	91002120 	add	x0, x9, #0x8
   81ac4:	910043e1 	add	x1, sp, #0x10
   81ac8:	f9001fe8 	str	x8, [sp, #56]
   81acc:	9400212e 	bl	89f84 <memcpy>
   81ad0:	94001098 	bl	85d30 <_ZN13ruspiro_timer3now17h886221fe36e27c96E>
   81ad4:	52884808 	mov	w8, #0x4240                	// #16960
   81ad8:	9101e3ea 	add	x10, sp, #0x78
   81adc:	72a001e8 	movk	w8, #0xf, lsl #16
   81ae0:	9101a3e9 	add	x9, sp, #0x68
   81ae4:	8b080008 	add	x8, x0, x8
   81ae8:	91002140 	add	x0, x10, #0x8
   81aec:	9100e3e1 	add	x1, sp, #0x38
   81af0:	52800602 	mov	w2, #0x30                  	// #48
   81af4:	f9003fe9 	str	x9, [sp, #120]
   81af8:	f90037e8 	str	x8, [sp, #104]
   81afc:	94002122 	bl	89f84 <memcpy>
   81b00:	b0000060 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   81b04:	9101e3e1 	add	x1, sp, #0x78
   81b08:	f9443c00 	ldr	x0, [x0, #2168]
   81b0c:	97fffcab 	bl	80db8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hf1c6e0fe436b4d7eE>
   81b10:	2a1f03e0 	mov	w0, wzr
   81b14:	1400002b 	b	81bc0 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x218>
   81b18:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   81b1c:	52800029 	mov	w9, #0x1                   	// #1
   81b20:	91218108 	add	x8, x8, #0x860
   81b24:	5280010a 	mov	w10, #0x8                   	// #8
   81b28:	a908ffff 	stp	xzr, xzr, [sp, #136]
   81b2c:	a907a7e8 	stp	x8, x9, [sp, #120]
   81b30:	a909ffea 	stp	x10, xzr, [sp, #152]
   81b34:	9100e3e8 	add	x8, sp, #0x38
   81b38:	9101e3e0 	add	x0, sp, #0x78
   81b3c:	9400163b 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   81b40:	a943a3e9 	ldp	x9, x8, [sp, #56]
   81b44:	f94027ea 	ldr	x10, [sp, #72]
   81b48:	a908ffff 	stp	xzr, xzr, [sp, #136]
   81b4c:	a90123e9 	stp	x9, x8, [sp, #16]
   81b50:	910043e8 	add	x8, sp, #0x10
   81b54:	52800049 	mov	w9, #0x2                   	// #2
   81b58:	f90013ea 	str	x10, [sp, #32]
   81b5c:	a906dbe8 	stp	x8, x22, [sp, #104]
   81b60:	52800028 	mov	w8, #0x1                   	// #1
   81b64:	a907a7f7 	stp	x23, x9, [sp, #120]
   81b68:	9101a3e9 	add	x9, sp, #0x68
   81b6c:	a909a3e9 	stp	x9, x8, [sp, #152]
   81b70:	9100e3e8 	add	x8, sp, #0x38
   81b74:	9101e3e0 	add	x0, sp, #0x78
   81b78:	9400162c 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   81b7c:	f9400fe1 	ldr	x1, [sp, #24]
   81b80:	b4000081 	cbz	x1, 81b90 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x1e8>
   81b84:	f9400be0 	ldr	x0, [sp, #16]
   81b88:	52800022 	mov	w2, #0x1                   	// #1
   81b8c:	9400007b 	bl	81d78 <__rust_dealloc>
   81b90:	a943a3f3 	ldp	x19, x8, [sp, #56]
   81b94:	f94027e1 	ldr	x1, [sp, #72]
   81b98:	a907a3f3 	stp	x19, x8, [sp, #120]
   81b9c:	f90047e1 	str	x1, [sp, #136]
   81ba0:	aa1303e0 	mov	x0, x19
   81ba4:	940015b7 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   81ba8:	f94043e1 	ldr	x1, [sp, #128]
   81bac:	b4000081 	cbz	x1, 81bbc <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x214>
   81bb0:	aa1303e0 	mov	x0, x19
   81bb4:	52800022 	mov	w2, #0x1                   	// #1
   81bb8:	94000070 	bl	81d78 <__rust_dealloc>
   81bbc:	52800020 	mov	w0, #0x1                   	// #1
   81bc0:	085ffebf 	ldaxrb	wzr, [x21]
   81bc4:	0808febf 	stlxrb	w8, wzr, [x21]
   81bc8:	35ffffc8 	cbnz	w8, 81bc0 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x218>
   81bcc:	a94d7bf3 	ldp	x19, x30, [sp, #208]
   81bd0:	a94c53f5 	ldp	x21, x20, [sp, #192]
   81bd4:	a94b5bf7 	ldp	x23, x22, [sp, #176]
   81bd8:	910383ff 	add	sp, sp, #0xe0
   81bdc:	d65f03c0 	ret
   81be0:	d4200020 	brk	#0x1
   81be4:	d4200020 	brk	#0x1
   81be8:	aa0003f3 	mov	x19, x0
   81bec:	9101e3e0 	add	x0, sp, #0x78
   81bf0:	14000003 	b	81bfc <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x254>
   81bf4:	aa0003f3 	mov	x19, x0
   81bf8:	910043e0 	add	x0, sp, #0x10
   81bfc:	97ffff5f 	bl	81978 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81c00:	14000007 	b	81c1c <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x274>
   81c04:	aa0003f3 	mov	x19, x0
   81c08:	9100e3e0 	add	x0, sp, #0x38
   81c0c:	97fff943 	bl	80118 <_ZN4core3ptr18real_drop_in_place17hb42a928b7cfb09ffE.llvm.14843948732551940918>
   81c10:	14000003 	b	81c1c <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x274>
   81c14:	14000001 	b	81c18 <_ZN82_$LT$kernel..TimedCounterThought$u20$as$u20$ruspiro_brain..thoughts..Thinkable$GT$5think17hc93030918c531a0dE+0x270>
   81c18:	aa0003f3 	mov	x19, x0
   81c1c:	910023e0 	add	x0, sp, #0x8
   81c20:	97ffff50 	bl	81960 <_ZN4core3ptr18real_drop_in_place17hc7ade7f3276eaf51E>
   81c24:	aa1303e0 	mov	x0, x19
   81c28:	94000832 	bl	83cf0 <_Unwind_Resume>
   81c2c:	d4200020 	brk	#0x1
   81c30:	aa0003f3 	mov	x19, x0
   81c34:	9101e3e0 	add	x0, sp, #0x78
   81c38:	97ffff50 	bl	81978 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81c3c:	aa1303e0 	mov	x0, x19
   81c40:	9400082c 	bl	83cf0 <_Unwind_Resume>
   81c44:	d4200020 	brk	#0x1
   81c48:	aa0003f3 	mov	x19, x0
   81c4c:	9100e3e0 	add	x0, sp, #0x38
   81c50:	97ffff4a 	bl	81978 <_ZN4core3ptr18real_drop_in_place17hfbd399c3a3a141bdE>
   81c54:	aa1303e0 	mov	x0, x19
   81c58:	94000826 	bl	83cf0 <_Unwind_Resume>
   81c5c:	d4200020 	brk	#0x1

0000000000081c60 <awake_with>:
   81c60:	d10143ff 	sub	sp, sp, #0x50
   81c64:	f9001bf4 	str	x20, [sp, #48]
   81c68:	a9047bf3 	stp	x19, x30, [sp, #64]
   81c6c:	b0000068 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   81c70:	f9445108 	ldr	x8, [x8, #2208]
   81c74:	f9400914 	ldr	x20, [x8, #16]
   81c78:	b40005d4 	cbz	x20, 81d30 <awake_with+0xd0>
   81c7c:	c85f7e88 	ldxr	x8, [x20]
   81c80:	91000509 	add	x9, x8, #0x1
   81c84:	c80a7e89 	stxr	w10, x9, [x20]
   81c88:	35ffffaa 	cbnz	w10, 81c7c <awake_with+0x1c>
   81c8c:	b7f805a8 	tbnz	x8, #63, 81d40 <awake_with+0xe0>
   81c90:	b9403be8 	ldr	w8, [sp, #56]
   81c94:	52800800 	mov	w0, #0x40                  	// #64
   81c98:	79407be9 	ldrh	w9, [sp, #60]
   81c9c:	52800201 	mov	w1, #0x10                  	// #16
   81ca0:	3940fbea 	ldrb	w10, [sp, #62]
   81ca4:	b9002be8 	str	w8, [sp, #40]
   81ca8:	79005be9 	strh	w9, [sp, #44]
   81cac:	3900bbea 	strb	w10, [sp, #46]
   81cb0:	9400002e 	bl	81d68 <__rust_alloc>
   81cb4:	b40004a0 	cbz	x0, 81d48 <awake_with+0xe8>
   81cb8:	52800028 	mov	w8, #0x1                   	// #1
   81cbc:	aa0003f3 	mov	x19, x0
   81cc0:	91004400 	add	x0, x0, #0x11
   81cc4:	9100a3e1 	add	x1, sp, #0x28
   81cc8:	528000e2 	mov	w2, #0x7                   	// #7
   81ccc:	4e080d00 	dup	v0.2d, x8
   81cd0:	3900427f 	strb	wzr, [x19, #16]
   81cd4:	3d8003e0 	str	q0, [sp]
   81cd8:	3d800260 	str	q0, [x19]
   81cdc:	940020aa 	bl	89f84 <memcpy>
   81ce0:	90000068 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   81ce4:	3dc003e0 	ldr	q0, [sp]
   81ce8:	911fe108 	add	x8, x8, #0x7f8
   81cec:	52800200 	mov	w0, #0x10                  	// #16
   81cf0:	52800201 	mov	w1, #0x10                  	// #16
   81cf4:	4e181d00 	mov	v0.d[1], x8
   81cf8:	3d8007e0 	str	q0, [sp, #16]
   81cfc:	f9400fe8 	ldr	x8, [sp, #24]
   81d00:	f9001268 	str	x8, [x19, #32]
   81d04:	f9400be8 	ldr	x8, [sp, #16]
   81d08:	f9001a74 	str	x20, [x19, #48]
   81d0c:	f9000e68 	str	x8, [x19, #24]
   81d10:	94000016 	bl	81d68 <__rust_alloc>
   81d14:	b4000220 	cbz	x0, 81d58 <awake_with+0xf8>
   81d18:	9100a288 	add	x8, x20, #0x28
   81d1c:	a9004c1f 	stp	xzr, x19, [x0]
   81d20:	c85ffd09 	ldaxr	x9, [x8]
   81d24:	c80afd00 	stlxr	w10, x0, [x8]
   81d28:	35ffffca 	cbnz	w10, 81d20 <awake_with+0xc0>
   81d2c:	f9000120 	str	x0, [x9]
   81d30:	a9447bf3 	ldp	x19, x30, [sp, #64]
   81d34:	f9401bf4 	ldr	x20, [sp, #48]
   81d38:	910143ff 	add	sp, sp, #0x50
   81d3c:	d65f03c0 	ret
   81d40:	d4200020 	brk	#0x1
   81d44:	d4200020 	brk	#0x1
   81d48:	52800800 	mov	w0, #0x40                  	// #64
   81d4c:	52800201 	mov	w1, #0x10                  	// #16
   81d50:	940015ac 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   81d54:	d4200020 	brk	#0x1
   81d58:	52800200 	mov	w0, #0x10                  	// #16
   81d5c:	52800201 	mov	w1, #0x10                  	// #16
   81d60:	940015a8 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   81d64:	d4200020 	brk	#0x1

0000000000081d68 <__rust_alloc>:
   81d68:	f81f0ffe 	str	x30, [sp, #-16]!
   81d6c:	9400000d 	bl	81da0 <__rg_alloc>
   81d70:	f84107fe 	ldr	x30, [sp], #16
   81d74:	d65f03c0 	ret

0000000000081d78 <__rust_dealloc>:
   81d78:	f81f0ffe 	str	x30, [sp, #-16]!
   81d7c:	9400000b 	bl	81da8 <__rg_dealloc>
   81d80:	f84107fe 	ldr	x30, [sp], #16
   81d84:	d65f03c0 	ret

0000000000081d88 <__rust_realloc>:
   81d88:	f81f0ffe 	str	x30, [sp, #-16]!
   81d8c:	9400008b 	bl	81fb8 <__rg_realloc>
   81d90:	f84107fe 	ldr	x30, [sp], #16
   81d94:	d65f03c0 	ret

0000000000081d98 <rust_oom>:
   81d98:	14000000 	b	81d98 <rust_oom>
   81d9c:	00000000 	.inst	0x00000000 ; undefined

0000000000081da0 <__rg_alloc>:
   81da0:	1400011c 	b	82210 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E>
   81da4:	00000000 	.inst	0x00000000 ; undefined

0000000000081da8 <__rg_dealloc>:
   81da8:	f81f0ffe 	str	x30, [sp, #-16]!
   81dac:	f85f8008 	ldur	x8, [x0, #-8]
   81db0:	5297dde9 	mov	w9, #0xbeef                	// #48879
   81db4:	72bbd5a9 	movk	w9, #0xdead, lsl #16
   81db8:	39400d0a 	ldrb	w10, [x8, #3]
   81dbc:	3940090b 	ldrb	w11, [x8, #2]
   81dc0:	3940050c 	ldrb	w12, [x8, #1]
   81dc4:	3940010d 	ldrb	w13, [x8]
   81dc8:	33181d4b 	bfi	w11, w10, #8, #8
   81dcc:	33181d8d 	bfi	w13, w12, #8, #8
   81dd0:	33103d6d 	bfi	w13, w11, #16, #16
   81dd4:	6b0901bf 	cmp	w13, w9
   81dd8:	54000e01 	b.ne	81f98 <__rg_dealloc+0x1f0>  // b.any
   81ddc:	aa0803e9 	mov	x9, x8
   81de0:	39000d1f 	strb	wzr, [x8, #3]
   81de4:	3900091f 	strb	wzr, [x8, #2]
   81de8:	3900051f 	strb	wzr, [x8, #1]
   81dec:	3900011f 	strb	wzr, [x8]
   81df0:	3940350a 	ldrb	w10, [x8, #13]
   81df4:	3840cd2b 	ldrb	w11, [x9, #12]!
   81df8:	b3781d4b 	bfi	x11, x10, #8, #8
   81dfc:	d000006a 	adrp	x10, 8f000 <_ZN17ruspiro_allocator6memory10HEAP_START17had4301f3f1bae9a9E.llvm.13491129622553900858>
   81e00:	39400d2c 	ldrb	w12, [x9, #3]
   81e04:	9100014a 	add	x10, x10, #0x0
   81e08:	3940092d 	ldrb	w13, [x9, #2]
   81e0c:	38404d2e 	ldrb	w14, [x9, #4]!
   81e10:	39404510 	ldrb	w16, [x8, #17]
   81e14:	b3781d8d 	bfi	x13, x12, #8, #8
   81e18:	39400d2f 	ldrb	w15, [x9, #3]
   81e1c:	39400929 	ldrb	w9, [x9, #2]
   81e20:	33181e0e 	bfi	w14, w16, #8, #8
   81e24:	b3703dab 	bfi	x11, x13, #16, #16
   81e28:	33181de9 	bfi	w9, w15, #8, #8
   81e2c:	33103d2e 	bfi	w14, w9, #16, #16
   81e30:	b3607dcb 	bfi	x11, x14, #32, #32
   81e34:	8b080169 	add	x9, x11, x8
   81e38:	c85ffd4b 	ldaxr	x11, [x10]
   81e3c:	eb09017f 	cmp	x11, x9
   81e40:	54000081 	b.ne	81e50 <__rg_dealloc+0xa8>  // b.any
   81e44:	c80bfd48 	stlxr	w11, x8, [x10]
   81e48:	35ffff8b 	cbnz	w11, 81e38 <__rg_dealloc+0x90>
   81e4c:	14000047 	b	81f68 <__rg_dealloc+0x1c0>
   81e50:	d0000069 	adrp	x9, 8f000 <_ZN17ruspiro_allocator6memory10HEAP_START17had4301f3f1bae9a9E.llvm.13491129622553900858>
   81e54:	d5033f5f 	clrex
   81e58:	91002129 	add	x9, x9, #0x8
   81e5c:	14000004 	b	81e6c <__rg_dealloc+0xc4>
   81e60:	d5033f5f 	clrex
   81e64:	eb0b015f 	cmp	x10, x11
   81e68:	54000800 	b.eq	81f68 <__rg_dealloc+0x1c0>  // b.none
   81e6c:	aa0803ea 	mov	x10, x8
   81e70:	38404d41 	ldrb	w1, [x10, #4]!
   81e74:	aa0a03ec 	mov	x12, x10
   81e78:	39400d4b 	ldrb	w11, [x10, #3]
   81e7c:	3940094d 	ldrb	w13, [x10, #2]
   81e80:	3940054e 	ldrb	w14, [x10, #1]
   81e84:	38404d8f 	ldrb	w15, [x12, #4]!
   81e88:	3940154a 	ldrb	w10, [x10, #5]
   81e8c:	b3781d6d 	bfi	x13, x11, #8, #8
   81e90:	b3781dc1 	bfi	x1, x14, #8, #8
   81e94:	39400d90 	ldrb	w16, [x12, #3]
   81e98:	b3703da1 	bfi	x1, x13, #16, #16
   81e9c:	3940098c 	ldrb	w12, [x12, #2]
   81ea0:	33181d4f 	bfi	w15, w10, #8, #8
   81ea4:	33181e0c 	bfi	w12, w16, #8, #8
   81ea8:	33103d8f 	bfi	w15, w12, #16, #16
   81eac:	b3607de1 	bfi	x1, x15, #32, #32
   81eb0:	f1003c3f 	cmp	x1, #0xf
   81eb4:	540005e8 	b.hi	81f70 <__rg_dealloc+0x1c8>  // b.pmore
   81eb8:	8b010d2a 	add	x10, x9, x1, lsl #3
   81ebc:	aa0803eb 	mov	x11, x8
   81ec0:	c8dffd4a 	ldar	x10, [x10]
   81ec4:	38404d61 	ldrb	w1, [x11, #4]!
   81ec8:	d368fd4c 	lsr	x12, x10, #40
   81ecc:	d358fd4e 	lsr	x14, x10, #24
   81ed0:	aa0b03ed 	mov	x13, x11
   81ed4:	d348fd4f 	lsr	x15, x10, #8
   81ed8:	d350fd50 	lsr	x16, x10, #16
   81edc:	3900756c 	strb	w12, [x11, #29]
   81ee0:	d360fd4c 	lsr	x12, x10, #32
   81ee4:	3900656f 	strb	w15, [x11, #25]
   81ee8:	38018daa 	strb	w10, [x13, #24]!
   81eec:	d378fd4f 	lsr	x15, x10, #56
   81ef0:	39000dae 	strb	w14, [x13, #3]
   81ef4:	d370fd4e 	lsr	x14, x10, #48
   81ef8:	390009b0 	strb	w16, [x13, #2]
   81efc:	38004dac 	strb	w12, [x13, #4]!
   81f00:	aa0b03ec 	mov	x12, x11
   81f04:	39000daf 	strb	w15, [x13, #3]
   81f08:	390009ae 	strb	w14, [x13, #2]
   81f0c:	39400d6d 	ldrb	w13, [x11, #3]
   81f10:	3940096e 	ldrb	w14, [x11, #2]
   81f14:	3940056f 	ldrb	w15, [x11, #1]
   81f18:	38404d90 	ldrb	w16, [x12, #4]!
   81f1c:	3940156b 	ldrb	w11, [x11, #5]
   81f20:	b3781dae 	bfi	x14, x13, #8, #8
   81f24:	b3781de1 	bfi	x1, x15, #8, #8
   81f28:	39400d91 	ldrb	w17, [x12, #3]
   81f2c:	b3703dc1 	bfi	x1, x14, #16, #16
   81f30:	3940098c 	ldrb	w12, [x12, #2]
   81f34:	33181d70 	bfi	w16, w11, #8, #8
   81f38:	33181e2c 	bfi	w12, w17, #8, #8
   81f3c:	33103d90 	bfi	w16, w12, #16, #16
   81f40:	b3607e01 	bfi	x1, x16, #32, #32
   81f44:	f1003c3f 	cmp	x1, #0xf
   81f48:	540001e8 	b.hi	81f84 <__rg_dealloc+0x1dc>  // b.pmore
   81f4c:	8b010d2c 	add	x12, x9, x1, lsl #3
   81f50:	c85ffd8b 	ldaxr	x11, [x12]
   81f54:	eb0a017f 	cmp	x11, x10
   81f58:	54fff841 	b.ne	81e60 <__rg_dealloc+0xb8>  // b.any
   81f5c:	c80dfd88 	stlxr	w13, x8, [x12]
   81f60:	35ffff8d 	cbnz	w13, 81f50 <__rg_dealloc+0x1a8>
   81f64:	17ffffc0 	b	81e64 <__rg_dealloc+0xbc>
   81f68:	f84107fe 	ldr	x30, [sp], #16
   81f6c:	d65f03c0 	ret
   81f70:	90000060 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   81f74:	91240000 	add	x0, x0, #0x900
   81f78:	52800202 	mov	w2, #0x10                  	// #16
   81f7c:	94001f9c 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   81f80:	d4200020 	brk	#0x1
   81f84:	90000060 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   81f88:	91246000 	add	x0, x0, #0x918
   81f8c:	52800202 	mov	w2, #0x10                  	// #16
   81f90:	94001f97 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   81f94:	d4200020 	brk	#0x1
   81f98:	b0000040 	adrp	x0, 8a000 <memmove>
   81f9c:	90000062 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   81fa0:	910ad400 	add	x0, x0, #0x2b5
   81fa4:	528005c1 	mov	w1, #0x2e                  	// #46
   81fa8:	9123a042 	add	x2, x2, #0x8e8
   81fac:	94001f83 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   81fb0:	d4200020 	brk	#0x1
   81fb4:	00000000 	.inst	0x00000000 ; undefined

0000000000081fb8 <__rg_realloc>:
   81fb8:	f81d0ff6 	str	x22, [sp, #-48]!
   81fbc:	a90153f5 	stp	x21, x20, [sp, #16]
   81fc0:	a9027bf3 	stp	x19, x30, [sp, #32]
   81fc4:	aa0103f6 	mov	x22, x1
   81fc8:	aa0003f4 	mov	x20, x0
   81fcc:	aa0303e0 	mov	x0, x3
   81fd0:	aa0203e1 	mov	x1, x2
   81fd4:	aa0303f5 	mov	x21, x3
   81fd8:	9400008e 	bl	82210 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E>
   81fdc:	aa0003f3 	mov	x19, x0
   81fe0:	b4000ea0 	cbz	x0, 821b4 <__rg_realloc+0x1fc>
   81fe4:	eb1502df 	cmp	x22, x21
   81fe8:	aa1303e0 	mov	x0, x19
   81fec:	9a9682a2 	csel	x2, x21, x22, hi  // hi = pmore
   81ff0:	aa1403e1 	mov	x1, x20
   81ff4:	94001fe4 	bl	89f84 <memcpy>
   81ff8:	f85f8288 	ldur	x8, [x20, #-8]
   81ffc:	39400d09 	ldrb	w9, [x8, #3]
   82000:	3940090a 	ldrb	w10, [x8, #2]
   82004:	3940050b 	ldrb	w11, [x8, #1]
   82008:	3940010c 	ldrb	w12, [x8]
   8200c:	33181d2a 	bfi	w10, w9, #8, #8
   82010:	5297dde9 	mov	w9, #0xbeef                	// #48879
   82014:	72bbd5a9 	movk	w9, #0xdead, lsl #16
   82018:	33181d6c 	bfi	w12, w11, #8, #8
   8201c:	33103d4c 	bfi	w12, w10, #16, #16
   82020:	6b09019f 	cmp	w12, w9
   82024:	54000e61 	b.ne	821f0 <__rg_realloc+0x238>  // b.any
   82028:	aa0803e9 	mov	x9, x8
   8202c:	39000d1f 	strb	wzr, [x8, #3]
   82030:	3900091f 	strb	wzr, [x8, #2]
   82034:	3900051f 	strb	wzr, [x8, #1]
   82038:	3900011f 	strb	wzr, [x8]
   8203c:	3940350a 	ldrb	w10, [x8, #13]
   82040:	3840cd2b 	ldrb	w11, [x9, #12]!
   82044:	b3781d4b 	bfi	x11, x10, #8, #8
   82048:	b000006a 	adrp	x10, 8f000 <_ZN17ruspiro_allocator6memory10HEAP_START17had4301f3f1bae9a9E.llvm.13491129622553900858>
   8204c:	39400d2c 	ldrb	w12, [x9, #3]
   82050:	9100014a 	add	x10, x10, #0x0
   82054:	3940092d 	ldrb	w13, [x9, #2]
   82058:	38404d2e 	ldrb	w14, [x9, #4]!
   8205c:	39404510 	ldrb	w16, [x8, #17]
   82060:	b3781d8d 	bfi	x13, x12, #8, #8
   82064:	39400d2f 	ldrb	w15, [x9, #3]
   82068:	39400929 	ldrb	w9, [x9, #2]
   8206c:	33181e0e 	bfi	w14, w16, #8, #8
   82070:	b3703dab 	bfi	x11, x13, #16, #16
   82074:	33181de9 	bfi	w9, w15, #8, #8
   82078:	33103d2e 	bfi	w14, w9, #16, #16
   8207c:	b3607dcb 	bfi	x11, x14, #32, #32
   82080:	8b080169 	add	x9, x11, x8
   82084:	c85ffd4b 	ldaxr	x11, [x10]
   82088:	eb09017f 	cmp	x11, x9
   8208c:	54000081 	b.ne	8209c <__rg_realloc+0xe4>  // b.any
   82090:	c80bfd48 	stlxr	w11, x8, [x10]
   82094:	35ffff8b 	cbnz	w11, 82084 <__rg_realloc+0xcc>
   82098:	14000047 	b	821b4 <__rg_realloc+0x1fc>
   8209c:	b0000069 	adrp	x9, 8f000 <_ZN17ruspiro_allocator6memory10HEAP_START17had4301f3f1bae9a9E.llvm.13491129622553900858>
   820a0:	d5033f5f 	clrex
   820a4:	91002129 	add	x9, x9, #0x8
   820a8:	14000004 	b	820b8 <__rg_realloc+0x100>
   820ac:	d5033f5f 	clrex
   820b0:	eb0b015f 	cmp	x10, x11
   820b4:	54000800 	b.eq	821b4 <__rg_realloc+0x1fc>  // b.none
   820b8:	aa0803ea 	mov	x10, x8
   820bc:	38404d41 	ldrb	w1, [x10, #4]!
   820c0:	aa0a03ec 	mov	x12, x10
   820c4:	39400d4b 	ldrb	w11, [x10, #3]
   820c8:	3940094d 	ldrb	w13, [x10, #2]
   820cc:	3940054e 	ldrb	w14, [x10, #1]
   820d0:	38404d8f 	ldrb	w15, [x12, #4]!
   820d4:	3940154a 	ldrb	w10, [x10, #5]
   820d8:	b3781d6d 	bfi	x13, x11, #8, #8
   820dc:	b3781dc1 	bfi	x1, x14, #8, #8
   820e0:	39400d90 	ldrb	w16, [x12, #3]
   820e4:	b3703da1 	bfi	x1, x13, #16, #16
   820e8:	3940098c 	ldrb	w12, [x12, #2]
   820ec:	33181d4f 	bfi	w15, w10, #8, #8
   820f0:	33181e0c 	bfi	w12, w16, #8, #8
   820f4:	33103d8f 	bfi	w15, w12, #16, #16
   820f8:	b3607de1 	bfi	x1, x15, #32, #32
   820fc:	f1003c3f 	cmp	x1, #0xf
   82100:	54000648 	b.hi	821c8 <__rg_realloc+0x210>  // b.pmore
   82104:	8b010d2a 	add	x10, x9, x1, lsl #3
   82108:	aa0803eb 	mov	x11, x8
   8210c:	c8dffd4a 	ldar	x10, [x10]
   82110:	38404d61 	ldrb	w1, [x11, #4]!
   82114:	d368fd4c 	lsr	x12, x10, #40
   82118:	d358fd4e 	lsr	x14, x10, #24
   8211c:	aa0b03ed 	mov	x13, x11
   82120:	d348fd4f 	lsr	x15, x10, #8
   82124:	d350fd50 	lsr	x16, x10, #16
   82128:	3900756c 	strb	w12, [x11, #29]
   8212c:	d360fd4c 	lsr	x12, x10, #32
   82130:	3900656f 	strb	w15, [x11, #25]
   82134:	38018daa 	strb	w10, [x13, #24]!
   82138:	d378fd4f 	lsr	x15, x10, #56
   8213c:	39000dae 	strb	w14, [x13, #3]
   82140:	d370fd4e 	lsr	x14, x10, #48
   82144:	390009b0 	strb	w16, [x13, #2]
   82148:	38004dac 	strb	w12, [x13, #4]!
   8214c:	aa0b03ec 	mov	x12, x11
   82150:	39000daf 	strb	w15, [x13, #3]
   82154:	390009ae 	strb	w14, [x13, #2]
   82158:	39400d6d 	ldrb	w13, [x11, #3]
   8215c:	3940096e 	ldrb	w14, [x11, #2]
   82160:	3940056f 	ldrb	w15, [x11, #1]
   82164:	38404d90 	ldrb	w16, [x12, #4]!
   82168:	3940156b 	ldrb	w11, [x11, #5]
   8216c:	b3781dae 	bfi	x14, x13, #8, #8
   82170:	b3781de1 	bfi	x1, x15, #8, #8
   82174:	39400d91 	ldrb	w17, [x12, #3]
   82178:	b3703dc1 	bfi	x1, x14, #16, #16
   8217c:	3940098c 	ldrb	w12, [x12, #2]
   82180:	33181d70 	bfi	w16, w11, #8, #8
   82184:	33181e2c 	bfi	w12, w17, #8, #8
   82188:	33103d90 	bfi	w16, w12, #16, #16
   8218c:	b3607e01 	bfi	x1, x16, #32, #32
   82190:	f1003c3f 	cmp	x1, #0xf
   82194:	54000248 	b.hi	821dc <__rg_realloc+0x224>  // b.pmore
   82198:	8b010d2c 	add	x12, x9, x1, lsl #3
   8219c:	c85ffd8b 	ldaxr	x11, [x12]
   821a0:	eb0a017f 	cmp	x11, x10
   821a4:	54fff841 	b.ne	820ac <__rg_realloc+0xf4>  // b.any
   821a8:	c80dfd88 	stlxr	w13, x8, [x12]
   821ac:	35ffff8d 	cbnz	w13, 8219c <__rg_realloc+0x1e4>
   821b0:	17ffffc0 	b	820b0 <__rg_realloc+0xf8>
   821b4:	aa1303e0 	mov	x0, x19
   821b8:	a9427bf3 	ldp	x19, x30, [sp, #32]
   821bc:	a94153f5 	ldp	x21, x20, [sp, #16]
   821c0:	f84307f6 	ldr	x22, [sp], #48
   821c4:	d65f03c0 	ret
   821c8:	f0000040 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   821cc:	91240000 	add	x0, x0, #0x900
   821d0:	52800202 	mov	w2, #0x10                  	// #16
   821d4:	94001f06 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   821d8:	d4200020 	brk	#0x1
   821dc:	f0000040 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   821e0:	91246000 	add	x0, x0, #0x918
   821e4:	52800202 	mov	w2, #0x10                  	// #16
   821e8:	94001f01 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   821ec:	d4200020 	brk	#0x1
   821f0:	90000040 	adrp	x0, 8a000 <memmove>
   821f4:	f0000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   821f8:	910ad400 	add	x0, x0, #0x2b5
   821fc:	528005c1 	mov	w1, #0x2e                  	// #46
   82200:	9123a042 	add	x2, x2, #0x8e8
   82204:	94001eed 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   82208:	d4200020 	brk	#0x1
   8220c:	00000000 	.inst	0x00000000 ; undefined

0000000000082210 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E>:
   82210:	d10243ff 	sub	sp, sp, #0x90
   82214:	a90753f5 	stp	x21, x20, [sp, #112]
   82218:	a9087bf3 	stp	x19, x30, [sp, #128]
   8221c:	90000068 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   82220:	b000006c 	adrp	x12, 8f000 <_ZN17ruspiro_allocator6memory10HEAP_START17had4301f3f1bae9a9E.llvm.13491129622553900858>
   82224:	9100018c 	add	x12, x12, #0x0
   82228:	f9446d08 	ldr	x8, [x8, #2264]
   8222c:	c85ffd89 	ldaxr	x9, [x12]
   82230:	b5000089 	cbnz	x9, 82240 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x30>
   82234:	c809fd88 	stlxr	w9, x8, [x12]
   82238:	35ffffa9 	cbnz	w9, 8222c <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x1c>
   8223c:	14000002 	b	82244 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x34>
   82240:	d5033f5f 	clrex
   82244:	5280002d 	mov	w13, #0x1                   	// #1
   82248:	9000004f 	adrp	x15, 8a000 <memmove>
   8224c:	9ac121a8 	lsl	x8, x13, x1
   82250:	9100f109 	add	x9, x8, #0x3c
   82254:	aa1f03ee 	mov	x14, xzr
   82258:	8b00012a 	add	x10, x9, x0
   8225c:	528001eb 	mov	w11, #0xf                   	// #15
   82260:	910681ef 	add	x15, x15, #0x1a0
   82264:	f100f1df 	cmp	x14, #0x3c
   82268:	54000160 	b.eq	82294 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x84>  // b.none
   8226c:	b86e69f0 	ldr	w16, [x15, x14]
   82270:	910011ce 	add	x14, x14, #0x4
   82274:	d10005ad 	sub	x13, x13, #0x1
   82278:	eb10015f 	cmp	x10, x16
   8227c:	54ffff42 	b.cs	82264 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x54>  // b.hs, b.nlast
   82280:	5280004a 	mov	w10, #0x2                   	// #2
   82284:	1a9f354a 	csinc	w10, w10, wzr, cc  // cc = lo, ul, last
   82288:	9240014a 	and	x10, x10, #0x1
   8228c:	cb0d014b 	sub	x11, x10, x13
   82290:	b86b79ea 	ldr	w10, [x15, x11, lsl #2]
   82294:	b000006d 	adrp	x13, 8f000 <_ZN17ruspiro_allocator6memory10HEAP_START17had4301f3f1bae9a9E.llvm.13491129622553900858>
   82298:	910021ad 	add	x13, x13, #0x8
   8229c:	8b0b0dad 	add	x13, x13, x11, lsl #3
   822a0:	c8dffdb3 	ldar	x19, [x13]
   822a4:	b4000333 	cbz	x19, 82308 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0xf8>
   822a8:	aa1303ef 	mov	x15, x19
   822ac:	3841cdee 	ldrb	w14, [x15, #28]!
   822b0:	aa0f03f1 	mov	x17, x15
   822b4:	39400df0 	ldrb	w16, [x15, #3]
   822b8:	394009f2 	ldrb	w18, [x15, #2]
   822bc:	394005e0 	ldrb	w0, [x15, #1]
   822c0:	38404e22 	ldrb	w2, [x17, #4]!
   822c4:	394015ef 	ldrb	w15, [x15, #5]
   822c8:	b3781e12 	bfi	x18, x16, #8, #8
   822cc:	b3781c0e 	bfi	x14, x0, #8, #8
   822d0:	39400e23 	ldrb	w3, [x17, #3]
   822d4:	b3703e4e 	bfi	x14, x18, #16, #16
   822d8:	39400a31 	ldrb	w17, [x17, #2]
   822dc:	33181de2 	bfi	w2, w15, #8, #8
   822e0:	33181c71 	bfi	w17, w3, #8, #8
   822e4:	33103e22 	bfi	w2, w17, #16, #16
   822e8:	b3607c4e 	bfi	x14, x2, #32, #32
   822ec:	c85ffdaf 	ldaxr	x15, [x13]
   822f0:	eb1301ff 	cmp	x15, x19
   822f4:	54000081 	b.ne	82304 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0xf4>  // b.any
   822f8:	c80ffdae 	stlxr	w15, x14, [x13]
   822fc:	35ffff8f 	cbnz	w15, 822ec <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0xdc>
   82300:	14000006 	b	82318 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x108>
   82304:	d5033f5f 	clrex
   82308:	c85ffd93 	ldaxr	x19, [x12]
   8230c:	8b0a026d 	add	x13, x19, x10
   82310:	c80efd8d 	stlxr	w14, x13, [x12]
   82314:	35ffffae 	cbnz	w14, 82308 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0xf8>
   82318:	d358fe6c 	lsr	x12, x19, #24
   8231c:	f100f99f 	cmp	x12, #0x3e
   82320:	f90003f3 	str	x19, [sp]
   82324:	54000f08 	b.hi	82504 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x2f4>  // b.pmore
   82328:	52801bcc 	mov	w12, #0xde                  	// #222
   8232c:	528015ad 	mov	w13, #0xad                  	// #173
   82330:	528017ce 	mov	w14, #0xbe                  	// #190
   82334:	52801def 	mov	w15, #0xef                  	// #239
   82338:	91007260 	add	x0, x19, #0x1c
   8233c:	52800202 	mov	w2, #0x10                  	// #16
   82340:	39000e6c 	strb	w12, [x19, #3]
   82344:	aa1303ec 	mov	x12, x19
   82348:	39000a6d 	strb	w13, [x19, #2]
   8234c:	d368fd6d 	lsr	x13, x11, #40
   82350:	3900066e 	strb	w14, [x19, #1]
   82354:	d358fd6e 	lsr	x14, x11, #24
   82358:	3900026f 	strb	w15, [x19]
   8235c:	aa1303ef 	mov	x15, x19
   82360:	38004d8b 	strb	w11, [x12, #4]!
   82364:	3900266d 	strb	w13, [x19, #9]
   82368:	d350fd6d 	lsr	x13, x11, #16
   8236c:	39000d8e 	strb	w14, [x12, #3]
   82370:	d348fd6e 	lsr	x14, x11, #8
   82374:	3900098d 	strb	w13, [x12, #2]
   82378:	d360fd6d 	lsr	x13, x11, #32
   8237c:	3900166e 	strb	w14, [x19, #5]
   82380:	d378fd6e 	lsr	x14, x11, #56
   82384:	d370fd6b 	lsr	x11, x11, #48
   82388:	8b090269 	add	x9, x19, x9
   8238c:	38004d8d 	strb	w13, [x12, #4]!
   82390:	39000d8e 	strb	w14, [x12, #3]
   82394:	d350fd4d 	lsr	x13, x10, #16
   82398:	3800cdea 	strb	w10, [x15, #12]!
   8239c:	3900098b 	strb	w11, [x12, #2]
   823a0:	d358fd4b 	lsr	x11, x10, #24
   823a4:	d368fd4c 	lsr	x12, x10, #40
   823a8:	390009ed 	strb	w13, [x15, #2]
   823ac:	39000deb 	strb	w11, [x15, #3]
   823b0:	d360fd4b 	lsr	x11, x10, #32
   823b4:	3900466c 	strb	w12, [x19, #17]
   823b8:	aa1303ec 	mov	x12, x19
   823bc:	38004deb 	strb	w11, [x15, #4]!
   823c0:	d378fd4b 	lsr	x11, x10, #56
   823c4:	d348fd4d 	lsr	x13, x10, #8
   823c8:	d370fd4a 	lsr	x10, x10, #48
   823cc:	cb0803e8 	neg	x8, x8
   823d0:	39000deb 	strb	w11, [x15, #3]
   823d4:	d368fc2b 	lsr	x11, x1, #40
   823d8:	3900366d 	strb	w13, [x19, #13]
   823dc:	12b82014 	mov	w20, #0x3effffff            	// #1056964607
   823e0:	38014d81 	strb	w1, [x12, #20]!
   823e4:	390009ea 	strb	w10, [x15, #2]
   823e8:	d358fc2a 	lsr	x10, x1, #24
   823ec:	3900666b 	strb	w11, [x19, #25]
   823f0:	d350fc2b 	lsr	x11, x1, #16
   823f4:	39000d8a 	strb	w10, [x12, #3]
   823f8:	d348fc2a 	lsr	x10, x1, #8
   823fc:	3900098b 	strb	w11, [x12, #2]
   82400:	d360fc2b 	lsr	x11, x1, #32
   82404:	3900566a 	strb	w10, [x19, #21]
   82408:	d378fc2a 	lsr	x10, x1, #56
   8240c:	38004d8b 	strb	w11, [x12, #4]!
   82410:	d370fc2b 	lsr	x11, x1, #48
   82414:	2a1f03e1 	mov	w1, wzr
   82418:	8a080135 	and	x21, x9, x8
   8241c:	39000d8a 	strb	w10, [x12, #3]
   82420:	3900098b 	strb	w11, [x12, #2]
   82424:	94001f21 	bl	8a0a8 <memset>
   82428:	aa1303e8 	mov	x8, x19
   8242c:	d348fea9 	lsr	x9, x21, #8
   82430:	d360feaa 	lsr	x10, x21, #32
   82434:	d368feac 	lsr	x12, x21, #40
   82438:	3802cd15 	strb	w21, [x8, #44]!
   8243c:	aa0803ed 	mov	x13, x8
   82440:	aa0803eb 	mov	x11, x8
   82444:	39000509 	strb	w9, [x8, #1]
   82448:	d350fea9 	lsr	x9, x21, #16
   8244c:	38002da9 	strb	w9, [x13, #2]!
   82450:	d358fea9 	lsr	x9, x21, #24
   82454:	38004d6a 	strb	w10, [x11, #4]!
   82458:	aa0b03ea 	mov	x10, x11
   8245c:	3900056c 	strb	w12, [x11, #1]
   82460:	d370feac 	lsr	x12, x21, #48
   82464:	390005a9 	strb	w9, [x13, #1]
   82468:	d378fea9 	lsr	x9, x21, #56
   8246c:	38002d4c 	strb	w12, [x10, #2]!
   82470:	39000549 	strb	w9, [x10, #1]
   82474:	3900e67f 	strb	wzr, [x19, #57]
   82478:	3900d67f 	strb	wzr, [x19, #53]
   8247c:	38034e7f 	strb	wzr, [x19, #52]!
   82480:	39000e7f 	strb	wzr, [x19, #3]
   82484:	39000a7f 	strb	wzr, [x19, #2]
   82488:	f94003e9 	ldr	x9, [sp]
   8248c:	38004e7f 	strb	wzr, [x19, #4]!
   82490:	39000e7f 	strb	wzr, [x19, #3]
   82494:	39000a7f 	strb	wzr, [x19, #2]
   82498:	f81f82a9 	stur	x9, [x21, #-8]
   8249c:	39400549 	ldrb	w9, [x10, #1]
   824a0:	3940014a 	ldrb	w10, [x10]
   824a4:	3940056c 	ldrb	w12, [x11, #1]
   824a8:	3940016b 	ldrb	w11, [x11]
   824ac:	394005ae 	ldrb	w14, [x13, #1]
   824b0:	394001ad 	ldrb	w13, [x13]
   824b4:	33181d2a 	bfi	w10, w9, #8, #8
   824b8:	3940050f 	ldrb	w15, [x8, #1]
   824bc:	39400100 	ldrb	w0, [x8]
   824c0:	33181d8b 	bfi	w11, w12, #8, #8
   824c4:	33103d4b 	bfi	w11, w10, #16, #16
   824c8:	b3781dcd 	bfi	x13, x14, #8, #8
   824cc:	b3781de0 	bfi	x0, x15, #8, #8
   824d0:	b3703da0 	bfi	x0, x13, #16, #16
   824d4:	b3607d60 	bfi	x0, x11, #32, #32
   824d8:	eb14001f 	cmp	x0, x20
   824dc:	54000228 	b.hi	82520 <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x310>  // b.pmore
   824e0:	f85f8008 	ldur	x8, [x0, #-8]
   824e4:	f94003e9 	ldr	x9, [sp]
   824e8:	f90007e8 	str	x8, [sp, #8]
   824ec:	eb08013f 	cmp	x9, x8
   824f0:	54000261 	b.ne	8253c <_ZN17ruspiro_allocator6memory5alloc17h5bc506a4ad3ec5e3E+0x32c>  // b.any
   824f4:	a9487bf3 	ldp	x19, x30, [sp, #128]
   824f8:	a94753f5 	ldp	x21, x20, [sp, #112]
   824fc:	910243ff 	add	sp, sp, #0x90
   82500:	d65f03c0 	ret
   82504:	90000040 	adrp	x0, 8a000 <memmove>
   82508:	f0000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   8250c:	91077000 	add	x0, x0, #0x1dc
   82510:	528005e1 	mov	w1, #0x2f                  	// #47
   82514:	9121c042 	add	x2, x2, #0x870
   82518:	94001e28 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   8251c:	d4200020 	brk	#0x1
   82520:	90000040 	adrp	x0, 8a000 <memmove>
   82524:	f0000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   82528:	91091000 	add	x0, x0, #0x244
   8252c:	528006e1 	mov	w1, #0x37                  	// #55
   82530:	91222042 	add	x2, x2, #0x888
   82534:	94001e21 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   82538:	d4200020 	brk	#0x1
   8253c:	910003e8 	mov	x8, sp
   82540:	910023e9 	add	x9, sp, #0x8
   82544:	910183ea 	add	x10, sp, #0x60
   82548:	f0000041 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   8254c:	91234021 	add	x1, x1, #0x8d0
   82550:	910043e0 	add	x0, sp, #0x10
   82554:	a90627e8 	stp	x8, x9, [sp, #96]
   82558:	90000008 	adrp	x8, 82000 <__rg_realloc+0x48>
   8255c:	91166108 	add	x8, x8, #0x598
   82560:	9101a3e9 	add	x9, sp, #0x68
   82564:	a9027fff 	stp	xzr, xzr, [sp, #32]
   82568:	a90423ea 	stp	x10, x8, [sp, #64]
   8256c:	5280006a 	mov	w10, #0x3                   	// #3
   82570:	a90523e9 	stp	x9, x8, [sp, #80]
   82574:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82578:	91228108 	add	x8, x8, #0x8a0
   8257c:	910103e9 	add	x9, sp, #0x40
   82580:	a9012be8 	stp	x8, x10, [sp, #16]
   82584:	52800048 	mov	w8, #0x2                   	// #2
   82588:	a90323e9 	stp	x9, x8, [sp, #48]
   8258c:	94001e2d 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   82590:	d4200020 	brk	#0x1
   82594:	00000000 	.inst	0x00000000 ; undefined

0000000000082598 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he5794a7b823707abE>:
   82598:	f81e0ff4 	str	x20, [sp, #-32]!
   8259c:	a9017bf3 	stp	x19, x30, [sp, #16]
   825a0:	f9400014 	ldr	x20, [x0]
   825a4:	aa0103e0 	mov	x0, x1
   825a8:	aa0103f3 	mov	x19, x1
   825ac:	94001bcf 	bl	894e8 <_ZN4core3fmt9Formatter15debug_lower_hex17h597d04d17268b5b5E>
   825b0:	360000c0 	tbz	w0, #0, 825c8 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he5794a7b823707abE+0x30>
   825b4:	aa1303e1 	mov	x1, x19
   825b8:	aa1403e0 	mov	x0, x20
   825bc:	a9417bf3 	ldp	x19, x30, [sp, #16]
   825c0:	f84207f4 	ldr	x20, [sp], #32
   825c4:	140014f3 	b	87990 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h9d17b57bf7f81c93E>
   825c8:	aa1303e0 	mov	x0, x19
   825cc:	94001bca 	bl	894f4 <_ZN4core3fmt9Formatter15debug_upper_hex17h69356f446087d521E>
   825d0:	360000c0 	tbz	w0, #0, 825e8 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he5794a7b823707abE+0x50>
   825d4:	aa1303e1 	mov	x1, x19
   825d8:	aa1403e0 	mov	x0, x20
   825dc:	a9417bf3 	ldp	x19, x30, [sp, #16]
   825e0:	f84207f4 	ldr	x20, [sp], #32
   825e4:	14001510 	b	87a24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17h3f96354a0cf1bb83E>
   825e8:	aa1303e1 	mov	x1, x19
   825ec:	aa1403e0 	mov	x0, x20
   825f0:	a9417bf3 	ldp	x19, x30, [sp, #16]
   825f4:	f84207f4 	ldr	x20, [sp], #32
   825f8:	140016b2 	b	880c0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E>
   825fc:	00000000 	.inst	0x00000000 ; undefined

0000000000082600 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>:
   82600:	f9400401 	ldr	x1, [x0, #8]
   82604:	b4000081 	cbz	x1, 82614 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE+0x14>
   82608:	f9400000 	ldr	x0, [x0]
   8260c:	52800022 	mov	w2, #0x1                   	// #1
   82610:	17fffdda 	b	81d78 <__rust_dealloc>
   82614:	d65f03c0 	ret

0000000000082618 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   82618:	f9400008 	ldr	x8, [x0]
   8261c:	aa0103e2 	mov	x2, x1
   82620:	f9400809 	ldr	x9, [x0, #16]
   82624:	aa0803e0 	mov	x0, x8
   82628:	aa0903e1 	mov	x1, x9
   8262c:	14001d09 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000082630 <_ZN13ruspiro_brain3run17h338e4500e3c81153E>:
   82630:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
   82634:	940011c7 	bl	86d50 <_ZN22ruspiro_interrupt_core17enable_interrupts17hae901d9cabef88e4E>
   82638:	90000068 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   8263c:	f9445108 	ldr	x8, [x8, #2208]
   82640:	91004113 	add	x19, x8, #0x10
   82644:	aa1303e0 	mov	x0, x19
   82648:	940000e8 	bl	829e8 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE>
   8264c:	17fffffe 	b	82644 <_ZN13ruspiro_brain3run17h338e4500e3c81153E+0x14>

0000000000082650 <__kernel_startup>:
   82650:	d10243ff 	sub	sp, sp, #0x90
   82654:	f9003bf4 	str	x20, [sp, #112]
   82658:	a9087bf3 	stp	x19, x30, [sp, #128]
   8265c:	340000a0 	cbz	w0, 82670 <__kernel_startup+0x20>
   82660:	a9487bf3 	ldp	x19, x30, [sp, #128]
   82664:	f9403bf4 	ldr	x20, [sp, #112]
   82668:	910243ff 	add	sp, sp, #0x90
   8266c:	d65f03c0 	ret
   82670:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82674:	52800033 	mov	w19, #0x1                   	// #1
   82678:	91254108 	add	x8, x8, #0x950
   8267c:	52800109 	mov	w9, #0x8                   	// #8
   82680:	910103e0 	add	x0, sp, #0x40
   82684:	a9057fff 	stp	xzr, xzr, [sp, #80]
   82688:	9100a3f4 	add	x20, sp, #0x28
   8268c:	a9044fe8 	stp	x8, x19, [sp, #64]
   82690:	9100a3e8 	add	x8, sp, #0x28
   82694:	a9067fe9 	stp	x9, xzr, [sp, #96]
   82698:	94001364 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   8269c:	90000008 	adrp	x8, 82000 <__rg_realloc+0x48>
   826a0:	52800049 	mov	w9, #0x2                   	// #2
   826a4:	91186108 	add	x8, x8, #0x618
   826a8:	a9057fff 	stp	xzr, xzr, [sp, #80]
   826ac:	a901a3f4 	stp	x20, x8, [sp, #24]
   826b0:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   826b4:	9124c108 	add	x8, x8, #0x930
   826b8:	a90427e8 	stp	x8, x9, [sp, #64]
   826bc:	910063e8 	add	x8, sp, #0x18
   826c0:	a9064fe8 	stp	x8, x19, [sp, #96]
   826c4:	910003e8 	mov	x8, sp
   826c8:	910103e0 	add	x0, sp, #0x40
   826cc:	94001357 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   826d0:	f9401be1 	ldr	x1, [sp, #48]
   826d4:	b4000081 	cbz	x1, 826e4 <__kernel_startup+0x94>
   826d8:	f94017e0 	ldr	x0, [sp, #40]
   826dc:	52800022 	mov	w2, #0x1                   	// #1
   826e0:	97fffda6 	bl	81d78 <__rust_dealloc>
   826e4:	a94023f3 	ldp	x19, x8, [sp]
   826e8:	f9400be1 	ldr	x1, [sp, #16]
   826ec:	a90423f3 	stp	x19, x8, [sp, #64]
   826f0:	f9002be1 	str	x1, [sp, #80]
   826f4:	aa1303e0 	mov	x0, x19
   826f8:	940012e2 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   826fc:	f94027e1 	ldr	x1, [sp, #72]
   82700:	b4000081 	cbz	x1, 82710 <__kernel_startup+0xc0>
   82704:	aa1303e0 	mov	x0, x19
   82708:	52800022 	mov	w2, #0x1                   	// #1
   8270c:	97fffd9b 	bl	81d78 <__rust_dealloc>
   82710:	90000073 	adrp	x19, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   82714:	f9445273 	ldr	x19, [x19, #2208]
   82718:	aa1303e0 	mov	x0, x19
   8271c:	940012ef 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   82720:	91004260 	add	x0, x19, #0x10
   82724:	94000069 	bl	828c8 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE>
   82728:	aa1303e0 	mov	x0, x19
   8272c:	940012f5 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   82730:	97fffd4c 	bl	81c60 <awake_with>
   82734:	a9487bf3 	ldp	x19, x30, [sp, #128]
   82738:	f9403bf4 	ldr	x20, [sp, #112]
   8273c:	910243ff 	add	sp, sp, #0x90
   82740:	d65f03c0 	ret
   82744:	aa0003f3 	mov	x19, x0
   82748:	910103e0 	add	x0, sp, #0x40
   8274c:	97ffffad 	bl	82600 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   82750:	aa1303e0 	mov	x0, x19
   82754:	94000567 	bl	83cf0 <_Unwind_Resume>
   82758:	d4200020 	brk	#0x1
   8275c:	aa0003f3 	mov	x19, x0
   82760:	9100a3e0 	add	x0, sp, #0x28
   82764:	97ffffa7 	bl	82600 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   82768:	aa1303e0 	mov	x0, x19
   8276c:	94000561 	bl	83cf0 <_Unwind_Resume>
   82770:	d4200020 	brk	#0x1
   82774:	00000000 	.inst	0x00000000 ; undefined

0000000000082778 <__kernel_run>:
   82778:	f81f0ffe 	str	x30, [sp, #-16]!
   8277c:	97ffffad 	bl	82630 <_ZN13ruspiro_brain3run17h338e4500e3c81153E>
   82780:	d4200020 	brk	#0x1
   82784:	00000000 	.inst	0x00000000 ; undefined

0000000000082788 <_ZN4core3ptr18real_drop_in_place17h404dabf49ca85fc0E>:
   82788:	f9400008 	ldr	x8, [x0]
   8278c:	f9401001 	ldr	x1, [x0, #32]
   82790:	aa0803e0 	mov	x0, x8
   82794:	d61f0020 	br	x1

0000000000082798 <_ZN4core3ptr18real_drop_in_place17h4d1abc2134190149E>:
   82798:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
   8279c:	aa0003f3 	mov	x19, x0
   827a0:	a9402000 	ldp	x0, x8, [x0]
   827a4:	f9400108 	ldr	x8, [x8]
   827a8:	d63f0100 	blr	x8
   827ac:	f9400668 	ldr	x8, [x19, #8]
   827b0:	f9400501 	ldr	x1, [x8, #8]
   827b4:	b40000a1 	cbz	x1, 827c8 <_ZN4core3ptr18real_drop_in_place17h4d1abc2134190149E+0x30>
   827b8:	f9400260 	ldr	x0, [x19]
   827bc:	f9400902 	ldr	x2, [x8, #16]
   827c0:	a8c17bf3 	ldp	x19, x30, [sp], #16
   827c4:	17fffd6d 	b	81d78 <__rust_dealloc>
   827c8:	a8c17bf3 	ldp	x19, x30, [sp], #16
   827cc:	d65f03c0 	ret
   827d0:	a9400668 	ldp	x8, x1, [x19]
   827d4:	aa0003f3 	mov	x19, x0
   827d8:	aa0803e0 	mov	x0, x8
   827dc:	9400002f 	bl	82898 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE>
   827e0:	aa1303e0 	mov	x0, x19
   827e4:	94000543 	bl	83cf0 <_Unwind_Resume>
   827e8:	d4200020 	brk	#0x1
   827ec:	00000000 	.inst	0x00000000 ; undefined

00000000000827f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>:
   827f0:	f9400401 	ldr	x1, [x0, #8]
   827f4:	b4000081 	cbz	x1, 82804 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE+0x14>
   827f8:	f9400000 	ldr	x0, [x0]
   827fc:	52800022 	mov	w2, #0x1                   	// #1
   82800:	17fffd5e 	b	81d78 <__rust_dealloc>
   82804:	d65f03c0 	ret

0000000000082808 <_ZN4core3ptr18real_drop_in_place17h582a8f905665fec7E.llvm.4076311326303757488>:
   82808:	f9400008 	ldr	x8, [x0]
   8280c:	c85f7d09 	ldxr	x9, [x8]
   82810:	f1000529 	subs	x9, x9, #0x1
   82814:	c80afd09 	stlxr	w10, x9, [x8]
   82818:	35ffffaa 	cbnz	w10, 8280c <_ZN4core3ptr18real_drop_in_place17h582a8f905665fec7E.llvm.4076311326303757488+0x4>
   8281c:	54000061 	b.ne	82828 <_ZN4core3ptr18real_drop_in_place17h582a8f905665fec7E.llvm.4076311326303757488+0x20>  // b.any
   82820:	d50339bf 	dmb	ishld
   82824:	14000401 	b	83828 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E>
   82828:	d65f03c0 	ret
   8282c:	00000000 	.inst	0x00000000 ; undefined

0000000000082830 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>:
   82830:	f9400008 	ldr	x8, [x0]
   82834:	c85f7d09 	ldxr	x9, [x8]
   82838:	f1000529 	subs	x9, x9, #0x1
   8283c:	c80afd09 	stlxr	w10, x9, [x8]
   82840:	35ffffaa 	cbnz	w10, 82834 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x4>
   82844:	54000061 	b.ne	82850 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x20>  // b.any
   82848:	d50339bf 	dmb	ishld
   8284c:	14000427 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   82850:	d65f03c0 	ret
   82854:	00000000 	.inst	0x00000000 ; undefined

0000000000082858 <_ZN4core3ptr18real_drop_in_place17hc0fd61e4a8d30c06E>:
   82858:	f9400008 	ldr	x8, [x0]
   8285c:	b4000108 	cbz	x8, 8287c <_ZN4core3ptr18real_drop_in_place17hc0fd61e4a8d30c06E+0x24>
   82860:	c85f7d09 	ldxr	x9, [x8]
   82864:	f1000529 	subs	x9, x9, #0x1
   82868:	c80afd09 	stlxr	w10, x9, [x8]
   8286c:	35ffffaa 	cbnz	w10, 82860 <_ZN4core3ptr18real_drop_in_place17hc0fd61e4a8d30c06E+0x8>
   82870:	54000061 	b.ne	8287c <_ZN4core3ptr18real_drop_in_place17hc0fd61e4a8d30c06E+0x24>  // b.any
   82874:	d50339bf 	dmb	ishld
   82878:	1400041c 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   8287c:	d65f03c0 	ret

0000000000082880 <_ZN4core3ptr18real_drop_in_place17hf104a89dc54c57b1E>:
   82880:	f9400008 	ldr	x8, [x0]
   82884:	085ffd1f 	ldaxrb	wzr, [x8]
   82888:	0809fd1f 	stlxrb	w9, wzr, [x8]
   8288c:	35ffffc9 	cbnz	w9, 82884 <_ZN4core3ptr18real_drop_in_place17hf104a89dc54c57b1E+0x4>
   82890:	d65f03c0 	ret
   82894:	00000000 	.inst	0x00000000 ; undefined

0000000000082898 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE>:
   82898:	aa0103e8 	mov	x8, x1
   8289c:	f9400421 	ldr	x1, [x1, #8]
   828a0:	b4000061 	cbz	x1, 828ac <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE+0x14>
   828a4:	f9400902 	ldr	x2, [x8, #16]
   828a8:	17fffd34 	b	81d78 <__rust_dealloc>
   828ac:	d65f03c0 	ret

00000000000828b0 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   828b0:	f9400008 	ldr	x8, [x0]
   828b4:	aa0103e2 	mov	x2, x1
   828b8:	f9400809 	ldr	x9, [x0, #16]
   828bc:	aa0803e0 	mov	x0, x8
   828c0:	aa0903e1 	mov	x1, x9
   828c4:	14001c63 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

00000000000828c8 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE>:
   828c8:	d100c3ff 	sub	sp, sp, #0x30
   828cc:	f9000bf4 	str	x20, [sp, #16]
   828d0:	a9027bf3 	stp	x19, x30, [sp, #32]
   828d4:	aa0003f3 	mov	x19, x0
   828d8:	52800200 	mov	w0, #0x10                  	// #16
   828dc:	52800201 	mov	w1, #0x10                  	// #16
   828e0:	97fffd22 	bl	81d68 <__rust_alloc>
   828e4:	b4000620 	cbz	x0, 829a8 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0xe0>
   828e8:	910003e8 	mov	x8, sp
   828ec:	aa0003f4 	mov	x20, x0
   828f0:	a9007c1f 	stp	xzr, xzr, [x0]
   828f4:	94001277 	bl	872d0 <_ZN12ruspiro_lock8spinlock8Spinlock3new17h0a3a855f75e3ab12E>
   828f8:	52800600 	mov	w0, #0x30                  	// #48
   828fc:	52800201 	mov	w1, #0x10                  	// #16
   82900:	97fffd1a 	bl	81d68 <__rust_alloc>
   82904:	b40005a0 	cbz	x0, 829b8 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0xf0>
   82908:	52800028 	mov	w8, #0x1                   	// #1
   8290c:	3dc003e1 	ldr	q1, [sp]
   82910:	a9025014 	stp	x20, x20, [x0, #32]
   82914:	4e080d00 	dup	v0.2d, x8
   82918:	ad000400 	stp	q0, q1, [x0]
   8291c:	c85f7c08 	ldxr	x8, [x0]
   82920:	91000509 	add	x9, x8, #0x1
   82924:	c80a7c09 	stxr	w10, x9, [x0]
   82928:	35ffffaa 	cbnz	w10, 8291c <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0x54>
   8292c:	b7f804e8 	tbnz	x8, #63, 829c8 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0x100>
   82930:	f9400268 	ldr	x8, [x19]
   82934:	f9000fe0 	str	x0, [sp, #24]
   82938:	f9000260 	str	x0, [x19]
   8293c:	f90003e8 	str	x8, [sp]
   82940:	b4000128 	cbz	x8, 82964 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0x9c>
   82944:	c85f7d09 	ldxr	x9, [x8]
   82948:	f1000529 	subs	x9, x9, #0x1
   8294c:	c80afd09 	stlxr	w10, x9, [x8]
   82950:	35ffffaa 	cbnz	w10, 82944 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0x7c>
   82954:	54000081 	b.ne	82964 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0x9c>  // b.any
   82958:	d50339bf 	dmb	ishld
   8295c:	910003e0 	mov	x0, sp
   82960:	940003b2 	bl	83828 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E>
   82964:	f9400fe9 	ldr	x9, [sp, #24]
   82968:	f9400668 	ldr	x8, [x19, #8]
   8296c:	f9000669 	str	x9, [x19, #8]
   82970:	f90003e8 	str	x8, [sp]
   82974:	b4000128 	cbz	x8, 82998 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0xd0>
   82978:	c85f7d09 	ldxr	x9, [x8]
   8297c:	f1000529 	subs	x9, x9, #0x1
   82980:	c80afd09 	stlxr	w10, x9, [x8]
   82984:	35ffffaa 	cbnz	w10, 82978 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0xb0>
   82988:	54000081 	b.ne	82998 <_ZN13ruspiro_brain5brain5Brain10initialize17h87757bc66cd88b5aE+0xd0>  // b.any
   8298c:	910003e0 	mov	x0, sp
   82990:	d50339bf 	dmb	ishld
   82994:	940003a5 	bl	83828 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E>
   82998:	a9427bf3 	ldp	x19, x30, [sp, #32]
   8299c:	f9400bf4 	ldr	x20, [sp, #16]
   829a0:	9100c3ff 	add	sp, sp, #0x30
   829a4:	d65f03c0 	ret
   829a8:	52800200 	mov	w0, #0x10                  	// #16
   829ac:	52800201 	mov	w1, #0x10                  	// #16
   829b0:	94001294 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   829b4:	d4200020 	brk	#0x1
   829b8:	52800600 	mov	w0, #0x30                  	// #48
   829bc:	52800201 	mov	w1, #0x10                  	// #16
   829c0:	94001290 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   829c4:	d4200020 	brk	#0x1
   829c8:	d4200020 	brk	#0x1
   829cc:	d4200020 	brk	#0x1
   829d0:	aa0003f3 	mov	x19, x0
   829d4:	910063e0 	add	x0, sp, #0x18
   829d8:	97ffff8c 	bl	82808 <_ZN4core3ptr18real_drop_in_place17h582a8f905665fec7E.llvm.4076311326303757488>
   829dc:	aa1303e0 	mov	x0, x19
   829e0:	940004c4 	bl	83cf0 <_Unwind_Resume>
   829e4:	d4200020 	brk	#0x1

00000000000829e8 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE>:
   829e8:	d104c3ff 	sub	sp, sp, #0x130
   829ec:	a90d6ffc 	stp	x28, x27, [sp, #208]
   829f0:	a90e67fa 	stp	x26, x25, [sp, #224]
   829f4:	a90f5ff8 	stp	x24, x23, [sp, #240]
   829f8:	a91057f6 	stp	x22, x21, [sp, #256]
   829fc:	a9114ff4 	stp	x20, x19, [sp, #272]
   82a00:	a9127bfd 	stp	x29, x30, [sp, #288]
   82a04:	f9400408 	ldr	x8, [x0, #8]
   82a08:	b4001208 	cbz	x8, 82c48 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x260>
   82a0c:	aa0003f3 	mov	x19, x0
   82a10:	91004100 	add	x0, x8, #0x10
   82a14:	94000307 	bl	83630 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E>
   82a18:	f100041f 	cmp	x0, #0x1
   82a1c:	9a9f0028 	csel	x8, x1, xzr, eq  // eq = none
   82a20:	f90013e8 	str	x8, [sp, #32]
   82a24:	b4001128 	cbz	x8, 82c48 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x260>
   82a28:	f0000049 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   82a2c:	9100c3e8 	add	x8, sp, #0x30
   82a30:	91264129 	add	x9, x9, #0x990
   82a34:	91004118 	add	x24, x8, #0x10
   82a38:	b0000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82a3c:	910243f6 	add	x22, sp, #0x90
   82a40:	91148108 	add	x8, x8, #0x520
   82a44:	910042d7 	add	x23, x22, #0x10
   82a48:	9e670120 	fmov	d0, x9
   82a4c:	5280003c 	mov	w28, #0x1                   	// #1
   82a50:	910183fd 	add	x29, sp, #0x60
   82a54:	4e181d00 	mov	v0.d[1], x8
   82a58:	3d8007e0 	str	q0, [sp, #16]
   82a5c:	14000008 	b	82a7c <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x94>
   82a60:	f9400668 	ldr	x8, [x19, #8]
   82a64:	91004100 	add	x0, x8, #0x10
   82a68:	940002f2 	bl	83630 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E>
   82a6c:	f100041f 	cmp	x0, #0x1
   82a70:	9a9f0028 	csel	x8, x1, xzr, eq  // eq = none
   82a74:	f90013e8 	str	x8, [sp, #32]
   82a78:	b4000e88 	cbz	x8, 82c48 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x260>
   82a7c:	90000069 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   82a80:	f90017e1 	str	x1, [sp, #40]
   82a84:	c8dffc28 	ldar	x8, [x1]
   82a88:	f9444929 	ldr	x9, [x9, #2192]
   82a8c:	f90067e8 	str	x8, [sp, #200]
   82a90:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82a94:	91268108 	add	x8, x8, #0x9a0
   82a98:	f90037e9 	str	x9, [sp, #104]
   82a9c:	910323e9 	add	x9, sp, #0xc8
   82aa0:	a90973e8 	stp	x8, x28, [sp, #144]
   82aa4:	f90033e9 	str	x9, [sp, #96]
   82aa8:	a9007eff 	stp	xzr, xzr, [x23]
   82aac:	a90b73fd 	stp	x29, x28, [sp, #176]
   82ab0:	9101e3e8 	add	x8, sp, #0x78
   82ab4:	910243e0 	add	x0, sp, #0x90
   82ab8:	9400125c 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   82abc:	a947a3e9 	ldp	x9, x8, [sp, #120]
   82ac0:	f94047ea 	ldr	x10, [sp, #136]
   82ac4:	3dc007e0 	ldr	q0, [sp, #16]
   82ac8:	a90623e9 	stp	x9, x8, [sp, #96]
   82acc:	90000008 	adrp	x8, 82000 <__rg_realloc+0x48>
   82ad0:	9122c108 	add	x8, x8, #0x8b0
   82ad4:	f9003bea 	str	x10, [sp, #112]
   82ad8:	3d8027e0 	str	q0, [sp, #144]
   82adc:	a90a23fd 	stp	x29, x8, [sp, #160]
   82ae0:	52800068 	mov	w8, #0x3                   	// #3
   82ae4:	f9001fe8 	str	x8, [sp, #56]
   82ae8:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82aec:	91258108 	add	x8, x8, #0x960
   82af0:	f9001be8 	str	x8, [sp, #48]
   82af4:	52800048 	mov	w8, #0x2                   	// #2
   82af8:	a9007f1f 	stp	xzr, xzr, [x24]
   82afc:	a90523f6 	stp	x22, x8, [sp, #80]
   82b00:	9101e3e8 	add	x8, sp, #0x78
   82b04:	9100c3e0 	add	x0, sp, #0x30
   82b08:	94001248 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   82b0c:	f94037e1 	ldr	x1, [sp, #104]
   82b10:	b4000081 	cbz	x1, 82b20 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x138>
   82b14:	f94033e0 	ldr	x0, [sp, #96]
   82b18:	52800022 	mov	w2, #0x1                   	// #1
   82b1c:	97fffc97 	bl	81d78 <__rust_dealloc>
   82b20:	a947a3f4 	ldp	x20, x8, [sp, #120]
   82b24:	f94047e1 	ldr	x1, [sp, #136]
   82b28:	a90923f4 	stp	x20, x8, [sp, #144]
   82b2c:	f90053e1 	str	x1, [sp, #160]
   82b30:	aa1403e0 	mov	x0, x20
   82b34:	940011d3 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   82b38:	f9404fe1 	ldr	x1, [sp, #152]
   82b3c:	b4000081 	cbz	x1, 82b4c <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x164>
   82b40:	aa1403e0 	mov	x0, x20
   82b44:	52800022 	mov	w2, #0x1                   	// #1
   82b48:	97fffc8c 	bl	81d78 <__rust_dealloc>
   82b4c:	f94017f9 	ldr	x25, [sp, #40]
   82b50:	9100433a 	add	x26, x25, #0x10
   82b54:	085fff48 	ldaxrb	w8, [x26]
   82b58:	0809ff5c 	stlxrb	w9, w28, [x26]
   82b5c:	7100013f 	cmp	w9, #0x0
   82b60:	7a400900 	ccmp	w8, #0x0, #0x0, eq  // eq = none
   82b64:	54ffff81 	b.ne	82b54 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x16c>  // b.any
   82b68:	aa1903fb 	mov	x27, x25
   82b6c:	f90033fa 	str	x26, [sp, #96]
   82b70:	f8418f74 	ldr	x20, [x27, #24]!
   82b74:	f9400775 	ldr	x21, [x27, #8]
   82b78:	a9007f7f 	stp	xzr, xzr, [x27]
   82b7c:	b40004d4 	cbz	x20, 82c14 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x22c>
   82b80:	a90357f4 	stp	x20, x21, [sp, #48]
   82b84:	910243e8 	add	x8, sp, #0x90
   82b88:	9100a3e0 	add	x0, sp, #0x28
   82b8c:	9400009b 	bl	82df8 <_ZN13ruspiro_brain8thoughts8wakeable23waker_ref_from_wakeable17hf70aa2fa0832a3acE>
   82b90:	f9400ea8 	ldr	x8, [x21, #24]
   82b94:	f9003ff6 	str	x22, [sp, #120]
   82b98:	9101e3e1 	add	x1, sp, #0x78
   82b9c:	aa1403e0 	mov	x0, x20
   82ba0:	d63f0100 	blr	x8
   82ba4:	36000060 	tbz	w0, #0, 82bb0 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x1c8>
   82ba8:	5280003b 	mov	w27, #0x1                   	// #1
   82bac:	1400000e 	b	82be4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x1fc>
   82bb0:	f9400360 	ldr	x0, [x27]
   82bb4:	b4000140 	cbz	x0, 82bdc <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x1f4>
   82bb8:	f9401328 	ldr	x8, [x25, #32]
   82bbc:	f9400108 	ldr	x8, [x8]
   82bc0:	d63f0100 	blr	x8
   82bc4:	f9401328 	ldr	x8, [x25, #32]
   82bc8:	f9400501 	ldr	x1, [x8, #8]
   82bcc:	b4000081 	cbz	x1, 82bdc <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x1f4>
   82bd0:	f9400360 	ldr	x0, [x27]
   82bd4:	f9400902 	ldr	x2, [x8, #16]
   82bd8:	97fffc68 	bl	81d78 <__rust_dealloc>
   82bdc:	2a1f03fb 	mov	w27, wzr
   82be0:	a901d734 	stp	x20, x21, [x25, #24]
   82be4:	f9404be0 	ldr	x0, [sp, #144]
   82be8:	f9405be8 	ldr	x8, [sp, #176]
   82bec:	d63f0100 	blr	x8
   82bf0:	3400013b 	cbz	w27, 82c14 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x22c>
   82bf4:	f94002a8 	ldr	x8, [x21]
   82bf8:	aa1403e0 	mov	x0, x20
   82bfc:	d63f0100 	blr	x8
   82c00:	f94006a1 	ldr	x1, [x21, #8]
   82c04:	b4000081 	cbz	x1, 82c14 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x22c>
   82c08:	f9400aa2 	ldr	x2, [x21, #16]
   82c0c:	aa1403e0 	mov	x0, x20
   82c10:	97fffc5a 	bl	81d78 <__rust_dealloc>
   82c14:	085fff5f 	ldaxrb	wzr, [x26]
   82c18:	0808ff5f 	stlxrb	w8, wzr, [x26]
   82c1c:	35ffffc8 	cbnz	w8, 82c14 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x22c>
   82c20:	f94017e8 	ldr	x8, [sp, #40]
   82c24:	c85f7d09 	ldxr	x9, [x8]
   82c28:	f1000529 	subs	x9, x9, #0x1
   82c2c:	c80afd09 	stlxr	w10, x9, [x8]
   82c30:	35ffffaa 	cbnz	w10, 82c24 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x23c>
   82c34:	54fff161 	b.ne	82a60 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x78>  // b.any
   82c38:	d50339bf 	dmb	ishld
   82c3c:	9100a3e0 	add	x0, sp, #0x28
   82c40:	9400032a 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   82c44:	17ffff87 	b	82a60 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x78>
   82c48:	a9527bfd 	ldp	x29, x30, [sp, #288]
   82c4c:	a9514ff4 	ldp	x20, x19, [sp, #272]
   82c50:	a95057f6 	ldp	x22, x21, [sp, #256]
   82c54:	a94f5ff8 	ldp	x24, x23, [sp, #240]
   82c58:	a94e67fa 	ldp	x26, x25, [sp, #224]
   82c5c:	a94d6ffc 	ldp	x28, x27, [sp, #208]
   82c60:	9104c3ff 	add	sp, sp, #0x130
   82c64:	d65f03c0 	ret
   82c68:	a9418728 	ldp	x8, x1, [x25, #24]
   82c6c:	aa0003f3 	mov	x19, x0
   82c70:	aa0803e0 	mov	x0, x8
   82c74:	97ffff09 	bl	82898 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE>
   82c78:	910243e0 	add	x0, sp, #0x90
   82c7c:	a901d734 	stp	x20, x21, [x25, #24]
   82c80:	97fffec2 	bl	82788 <_ZN4core3ptr18real_drop_in_place17h404dabf49ca85fc0E>
   82c84:	14000014 	b	82cd4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x2ec>
   82c88:	aa0003f3 	mov	x19, x0
   82c8c:	aa1403e0 	mov	x0, x20
   82c90:	aa1503e1 	mov	x1, x21
   82c94:	97ffff01 	bl	82898 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE>
   82c98:	1400000f 	b	82cd4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x2ec>
   82c9c:	aa0003f3 	mov	x19, x0
   82ca0:	f94013e8 	ldr	x8, [sp, #32]
   82ca4:	b4000248 	cbz	x8, 82cec <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x304>
   82ca8:	14000013 	b	82cf4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x30c>
   82cac:	aa0003f3 	mov	x19, x0
   82cb0:	350000fb 	cbnz	w27, 82ccc <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x2e4>
   82cb4:	14000008 	b	82cd4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x2ec>
   82cb8:	aa0003f3 	mov	x19, x0
   82cbc:	910243e0 	add	x0, sp, #0x90
   82cc0:	97fffeb2 	bl	82788 <_ZN4core3ptr18real_drop_in_place17h404dabf49ca85fc0E>
   82cc4:	14000002 	b	82ccc <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x2e4>
   82cc8:	aa0003f3 	mov	x19, x0
   82ccc:	9100c3e0 	add	x0, sp, #0x30
   82cd0:	97fffeb2 	bl	82798 <_ZN4core3ptr18real_drop_in_place17h4d1abc2134190149E>
   82cd4:	910183e0 	add	x0, sp, #0x60
   82cd8:	97fffeea 	bl	82880 <_ZN4core3ptr18real_drop_in_place17hf104a89dc54c57b1E>
   82cdc:	9100a3e0 	add	x0, sp, #0x28
   82ce0:	97fffed4 	bl	82830 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>
   82ce4:	f94013e8 	ldr	x8, [sp, #32]
   82ce8:	b5000068 	cbnz	x8, 82cf4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x30c>
   82cec:	910083e0 	add	x0, sp, #0x20
   82cf0:	97fffeda 	bl	82858 <_ZN4core3ptr18real_drop_in_place17hc0fd61e4a8d30c06E>
   82cf4:	aa1303e0 	mov	x0, x19
   82cf8:	940003fe 	bl	83cf0 <_Unwind_Resume>
   82cfc:	d4200020 	brk	#0x1
   82d00:	aa0003f3 	mov	x19, x0
   82d04:	910243e0 	add	x0, sp, #0x90
   82d08:	14000003 	b	82d14 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x32c>
   82d0c:	aa0003f3 	mov	x19, x0
   82d10:	910183e0 	add	x0, sp, #0x60
   82d14:	97fffeb7 	bl	827f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   82d18:	9100a3e0 	add	x0, sp, #0x28
   82d1c:	97fffec5 	bl	82830 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>
   82d20:	f94013e8 	ldr	x8, [sp, #32]
   82d24:	b4fffe48 	cbz	x8, 82cec <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x304>
   82d28:	17fffff3 	b	82cf4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x30c>
   82d2c:	aa0003f3 	mov	x19, x0
   82d30:	9100a3e0 	add	x0, sp, #0x28
   82d34:	97fffebf 	bl	82830 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>
   82d38:	f94013e8 	ldr	x8, [sp, #32]
   82d3c:	b5fffdc8 	cbnz	x8, 82cf4 <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x30c>
   82d40:	17ffffeb 	b	82cec <_ZN13ruspiro_brain5brain5Brain5think17ha28041796c53f11fE+0x304>
   82d44:	00000000 	.inst	0x00000000 ; undefined

0000000000082d48 <_ZN13ruspiro_brain8thoughts5waker5Waker4wake17h808a975f295c8579E>:
   82d48:	a9400408 	ldp	x8, x1, [x0]
   82d4c:	aa0803e0 	mov	x0, x8
   82d50:	d61f0020 	br	x1
   82d54:	00000000 	.inst	0x00000000 ; undefined

0000000000082d58 <_ZN76_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..clone..Clone$GT$5clone17h606f4dbd22395a91E>:
   82d58:	d10103ff 	sub	sp, sp, #0x40
   82d5c:	a9037bf3 	stp	x19, x30, [sp, #48]
   82d60:	f9400c09 	ldr	x9, [x0, #24]
   82d64:	aa0803f3 	mov	x19, x8
   82d68:	f9400000 	ldr	x0, [x0]
   82d6c:	910023e8 	add	x8, sp, #0x8
   82d70:	d63f0120 	blr	x9
   82d74:	52800502 	mov	w2, #0x28                  	// #40
   82d78:	910023e1 	add	x1, sp, #0x8
   82d7c:	aa1303e0 	mov	x0, x19
   82d80:	94001c81 	bl	89f84 <memcpy>
   82d84:	a9437bf3 	ldp	x19, x30, [sp, #48]
   82d88:	910103ff 	add	sp, sp, #0x40
   82d8c:	d65f03c0 	ret

0000000000082d90 <_ZN79_$LT$ruspiro_brain..thoughts..waker..Waker$u20$as$u20$core..ops..drop..Drop$GT$4drop17h7df6c25be8e2a326E>:
   82d90:	f9400008 	ldr	x8, [x0]
   82d94:	f9401001 	ldr	x1, [x0, #32]
   82d98:	aa0803e0 	mov	x0, x8
   82d9c:	d61f0020 	br	x1

0000000000082da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>:
   82da0:	f9400401 	ldr	x1, [x0, #8]
   82da4:	b4000081 	cbz	x1, 82db4 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE+0x14>
   82da8:	f9400000 	ldr	x0, [x0]
   82dac:	52800022 	mov	w2, #0x1                   	// #1
   82db0:	17fffbf2 	b	81d78 <__rust_dealloc>
   82db4:	d65f03c0 	ret

0000000000082db8 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>:
   82db8:	f9400008 	ldr	x8, [x0]
   82dbc:	c85f7d09 	ldxr	x9, [x8]
   82dc0:	f1000529 	subs	x9, x9, #0x1
   82dc4:	c80afd09 	stlxr	w10, x9, [x8]
   82dc8:	35ffffaa 	cbnz	w10, 82dbc <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x4>
   82dcc:	54000061 	b.ne	82dd8 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x20>  // b.any
   82dd0:	d50339bf 	dmb	ishld
   82dd4:	140002c5 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   82dd8:	d65f03c0 	ret
   82ddc:	00000000 	.inst	0x00000000 ; undefined

0000000000082de0 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   82de0:	f9400008 	ldr	x8, [x0]
   82de4:	aa0103e2 	mov	x2, x1
   82de8:	f9400809 	ldr	x9, [x0, #16]
   82dec:	aa0803e0 	mov	x0, x8
   82df0:	aa0903e1 	mov	x1, x9
   82df4:	14001b17 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000082df8 <_ZN13ruspiro_brain8thoughts8wakeable23waker_ref_from_wakeable17hf70aa2fa0832a3acE>:
   82df8:	d10303ff 	sub	sp, sp, #0xc0
   82dfc:	a90a53f5 	stp	x21, x20, [sp, #160]
   82e00:	a90b7bf3 	stp	x19, x30, [sp, #176]
   82e04:	b0000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82e08:	aa0803f3 	mov	x19, x8
   82e0c:	910043e8 	add	x8, sp, #0x10
   82e10:	9114e129 	add	x9, x9, #0x538
   82e14:	f940000a 	ldr	x10, [x0]
   82e18:	9000004b 	adrp	x11, 8a000 <memmove>
   82e1c:	910ea16b 	add	x11, x11, #0x3a8
   82e20:	9100c3f4 	add	x20, sp, #0x30
   82e24:	a90327e8 	stp	x8, x9, [sp, #48]
   82e28:	f0000049 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   82e2c:	52800028 	mov	w8, #0x1                   	// #1
   82e30:	9127c129 	add	x9, x9, #0x9f0
   82e34:	9101c3e0 	add	x0, sp, #0x70
   82e38:	910163f5 	add	x21, sp, #0x58
   82e3c:	a90723e9 	stp	x9, x8, [sp, #112]
   82e40:	91004149 	add	x9, x10, #0x10
   82e44:	a90823eb 	stp	x11, x8, [sp, #128]
   82e48:	a90923f4 	stp	x20, x8, [sp, #144]
   82e4c:	910163e8 	add	x8, sp, #0x58
   82e50:	f9000be9 	str	x9, [sp, #16]
   82e54:	94001175 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   82e58:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82e5c:	90000009 	adrp	x9, 82000 <__rg_realloc+0x48>
   82e60:	91278108 	add	x8, x8, #0x9e0
   82e64:	91378129 	add	x9, x9, #0xde0
   82e68:	f000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   82e6c:	a9087fff 	stp	xzr, xzr, [sp, #128]
   82e70:	9126c14a 	add	x10, x10, #0x9b0
   82e74:	9e670100 	fmov	d0, x8
   82e78:	b0000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82e7c:	91148108 	add	x8, x8, #0x520
   82e80:	a90427f5 	stp	x21, x9, [sp, #64]
   82e84:	52800049 	mov	w9, #0x2                   	// #2
   82e88:	a90927f4 	stp	x20, x9, [sp, #144]
   82e8c:	4e181d00 	mov	v0.d[1], x8
   82e90:	52800068 	mov	w8, #0x3                   	// #3
   82e94:	a90723ea 	stp	x10, x8, [sp, #112]
   82e98:	3d800fe0 	str	q0, [sp, #48]
   82e9c:	910063e8 	add	x8, sp, #0x18
   82ea0:	9101c3e0 	add	x0, sp, #0x70
   82ea4:	94001161 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   82ea8:	f94033e1 	ldr	x1, [sp, #96]
   82eac:	b4000081 	cbz	x1, 82ebc <_ZN13ruspiro_brain8thoughts8wakeable23waker_ref_from_wakeable17hf70aa2fa0832a3acE+0xc4>
   82eb0:	f9402fe0 	ldr	x0, [sp, #88]
   82eb4:	52800022 	mov	w2, #0x1                   	// #1
   82eb8:	97fffbb0 	bl	81d78 <__rust_dealloc>
   82ebc:	a941a3f4 	ldp	x20, x8, [sp, #24]
   82ec0:	f94017e1 	ldr	x1, [sp, #40]
   82ec4:	a90723f4 	stp	x20, x8, [sp, #112]
   82ec8:	f90043e1 	str	x1, [sp, #128]
   82ecc:	aa1403e0 	mov	x0, x20
   82ed0:	940010ec 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   82ed4:	f9403fe1 	ldr	x1, [sp, #120]
   82ed8:	b4000081 	cbz	x1, 82ee8 <_ZN13ruspiro_brain8thoughts8wakeable23waker_ref_from_wakeable17hf70aa2fa0832a3acE+0xf0>
   82edc:	aa1403e0 	mov	x0, x20
   82ee0:	52800022 	mov	w2, #0x1                   	// #1
   82ee4:	97fffba5 	bl	81d78 <__rust_dealloc>
   82ee8:	90000008 	adrp	x8, 82000 <__rg_realloc+0x48>
   82eec:	b0000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82ef0:	913dc108 	add	x8, x8, #0xf70
   82ef4:	b000000a 	adrp	x10, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82ef8:	9108c129 	add	x9, x9, #0x230
   82efc:	9114614a 	add	x10, x10, #0x518
   82f00:	a94a53f5 	ldp	x21, x20, [sp, #160]
   82f04:	9e670100 	fmov	d0, x8
   82f08:	b0000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82f0c:	91038108 	add	x8, x8, #0xe0
   82f10:	4e181d00 	mov	v0.d[1], x8
   82f14:	f9400be8 	ldr	x8, [sp, #16]
   82f18:	f9000268 	str	x8, [x19]
   82f1c:	3d8003e0 	str	q0, [sp]
   82f20:	f94007e8 	ldr	x8, [sp, #8]
   82f24:	f9000a68 	str	x8, [x19, #16]
   82f28:	f94003e8 	ldr	x8, [sp]
   82f2c:	a901aa69 	stp	x9, x10, [x19, #24]
   82f30:	f9000668 	str	x8, [x19, #8]
   82f34:	a94b7bf3 	ldp	x19, x30, [sp, #176]
   82f38:	910303ff 	add	sp, sp, #0xc0
   82f3c:	d65f03c0 	ret
   82f40:	aa0003f3 	mov	x19, x0
   82f44:	9101c3e0 	add	x0, sp, #0x70
   82f48:	97ffff96 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   82f4c:	aa1303e0 	mov	x0, x19
   82f50:	94000368 	bl	83cf0 <_Unwind_Resume>
   82f54:	d4200020 	brk	#0x1
   82f58:	aa0003f3 	mov	x19, x0
   82f5c:	910163e0 	add	x0, sp, #0x58
   82f60:	97ffff90 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   82f64:	aa1303e0 	mov	x0, x19
   82f68:	94000362 	bl	83cf0 <_Unwind_Resume>
   82f6c:	d4200020 	brk	#0x1

0000000000082f70 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E>:
   82f70:	d102c3ff 	sub	sp, sp, #0xb0
   82f74:	a90903f4 	stp	x20, x0, [sp, #144]
   82f78:	a90a7bf3 	stp	x19, x30, [sp, #160]
   82f7c:	b0000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82f80:	910263e8 	add	x8, sp, #0x98
   82f84:	9114e129 	add	x9, x9, #0x538
   82f88:	5280002a 	mov	w10, #0x1                   	// #1
   82f8c:	910083f3 	add	x19, sp, #0x20
   82f90:	910183e0 	add	x0, sp, #0x60
   82f94:	910123f4 	add	x20, sp, #0x48
   82f98:	a90227e8 	stp	x8, x9, [sp, #32]
   82f9c:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82fa0:	91280108 	add	x8, x8, #0xa00
   82fa4:	a9082bf3 	stp	x19, x10, [sp, #128]
   82fa8:	a9062be8 	stp	x8, x10, [sp, #96]
   82fac:	90000048 	adrp	x8, 8a000 <memmove>
   82fb0:	910ea108 	add	x8, x8, #0x3a8
   82fb4:	a9072be8 	stp	x8, x10, [sp, #112]
   82fb8:	910123e8 	add	x8, sp, #0x48
   82fbc:	9400111b 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   82fc0:	f0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   82fc4:	90000009 	adrp	x9, 82000 <__rg_realloc+0x48>
   82fc8:	91278108 	add	x8, x8, #0x9e0
   82fcc:	91378129 	add	x9, x9, #0xde0
   82fd0:	f000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   82fd4:	a9077fff 	stp	xzr, xzr, [sp, #112]
   82fd8:	9126c14a 	add	x10, x10, #0x9b0
   82fdc:	9e670100 	fmov	d0, x8
   82fe0:	b0000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   82fe4:	91148108 	add	x8, x8, #0x520
   82fe8:	a90327f4 	stp	x20, x9, [sp, #48]
   82fec:	52800049 	mov	w9, #0x2                   	// #2
   82ff0:	a90827f3 	stp	x19, x9, [sp, #128]
   82ff4:	4e181d00 	mov	v0.d[1], x8
   82ff8:	52800068 	mov	w8, #0x3                   	// #3
   82ffc:	a90623ea 	stp	x10, x8, [sp, #96]
   83000:	3d800be0 	str	q0, [sp, #32]
   83004:	910023e8 	add	x8, sp, #0x8
   83008:	910183e0 	add	x0, sp, #0x60
   8300c:	94001107 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83010:	f9402be1 	ldr	x1, [sp, #80]
   83014:	b4000081 	cbz	x1, 83024 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0xb4>
   83018:	f94027e0 	ldr	x0, [sp, #72]
   8301c:	52800022 	mov	w2, #0x1                   	// #1
   83020:	97fffb56 	bl	81d78 <__rust_dealloc>
   83024:	a940a3f3 	ldp	x19, x8, [sp, #8]
   83028:	f9400fe1 	ldr	x1, [sp, #24]
   8302c:	a90623f3 	stp	x19, x8, [sp, #96]
   83030:	f9003be1 	str	x1, [sp, #112]
   83034:	aa1303e0 	mov	x0, x19
   83038:	94001092 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   8303c:	f94037e1 	ldr	x1, [sp, #104]
   83040:	b4000081 	cbz	x1, 83050 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0xe0>
   83044:	aa1303e0 	mov	x0, x19
   83048:	52800022 	mov	w2, #0x1                   	// #1
   8304c:	97fffb4b 	bl	81d78 <__rust_dealloc>
   83050:	f9404fe8 	ldr	x8, [sp, #152]
   83054:	d1004108 	sub	x8, x8, #0x10
   83058:	f90033e8 	str	x8, [sp, #96]
   8305c:	910183e0 	add	x0, sp, #0x60
   83060:	9400027a 	bl	83a48 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E>
   83064:	f94033e8 	ldr	x8, [sp, #96]
   83068:	c85f7d09 	ldxr	x9, [x8]
   8306c:	f1000529 	subs	x9, x9, #0x1
   83070:	c80afd09 	stlxr	w10, x9, [x8]
   83074:	35ffffaa 	cbnz	w10, 83068 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0xf8>
   83078:	54000081 	b.ne	83088 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x118>  // b.any
   8307c:	910183e0 	add	x0, sp, #0x60
   83080:	d50339bf 	dmb	ishld
   83084:	94000219 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   83088:	a94a7bf3 	ldp	x19, x30, [sp, #160]
   8308c:	f9404bf4 	ldr	x20, [sp, #144]
   83090:	9102c3ff 	add	sp, sp, #0xb0
   83094:	d65f03c0 	ret
   83098:	aa0003f3 	mov	x19, x0
   8309c:	910183e0 	add	x0, sp, #0x60
   830a0:	9400024a 	bl	839c8 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E.llvm.13170691176973607575>
   830a4:	aa1303e0 	mov	x0, x19
   830a8:	94000312 	bl	83cf0 <_Unwind_Resume>
   830ac:	d4200020 	brk	#0x1
   830b0:	aa0003f3 	mov	x19, x0
   830b4:	910183e0 	add	x0, sp, #0x60
   830b8:	97ffff3a 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   830bc:	aa1303e0 	mov	x0, x19
   830c0:	9400030c 	bl	83cf0 <_Unwind_Resume>
   830c4:	d4200020 	brk	#0x1
   830c8:	aa0003f3 	mov	x19, x0
   830cc:	910123e0 	add	x0, sp, #0x48
   830d0:	97ffff34 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   830d4:	aa1303e0 	mov	x0, x19
   830d8:	94000306 	bl	83cf0 <_Unwind_Resume>
   830dc:	d4200020 	brk	#0x1

00000000000830e0 <_ZN13ruspiro_brain8thoughts8wakeable24wake_by_ref_wakeable_raw17h851d2c35406f4dffE>:
   830e0:	d102c3ff 	sub	sp, sp, #0xb0
   830e4:	a90903f4 	stp	x20, x0, [sp, #144]
   830e8:	a90a7bf3 	stp	x19, x30, [sp, #160]
   830ec:	90000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   830f0:	910263e8 	add	x8, sp, #0x98
   830f4:	9114e129 	add	x9, x9, #0x538
   830f8:	5280002a 	mov	w10, #0x1                   	// #1
   830fc:	910083f3 	add	x19, sp, #0x20
   83100:	910183e0 	add	x0, sp, #0x60
   83104:	910123f4 	add	x20, sp, #0x48
   83108:	a90227e8 	stp	x8, x9, [sp, #32]
   8310c:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83110:	91284108 	add	x8, x8, #0xa10
   83114:	a9082bf3 	stp	x19, x10, [sp, #128]
   83118:	a9062be8 	stp	x8, x10, [sp, #96]
   8311c:	f0000028 	adrp	x8, 8a000 <memmove>
   83120:	910ea108 	add	x8, x8, #0x3a8
   83124:	a9072be8 	stp	x8, x10, [sp, #112]
   83128:	910123e8 	add	x8, sp, #0x48
   8312c:	940010bf 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83130:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83134:	f0ffffe9 	adrp	x9, 82000 <__rg_realloc+0x48>
   83138:	91278108 	add	x8, x8, #0x9e0
   8313c:	91378129 	add	x9, x9, #0xde0
   83140:	d000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   83144:	a9077fff 	stp	xzr, xzr, [sp, #112]
   83148:	9126c14a 	add	x10, x10, #0x9b0
   8314c:	9e670100 	fmov	d0, x8
   83150:	90000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83154:	91148108 	add	x8, x8, #0x520
   83158:	a90327f4 	stp	x20, x9, [sp, #48]
   8315c:	52800049 	mov	w9, #0x2                   	// #2
   83160:	a90827f3 	stp	x19, x9, [sp, #128]
   83164:	4e181d00 	mov	v0.d[1], x8
   83168:	52800068 	mov	w8, #0x3                   	// #3
   8316c:	a90623ea 	stp	x10, x8, [sp, #96]
   83170:	3d800be0 	str	q0, [sp, #32]
   83174:	910023e8 	add	x8, sp, #0x8
   83178:	910183e0 	add	x0, sp, #0x60
   8317c:	940010ab 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83180:	f9402be1 	ldr	x1, [sp, #80]
   83184:	b4000081 	cbz	x1, 83194 <_ZN13ruspiro_brain8thoughts8wakeable24wake_by_ref_wakeable_raw17h851d2c35406f4dffE+0xb4>
   83188:	f94027e0 	ldr	x0, [sp, #72]
   8318c:	52800022 	mov	w2, #0x1                   	// #1
   83190:	97fffafa 	bl	81d78 <__rust_dealloc>
   83194:	a940a3f3 	ldp	x19, x8, [sp, #8]
   83198:	f9400fe1 	ldr	x1, [sp, #24]
   8319c:	a90623f3 	stp	x19, x8, [sp, #96]
   831a0:	f9003be1 	str	x1, [sp, #112]
   831a4:	aa1303e0 	mov	x0, x19
   831a8:	94001036 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   831ac:	f94037e1 	ldr	x1, [sp, #104]
   831b0:	b4000081 	cbz	x1, 831c0 <_ZN13ruspiro_brain8thoughts8wakeable24wake_by_ref_wakeable_raw17h851d2c35406f4dffE+0xe0>
   831b4:	aa1303e0 	mov	x0, x19
   831b8:	52800022 	mov	w2, #0x1                   	// #1
   831bc:	97fffaef 	bl	81d78 <__rust_dealloc>
   831c0:	f9404fe8 	ldr	x8, [sp, #152]
   831c4:	d1004108 	sub	x8, x8, #0x10
   831c8:	f90033e8 	str	x8, [sp, #96]
   831cc:	910183e0 	add	x0, sp, #0x60
   831d0:	9400021e 	bl	83a48 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E>
   831d4:	a94a7bf3 	ldp	x19, x30, [sp, #160]
   831d8:	f9404bf4 	ldr	x20, [sp, #144]
   831dc:	9102c3ff 	add	sp, sp, #0xb0
   831e0:	d65f03c0 	ret
   831e4:	aa0003f3 	mov	x19, x0
   831e8:	910183e0 	add	x0, sp, #0x60
   831ec:	97fffef3 	bl	82db8 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>
   831f0:	aa1303e0 	mov	x0, x19
   831f4:	940002bf 	bl	83cf0 <_Unwind_Resume>
   831f8:	d4200020 	brk	#0x1
   831fc:	aa0003f3 	mov	x19, x0
   83200:	910183e0 	add	x0, sp, #0x60
   83204:	97fffee7 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83208:	aa1303e0 	mov	x0, x19
   8320c:	940002b9 	bl	83cf0 <_Unwind_Resume>
   83210:	d4200020 	brk	#0x1
   83214:	aa0003f3 	mov	x19, x0
   83218:	910123e0 	add	x0, sp, #0x48
   8321c:	97fffee1 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83220:	aa1303e0 	mov	x0, x19
   83224:	940002b3 	bl	83cf0 <_Unwind_Resume>
   83228:	d4200020 	brk	#0x1
   8322c:	00000000 	.inst	0x00000000 ; undefined

0000000000083230 <_ZN13ruspiro_brain8thoughts8wakeable18clone_wakeable_raw17h7ac58330b94a9e97E>:
   83230:	d10303ff 	sub	sp, sp, #0xc0
   83234:	a90a53f5 	stp	x21, x20, [sp, #160]
   83238:	a90b7bf3 	stp	x19, x30, [sp, #176]
   8323c:	90000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83240:	aa0803f3 	mov	x19, x8
   83244:	910043e8 	add	x8, sp, #0x10
   83248:	9114e129 	add	x9, x9, #0x538
   8324c:	5280002a 	mov	w10, #0x1                   	// #1
   83250:	f9000be0 	str	x0, [sp, #16]
   83254:	9100c3f4 	add	x20, sp, #0x30
   83258:	9101c3e0 	add	x0, sp, #0x70
   8325c:	a90327e8 	stp	x8, x9, [sp, #48]
   83260:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83264:	91288108 	add	x8, x8, #0xa20
   83268:	910163f5 	add	x21, sp, #0x58
   8326c:	a9092bf4 	stp	x20, x10, [sp, #144]
   83270:	a9072be8 	stp	x8, x10, [sp, #112]
   83274:	f0000028 	adrp	x8, 8a000 <memmove>
   83278:	910ea108 	add	x8, x8, #0x3a8
   8327c:	a9082be8 	stp	x8, x10, [sp, #128]
   83280:	910163e8 	add	x8, sp, #0x58
   83284:	94001069 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83288:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   8328c:	f0ffffe9 	adrp	x9, 82000 <__rg_realloc+0x48>
   83290:	91278108 	add	x8, x8, #0x9e0
   83294:	91378129 	add	x9, x9, #0xde0
   83298:	d000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   8329c:	a9087fff 	stp	xzr, xzr, [sp, #128]
   832a0:	9126c14a 	add	x10, x10, #0x9b0
   832a4:	9e670100 	fmov	d0, x8
   832a8:	90000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   832ac:	91148108 	add	x8, x8, #0x520
   832b0:	a90427f5 	stp	x21, x9, [sp, #64]
   832b4:	52800049 	mov	w9, #0x2                   	// #2
   832b8:	a90927f4 	stp	x20, x9, [sp, #144]
   832bc:	4e181d00 	mov	v0.d[1], x8
   832c0:	52800068 	mov	w8, #0x3                   	// #3
   832c4:	a90723ea 	stp	x10, x8, [sp, #112]
   832c8:	3d800fe0 	str	q0, [sp, #48]
   832cc:	910063e8 	add	x8, sp, #0x18
   832d0:	9101c3e0 	add	x0, sp, #0x70
   832d4:	94001055 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   832d8:	f94033e1 	ldr	x1, [sp, #96]
   832dc:	b4000081 	cbz	x1, 832ec <_ZN13ruspiro_brain8thoughts8wakeable18clone_wakeable_raw17h7ac58330b94a9e97E+0xbc>
   832e0:	f9402fe0 	ldr	x0, [sp, #88]
   832e4:	52800022 	mov	w2, #0x1                   	// #1
   832e8:	97fffaa4 	bl	81d78 <__rust_dealloc>
   832ec:	a941a3f4 	ldp	x20, x8, [sp, #24]
   832f0:	f94017e1 	ldr	x1, [sp, #40]
   832f4:	a90723f4 	stp	x20, x8, [sp, #112]
   832f8:	f90043e1 	str	x1, [sp, #128]
   832fc:	aa1403e0 	mov	x0, x20
   83300:	94000fe0 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   83304:	f9403fe1 	ldr	x1, [sp, #120]
   83308:	b4000081 	cbz	x1, 83318 <_ZN13ruspiro_brain8thoughts8wakeable18clone_wakeable_raw17h7ac58330b94a9e97E+0xe8>
   8330c:	aa1403e0 	mov	x0, x20
   83310:	52800022 	mov	w2, #0x1                   	// #1
   83314:	97fffa99 	bl	81d78 <__rust_dealloc>
   83318:	f9400be8 	ldr	x8, [sp, #16]
   8331c:	d1004108 	sub	x8, x8, #0x10
   83320:	c85f7d09 	ldxr	x9, [x8]
   83324:	9100052a 	add	x10, x9, #0x1
   83328:	c80b7d0a 	stxr	w11, x10, [x8]
   8332c:	35ffffab 	cbnz	w11, 83320 <_ZN13ruspiro_brain8thoughts8wakeable18clone_wakeable_raw17h7ac58330b94a9e97E+0xf0>
   83330:	b7f802e9 	tbnz	x9, #63, 8338c <_ZN13ruspiro_brain8thoughts8wakeable18clone_wakeable_raw17h7ac58330b94a9e97E+0x15c>
   83334:	f0ffffe8 	adrp	x8, 82000 <__rg_realloc+0x48>
   83338:	90000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   8333c:	913dc108 	add	x8, x8, #0xf70
   83340:	9000000a 	adrp	x10, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83344:	9108c129 	add	x9, x9, #0x230
   83348:	910f214a 	add	x10, x10, #0x3c8
   8334c:	a94a53f5 	ldp	x21, x20, [sp, #160]
   83350:	9e670100 	fmov	d0, x8
   83354:	90000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83358:	91038108 	add	x8, x8, #0xe0
   8335c:	4e181d00 	mov	v0.d[1], x8
   83360:	f9400be8 	ldr	x8, [sp, #16]
   83364:	f9000268 	str	x8, [x19]
   83368:	3d8003e0 	str	q0, [sp]
   8336c:	f94007e8 	ldr	x8, [sp, #8]
   83370:	f9000a68 	str	x8, [x19, #16]
   83374:	f94003e8 	ldr	x8, [sp]
   83378:	a901aa69 	stp	x9, x10, [x19, #24]
   8337c:	f9000668 	str	x8, [x19, #8]
   83380:	a94b7bf3 	ldp	x19, x30, [sp, #176]
   83384:	910303ff 	add	sp, sp, #0xc0
   83388:	d65f03c0 	ret
   8338c:	d4200020 	brk	#0x1
   83390:	d4200020 	brk	#0x1
   83394:	aa0003f3 	mov	x19, x0
   83398:	9101c3e0 	add	x0, sp, #0x70
   8339c:	97fffe81 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   833a0:	aa1303e0 	mov	x0, x19
   833a4:	94000253 	bl	83cf0 <_Unwind_Resume>
   833a8:	d4200020 	brk	#0x1
   833ac:	aa0003f3 	mov	x19, x0
   833b0:	910163e0 	add	x0, sp, #0x58
   833b4:	97fffe7b 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   833b8:	aa1303e0 	mov	x0, x19
   833bc:	9400024d 	bl	83cf0 <_Unwind_Resume>
   833c0:	d4200020 	brk	#0x1
   833c4:	00000000 	.inst	0x00000000 ; undefined

00000000000833c8 <_ZN13ruspiro_brain8thoughts8wakeable17drop_wakeable_raw17hd40dfd41d5abc4d3E>:
   833c8:	d102c3ff 	sub	sp, sp, #0xb0
   833cc:	a90903f4 	stp	x20, x0, [sp, #144]
   833d0:	a90a7bf3 	stp	x19, x30, [sp, #160]
   833d4:	90000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   833d8:	910263e8 	add	x8, sp, #0x98
   833dc:	9114e129 	add	x9, x9, #0x538
   833e0:	5280002a 	mov	w10, #0x1                   	// #1
   833e4:	910083f3 	add	x19, sp, #0x20
   833e8:	910183e0 	add	x0, sp, #0x60
   833ec:	910123f4 	add	x20, sp, #0x48
   833f0:	a90227e8 	stp	x8, x9, [sp, #32]
   833f4:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   833f8:	9128c108 	add	x8, x8, #0xa30
   833fc:	a9082bf3 	stp	x19, x10, [sp, #128]
   83400:	a9062be8 	stp	x8, x10, [sp, #96]
   83404:	f0000028 	adrp	x8, 8a000 <memmove>
   83408:	9110a108 	add	x8, x8, #0x428
   8340c:	a9072be8 	stp	x8, x10, [sp, #112]
   83410:	910123e8 	add	x8, sp, #0x48
   83414:	94001005 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83418:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   8341c:	f0ffffe9 	adrp	x9, 82000 <__rg_realloc+0x48>
   83420:	91278108 	add	x8, x8, #0x9e0
   83424:	91378129 	add	x9, x9, #0xde0
   83428:	d000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   8342c:	a9077fff 	stp	xzr, xzr, [sp, #112]
   83430:	9126c14a 	add	x10, x10, #0x9b0
   83434:	9e670100 	fmov	d0, x8
   83438:	90000008 	adrp	x8, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   8343c:	91148108 	add	x8, x8, #0x520
   83440:	a90327f4 	stp	x20, x9, [sp, #48]
   83444:	52800049 	mov	w9, #0x2                   	// #2
   83448:	a90827f3 	stp	x19, x9, [sp, #128]
   8344c:	4e181d00 	mov	v0.d[1], x8
   83450:	52800068 	mov	w8, #0x3                   	// #3
   83454:	a90623ea 	stp	x10, x8, [sp, #96]
   83458:	3d800be0 	str	q0, [sp, #32]
   8345c:	910023e8 	add	x8, sp, #0x8
   83460:	910183e0 	add	x0, sp, #0x60
   83464:	94000ff1 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83468:	f9402be1 	ldr	x1, [sp, #80]
   8346c:	b4000081 	cbz	x1, 8347c <_ZN13ruspiro_brain8thoughts8wakeable17drop_wakeable_raw17hd40dfd41d5abc4d3E+0xb4>
   83470:	f94027e0 	ldr	x0, [sp, #72]
   83474:	52800022 	mov	w2, #0x1                   	// #1
   83478:	97fffa40 	bl	81d78 <__rust_dealloc>
   8347c:	a940a3f3 	ldp	x19, x8, [sp, #8]
   83480:	f9400fe1 	ldr	x1, [sp, #24]
   83484:	a90623f3 	stp	x19, x8, [sp, #96]
   83488:	f9003be1 	str	x1, [sp, #112]
   8348c:	aa1303e0 	mov	x0, x19
   83490:	94000f7c 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   83494:	f94037e1 	ldr	x1, [sp, #104]
   83498:	b4000081 	cbz	x1, 834a8 <_ZN13ruspiro_brain8thoughts8wakeable17drop_wakeable_raw17hd40dfd41d5abc4d3E+0xe0>
   8349c:	aa1303e0 	mov	x0, x19
   834a0:	52800022 	mov	w2, #0x1                   	// #1
   834a4:	97fffa35 	bl	81d78 <__rust_dealloc>
   834a8:	f9404fe8 	ldr	x8, [sp, #152]
   834ac:	d1004108 	sub	x8, x8, #0x10
   834b0:	f90033e8 	str	x8, [sp, #96]
   834b4:	c85f7d09 	ldxr	x9, [x8]
   834b8:	f1000529 	subs	x9, x9, #0x1
   834bc:	c80afd09 	stlxr	w10, x9, [x8]
   834c0:	35ffffaa 	cbnz	w10, 834b4 <_ZN13ruspiro_brain8thoughts8wakeable17drop_wakeable_raw17hd40dfd41d5abc4d3E+0xec>
   834c4:	54000081 	b.ne	834d4 <_ZN13ruspiro_brain8thoughts8wakeable17drop_wakeable_raw17hd40dfd41d5abc4d3E+0x10c>  // b.any
   834c8:	910183e0 	add	x0, sp, #0x60
   834cc:	d50339bf 	dmb	ishld
   834d0:	94000106 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   834d4:	a94a7bf3 	ldp	x19, x30, [sp, #160]
   834d8:	f9404bf4 	ldr	x20, [sp, #144]
   834dc:	9102c3ff 	add	sp, sp, #0xb0
   834e0:	d65f03c0 	ret
   834e4:	aa0003f3 	mov	x19, x0
   834e8:	910183e0 	add	x0, sp, #0x60
   834ec:	97fffe2d 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   834f0:	aa1303e0 	mov	x0, x19
   834f4:	940001ff 	bl	83cf0 <_Unwind_Resume>
   834f8:	d4200020 	brk	#0x1
   834fc:	aa0003f3 	mov	x19, x0
   83500:	910123e0 	add	x0, sp, #0x48
   83504:	97fffe27 	bl	82da0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83508:	aa1303e0 	mov	x0, x19
   8350c:	940001f9 	bl	83cf0 <_Unwind_Resume>
   83510:	d4200020 	brk	#0x1
   83514:	00000000 	.inst	0x00000000 ; undefined

0000000000083518 <_ZN13ruspiro_brain8thoughts8wakeable4noop17h18973509f973cd6cE>:
   83518:	d65f03c0 	ret
   8351c:	00000000 	.inst	0x00000000 ; undefined

0000000000083520 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h86013de608609ab5E>:
   83520:	a9402408 	ldp	x8, x9, [x0]
   83524:	aa0103e2 	mov	x2, x1
   83528:	aa0803e0 	mov	x0, x8
   8352c:	aa0903e1 	mov	x1, x9
   83530:	14001948 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>
   83534:	00000000 	.inst	0x00000000 ; undefined

0000000000083538 <_ZN52_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha5e08877160dc6b8E>:
   83538:	d10143ff 	sub	sp, sp, #0x50
   8353c:	a9025bf7 	stp	x23, x22, [sp, #32]
   83540:	a90353f5 	stp	x21, x20, [sp, #48]
   83544:	a9047bf3 	stp	x19, x30, [sp, #64]
   83548:	a9405835 	ldp	x21, x22, [x1]
   8354c:	aa0003f4 	mov	x20, x0
   83550:	aa0103e0 	mov	x0, x1
   83554:	b9405037 	ldr	w23, [x1, #80]
   83558:	aa0103f3 	mov	x19, x1
   8355c:	940017e0 	bl	894dc <_ZN4core3fmt9Formatter9alternate17h55b61d4eb6831511E>
   83560:	b9405268 	ldr	w8, [x19, #80]
   83564:	340001a0 	cbz	w0, 83598 <_ZN52_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha5e08877160dc6b8E+0x60>
   83568:	f9400269 	ldr	x9, [x19]
   8356c:	321d0108 	orr	w8, w8, #0x8
   83570:	b9005268 	str	w8, [x19, #80]
   83574:	f100053f 	cmp	x9, #0x1
   83578:	54000100 	b.eq	83598 <_ZN52_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha5e08877160dc6b8E+0x60>  // b.none
   8357c:	f0000029 	adrp	x9, 8a000 <memmove>
   83580:	3dc11d20 	ldr	q0, [x9, #1136]
   83584:	3d8003e0 	str	q0, [sp]
   83588:	f94007e9 	ldr	x9, [sp, #8]
   8358c:	f9000669 	str	x9, [x19, #8]
   83590:	f94003e9 	ldr	x9, [sp]
   83594:	f9000269 	str	x9, [x19]
   83598:	f9400289 	ldr	x9, [x20]
   8359c:	321e0108 	orr	w8, w8, #0x4
   835a0:	910063e0 	add	x0, sp, #0x18
   835a4:	aa1303e1 	mov	x1, x19
   835a8:	b9005268 	str	w8, [x19, #80]
   835ac:	f9000fe9 	str	x9, [sp, #24]
   835b0:	940010f8 	bl	87990 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h9d17b57bf7f81c93E>
   835b4:	a9005a75 	stp	x21, x22, [x19]
   835b8:	b9005277 	str	w23, [x19, #80]
   835bc:	a9447bf3 	ldp	x19, x30, [sp, #64]
   835c0:	a94353f5 	ldp	x21, x20, [sp, #48]
   835c4:	a9425bf7 	ldp	x23, x22, [sp, #32]
   835c8:	910143ff 	add	sp, sp, #0x50
   835cc:	d65f03c0 	ret

00000000000835d0 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>:
   835d0:	f9400008 	ldr	x8, [x0]
   835d4:	c85f7d09 	ldxr	x9, [x8]
   835d8:	f1000529 	subs	x9, x9, #0x1
   835dc:	c80afd09 	stlxr	w10, x9, [x8]
   835e0:	35ffffaa 	cbnz	w10, 835d4 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x4>
   835e4:	54000061 	b.ne	835f0 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x20>  // b.any
   835e8:	d50339bf 	dmb	ishld
   835ec:	140000bf 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   835f0:	d65f03c0 	ret
   835f4:	00000000 	.inst	0x00000000 ; undefined

00000000000835f8 <_ZN4core3ptr18real_drop_in_place17hf680be72e4b8c490E>:
   835f8:	f9400008 	ldr	x8, [x0]
   835fc:	b4000108 	cbz	x8, 8361c <_ZN4core3ptr18real_drop_in_place17hf680be72e4b8c490E+0x24>
   83600:	c85f7d09 	ldxr	x9, [x8]
   83604:	f1000529 	subs	x9, x9, #0x1
   83608:	c80afd09 	stlxr	w10, x9, [x8]
   8360c:	35ffffaa 	cbnz	w10, 83600 <_ZN4core3ptr18real_drop_in_place17hf680be72e4b8c490E+0x8>
   83610:	54000061 	b.ne	8361c <_ZN4core3ptr18real_drop_in_place17hf680be72e4b8c490E+0x24>  // b.any
   83614:	d50339bf 	dmb	ishld
   83618:	140000b4 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   8361c:	d65f03c0 	ret

0000000000083620 <_ZN5alloc5alloc8box_free17h1d587d659861a7c5E.llvm.17294116360248276485>:
   83620:	52800201 	mov	w1, #0x10                  	// #16
   83624:	52800202 	mov	w2, #0x10                  	// #16
   83628:	17fff9d4 	b	81d78 <__rust_dealloc>
   8362c:	00000000 	.inst	0x00000000 ; undefined

0000000000083630 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E>:
   83630:	d100c3ff 	sub	sp, sp, #0x30
   83634:	a90153f5 	stp	x21, x20, [sp, #16]
   83638:	a9027bf3 	stp	x19, x30, [sp, #32]
   8363c:	aa0003f5 	mov	x21, x0
   83640:	52800200 	mov	w0, #0x10                  	// #16
   83644:	52800201 	mov	w1, #0x10                  	// #16
   83648:	97fff9c8 	bl	81d68 <__rust_alloc>
   8364c:	b4000940 	cbz	x0, 83774 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x144>
   83650:	aa0003f4 	mov	x20, x0
   83654:	910042a8 	add	x8, x21, #0x10
   83658:	a9007c1f 	stp	xzr, xzr, [x0]
   8365c:	c85ffd13 	ldaxr	x19, [x8]
   83660:	c809fd14 	stlxr	w9, x20, [x8]
   83664:	35ffffc9 	cbnz	w9, 8365c <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x2c>
   83668:	f9400269 	ldr	x9, [x19]
   8366c:	b4000529 	cbz	x9, 83710 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0xe0>
   83670:	c89ffd09 	stlr	x9, [x8]
   83674:	f9400528 	ldr	x8, [x9, #8]
   83678:	f900053f 	str	xzr, [x9, #8]
   8367c:	f90007e8 	str	x8, [sp, #8]
   83680:	b4000828 	cbz	x8, 83784 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x154>
   83684:	aa1303e0 	mov	x0, x19
   83688:	f90007e8 	str	x8, [sp, #8]
   8368c:	f8408c08 	ldr	x8, [x0, #8]!
   83690:	b4000108 	cbz	x8, 836b0 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x80>
   83694:	c85f7d09 	ldxr	x9, [x8]
   83698:	f1000529 	subs	x9, x9, #0x1
   8369c:	c80afd09 	stlxr	w10, x9, [x8]
   836a0:	35ffffaa 	cbnz	w10, 83694 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x64>
   836a4:	54000061 	b.ne	836b0 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x80>  // b.any
   836a8:	d50339bf 	dmb	ishld
   836ac:	9400008f 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   836b0:	aa1303e0 	mov	x0, x19
   836b4:	52800201 	mov	w1, #0x10                  	// #16
   836b8:	52800202 	mov	w2, #0x10                  	// #16
   836bc:	97fff9af 	bl	81d78 <__rust_dealloc>
   836c0:	aa1403e0 	mov	x0, x20
   836c4:	f8408c08 	ldr	x8, [x0, #8]!
   836c8:	b4000108 	cbz	x8, 836e8 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0xb8>
   836cc:	c85f7d09 	ldxr	x9, [x8]
   836d0:	f1000529 	subs	x9, x9, #0x1
   836d4:	c80afd09 	stlxr	w10, x9, [x8]
   836d8:	35ffffaa 	cbnz	w10, 836cc <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x9c>
   836dc:	54000061 	b.ne	836e8 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0xb8>  // b.any
   836e0:	d50339bf 	dmb	ishld
   836e4:	94000081 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   836e8:	aa1403e0 	mov	x0, x20
   836ec:	52800201 	mov	w1, #0x10                  	// #16
   836f0:	52800202 	mov	w2, #0x10                  	// #16
   836f4:	97fff9a1 	bl	81d78 <__rust_dealloc>
   836f8:	f94007e1 	ldr	x1, [sp, #8]
   836fc:	52800020 	mov	w0, #0x1                   	// #1
   83700:	a9427bf3 	ldp	x19, x30, [sp, #32]
   83704:	a94153f5 	ldp	x21, x20, [sp, #16]
   83708:	9100c3ff 	add	sp, sp, #0x30
   8370c:	d65f03c0 	ret
   83710:	c85ffd14 	ldaxr	x20, [x8]
   83714:	c809fd13 	stlxr	w9, x19, [x8]
   83718:	35ffffc9 	cbnz	w9, 83710 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0xe0>
   8371c:	aa1403e0 	mov	x0, x20
   83720:	f8408c08 	ldr	x8, [x0, #8]!
   83724:	b4000108 	cbz	x8, 83744 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x114>
   83728:	c85f7d09 	ldxr	x9, [x8]
   8372c:	f1000529 	subs	x9, x9, #0x1
   83730:	c80afd09 	stlxr	w10, x9, [x8]
   83734:	35ffffaa 	cbnz	w10, 83728 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0xf8>
   83738:	54000061 	b.ne	83744 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x114>  // b.any
   8373c:	d50339bf 	dmb	ishld
   83740:	9400006a 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   83744:	aa1403e0 	mov	x0, x20
   83748:	52800201 	mov	w1, #0x10                  	// #16
   8374c:	52800202 	mov	w2, #0x10                  	// #16
   83750:	97fff98a 	bl	81d78 <__rust_dealloc>
   83754:	f9400ea8 	ldr	x8, [x21, #24]
   83758:	eb13011f 	cmp	x8, x19
   8375c:	1a9f07e8 	cset	w8, ne  // ne = any
   83760:	d37ff900 	lsl	x0, x8, #1
   83764:	a9427bf3 	ldp	x19, x30, [sp, #32]
   83768:	a94153f5 	ldp	x21, x20, [sp, #16]
   8376c:	9100c3ff 	add	sp, sp, #0x30
   83770:	d65f03c0 	ret
   83774:	52800200 	mov	w0, #0x10                  	// #16
   83778:	52800201 	mov	w1, #0x10                  	// #16
   8377c:	94000f21 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   83780:	d4200020 	brk	#0x1
   83784:	f0000020 	adrp	x0, 8a000 <memmove>
   83788:	d0000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   8378c:	9113c000 	add	x0, x0, #0x4f0
   83790:	52800561 	mov	w1, #0x2b                  	// #43
   83794:	91290042 	add	x2, x2, #0xa40
   83798:	94001988 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   8379c:	d4200020 	brk	#0x1
   837a0:	aa0003f5 	mov	x21, x0
   837a4:	910023e0 	add	x0, sp, #0x8
   837a8:	97ffff94 	bl	835f8 <_ZN4core3ptr18real_drop_in_place17hf680be72e4b8c490E>
   837ac:	aa1503e0 	mov	x0, x21
   837b0:	94000150 	bl	83cf0 <_Unwind_Resume>
   837b4:	d4200020 	brk	#0x1
   837b8:	aa0003f5 	mov	x21, x0
   837bc:	aa1403e0 	mov	x0, x20
   837c0:	97ffff98 	bl	83620 <_ZN5alloc5alloc8box_free17h1d587d659861a7c5E.llvm.17294116360248276485>
   837c4:	aa1503e0 	mov	x0, x21
   837c8:	9400014a 	bl	83cf0 <_Unwind_Resume>
   837cc:	d4200020 	brk	#0x1
   837d0:	aa0003f5 	mov	x21, x0
   837d4:	aa1403f3 	mov	x19, x20
   837d8:	14000002 	b	837e0 <_ZN13ruspiro_brain4mpmc5queue14Queue$LT$T$GT$3pop17hbdf4bed17113c0a0E+0x1b0>
   837dc:	aa0003f5 	mov	x21, x0
   837e0:	aa1303e0 	mov	x0, x19
   837e4:	97ffff8f 	bl	83620 <_ZN5alloc5alloc8box_free17h1d587d659861a7c5E.llvm.17294116360248276485>
   837e8:	910023e0 	add	x0, sp, #0x8
   837ec:	97ffff79 	bl	835d0 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>
   837f0:	aa1503e0 	mov	x0, x21
   837f4:	9400013f 	bl	83cf0 <_Unwind_Resume>
   837f8:	d4200020 	brk	#0x1
   837fc:	00000000 	.inst	0x00000000 ; undefined

0000000000083800 <_ZN4core3ptr18real_drop_in_place17hc8a142c2c137f620E>:
   83800:	f9400008 	ldr	x8, [x0]
   83804:	c85f7d09 	ldxr	x9, [x8]
   83808:	f1000529 	subs	x9, x9, #0x1
   8380c:	c80afd09 	stlxr	w10, x9, [x8]
   83810:	35ffffaa 	cbnz	w10, 83804 <_ZN4core3ptr18real_drop_in_place17hc8a142c2c137f620E+0x4>
   83814:	54000061 	b.ne	83820 <_ZN4core3ptr18real_drop_in_place17hc8a142c2c137f620E+0x20>  // b.any
   83818:	d50339bf 	dmb	ishld
   8381c:	14000003 	b	83828 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E>
   83820:	d65f03c0 	ret
   83824:	00000000 	.inst	0x00000000 ; undefined

0000000000083828 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E>:
   83828:	a9be53f5 	stp	x21, x20, [sp, #-32]!
   8382c:	a9017bf3 	stp	x19, x30, [sp, #16]
   83830:	f9400008 	ldr	x8, [x0]
   83834:	aa0003f3 	mov	x19, x0
   83838:	f9401115 	ldr	x21, [x8, #32]
   8383c:	b50000f5 	cbnz	x21, 83858 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x30>
   83840:	14000014 	b	83890 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x68>
   83844:	aa1403e0 	mov	x0, x20
   83848:	52800201 	mov	w1, #0x10                  	// #16
   8384c:	52800202 	mov	w2, #0x10                  	// #16
   83850:	97fff94a 	bl	81d78 <__rust_dealloc>
   83854:	b40001d5 	cbz	x21, 8388c <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x64>
   83858:	aa1503f4 	mov	x20, x21
   8385c:	f94002b5 	ldr	x21, [x21]
   83860:	aa1403e0 	mov	x0, x20
   83864:	f8408c08 	ldr	x8, [x0, #8]!
   83868:	b4fffee8 	cbz	x8, 83844 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x1c>
   8386c:	c85f7d09 	ldxr	x9, [x8]
   83870:	f1000529 	subs	x9, x9, #0x1
   83874:	c80afd09 	stlxr	w10, x9, [x8]
   83878:	35ffffaa 	cbnz	w10, 8386c <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x44>
   8387c:	54fffe41 	b.ne	83844 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x1c>  // b.any
   83880:	d50339bf 	dmb	ishld
   83884:	94000019 	bl	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   83888:	17ffffef 	b	83844 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x1c>
   8388c:	f9400268 	ldr	x8, [x19]
   83890:	91002108 	add	x8, x8, #0x8
   83894:	c85f7d09 	ldxr	x9, [x8]
   83898:	f1000529 	subs	x9, x9, #0x1
   8389c:	c80afd09 	stlxr	w10, x9, [x8]
   838a0:	35ffffaa 	cbnz	w10, 83894 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x6c>
   838a4:	54000101 	b.ne	838c4 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E+0x9c>  // b.any
   838a8:	d50339bf 	dmb	ishld
   838ac:	52800601 	mov	w1, #0x30                  	// #48
   838b0:	f9400260 	ldr	x0, [x19]
   838b4:	52800202 	mov	w2, #0x10                  	// #16
   838b8:	a9417bf3 	ldp	x19, x30, [sp, #16]
   838bc:	a8c253f5 	ldp	x21, x20, [sp], #32
   838c0:	17fff92e 	b	81d78 <__rust_dealloc>
   838c4:	a9417bf3 	ldp	x19, x30, [sp, #16]
   838c8:	a8c253f5 	ldp	x21, x20, [sp], #32
   838cc:	d65f03c0 	ret
   838d0:	aa0003f3 	mov	x19, x0
   838d4:	aa1403e0 	mov	x0, x20
   838d8:	97ffff52 	bl	83620 <_ZN5alloc5alloc8box_free17h1d587d659861a7c5E.llvm.17294116360248276485>
   838dc:	aa1303e0 	mov	x0, x19
   838e0:	94000104 	bl	83cf0 <_Unwind_Resume>
   838e4:	d4200020 	brk	#0x1

00000000000838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>:
   838e8:	f81e0ff4 	str	x20, [sp, #-32]!
   838ec:	a9017bf3 	stp	x19, x30, [sp, #16]
   838f0:	f9400014 	ldr	x20, [x0]
   838f4:	aa0003f3 	mov	x19, x0
   838f8:	f9400e80 	ldr	x0, [x20, #24]
   838fc:	b4000140 	cbz	x0, 83924 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E+0x3c>
   83900:	f9401288 	ldr	x8, [x20, #32]
   83904:	f9400108 	ldr	x8, [x8]
   83908:	d63f0100 	blr	x8
   8390c:	f9401288 	ldr	x8, [x20, #32]
   83910:	f9400501 	ldr	x1, [x8, #8]
   83914:	b4000081 	cbz	x1, 83924 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E+0x3c>
   83918:	f9400e80 	ldr	x0, [x20, #24]
   8391c:	f9400902 	ldr	x2, [x8, #16]
   83920:	97fff916 	bl	81d78 <__rust_dealloc>
   83924:	f8430e88 	ldr	x8, [x20, #48]!
   83928:	c85f7d09 	ldxr	x9, [x8]
   8392c:	f1000529 	subs	x9, x9, #0x1
   83930:	c80afd09 	stlxr	w10, x9, [x8]
   83934:	35ffffaa 	cbnz	w10, 83928 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E+0x40>
   83938:	54000081 	b.ne	83948 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E+0x60>  // b.any
   8393c:	aa1403e0 	mov	x0, x20
   83940:	d50339bf 	dmb	ishld
   83944:	97ffffb9 	bl	83828 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hc8c599f344fe6447E>
   83948:	f9400268 	ldr	x8, [x19]
   8394c:	91002108 	add	x8, x8, #0x8
   83950:	c85f7d09 	ldxr	x9, [x8]
   83954:	f1000529 	subs	x9, x9, #0x1
   83958:	c80afd09 	stlxr	w10, x9, [x8]
   8395c:	35ffffaa 	cbnz	w10, 83950 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E+0x68>
   83960:	54000101 	b.ne	83980 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E+0x98>  // b.any
   83964:	d50339bf 	dmb	ishld
   83968:	52800801 	mov	w1, #0x40                  	// #64
   8396c:	f9400260 	ldr	x0, [x19]
   83970:	52800202 	mov	w2, #0x10                  	// #16
   83974:	a9417bf3 	ldp	x19, x30, [sp, #16]
   83978:	f84207f4 	ldr	x20, [sp], #32
   8397c:	17fff8ff 	b	81d78 <__rust_dealloc>
   83980:	a9417bf3 	ldp	x19, x30, [sp, #16]
   83984:	f84207f4 	ldr	x20, [sp], #32
   83988:	d65f03c0 	ret
   8398c:	a9418688 	ldp	x8, x1, [x20, #24]
   83990:	aa0003f3 	mov	x19, x0
   83994:	aa0803e0 	mov	x0, x8
   83998:	94000006 	bl	839b0 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE>
   8399c:	9100c280 	add	x0, x20, #0x30
   839a0:	97ffff98 	bl	83800 <_ZN4core3ptr18real_drop_in_place17hc8a142c2c137f620E>
   839a4:	aa1303e0 	mov	x0, x19
   839a8:	940000d2 	bl	83cf0 <_Unwind_Resume>
   839ac:	d4200020 	brk	#0x1

00000000000839b0 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE>:
   839b0:	aa0103e8 	mov	x8, x1
   839b4:	f9400421 	ldr	x1, [x1, #8]
   839b8:	b4000061 	cbz	x1, 839c4 <_ZN5alloc5alloc8box_free17hde8f60f6f634249cE+0x14>
   839bc:	f9400902 	ldr	x2, [x8, #16]
   839c0:	17fff8ee 	b	81d78 <__rust_dealloc>
   839c4:	d65f03c0 	ret

00000000000839c8 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E.llvm.13170691176973607575>:
   839c8:	f9400008 	ldr	x8, [x0]
   839cc:	c85f7d09 	ldxr	x9, [x8]
   839d0:	f1000529 	subs	x9, x9, #0x1
   839d4:	c80afd09 	stlxr	w10, x9, [x8]
   839d8:	35ffffaa 	cbnz	w10, 839cc <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E.llvm.13170691176973607575+0x4>
   839dc:	54000061 	b.ne	839e8 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E.llvm.13170691176973607575+0x20>  // b.any
   839e0:	d50339bf 	dmb	ishld
   839e4:	17ffffc1 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   839e8:	d65f03c0 	ret
   839ec:	00000000 	.inst	0x00000000 ; undefined

00000000000839f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>:
   839f0:	f9400401 	ldr	x1, [x0, #8]
   839f4:	b4000081 	cbz	x1, 83a04 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE+0x14>
   839f8:	f9400000 	ldr	x0, [x0]
   839fc:	52800022 	mov	w2, #0x1                   	// #1
   83a00:	17fff8de 	b	81d78 <__rust_dealloc>
   83a04:	d65f03c0 	ret

0000000000083a08 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>:
   83a08:	f9400008 	ldr	x8, [x0]
   83a0c:	c85f7d09 	ldxr	x9, [x8]
   83a10:	f1000529 	subs	x9, x9, #0x1
   83a14:	c80afd09 	stlxr	w10, x9, [x8]
   83a18:	35ffffaa 	cbnz	w10, 83a0c <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x4>
   83a1c:	54000061 	b.ne	83a28 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E+0x20>  // b.any
   83a20:	d50339bf 	dmb	ishld
   83a24:	17ffffb1 	b	838e8 <_ZN5alloc4sync12Arc$LT$T$GT$9drop_slow17hcadfdbdeccafae32E>
   83a28:	d65f03c0 	ret
   83a2c:	00000000 	.inst	0x00000000 ; undefined

0000000000083a30 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   83a30:	f9400008 	ldr	x8, [x0]
   83a34:	aa0103e2 	mov	x2, x1
   83a38:	f9400809 	ldr	x9, [x0, #16]
   83a3c:	aa0803e0 	mov	x0, x8
   83a40:	aa0903e1 	mov	x1, x9
   83a44:	14001803 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000083a48 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E>:
   83a48:	d10343ff 	sub	sp, sp, #0xd0
   83a4c:	f9004bf8 	str	x24, [sp, #144]
   83a50:	a90a5bf7 	stp	x23, x22, [sp, #160]
   83a54:	a90b53f5 	stp	x21, x20, [sp, #176]
   83a58:	a90c7bf3 	stp	x19, x30, [sp, #192]
   83a5c:	f9400008 	ldr	x8, [x0]
   83a60:	aa0003f3 	mov	x19, x0
   83a64:	c85f7d09 	ldxr	x9, [x8]
   83a68:	9100052a 	add	x10, x9, #0x1
   83a6c:	c80b7d0a 	stxr	w11, x10, [x8]
   83a70:	35ffffab 	cbnz	w11, 83a64 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x1c>
   83a74:	b7f80f69 	tbnz	x9, #63, 83c60 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x218>
   83a78:	f0000049 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   83a7c:	910023ea 	add	x10, sp, #0x8
   83a80:	910123f7 	add	x23, sp, #0x48
   83a84:	f9444929 	ldr	x9, [x9, #2192]
   83a88:	f9004fe8 	str	x8, [sp, #152]
   83a8c:	c8dffd08 	ldar	x8, [x8]
   83a90:	a9077fff 	stp	xzr, xzr, [sp, #112]
   83a94:	a904a7ea 	stp	x10, x9, [sp, #72]
   83a98:	52800049 	mov	w9, #0x2                   	// #2
   83a9c:	f90007e8 	str	x8, [sp, #8]
   83aa0:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83aa4:	912a6108 	add	x8, x8, #0xa98
   83aa8:	a90627e8 	stp	x8, x9, [sp, #96]
   83aac:	52800028 	mov	w8, #0x1                   	// #1
   83ab0:	a90823f7 	stp	x23, x8, [sp, #128]
   83ab4:	910083e8 	add	x8, sp, #0x20
   83ab8:	910183e0 	add	x0, sp, #0x60
   83abc:	910083f4 	add	x20, sp, #0x20
   83ac0:	94000e5a 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83ac4:	d0000056 	adrp	x22, 8d000 <GCC_except_table3+0xa5c>
   83ac8:	90000015 	adrp	x21, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83acc:	912a22d6 	add	x22, x22, #0xa88
   83ad0:	911482b5 	add	x21, x21, #0x520
   83ad4:	a94227e8 	ldp	x8, x9, [sp, #32]
   83ad8:	90000018 	adrp	x24, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83adc:	9e6702c0 	fmov	d0, x22
   83ae0:	9128c318 	add	x24, x24, #0xa30
   83ae4:	f9401bea 	ldr	x10, [sp, #48]
   83ae8:	a904a7e8 	stp	x8, x9, [sp, #72]
   83aec:	52800068 	mov	w8, #0x3                   	// #3
   83af0:	a90363f7 	stp	x23, x24, [sp, #48]
   83af4:	d0000057 	adrp	x23, 8d000 <GCC_except_table3+0xa5c>
   83af8:	912962f7 	add	x23, x23, #0xa58
   83afc:	a907d3ff 	stp	xzr, x20, [sp, #120]
   83b00:	a906ffe8 	stp	x8, xzr, [sp, #104]
   83b04:	52800048 	mov	w8, #0x2                   	// #2
   83b08:	4e181ea0 	mov	v0.d[1], x21
   83b0c:	a905dfea 	stp	x10, x23, [sp, #88]
   83b10:	f90047e8 	str	x8, [sp, #136]
   83b14:	3d800be0 	str	q0, [sp, #32]
   83b18:	910023e8 	add	x8, sp, #0x8
   83b1c:	910183e0 	add	x0, sp, #0x60
   83b20:	94000e42 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83b24:	f9402be1 	ldr	x1, [sp, #80]
   83b28:	b4000081 	cbz	x1, 83b38 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0xf0>
   83b2c:	f94027e0 	ldr	x0, [sp, #72]
   83b30:	52800022 	mov	w2, #0x1                   	// #1
   83b34:	97fff891 	bl	81d78 <__rust_dealloc>
   83b38:	a940a3f4 	ldp	x20, x8, [sp, #8]
   83b3c:	f9400fe1 	ldr	x1, [sp, #24]
   83b40:	a90623f4 	stp	x20, x8, [sp, #96]
   83b44:	f9003be1 	str	x1, [sp, #112]
   83b48:	aa1403e0 	mov	x0, x20
   83b4c:	94000dcd 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   83b50:	f94037e1 	ldr	x1, [sp, #104]
   83b54:	b4000081 	cbz	x1, 83b64 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x11c>
   83b58:	aa1403e0 	mov	x0, x20
   83b5c:	52800022 	mov	w2, #0x1                   	// #1
   83b60:	97fff886 	bl	81d78 <__rust_dealloc>
   83b64:	f9400268 	ldr	x8, [x19]
   83b68:	52800200 	mov	w0, #0x10                  	// #16
   83b6c:	f9404ff3 	ldr	x19, [sp, #152]
   83b70:	52800201 	mov	w1, #0x10                  	// #16
   83b74:	f9401914 	ldr	x20, [x8, #48]
   83b78:	97fff87c 	bl	81d68 <__rust_alloc>
   83b7c:	b4000760 	cbz	x0, 83c68 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x220>
   83b80:	9100a289 	add	x9, x20, #0x28
   83b84:	a9004c1f 	stp	xzr, x19, [x0]
   83b88:	c85ffd28 	ldaxr	x8, [x9]
   83b8c:	c80afd20 	stlxr	w10, x0, [x9]
   83b90:	35ffffca 	cbnz	w10, 83b88 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x140>
   83b94:	f9000100 	str	x0, [x8]
   83b98:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83b9c:	52800029 	mov	w9, #0x1                   	// #1
   83ba0:	912ae108 	add	x8, x8, #0xab8
   83ba4:	a9077fff 	stp	xzr, xzr, [sp, #112]
   83ba8:	a90627e8 	stp	x8, x9, [sp, #96]
   83bac:	52800108 	mov	w8, #0x8                   	// #8
   83bb0:	a9087fe8 	stp	x8, xzr, [sp, #128]
   83bb4:	910083e8 	add	x8, sp, #0x20
   83bb8:	910183e0 	add	x0, sp, #0x60
   83bbc:	910083f3 	add	x19, sp, #0x20
   83bc0:	94000e1a 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83bc4:	9e6702c0 	fmov	d0, x22
   83bc8:	f94013eb 	ldr	x11, [sp, #32]
   83bcc:	a942a3e9 	ldp	x9, x8, [sp, #40]
   83bd0:	910123ea 	add	x10, sp, #0x48
   83bd4:	a907cfff 	stp	xzr, x19, [sp, #120]
   83bd8:	a904a7eb 	stp	x11, x9, [sp, #72]
   83bdc:	52800069 	mov	w9, #0x3                   	// #3
   83be0:	4e181ea0 	mov	v0.d[1], x21
   83be4:	a905dfe8 	stp	x8, x23, [sp, #88]
   83be8:	52800048 	mov	w8, #0x2                   	// #2
   83bec:	a90363ea 	stp	x10, x24, [sp, #48]
   83bf0:	a906ffe9 	stp	x9, xzr, [sp, #104]
   83bf4:	f90047e8 	str	x8, [sp, #136]
   83bf8:	3d800be0 	str	q0, [sp, #32]
   83bfc:	910023e8 	add	x8, sp, #0x8
   83c00:	910183e0 	add	x0, sp, #0x60
   83c04:	94000e09 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83c08:	f9402be1 	ldr	x1, [sp, #80]
   83c0c:	b4000081 	cbz	x1, 83c1c <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x1d4>
   83c10:	f94027e0 	ldr	x0, [sp, #72]
   83c14:	52800022 	mov	w2, #0x1                   	// #1
   83c18:	97fff858 	bl	81d78 <__rust_dealloc>
   83c1c:	a940a3f3 	ldp	x19, x8, [sp, #8]
   83c20:	f9400fe1 	ldr	x1, [sp, #24]
   83c24:	a90623f3 	stp	x19, x8, [sp, #96]
   83c28:	f9003be1 	str	x1, [sp, #112]
   83c2c:	aa1303e0 	mov	x0, x19
   83c30:	94000d94 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   83c34:	f94037e1 	ldr	x1, [sp, #104]
   83c38:	b4000081 	cbz	x1, 83c48 <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x200>
   83c3c:	aa1303e0 	mov	x0, x19
   83c40:	52800022 	mov	w2, #0x1                   	// #1
   83c44:	97fff84d 	bl	81d78 <__rust_dealloc>
   83c48:	a94c7bf3 	ldp	x19, x30, [sp, #192]
   83c4c:	f9404bf8 	ldr	x24, [sp, #144]
   83c50:	a94b53f5 	ldp	x21, x20, [sp, #176]
   83c54:	a94a5bf7 	ldp	x23, x22, [sp, #160]
   83c58:	910343ff 	add	sp, sp, #0xd0
   83c5c:	d65f03c0 	ret
   83c60:	d4200020 	brk	#0x1
   83c64:	d4200020 	brk	#0x1
   83c68:	52800200 	mov	w0, #0x10                  	// #16
   83c6c:	52800201 	mov	w1, #0x10                  	// #16
   83c70:	94000de4 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   83c74:	d4200020 	brk	#0x1
   83c78:	aa0003f3 	mov	x19, x0
   83c7c:	910183e0 	add	x0, sp, #0x60
   83c80:	97ffff5c 	bl	839f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83c84:	aa1303e0 	mov	x0, x19
   83c88:	9400001a 	bl	83cf0 <_Unwind_Resume>
   83c8c:	d4200020 	brk	#0x1
   83c90:	aa0003f3 	mov	x19, x0
   83c94:	910123e0 	add	x0, sp, #0x48
   83c98:	97ffff56 	bl	839f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83c9c:	aa1303e0 	mov	x0, x19
   83ca0:	94000014 	bl	83cf0 <_Unwind_Resume>
   83ca4:	d4200020 	brk	#0x1
   83ca8:	aa0003f3 	mov	x19, x0
   83cac:	aa1303e0 	mov	x0, x19
   83cb0:	94000010 	bl	83cf0 <_Unwind_Resume>
   83cb4:	d4200020 	brk	#0x1
   83cb8:	aa0003f3 	mov	x19, x0
   83cbc:	910183e0 	add	x0, sp, #0x60
   83cc0:	97ffff4c 	bl	839f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83cc4:	14000006 	b	83cdc <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x294>
   83cc8:	aa0003f3 	mov	x19, x0
   83ccc:	910123e0 	add	x0, sp, #0x48
   83cd0:	97ffff48 	bl	839f0 <_ZN4core3ptr18real_drop_in_place17h557394cb1f98129bE>
   83cd4:	14000002 	b	83cdc <_ZN105_$LT$ruspiro_brain..thoughts..thought..Thought$u20$as$u20$ruspiro_brain..thoughts..wakeable..WakeAble$GT$11wake_by_ref17h57bb8f386c84d128E+0x294>
   83cd8:	aa0003f3 	mov	x19, x0
   83cdc:	910263e0 	add	x0, sp, #0x98
   83ce0:	97ffff4a 	bl	83a08 <_ZN4core3ptr18real_drop_in_place17h742e1db7865957f5E>
   83ce4:	aa1303e0 	mov	x0, x19
   83ce8:	94000002 	bl	83cf0 <_Unwind_Resume>
   83cec:	d4200020 	brk	#0x1

0000000000083cf0 <_Unwind_Resume>:
   83cf0:	d65f03c0 	ret
   83cf4:	00000000 	.inst	0x00000000 ; undefined

0000000000083cf8 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>:
   83cf8:	f9400401 	ldr	x1, [x0, #8]
   83cfc:	b4000081 	cbz	x1, 83d0c <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE+0x14>
   83d00:	f9400000 	ldr	x0, [x0]
   83d04:	52800022 	mov	w2, #0x1                   	// #1
   83d08:	17fff81c 	b	81d78 <__rust_dealloc>
   83d0c:	d65f03c0 	ret

0000000000083d10 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   83d10:	f9400008 	ldr	x8, [x0]
   83d14:	aa0103e2 	mov	x2, x1
   83d18:	f9400809 	ldr	x9, [x0, #16]
   83d1c:	aa0803e0 	mov	x0, x8
   83d20:	aa0903e1 	mov	x1, x9
   83d24:	1400174b 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000083d28 <rust_begin_unwind>:
   83d28:	d10303ff 	sub	sp, sp, #0xc0
   83d2c:	a90a53f5 	stp	x21, x20, [sp, #160]
   83d30:	a90b7bf3 	stp	x19, x30, [sp, #176]
   83d34:	94001089 	bl	87f58 <_ZN4core5panic9PanicInfo8location17h99607b6ab81c0b4dE>
   83d38:	b40007e0 	cbz	x0, 83e34 <rust_begin_unwind+0x10c>
   83d3c:	aa0003f3 	mov	x19, x0
   83d40:	94001088 	bl	87f60 <_ZN4core5panic8Location4file17heb49df6102de4e30E>
   83d44:	a90407e0 	stp	x0, x1, [sp, #64]
   83d48:	aa1303e0 	mov	x0, x19
   83d4c:	94001088 	bl	87f6c <_ZN4core5panic8Location4line17h4e0ac00bd2f31693E>
   83d50:	b9003be0 	str	w0, [sp, #56]
   83d54:	aa1303e0 	mov	x0, x19
   83d58:	94001087 	bl	87f74 <_ZN4core5panic8Location6column17h0f6be5edfbf47b79E>
   83d5c:	d0000009 	adrp	x9, 85000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   83d60:	f000004a 	adrp	x10, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   83d64:	910103e8 	add	x8, sp, #0x40
   83d68:	9108e129 	add	x9, x9, #0x238
   83d6c:	52800073 	mov	w19, #0x3                   	// #3
   83d70:	9100e3eb 	add	x11, sp, #0x38
   83d74:	f944394a 	ldr	x10, [x10, #2160]
   83d78:	910163f4 	add	x20, sp, #0x58
   83d7c:	a90727e8 	stp	x8, x9, [sp, #112]
   83d80:	9100f3e8 	add	x8, sp, #0x3c
   83d84:	b9003fe0 	str	w0, [sp, #60]
   83d88:	910003e0 	mov	x0, sp
   83d8c:	a9017fff 	stp	xzr, xzr, [sp, #16]
   83d90:	910003f5 	mov	x21, sp
   83d94:	a9092be8 	stp	x8, x10, [sp, #144]
   83d98:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83d9c:	912c6108 	add	x8, x8, #0xb18
   83da0:	a9082beb 	stp	x11, x10, [sp, #128]
   83da4:	a9004fe8 	stp	x8, x19, [sp]
   83da8:	9101c3e8 	add	x8, sp, #0x70
   83dac:	a9024fe8 	stp	x8, x19, [sp, #32]
   83db0:	910163e8 	add	x8, sp, #0x58
   83db4:	94000d9d 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83db8:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83dbc:	90000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83dc0:	912be108 	add	x8, x8, #0xaf8
   83dc4:	91344129 	add	x9, x9, #0xd10
   83dc8:	a9087fff 	stp	xzr, xzr, [sp, #128]
   83dcc:	9e670100 	fmov	d0, x8
   83dd0:	d0000008 	adrp	x8, 85000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   83dd4:	91094108 	add	x8, x8, #0x250
   83dd8:	a90127f4 	stp	x20, x9, [sp, #16]
   83ddc:	4e181d00 	mov	v0.d[1], x8
   83de0:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83de4:	912b2108 	add	x8, x8, #0xac8
   83de8:	a9074fe8 	stp	x8, x19, [sp, #112]
   83dec:	52800048 	mov	w8, #0x2                   	// #2
   83df0:	3d8003e0 	str	q0, [sp]
   83df4:	a90923f5 	stp	x21, x8, [sp, #144]
   83df8:	910103e8 	add	x8, sp, #0x40
   83dfc:	9101c3e0 	add	x0, sp, #0x70
   83e00:	94000d8a 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83e04:	f94033e1 	ldr	x1, [sp, #96]
   83e08:	b4000081 	cbz	x1, 83e18 <rust_begin_unwind+0xf0>
   83e0c:	f9402fe0 	ldr	x0, [sp, #88]
   83e10:	52800022 	mov	w2, #0x1                   	// #1
   83e14:	97fff7d9 	bl	81d78 <__rust_dealloc>
   83e18:	a94423f3 	ldp	x19, x8, [sp, #64]
   83e1c:	f9402be1 	ldr	x1, [sp, #80]
   83e20:	a90723f3 	stp	x19, x8, [sp, #112]
   83e24:	f90043e1 	str	x1, [sp, #128]
   83e28:	aa1303e0 	mov	x0, x19
   83e2c:	94000d15 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   83e30:	1400002c 	b	83ee0 <rust_begin_unwind+0x1b8>
   83e34:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83e38:	52800029 	mov	w9, #0x1                   	// #1
   83e3c:	912c2108 	add	x8, x8, #0xb08
   83e40:	5280010a 	mov	w10, #0x8                   	// #8
   83e44:	9101c3e0 	add	x0, sp, #0x70
   83e48:	a9087fff 	stp	xzr, xzr, [sp, #128]
   83e4c:	910163f3 	add	x19, sp, #0x58
   83e50:	a90727e8 	stp	x8, x9, [sp, #112]
   83e54:	910163e8 	add	x8, sp, #0x58
   83e58:	a9097fea 	stp	x10, xzr, [sp, #144]
   83e5c:	94000d73 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83e60:	d0000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   83e64:	90000009 	adrp	x9, 83000 <_ZN13ruspiro_brain8thoughts8wakeable17wake_wakeable_raw17hb0a6b7bc13fc6a19E+0x90>
   83e68:	912be108 	add	x8, x8, #0xaf8
   83e6c:	d000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   83e70:	91344129 	add	x9, x9, #0xd10
   83e74:	912b214a 	add	x10, x10, #0xac8
   83e78:	a9087fff 	stp	xzr, xzr, [sp, #128]
   83e7c:	9e670100 	fmov	d0, x8
   83e80:	d0000008 	adrp	x8, 85000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   83e84:	91094108 	add	x8, x8, #0x250
   83e88:	a90127f3 	stp	x19, x9, [sp, #16]
   83e8c:	52800049 	mov	w9, #0x2                   	// #2
   83e90:	4e181d00 	mov	v0.d[1], x8
   83e94:	52800068 	mov	w8, #0x3                   	// #3
   83e98:	a90723ea 	stp	x10, x8, [sp, #112]
   83e9c:	910003e8 	mov	x8, sp
   83ea0:	3d8003e0 	str	q0, [sp]
   83ea4:	a90927e8 	stp	x8, x9, [sp, #144]
   83ea8:	910103e8 	add	x8, sp, #0x40
   83eac:	9101c3e0 	add	x0, sp, #0x70
   83eb0:	94000d5e 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   83eb4:	f94033e1 	ldr	x1, [sp, #96]
   83eb8:	b4000081 	cbz	x1, 83ec8 <rust_begin_unwind+0x1a0>
   83ebc:	f9402fe0 	ldr	x0, [sp, #88]
   83ec0:	52800022 	mov	w2, #0x1                   	// #1
   83ec4:	97fff7ad 	bl	81d78 <__rust_dealloc>
   83ec8:	a94423f3 	ldp	x19, x8, [sp, #64]
   83ecc:	f9402be1 	ldr	x1, [sp, #80]
   83ed0:	a90723f3 	stp	x19, x8, [sp, #112]
   83ed4:	f90043e1 	str	x1, [sp, #128]
   83ed8:	aa1303e0 	mov	x0, x19
   83edc:	94000ce9 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   83ee0:	f9403fe1 	ldr	x1, [sp, #120]
   83ee4:	b4000081 	cbz	x1, 83ef4 <rust_begin_unwind+0x1cc>
   83ee8:	aa1303e0 	mov	x0, x19
   83eec:	52800022 	mov	w2, #0x1                   	// #1
   83ef0:	97fff7a2 	bl	81d78 <__rust_dealloc>
   83ef4:	14000000 	b	83ef4 <rust_begin_unwind+0x1cc>
   83ef8:	14000002 	b	83f00 <rust_begin_unwind+0x1d8>
   83efc:	14000007 	b	83f18 <rust_begin_unwind+0x1f0>
   83f00:	aa0003f3 	mov	x19, x0
   83f04:	9101c3e0 	add	x0, sp, #0x70
   83f08:	97ffff7c 	bl	83cf8 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   83f0c:	aa1303e0 	mov	x0, x19
   83f10:	97ffff78 	bl	83cf0 <_Unwind_Resume>
   83f14:	d4200020 	brk	#0x1
   83f18:	aa0003f3 	mov	x19, x0
   83f1c:	910163e0 	add	x0, sp, #0x58
   83f20:	97ffff76 	bl	83cf8 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   83f24:	aa1303e0 	mov	x0, x19
   83f28:	97ffff72 	bl	83cf0 <_Unwind_Resume>
   83f2c:	d4200020 	brk	#0x1

0000000000083f30 <rust_eh_personality>:
   83f30:	d65f03c0 	ret

0000000000083f34 <__hang>:
   83f34:	d503205f 	wfe
   83f38:	17ffffff 	b	83f34 <__hang>
	...
   84000:	d503201f 	nop
   84004:	d65f03c0 	ret

0000000000084008 <__exception_trampoline>:
   84008:	d102c3ff 	sub	sp, sp, #0xb0
   8400c:	a90007e0 	stp	x0, x1, [sp]
   84010:	a9010fe2 	stp	x2, x3, [sp, #16]
   84014:	a90217e4 	stp	x4, x5, [sp, #32]
   84018:	a9031fe6 	stp	x6, x7, [sp, #48]
   8401c:	a90427e8 	stp	x8, x9, [sp, #64]
   84020:	a9052fea 	stp	x10, x11, [sp, #80]
   84024:	a90637ec 	stp	x12, x13, [sp, #96]
   84028:	a9073fee 	stp	x14, x15, [sp, #112]
   8402c:	a90847f0 	stp	x16, x17, [sp, #128]
   84030:	a9097bf2 	stp	x18, x30, [sp, #144]
   84034:	d538400a 	mrs	x10, spsr_el1
   84038:	d538402b 	mrs	x11, elr_el1
   8403c:	a90a2fea 	stp	x10, x11, [sp, #160]
   84040:	d5385201 	mrs	x1, esr_el1
   84044:	d5384002 	mrs	x2, spsr_el1
   84048:	d5386003 	mrs	x3, far_el1
   8404c:	d5384024 	mrs	x4, elr_el1
   84050:	94000a36 	bl	86928 <__exception_handler_default>
   84054:	a94a2fea 	ldp	x10, x11, [sp, #160]
   84058:	d518402b 	msr	elr_el1, x11
   8405c:	d518400a 	msr	spsr_el1, x10
   84060:	a94007e0 	ldp	x0, x1, [sp]
   84064:	a9410fe2 	ldp	x2, x3, [sp, #16]
   84068:	a94217e4 	ldp	x4, x5, [sp, #32]
   8406c:	a9431fe6 	ldp	x6, x7, [sp, #48]
   84070:	a94427e8 	ldp	x8, x9, [sp, #64]
   84074:	a9452fea 	ldp	x10, x11, [sp, #80]
   84078:	a94637ec 	ldp	x12, x13, [sp, #96]
   8407c:	a9473fee 	ldp	x14, x15, [sp, #112]
   84080:	a94847f0 	ldp	x16, x17, [sp, #128]
   84084:	a9497bf2 	ldp	x18, x30, [sp, #144]
   84088:	9102c3ff 	add	sp, sp, #0xb0
   8408c:	d65f03c0 	ret
   84090:	d503201f 	nop
   84094:	d503201f 	nop
   84098:	d503201f 	nop
   8409c:	d503201f 	nop
   840a0:	d503201f 	nop
   840a4:	d503201f 	nop
   840a8:	d503201f 	nop
   840ac:	d503201f 	nop
   840b0:	d503201f 	nop
   840b4:	d503201f 	nop
   840b8:	d503201f 	nop
   840bc:	d503201f 	nop
   840c0:	d503201f 	nop
   840c4:	d503201f 	nop
   840c8:	d503201f 	nop
   840cc:	d503201f 	nop
   840d0:	d503201f 	nop
   840d4:	d503201f 	nop
   840d8:	d503201f 	nop
   840dc:	d503201f 	nop
   840e0:	d503201f 	nop
   840e4:	d503201f 	nop
   840e8:	d503201f 	nop
   840ec:	d503201f 	nop
   840f0:	d503201f 	nop
   840f4:	d503201f 	nop
   840f8:	d503201f 	nop
   840fc:	d503201f 	nop
   84100:	d503201f 	nop
   84104:	d503201f 	nop
   84108:	d503201f 	nop
   8410c:	d503201f 	nop
   84110:	d503201f 	nop
   84114:	d503201f 	nop
   84118:	d503201f 	nop
   8411c:	d503201f 	nop
   84120:	d503201f 	nop
   84124:	d503201f 	nop
   84128:	d503201f 	nop
   8412c:	d503201f 	nop
   84130:	d503201f 	nop
   84134:	d503201f 	nop
   84138:	d503201f 	nop
   8413c:	d503201f 	nop
   84140:	d503201f 	nop
   84144:	d503201f 	nop
   84148:	d503201f 	nop
   8414c:	d503201f 	nop
   84150:	d503201f 	nop
   84154:	d503201f 	nop
   84158:	d503201f 	nop
   8415c:	d503201f 	nop
   84160:	d503201f 	nop
   84164:	d503201f 	nop
   84168:	d503201f 	nop
   8416c:	d503201f 	nop
   84170:	d503201f 	nop
   84174:	d503201f 	nop
   84178:	d503201f 	nop
   8417c:	d503201f 	nop
   84180:	d503201f 	nop
   84184:	d503201f 	nop
   84188:	d503201f 	nop
   8418c:	d503201f 	nop
   84190:	d503201f 	nop
   84194:	d503201f 	nop
   84198:	d503201f 	nop
   8419c:	d503201f 	nop
   841a0:	d503201f 	nop
   841a4:	d503201f 	nop
   841a8:	d503201f 	nop
   841ac:	d503201f 	nop
   841b0:	d503201f 	nop
   841b4:	d503201f 	nop
   841b8:	d503201f 	nop
   841bc:	d503201f 	nop
   841c0:	d503201f 	nop
   841c4:	d503201f 	nop
   841c8:	d503201f 	nop
   841cc:	d503201f 	nop
   841d0:	d503201f 	nop
   841d4:	d503201f 	nop
   841d8:	d503201f 	nop
   841dc:	d503201f 	nop
   841e0:	d503201f 	nop
   841e4:	d503201f 	nop
   841e8:	d503201f 	nop
   841ec:	d503201f 	nop
   841f0:	d503201f 	nop
   841f4:	d503201f 	nop
   841f8:	d503201f 	nop
   841fc:	d503201f 	nop
   84200:	d503201f 	nop
   84204:	d503201f 	nop
   84208:	d503201f 	nop
   8420c:	d503201f 	nop
   84210:	d503201f 	nop
   84214:	d503201f 	nop
   84218:	d503201f 	nop
   8421c:	d503201f 	nop
   84220:	d503201f 	nop
   84224:	d503201f 	nop
   84228:	d503201f 	nop
   8422c:	d503201f 	nop
   84230:	d503201f 	nop
   84234:	d503201f 	nop
   84238:	d503201f 	nop
   8423c:	d503201f 	nop
   84240:	d503201f 	nop
   84244:	d503201f 	nop
   84248:	d503201f 	nop
   8424c:	d503201f 	nop
   84250:	d503201f 	nop
   84254:	d503201f 	nop
   84258:	d503201f 	nop
   8425c:	d503201f 	nop
   84260:	d503201f 	nop
   84264:	d503201f 	nop
   84268:	d503201f 	nop
   8426c:	d503201f 	nop
   84270:	d503201f 	nop
   84274:	d503201f 	nop
   84278:	d503201f 	nop
   8427c:	d503201f 	nop
   84280:	d503201f 	nop
   84284:	d503201f 	nop
   84288:	d503201f 	nop
   8428c:	d503201f 	nop
   84290:	d503201f 	nop
   84294:	d503201f 	nop
   84298:	d503201f 	nop
   8429c:	d503201f 	nop
   842a0:	d503201f 	nop
   842a4:	d503201f 	nop
   842a8:	d503201f 	nop
   842ac:	d503201f 	nop
   842b0:	d503201f 	nop
   842b4:	d503201f 	nop
   842b8:	d503201f 	nop
   842bc:	d503201f 	nop
   842c0:	d503201f 	nop
   842c4:	d503201f 	nop
   842c8:	d503201f 	nop
   842cc:	d503201f 	nop
   842d0:	d503201f 	nop
   842d4:	d503201f 	nop
   842d8:	d503201f 	nop
   842dc:	d503201f 	nop
   842e0:	d503201f 	nop
   842e4:	d503201f 	nop
   842e8:	d503201f 	nop
   842ec:	d503201f 	nop
   842f0:	d503201f 	nop
   842f4:	d503201f 	nop
   842f8:	d503201f 	nop
   842fc:	d503201f 	nop
   84300:	d503201f 	nop
   84304:	d503201f 	nop
   84308:	d503201f 	nop
   8430c:	d503201f 	nop
   84310:	d503201f 	nop
   84314:	d503201f 	nop
   84318:	d503201f 	nop
   8431c:	d503201f 	nop
   84320:	d503201f 	nop
   84324:	d503201f 	nop
   84328:	d503201f 	nop
   8432c:	d503201f 	nop
   84330:	d503201f 	nop
   84334:	d503201f 	nop
   84338:	d503201f 	nop
   8433c:	d503201f 	nop
   84340:	d503201f 	nop
   84344:	d503201f 	nop
   84348:	d503201f 	nop
   8434c:	d503201f 	nop
   84350:	d503201f 	nop
   84354:	d503201f 	nop
   84358:	d503201f 	nop
   8435c:	d503201f 	nop
   84360:	d503201f 	nop
   84364:	d503201f 	nop
   84368:	d503201f 	nop
   8436c:	d503201f 	nop
   84370:	d503201f 	nop
   84374:	d503201f 	nop
   84378:	d503201f 	nop
   8437c:	d503201f 	nop
   84380:	d503201f 	nop
   84384:	d503201f 	nop
   84388:	d503201f 	nop
   8438c:	d503201f 	nop
   84390:	d503201f 	nop
   84394:	d503201f 	nop
   84398:	d503201f 	nop
   8439c:	d503201f 	nop
   843a0:	d503201f 	nop
   843a4:	d503201f 	nop
   843a8:	d503201f 	nop
   843ac:	d503201f 	nop
   843b0:	d503201f 	nop
   843b4:	d503201f 	nop
   843b8:	d503201f 	nop
   843bc:	d503201f 	nop
   843c0:	d503201f 	nop
   843c4:	d503201f 	nop
   843c8:	d503201f 	nop
   843cc:	d503201f 	nop
   843d0:	d503201f 	nop
   843d4:	d503201f 	nop
   843d8:	d503201f 	nop
   843dc:	d503201f 	nop
   843e0:	d503201f 	nop
   843e4:	d503201f 	nop
   843e8:	d503201f 	nop
   843ec:	d503201f 	nop
   843f0:	d503201f 	nop
   843f4:	d503201f 	nop
   843f8:	d503201f 	nop
   843fc:	d503201f 	nop
   84400:	d503201f 	nop
   84404:	d503201f 	nop
   84408:	d503201f 	nop
   8440c:	d503201f 	nop
   84410:	d503201f 	nop
   84414:	d503201f 	nop
   84418:	d503201f 	nop
   8441c:	d503201f 	nop
   84420:	d503201f 	nop
   84424:	d503201f 	nop
   84428:	d503201f 	nop
   8442c:	d503201f 	nop
   84430:	d503201f 	nop
   84434:	d503201f 	nop
   84438:	d503201f 	nop
   8443c:	d503201f 	nop
   84440:	d503201f 	nop
   84444:	d503201f 	nop
   84448:	d503201f 	nop
   8444c:	d503201f 	nop
   84450:	d503201f 	nop
   84454:	d503201f 	nop
   84458:	d503201f 	nop
   8445c:	d503201f 	nop
   84460:	d503201f 	nop
   84464:	d503201f 	nop
   84468:	d503201f 	nop
   8446c:	d503201f 	nop
   84470:	d503201f 	nop
   84474:	d503201f 	nop
   84478:	d503201f 	nop
   8447c:	d503201f 	nop
   84480:	d503201f 	nop
   84484:	d503201f 	nop
   84488:	d503201f 	nop
   8448c:	d503201f 	nop
   84490:	d503201f 	nop
   84494:	d503201f 	nop
   84498:	d503201f 	nop
   8449c:	d503201f 	nop
   844a0:	d503201f 	nop
   844a4:	d503201f 	nop
   844a8:	d503201f 	nop
   844ac:	d503201f 	nop
   844b0:	d503201f 	nop
   844b4:	d503201f 	nop
   844b8:	d503201f 	nop
   844bc:	d503201f 	nop
   844c0:	d503201f 	nop
   844c4:	d503201f 	nop
   844c8:	d503201f 	nop
   844cc:	d503201f 	nop
   844d0:	d503201f 	nop
   844d4:	d503201f 	nop
   844d8:	d503201f 	nop
   844dc:	d503201f 	nop
   844e0:	d503201f 	nop
   844e4:	d503201f 	nop
   844e8:	d503201f 	nop
   844ec:	d503201f 	nop
   844f0:	d503201f 	nop
   844f4:	d503201f 	nop
   844f8:	d503201f 	nop
   844fc:	d503201f 	nop
   84500:	d503201f 	nop
   84504:	d503201f 	nop
   84508:	d503201f 	nop
   8450c:	d503201f 	nop
   84510:	d503201f 	nop
   84514:	d503201f 	nop
   84518:	d503201f 	nop
   8451c:	d503201f 	nop
   84520:	d503201f 	nop
   84524:	d503201f 	nop
   84528:	d503201f 	nop
   8452c:	d503201f 	nop
   84530:	d503201f 	nop
   84534:	d503201f 	nop
   84538:	d503201f 	nop
   8453c:	d503201f 	nop
   84540:	d503201f 	nop
   84544:	d503201f 	nop
   84548:	d503201f 	nop
   8454c:	d503201f 	nop
   84550:	d503201f 	nop
   84554:	d503201f 	nop
   84558:	d503201f 	nop
   8455c:	d503201f 	nop
   84560:	d503201f 	nop
   84564:	d503201f 	nop
   84568:	d503201f 	nop
   8456c:	d503201f 	nop
   84570:	d503201f 	nop
   84574:	d503201f 	nop
   84578:	d503201f 	nop
   8457c:	d503201f 	nop
   84580:	d503201f 	nop
   84584:	d503201f 	nop
   84588:	d503201f 	nop
   8458c:	d503201f 	nop
   84590:	d503201f 	nop
   84594:	d503201f 	nop
   84598:	d503201f 	nop
   8459c:	d503201f 	nop
   845a0:	d503201f 	nop
   845a4:	d503201f 	nop
   845a8:	d503201f 	nop
   845ac:	d503201f 	nop
   845b0:	d503201f 	nop
   845b4:	d503201f 	nop
   845b8:	d503201f 	nop
   845bc:	d503201f 	nop
   845c0:	d503201f 	nop
   845c4:	d503201f 	nop
   845c8:	d503201f 	nop
   845cc:	d503201f 	nop
   845d0:	d503201f 	nop
   845d4:	d503201f 	nop
   845d8:	d503201f 	nop
   845dc:	d503201f 	nop
   845e0:	d503201f 	nop
   845e4:	d503201f 	nop
   845e8:	d503201f 	nop
   845ec:	d503201f 	nop
   845f0:	d503201f 	nop
   845f4:	d503201f 	nop
   845f8:	d503201f 	nop
   845fc:	d503201f 	nop
   84600:	d503201f 	nop
   84604:	d503201f 	nop
   84608:	d503201f 	nop
   8460c:	d503201f 	nop
   84610:	d503201f 	nop
   84614:	d503201f 	nop
   84618:	d503201f 	nop
   8461c:	d503201f 	nop
   84620:	d503201f 	nop
   84624:	d503201f 	nop
   84628:	d503201f 	nop
   8462c:	d503201f 	nop
   84630:	d503201f 	nop
   84634:	d503201f 	nop
   84638:	d503201f 	nop
   8463c:	d503201f 	nop
   84640:	d503201f 	nop
   84644:	d503201f 	nop
   84648:	d503201f 	nop
   8464c:	d503201f 	nop
   84650:	d503201f 	nop
   84654:	d503201f 	nop
   84658:	d503201f 	nop
   8465c:	d503201f 	nop
   84660:	d503201f 	nop
   84664:	d503201f 	nop
   84668:	d503201f 	nop
   8466c:	d503201f 	nop
   84670:	d503201f 	nop
   84674:	d503201f 	nop
   84678:	d503201f 	nop
   8467c:	d503201f 	nop
   84680:	d503201f 	nop
   84684:	d503201f 	nop
   84688:	d503201f 	nop
   8468c:	d503201f 	nop
   84690:	d503201f 	nop
   84694:	d503201f 	nop
   84698:	d503201f 	nop
   8469c:	d503201f 	nop
   846a0:	d503201f 	nop
   846a4:	d503201f 	nop
   846a8:	d503201f 	nop
   846ac:	d503201f 	nop
   846b0:	d503201f 	nop
   846b4:	d503201f 	nop
   846b8:	d503201f 	nop
   846bc:	d503201f 	nop
   846c0:	d503201f 	nop
   846c4:	d503201f 	nop
   846c8:	d503201f 	nop
   846cc:	d503201f 	nop
   846d0:	d503201f 	nop
   846d4:	d503201f 	nop
   846d8:	d503201f 	nop
   846dc:	d503201f 	nop
   846e0:	d503201f 	nop
   846e4:	d503201f 	nop
   846e8:	d503201f 	nop
   846ec:	d503201f 	nop
   846f0:	d503201f 	nop
   846f4:	d503201f 	nop
   846f8:	d503201f 	nop
   846fc:	d503201f 	nop
   84700:	d503201f 	nop
   84704:	d503201f 	nop
   84708:	d503201f 	nop
   8470c:	d503201f 	nop
   84710:	d503201f 	nop
   84714:	d503201f 	nop
   84718:	d503201f 	nop
   8471c:	d503201f 	nop
   84720:	d503201f 	nop
   84724:	d503201f 	nop
   84728:	d503201f 	nop
   8472c:	d503201f 	nop
   84730:	d503201f 	nop
   84734:	d503201f 	nop
   84738:	d503201f 	nop
   8473c:	d503201f 	nop
   84740:	d503201f 	nop
   84744:	d503201f 	nop
   84748:	d503201f 	nop
   8474c:	d503201f 	nop
   84750:	d503201f 	nop
   84754:	d503201f 	nop
   84758:	d503201f 	nop
   8475c:	d503201f 	nop
   84760:	d503201f 	nop
   84764:	d503201f 	nop
   84768:	d503201f 	nop
   8476c:	d503201f 	nop
   84770:	d503201f 	nop
   84774:	d503201f 	nop
   84778:	d503201f 	nop
   8477c:	d503201f 	nop
   84780:	d503201f 	nop
   84784:	d503201f 	nop
   84788:	d503201f 	nop
   8478c:	d503201f 	nop
   84790:	d503201f 	nop
   84794:	d503201f 	nop
   84798:	d503201f 	nop
   8479c:	d503201f 	nop
   847a0:	d503201f 	nop
   847a4:	d503201f 	nop
   847a8:	d503201f 	nop
   847ac:	d503201f 	nop
   847b0:	d503201f 	nop
   847b4:	d503201f 	nop
   847b8:	d503201f 	nop
   847bc:	d503201f 	nop
   847c0:	d503201f 	nop
   847c4:	d503201f 	nop
   847c8:	d503201f 	nop
   847cc:	d503201f 	nop
   847d0:	d503201f 	nop
   847d4:	d503201f 	nop
   847d8:	d503201f 	nop
   847dc:	d503201f 	nop
   847e0:	d503201f 	nop
   847e4:	d503201f 	nop
   847e8:	d503201f 	nop
   847ec:	d503201f 	nop
   847f0:	d503201f 	nop
   847f4:	d503201f 	nop
   847f8:	d503201f 	nop
   847fc:	d503201f 	nop

0000000000084800 <__ExceptionVectorTable>:
   84800:	d10043ff 	sub	sp, sp, #0x10
   84804:	a9007be0 	stp	x0, x30, [sp]
   84808:	d2800020 	mov	x0, #0x1                   	// #1
   8480c:	97fffdff 	bl	84008 <__exception_trampoline>
   84810:	a9407be0 	ldp	x0, x30, [sp]
   84814:	910043ff 	add	sp, sp, #0x10
   84818:	d69f03e0 	eret
   8481c:	d503201f 	nop
   84820:	d503201f 	nop
   84824:	d503201f 	nop
   84828:	d503201f 	nop
   8482c:	d503201f 	nop
   84830:	d503201f 	nop
   84834:	d503201f 	nop
   84838:	d503201f 	nop
   8483c:	d503201f 	nop
   84840:	d503201f 	nop
   84844:	d503201f 	nop
   84848:	d503201f 	nop
   8484c:	d503201f 	nop
   84850:	d503201f 	nop
   84854:	d503201f 	nop
   84858:	d503201f 	nop
   8485c:	d503201f 	nop
   84860:	d503201f 	nop
   84864:	d503201f 	nop
   84868:	d503201f 	nop
   8486c:	d503201f 	nop
   84870:	d503201f 	nop
   84874:	d503201f 	nop
   84878:	d503201f 	nop
   8487c:	d503201f 	nop

0000000000084880 <.EXC_CURREL_SP0_Irq>:
   84880:	d10043ff 	sub	sp, sp, #0x10
   84884:	a9007be0 	stp	x0, x30, [sp]
   84888:	d2800040 	mov	x0, #0x2                   	// #2
   8488c:	97fffddf 	bl	84008 <__exception_trampoline>
   84890:	a9407be0 	ldp	x0, x30, [sp]
   84894:	910043ff 	add	sp, sp, #0x10
   84898:	d69f03e0 	eret
   8489c:	d503201f 	nop
   848a0:	d503201f 	nop
   848a4:	d503201f 	nop
   848a8:	d503201f 	nop
   848ac:	d503201f 	nop
   848b0:	d503201f 	nop
   848b4:	d503201f 	nop
   848b8:	d503201f 	nop
   848bc:	d503201f 	nop
   848c0:	d503201f 	nop
   848c4:	d503201f 	nop
   848c8:	d503201f 	nop
   848cc:	d503201f 	nop
   848d0:	d503201f 	nop
   848d4:	d503201f 	nop
   848d8:	d503201f 	nop
   848dc:	d503201f 	nop
   848e0:	d503201f 	nop
   848e4:	d503201f 	nop
   848e8:	d503201f 	nop
   848ec:	d503201f 	nop
   848f0:	d503201f 	nop
   848f4:	d503201f 	nop
   848f8:	d503201f 	nop
   848fc:	d503201f 	nop

0000000000084900 <.EXC_CURREL_SP0_Fiq>:
   84900:	d10043ff 	sub	sp, sp, #0x10
   84904:	a9007be0 	stp	x0, x30, [sp]
   84908:	d2800060 	mov	x0, #0x3                   	// #3
   8490c:	97fffdbf 	bl	84008 <__exception_trampoline>
   84910:	a9407be0 	ldp	x0, x30, [sp]
   84914:	910043ff 	add	sp, sp, #0x10
   84918:	d69f03e0 	eret
   8491c:	d503201f 	nop
   84920:	d503201f 	nop
   84924:	d503201f 	nop
   84928:	d503201f 	nop
   8492c:	d503201f 	nop
   84930:	d503201f 	nop
   84934:	d503201f 	nop
   84938:	d503201f 	nop
   8493c:	d503201f 	nop
   84940:	d503201f 	nop
   84944:	d503201f 	nop
   84948:	d503201f 	nop
   8494c:	d503201f 	nop
   84950:	d503201f 	nop
   84954:	d503201f 	nop
   84958:	d503201f 	nop
   8495c:	d503201f 	nop
   84960:	d503201f 	nop
   84964:	d503201f 	nop
   84968:	d503201f 	nop
   8496c:	d503201f 	nop
   84970:	d503201f 	nop
   84974:	d503201f 	nop
   84978:	d503201f 	nop
   8497c:	d503201f 	nop

0000000000084980 <.EXC_CURREL_SP0_SErr>:
   84980:	d10043ff 	sub	sp, sp, #0x10
   84984:	a9007be0 	stp	x0, x30, [sp]
   84988:	d2800080 	mov	x0, #0x4                   	// #4
   8498c:	97fffd9f 	bl	84008 <__exception_trampoline>
   84990:	a9407be0 	ldp	x0, x30, [sp]
   84994:	910043ff 	add	sp, sp, #0x10
   84998:	d69f03e0 	eret
   8499c:	d503201f 	nop
   849a0:	d503201f 	nop
   849a4:	d503201f 	nop
   849a8:	d503201f 	nop
   849ac:	d503201f 	nop
   849b0:	d503201f 	nop
   849b4:	d503201f 	nop
   849b8:	d503201f 	nop
   849bc:	d503201f 	nop
   849c0:	d503201f 	nop
   849c4:	d503201f 	nop
   849c8:	d503201f 	nop
   849cc:	d503201f 	nop
   849d0:	d503201f 	nop
   849d4:	d503201f 	nop
   849d8:	d503201f 	nop
   849dc:	d503201f 	nop
   849e0:	d503201f 	nop
   849e4:	d503201f 	nop
   849e8:	d503201f 	nop
   849ec:	d503201f 	nop
   849f0:	d503201f 	nop
   849f4:	d503201f 	nop
   849f8:	d503201f 	nop
   849fc:	d503201f 	nop

0000000000084a00 <.EXC_CURREL_SPX_Sync>:
   84a00:	d10043ff 	sub	sp, sp, #0x10
   84a04:	a9007be0 	stp	x0, x30, [sp]
   84a08:	d2800220 	mov	x0, #0x11                  	// #17
   84a0c:	97fffd7f 	bl	84008 <__exception_trampoline>
   84a10:	a9407be0 	ldp	x0, x30, [sp]
   84a14:	910043ff 	add	sp, sp, #0x10
   84a18:	d69f03e0 	eret
   84a1c:	d503201f 	nop
   84a20:	d503201f 	nop
   84a24:	d503201f 	nop
   84a28:	d503201f 	nop
   84a2c:	d503201f 	nop
   84a30:	d503201f 	nop
   84a34:	d503201f 	nop
   84a38:	d503201f 	nop
   84a3c:	d503201f 	nop
   84a40:	d503201f 	nop
   84a44:	d503201f 	nop
   84a48:	d503201f 	nop
   84a4c:	d503201f 	nop
   84a50:	d503201f 	nop
   84a54:	d503201f 	nop
   84a58:	d503201f 	nop
   84a5c:	d503201f 	nop
   84a60:	d503201f 	nop
   84a64:	d503201f 	nop
   84a68:	d503201f 	nop
   84a6c:	d503201f 	nop
   84a70:	d503201f 	nop
   84a74:	d503201f 	nop
   84a78:	d503201f 	nop
   84a7c:	d503201f 	nop

0000000000084a80 <.EXC_CURREL_SPX_Irq>:
   84a80:	d10043ff 	sub	sp, sp, #0x10
   84a84:	a9007be0 	stp	x0, x30, [sp]
   84a88:	d2800240 	mov	x0, #0x12                  	// #18
   84a8c:	97fffd5f 	bl	84008 <__exception_trampoline>
   84a90:	a9407be0 	ldp	x0, x30, [sp]
   84a94:	910043ff 	add	sp, sp, #0x10
   84a98:	d69f03e0 	eret
   84a9c:	d503201f 	nop
   84aa0:	d503201f 	nop
   84aa4:	d503201f 	nop
   84aa8:	d503201f 	nop
   84aac:	d503201f 	nop
   84ab0:	d503201f 	nop
   84ab4:	d503201f 	nop
   84ab8:	d503201f 	nop
   84abc:	d503201f 	nop
   84ac0:	d503201f 	nop
   84ac4:	d503201f 	nop
   84ac8:	d503201f 	nop
   84acc:	d503201f 	nop
   84ad0:	d503201f 	nop
   84ad4:	d503201f 	nop
   84ad8:	d503201f 	nop
   84adc:	d503201f 	nop
   84ae0:	d503201f 	nop
   84ae4:	d503201f 	nop
   84ae8:	d503201f 	nop
   84aec:	d503201f 	nop
   84af0:	d503201f 	nop
   84af4:	d503201f 	nop
   84af8:	d503201f 	nop
   84afc:	d503201f 	nop

0000000000084b00 <.EXC_CURREL_SPX_Fiq>:
   84b00:	d10043ff 	sub	sp, sp, #0x10
   84b04:	a9007be0 	stp	x0, x30, [sp]
   84b08:	d2800260 	mov	x0, #0x13                  	// #19
   84b0c:	97fffd3f 	bl	84008 <__exception_trampoline>
   84b10:	a9407be0 	ldp	x0, x30, [sp]
   84b14:	910043ff 	add	sp, sp, #0x10
   84b18:	d69f03e0 	eret
   84b1c:	d503201f 	nop
   84b20:	d503201f 	nop
   84b24:	d503201f 	nop
   84b28:	d503201f 	nop
   84b2c:	d503201f 	nop
   84b30:	d503201f 	nop
   84b34:	d503201f 	nop
   84b38:	d503201f 	nop
   84b3c:	d503201f 	nop
   84b40:	d503201f 	nop
   84b44:	d503201f 	nop
   84b48:	d503201f 	nop
   84b4c:	d503201f 	nop
   84b50:	d503201f 	nop
   84b54:	d503201f 	nop
   84b58:	d503201f 	nop
   84b5c:	d503201f 	nop
   84b60:	d503201f 	nop
   84b64:	d503201f 	nop
   84b68:	d503201f 	nop
   84b6c:	d503201f 	nop
   84b70:	d503201f 	nop
   84b74:	d503201f 	nop
   84b78:	d503201f 	nop
   84b7c:	d503201f 	nop

0000000000084b80 <.EXC_CURREL_SPX_SErr>:
   84b80:	d10043ff 	sub	sp, sp, #0x10
   84b84:	a9007be0 	stp	x0, x30, [sp]
   84b88:	d2800280 	mov	x0, #0x14                  	// #20
   84b8c:	97fffd1f 	bl	84008 <__exception_trampoline>
   84b90:	a9407be0 	ldp	x0, x30, [sp]
   84b94:	910043ff 	add	sp, sp, #0x10
   84b98:	d69f03e0 	eret
   84b9c:	d503201f 	nop
   84ba0:	d503201f 	nop
   84ba4:	d503201f 	nop
   84ba8:	d503201f 	nop
   84bac:	d503201f 	nop
   84bb0:	d503201f 	nop
   84bb4:	d503201f 	nop
   84bb8:	d503201f 	nop
   84bbc:	d503201f 	nop
   84bc0:	d503201f 	nop
   84bc4:	d503201f 	nop
   84bc8:	d503201f 	nop
   84bcc:	d503201f 	nop
   84bd0:	d503201f 	nop
   84bd4:	d503201f 	nop
   84bd8:	d503201f 	nop
   84bdc:	d503201f 	nop
   84be0:	d503201f 	nop
   84be4:	d503201f 	nop
   84be8:	d503201f 	nop
   84bec:	d503201f 	nop
   84bf0:	d503201f 	nop
   84bf4:	d503201f 	nop
   84bf8:	d503201f 	nop
   84bfc:	d503201f 	nop

0000000000084c00 <.EXC_LOWEREL64_SPX_Sync>:
   84c00:	d10043ff 	sub	sp, sp, #0x10
   84c04:	a9007be0 	stp	x0, x30, [sp]
   84c08:	d2800420 	mov	x0, #0x21                  	// #33
   84c0c:	97fffcff 	bl	84008 <__exception_trampoline>
   84c10:	a9407be0 	ldp	x0, x30, [sp]
   84c14:	910043ff 	add	sp, sp, #0x10
   84c18:	d69f03e0 	eret
   84c1c:	d503201f 	nop
   84c20:	d503201f 	nop
   84c24:	d503201f 	nop
   84c28:	d503201f 	nop
   84c2c:	d503201f 	nop
   84c30:	d503201f 	nop
   84c34:	d503201f 	nop
   84c38:	d503201f 	nop
   84c3c:	d503201f 	nop
   84c40:	d503201f 	nop
   84c44:	d503201f 	nop
   84c48:	d503201f 	nop
   84c4c:	d503201f 	nop
   84c50:	d503201f 	nop
   84c54:	d503201f 	nop
   84c58:	d503201f 	nop
   84c5c:	d503201f 	nop
   84c60:	d503201f 	nop
   84c64:	d503201f 	nop
   84c68:	d503201f 	nop
   84c6c:	d503201f 	nop
   84c70:	d503201f 	nop
   84c74:	d503201f 	nop
   84c78:	d503201f 	nop
   84c7c:	d503201f 	nop

0000000000084c80 <.EXC_LOWEREL64_SPX_Irq>:
   84c80:	d10043ff 	sub	sp, sp, #0x10
   84c84:	a9007be0 	stp	x0, x30, [sp]
   84c88:	d2800440 	mov	x0, #0x22                  	// #34
   84c8c:	97fffcdf 	bl	84008 <__exception_trampoline>
   84c90:	a9407be0 	ldp	x0, x30, [sp]
   84c94:	910043ff 	add	sp, sp, #0x10
   84c98:	d69f03e0 	eret
   84c9c:	d503201f 	nop
   84ca0:	d503201f 	nop
   84ca4:	d503201f 	nop
   84ca8:	d503201f 	nop
   84cac:	d503201f 	nop
   84cb0:	d503201f 	nop
   84cb4:	d503201f 	nop
   84cb8:	d503201f 	nop
   84cbc:	d503201f 	nop
   84cc0:	d503201f 	nop
   84cc4:	d503201f 	nop
   84cc8:	d503201f 	nop
   84ccc:	d503201f 	nop
   84cd0:	d503201f 	nop
   84cd4:	d503201f 	nop
   84cd8:	d503201f 	nop
   84cdc:	d503201f 	nop
   84ce0:	d503201f 	nop
   84ce4:	d503201f 	nop
   84ce8:	d503201f 	nop
   84cec:	d503201f 	nop
   84cf0:	d503201f 	nop
   84cf4:	d503201f 	nop
   84cf8:	d503201f 	nop
   84cfc:	d503201f 	nop

0000000000084d00 <.EXC_LOWEREL64_SPX_Fiq>:
   84d00:	d10043ff 	sub	sp, sp, #0x10
   84d04:	a9007be0 	stp	x0, x30, [sp]
   84d08:	d2800460 	mov	x0, #0x23                  	// #35
   84d0c:	97fffcbf 	bl	84008 <__exception_trampoline>
   84d10:	a9407be0 	ldp	x0, x30, [sp]
   84d14:	910043ff 	add	sp, sp, #0x10
   84d18:	d69f03e0 	eret
   84d1c:	d503201f 	nop
   84d20:	d503201f 	nop
   84d24:	d503201f 	nop
   84d28:	d503201f 	nop
   84d2c:	d503201f 	nop
   84d30:	d503201f 	nop
   84d34:	d503201f 	nop
   84d38:	d503201f 	nop
   84d3c:	d503201f 	nop
   84d40:	d503201f 	nop
   84d44:	d503201f 	nop
   84d48:	d503201f 	nop
   84d4c:	d503201f 	nop
   84d50:	d503201f 	nop
   84d54:	d503201f 	nop
   84d58:	d503201f 	nop
   84d5c:	d503201f 	nop
   84d60:	d503201f 	nop
   84d64:	d503201f 	nop
   84d68:	d503201f 	nop
   84d6c:	d503201f 	nop
   84d70:	d503201f 	nop
   84d74:	d503201f 	nop
   84d78:	d503201f 	nop
   84d7c:	d503201f 	nop

0000000000084d80 <.EXC_LOWEREL64_SPX_SErr>:
   84d80:	d10043ff 	sub	sp, sp, #0x10
   84d84:	a9007be0 	stp	x0, x30, [sp]
   84d88:	d2800480 	mov	x0, #0x24                  	// #36
   84d8c:	97fffc9f 	bl	84008 <__exception_trampoline>
   84d90:	a9407be0 	ldp	x0, x30, [sp]
   84d94:	910043ff 	add	sp, sp, #0x10
   84d98:	d69f03e0 	eret
   84d9c:	d503201f 	nop
   84da0:	d503201f 	nop
   84da4:	d503201f 	nop
   84da8:	d503201f 	nop
   84dac:	d503201f 	nop
   84db0:	d503201f 	nop
   84db4:	d503201f 	nop
   84db8:	d503201f 	nop
   84dbc:	d503201f 	nop
   84dc0:	d503201f 	nop
   84dc4:	d503201f 	nop
   84dc8:	d503201f 	nop
   84dcc:	d503201f 	nop
   84dd0:	d503201f 	nop
   84dd4:	d503201f 	nop
   84dd8:	d503201f 	nop
   84ddc:	d503201f 	nop
   84de0:	d503201f 	nop
   84de4:	d503201f 	nop
   84de8:	d503201f 	nop
   84dec:	d503201f 	nop
   84df0:	d503201f 	nop
   84df4:	d503201f 	nop
   84df8:	d503201f 	nop
   84dfc:	d503201f 	nop

0000000000084e00 <.EXC_LOWEREL32_SPX_Sync>:
   84e00:	d10043ff 	sub	sp, sp, #0x10
   84e04:	a9007be0 	stp	x0, x30, [sp]
   84e08:	d2800620 	mov	x0, #0x31                  	// #49
   84e0c:	97fffc7f 	bl	84008 <__exception_trampoline>
   84e10:	a9407be0 	ldp	x0, x30, [sp]
   84e14:	910043ff 	add	sp, sp, #0x10
   84e18:	d69f03e0 	eret
   84e1c:	d503201f 	nop
   84e20:	d503201f 	nop
   84e24:	d503201f 	nop
   84e28:	d503201f 	nop
   84e2c:	d503201f 	nop
   84e30:	d503201f 	nop
   84e34:	d503201f 	nop
   84e38:	d503201f 	nop
   84e3c:	d503201f 	nop
   84e40:	d503201f 	nop
   84e44:	d503201f 	nop
   84e48:	d503201f 	nop
   84e4c:	d503201f 	nop
   84e50:	d503201f 	nop
   84e54:	d503201f 	nop
   84e58:	d503201f 	nop
   84e5c:	d503201f 	nop
   84e60:	d503201f 	nop
   84e64:	d503201f 	nop
   84e68:	d503201f 	nop
   84e6c:	d503201f 	nop
   84e70:	d503201f 	nop
   84e74:	d503201f 	nop
   84e78:	d503201f 	nop
   84e7c:	d503201f 	nop

0000000000084e80 <.EXC_LOWEREL32_SPX_Irq>:
   84e80:	d10043ff 	sub	sp, sp, #0x10
   84e84:	a9007be0 	stp	x0, x30, [sp]
   84e88:	d2800640 	mov	x0, #0x32                  	// #50
   84e8c:	97fffc5f 	bl	84008 <__exception_trampoline>
   84e90:	a9407be0 	ldp	x0, x30, [sp]
   84e94:	910043ff 	add	sp, sp, #0x10
   84e98:	d69f03e0 	eret
   84e9c:	d503201f 	nop
   84ea0:	d503201f 	nop
   84ea4:	d503201f 	nop
   84ea8:	d503201f 	nop
   84eac:	d503201f 	nop
   84eb0:	d503201f 	nop
   84eb4:	d503201f 	nop
   84eb8:	d503201f 	nop
   84ebc:	d503201f 	nop
   84ec0:	d503201f 	nop
   84ec4:	d503201f 	nop
   84ec8:	d503201f 	nop
   84ecc:	d503201f 	nop
   84ed0:	d503201f 	nop
   84ed4:	d503201f 	nop
   84ed8:	d503201f 	nop
   84edc:	d503201f 	nop
   84ee0:	d503201f 	nop
   84ee4:	d503201f 	nop
   84ee8:	d503201f 	nop
   84eec:	d503201f 	nop
   84ef0:	d503201f 	nop
   84ef4:	d503201f 	nop
   84ef8:	d503201f 	nop
   84efc:	d503201f 	nop

0000000000084f00 <.EXC_LOWEREL32_SPX_Fiq>:
   84f00:	d10043ff 	sub	sp, sp, #0x10
   84f04:	a9007be0 	stp	x0, x30, [sp]
   84f08:	d2800660 	mov	x0, #0x33                  	// #51
   84f0c:	97fffc3f 	bl	84008 <__exception_trampoline>
   84f10:	a9407be0 	ldp	x0, x30, [sp]
   84f14:	910043ff 	add	sp, sp, #0x10
   84f18:	d69f03e0 	eret
   84f1c:	d503201f 	nop
   84f20:	d503201f 	nop
   84f24:	d503201f 	nop
   84f28:	d503201f 	nop
   84f2c:	d503201f 	nop
   84f30:	d503201f 	nop
   84f34:	d503201f 	nop
   84f38:	d503201f 	nop
   84f3c:	d503201f 	nop
   84f40:	d503201f 	nop
   84f44:	d503201f 	nop
   84f48:	d503201f 	nop
   84f4c:	d503201f 	nop
   84f50:	d503201f 	nop
   84f54:	d503201f 	nop
   84f58:	d503201f 	nop
   84f5c:	d503201f 	nop
   84f60:	d503201f 	nop
   84f64:	d503201f 	nop
   84f68:	d503201f 	nop
   84f6c:	d503201f 	nop
   84f70:	d503201f 	nop
   84f74:	d503201f 	nop
   84f78:	d503201f 	nop
   84f7c:	d503201f 	nop

0000000000084f80 <.EXC_LOWEREL32_SPX_SErr>:
   84f80:	d10043ff 	sub	sp, sp, #0x10
   84f84:	a9007be0 	stp	x0, x30, [sp]
   84f88:	d2800680 	mov	x0, #0x34                  	// #52
   84f8c:	97fffc1f 	bl	84008 <__exception_trampoline>
   84f90:	a9407be0 	ldp	x0, x30, [sp]
   84f94:	910043ff 	add	sp, sp, #0x10
   84f98:	d69f03e0 	eret
   84f9c:	d503201f 	nop
   84fa0:	d503201f 	nop
   84fa4:	d503201f 	nop
   84fa8:	d503201f 	nop
   84fac:	d503201f 	nop
   84fb0:	d503201f 	nop
   84fb4:	d503201f 	nop
   84fb8:	d503201f 	nop
   84fbc:	d503201f 	nop
   84fc0:	d503201f 	nop
   84fc4:	d503201f 	nop
   84fc8:	d503201f 	nop
   84fcc:	d503201f 	nop
   84fd0:	d503201f 	nop
   84fd4:	d503201f 	nop
   84fd8:	d503201f 	nop
   84fdc:	d503201f 	nop
   84fe0:	d503201f 	nop
   84fe4:	d503201f 	nop
   84fe8:	d503201f 	nop
   84fec:	d503201f 	nop
   84ff0:	d503201f 	nop
   84ff4:	d503201f 	nop
   84ff8:	d503201f 	nop
   84ffc:	d503201f 	nop

0000000000085000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>:
   85000:	f9400401 	ldr	x1, [x0, #8]
   85004:	b4000081 	cbz	x1, 85014 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE+0x14>
   85008:	f9400000 	ldr	x0, [x0]
   8500c:	52800022 	mov	w2, #0x1                   	// #1
   85010:	17fff35a 	b	81d78 <__rust_dealloc>
   85014:	d65f03c0 	ret

0000000000085018 <_ZN4core3ptr18real_drop_in_place17hefe1a65893d74b55E>:
   85018:	14000198 	b	85678 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h1242b4c97eb5cdc4E>
   8501c:	00000000 	.inst	0x00000000 ; undefined

0000000000085020 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   85020:	f9400008 	ldr	x8, [x0]
   85024:	aa0103e2 	mov	x2, x1
   85028:	f9400809 	ldr	x9, [x0, #16]
   8502c:	aa0803e0 	mov	x0, x8
   85030:	aa0903e1 	mov	x1, x9
   85034:	14001287 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000085038 <__rust_entry>:
   85038:	d10243ff 	sub	sp, sp, #0x90
   8503c:	f9003bf4 	str	x20, [sp, #112]
   85040:	a9087bf3 	stp	x19, x30, [sp, #128]
   85044:	2a0003f3 	mov	w19, w0
   85048:	940000be 	bl	85340 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE>
   8504c:	35000a73 	cbnz	w19, 85198 <__rust_entry+0x160>
   85050:	b0000054 	adrp	x20, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85054:	f9445694 	ldr	x20, [x20, #2216]
   85058:	aa1403e0 	mov	x0, x20
   8505c:	9400089f 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   85060:	910103e8 	add	x8, sp, #0x40
   85064:	aa1403e0 	mov	x0, x20
   85068:	52800081 	mov	w1, #0x4                   	// #4
   8506c:	9400073f 	bl	86d68 <_ZN15ruspiro_mailbox7Mailbox13get_clockrate17hecd0f87f51b53591E>
   85070:	aa1403e0 	mov	x0, x20
   85074:	940008a3 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   85078:	294827e8 	ldp	w8, w9, [sp, #64]
   8507c:	7100051f 	cmp	w8, #0x1
   85080:	52965008 	mov	w8, #0xb280                	// #45696
   85084:	72a1dcc8 	movk	w8, #0xee6, lsl #16
   85088:	1a890114 	csel	w20, w8, w9, eq  // eq = none
   8508c:	94000143 	bl	85598 <_ZN12ruspiro_uart5uart15Uart13new17h45a93afce8267938E>
   85090:	3901f3e0 	strb	w0, [sp, #124]
   85094:	52984002 	mov	w2, #0xc200                	// #49664
   85098:	9101f3e0 	add	x0, sp, #0x7c
   8509c:	72a00022 	movk	w2, #0x1, lsl #16
   850a0:	2a1403e1 	mov	w1, w20
   850a4:	9400013f 	bl	855a0 <_ZN12ruspiro_uart5uart15Uart110initialize17h4219467896ec5bbfE>
   850a8:	3941f3e1 	ldrb	w1, [sp, #124]
   850ac:	b0000040 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   850b0:	f9446400 	ldr	x0, [x0, #2248]
   850b4:	9400006d 	bl	85268 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h32af2f23f622b306E>
   850b8:	90000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   850bc:	52800029 	mov	w9, #0x1                   	// #1
   850c0:	912da108 	add	x8, x8, #0xb68
   850c4:	5280010a 	mov	w10, #0x8                   	// #8
   850c8:	a9057fff 	stp	xzr, xzr, [sp, #80]
   850cc:	a90427e8 	stp	x8, x9, [sp, #64]
   850d0:	a9067fea 	stp	x10, xzr, [sp, #96]
   850d4:	9100a3e8 	add	x8, sp, #0x28
   850d8:	910103e0 	add	x0, sp, #0x40
   850dc:	940008d3 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   850e0:	a942a3e9 	ldp	x9, x8, [sp, #40]
   850e4:	f9401fea 	ldr	x10, [sp, #56]
   850e8:	a9057fff 	stp	xzr, xzr, [sp, #80]
   850ec:	a90123e9 	stp	x9, x8, [sp, #16]
   850f0:	90000009 	adrp	x9, 85000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   850f4:	910043e8 	add	x8, sp, #0x10
   850f8:	91008129 	add	x9, x9, #0x20
   850fc:	f90013ea 	str	x10, [sp, #32]
   85100:	5280004a 	mov	w10, #0x2                   	// #2
   85104:	a90027e8 	stp	x8, x9, [sp]
   85108:	90000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   8510c:	912d2108 	add	x8, x8, #0xb48
   85110:	910003e9 	mov	x9, sp
   85114:	a9042be8 	stp	x8, x10, [sp, #64]
   85118:	52800028 	mov	w8, #0x1                   	// #1
   8511c:	a90623e9 	stp	x9, x8, [sp, #96]
   85120:	9100a3e8 	add	x8, sp, #0x28
   85124:	910103e0 	add	x0, sp, #0x40
   85128:	940008c0 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   8512c:	f9400fe1 	ldr	x1, [sp, #24]
   85130:	b4000081 	cbz	x1, 85140 <__rust_entry+0x108>
   85134:	f9400be0 	ldr	x0, [sp, #16]
   85138:	52800022 	mov	w2, #0x1                   	// #1
   8513c:	97fff30f 	bl	81d78 <__rust_dealloc>
   85140:	a942a3f4 	ldp	x20, x8, [sp, #40]
   85144:	f9401fe1 	ldr	x1, [sp, #56]
   85148:	a90423f4 	stp	x20, x8, [sp, #64]
   8514c:	f9002be1 	str	x1, [sp, #80]
   85150:	aa1403e0 	mov	x0, x20
   85154:	9400084b 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   85158:	f94027e1 	ldr	x1, [sp, #72]
   8515c:	b4000081 	cbz	x1, 8516c <__rust_entry+0x134>
   85160:	aa1403e0 	mov	x0, x20
   85164:	52800022 	mov	w2, #0x1                   	// #1
   85168:	97fff304 	bl	81d78 <__rust_dealloc>
   8516c:	5284e200 	mov	w0, #0x2710                	// #10000
   85170:	940002da 	bl	85cd8 <_ZN13ruspiro_timer5sleep17h2196643d932a9abdE>
   85174:	b0000054 	adrp	x20, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85178:	f9447694 	ldr	x20, [x20, #2280]
   8517c:	aa1403e0 	mov	x0, x20
   85180:	94000856 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   85184:	91004280 	add	x0, x20, #0x10
   85188:	940005a8 	bl	86828 <_ZN17ruspiro_interrupt16InterruptManager10initialize17hb5cc1913d9bcbf35E>
   8518c:	b0000040 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85190:	f9447400 	ldr	x0, [x0, #2280]
   85194:	9400085b 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   85198:	2a1303e0 	mov	w0, w19
   8519c:	97fff52d 	bl	82650 <__kernel_startup>
   851a0:	2a1303e0 	mov	w0, w19
   851a4:	97fff575 	bl	82778 <__kernel_run>
   851a8:	d4200020 	brk	#0x1
   851ac:	aa0003f3 	mov	x19, x0
   851b0:	aa1303e0 	mov	x0, x19
   851b4:	97fffacf 	bl	83cf0 <_Unwind_Resume>
   851b8:	d4200020 	brk	#0x1
   851bc:	aa0003f3 	mov	x19, x0
   851c0:	aa1303e0 	mov	x0, x19
   851c4:	97fffacb 	bl	83cf0 <_Unwind_Resume>
   851c8:	d4200020 	brk	#0x1
   851cc:	aa0003f3 	mov	x19, x0
   851d0:	aa1303e0 	mov	x0, x19
   851d4:	97fffac7 	bl	83cf0 <_Unwind_Resume>
   851d8:	d4200020 	brk	#0x1
   851dc:	aa0003f3 	mov	x19, x0
   851e0:	910103e0 	add	x0, sp, #0x40
   851e4:	97ffff87 	bl	85000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   851e8:	aa1303e0 	mov	x0, x19
   851ec:	97fffac1 	bl	83cf0 <_Unwind_Resume>
   851f0:	d4200020 	brk	#0x1
   851f4:	aa0003f3 	mov	x19, x0
   851f8:	910043e0 	add	x0, sp, #0x10
   851fc:	97ffff81 	bl	85000 <_ZN4core3ptr18real_drop_in_place17hbbd74dd63f0ead4fE>
   85200:	aa1303e0 	mov	x0, x19
   85204:	97fffabb 	bl	83cf0 <_Unwind_Resume>
   85208:	d4200020 	brk	#0x1
   8520c:	aa0003f3 	mov	x19, x0
   85210:	9101f3e0 	add	x0, sp, #0x7c
   85214:	97ffff81 	bl	85018 <_ZN4core3ptr18real_drop_in_place17hefe1a65893d74b55E>
   85218:	aa1303e0 	mov	x0, x19
   8521c:	97fffab5 	bl	83cf0 <_Unwind_Resume>
   85220:	d4200020 	brk	#0x1
   85224:	aa0003f3 	mov	x19, x0
   85228:	aa1303e0 	mov	x0, x19
   8522c:	97fffab1 	bl	83cf0 <_Unwind_Resume>
   85230:	d4200020 	brk	#0x1
   85234:	00000000 	.inst	0x00000000 ; undefined

0000000000085238 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h2f7903c260693ba6E>:
   85238:	a9402408 	ldp	x8, x9, [x0]
   8523c:	aa0103e2 	mov	x2, x1
   85240:	aa0803e0 	mov	x0, x8
   85244:	aa0903e1 	mov	x1, x9
   85248:	140010ae 	b	89500 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E>
   8524c:	00000000 	.inst	0x00000000 ; undefined

0000000000085250 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h7ec832f20bf83763E>:
   85250:	a9402408 	ldp	x8, x9, [x0]
   85254:	aa0103e2 	mov	x2, x1
   85258:	aa0803e0 	mov	x0, x8
   8525c:	aa0903e1 	mov	x1, x9
   85260:	140011fc 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>
   85264:	00000000 	.inst	0x00000000 ; undefined

0000000000085268 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h32af2f23f622b306E>:
   85268:	d100c3ff 	sub	sp, sp, #0x30
   8526c:	a90153f5 	stp	x21, x20, [sp, #16]
   85270:	a9027bf3 	stp	x19, x30, [sp, #32]
   85274:	aa0003f3 	mov	x19, x0
   85278:	390033e1 	strb	w1, [sp, #12]
   8527c:	94000817 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   85280:	394033f4 	ldrb	w20, [sp, #12]
   85284:	52800020 	mov	w0, #0x1                   	// #1
   85288:	52800021 	mov	w1, #0x1                   	// #1
   8528c:	97fff2b7 	bl	81d68 <__rust_alloc>
   85290:	b40002a0 	cbz	x0, 852e4 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h32af2f23f622b306E+0x7c>
   85294:	39000014 	strb	w20, [x0]
   85298:	90000048 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   8529c:	a9415674 	ldp	x20, x21, [x19, #16]
   852a0:	912ea108 	add	x8, x8, #0xba8
   852a4:	a9012260 	stp	x0, x8, [x19, #16]
   852a8:	b4000134 	cbz	x20, 852cc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h32af2f23f622b306E+0x64>
   852ac:	f94002a8 	ldr	x8, [x21]
   852b0:	aa1403e0 	mov	x0, x20
   852b4:	d63f0100 	blr	x8
   852b8:	f94006a1 	ldr	x1, [x21, #8]
   852bc:	b4000081 	cbz	x1, 852cc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17h32af2f23f622b306E+0x64>
   852c0:	f9400aa2 	ldr	x2, [x21, #16]
   852c4:	aa1403e0 	mov	x0, x20
   852c8:	97fff2ac 	bl	81d78 <__rust_dealloc>
   852cc:	aa1303e0 	mov	x0, x19
   852d0:	9400080c 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   852d4:	a9427bf3 	ldp	x19, x30, [sp, #32]
   852d8:	a94153f5 	ldp	x21, x20, [sp, #16]
   852dc:	9100c3ff 	add	sp, sp, #0x30
   852e0:	d65f03c0 	ret
   852e4:	52800020 	mov	w0, #0x1                   	// #1
   852e8:	52800021 	mov	w1, #0x1                   	// #1
   852ec:	94000845 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   852f0:	d4200020 	brk	#0x1
   852f4:	aa0003f3 	mov	x19, x0
   852f8:	aa1403e0 	mov	x0, x20
   852fc:	aa1503e1 	mov	x1, x21
   85300:	940000a0 	bl	85580 <_ZN5alloc5alloc8box_free17h4b5582d1d57261afE.llvm.5692450643932149292>
   85304:	aa1303e0 	mov	x0, x19
   85308:	97fffa7a 	bl	83cf0 <_Unwind_Resume>
   8530c:	d4200020 	brk	#0x1
   85310:	aa0003f3 	mov	x19, x0
   85314:	aa1303e0 	mov	x0, x19
   85318:	97fffa76 	bl	83cf0 <_Unwind_Resume>
   8531c:	d4200020 	brk	#0x1
   85320:	aa0003f3 	mov	x19, x0
   85324:	910033e0 	add	x0, sp, #0xc
   85328:	94000004 	bl	85338 <_ZN4core3ptr18real_drop_in_place17he9df51d339435cbeE.llvm.11628253194779846409>
   8532c:	aa1303e0 	mov	x0, x19
   85330:	97fffa70 	bl	83cf0 <_Unwind_Resume>
   85334:	d4200020 	brk	#0x1

0000000000085338 <_ZN4core3ptr18real_drop_in_place17he9df51d339435cbeE.llvm.11628253194779846409>:
   85338:	140000d0 	b	85678 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h1242b4c97eb5cdc4E>
   8533c:	00000000 	.inst	0x00000000 ; undefined

0000000000085340 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE>:
   85340:	f81f0ffe 	str	x30, [sp, #-16]!
   85344:	d5384248 	mrs	x8, currentel
   85348:	d3420d08 	ubfx	x8, x8, #2, #2
   8534c:	f100051f 	cmp	x8, #0x1
   85350:	54000580 	b.eq	85400 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0xc0>  // b.none
   85354:	f100091f 	cmp	x8, #0x2
   85358:	54000f41 	b.ne	85540 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0x200>  // b.any
   8535c:	d53c1009 	mrs	x9, sctlr_el2
   85360:	928200aa 	mov	x10, #0xffffffffffffeffa    	// #-4102
   85364:	8a0a0129 	and	x9, x9, x10
   85368:	d51c1009 	msr	sctlr_el2, x9
   8536c:	34000540 	cbz	w0, 85414 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0xd4>
   85370:	f100051f 	cmp	x8, #0x1
   85374:	54000ae0 	b.eq	854d0 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0x190>  // b.none
   85378:	f100091f 	cmp	x8, #0x2
   8537c:	54000f01 	b.ne	8555c <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0x21c>  // b.any
   85380:	d2808008 	mov	x8, #0x400                 	// #1024
   85384:	d53ca209 	mrs	x9, mair_el2
   85388:	f2a88188 	movk	x8, #0x440c, lsl #16
   8538c:	f2c01fe8 	movk	x8, #0xff, lsl #32
   85390:	b3409d09 	bfxil	x9, x8, #0, #40
   85394:	f0000048 	adrp	x8, 90000 <_ZN12ruspiro_boot3mmu7MMU_CFG17h991923868b0492f3E>
   85398:	91000108 	add	x8, x8, #0x0
   8539c:	d51ca209 	msr	mair_el2, x9
   853a0:	d53c2009 	mrs	x9, ttbr0_el2
   853a4:	b340bd09 	bfxil	x9, x8, #0, #48
   853a8:	52801808 	mov	w8, #0xc0                  	// #192
   853ac:	72bffd08 	movk	w8, #0xffe8, lsl #16
   853b0:	d51c2009 	msr	ttbr0_el2, x9
   853b4:	d53c2049 	mrs	x9, tcr_el2
   853b8:	0a080128 	and	w8, w9, w8
   853bc:	5286a329 	mov	w9, #0x3519                	// #13593
   853c0:	72a00209 	movk	w9, #0x10, lsl #16
   853c4:	2a090108 	orr	w8, w8, w9
   853c8:	92820029 	mov	x9, #0xffffffffffffeffe    	// #-4098
   853cc:	d51c2048 	msr	tcr_el2, x8
   853d0:	d53c1108 	mrs	x8, hcr_el2
   853d4:	8a090108 	and	x8, x8, x9
   853d8:	d51c1108 	msr	hcr_el2, x8
   853dc:	d53c1008 	mrs	x8, sctlr_el2
   853e0:	528200a9 	mov	w9, #0x1005                	// #4101
   853e4:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   853e8:	aa090108 	orr	x8, x8, x9
   853ec:	d51c1008 	msr	sctlr_el2, x8
   853f0:	d503201f 	nop
   853f4:	d503201f 	nop
   853f8:	f84107fe 	ldr	x30, [sp], #16
   853fc:	d65f03c0 	ret
   85400:	d5381009 	mrs	x9, sctlr_el1
   85404:	928200aa 	mov	x10, #0xffffffffffffeffa    	// #-4102
   85408:	8a0a0129 	and	x9, x9, x10
   8540c:	d5181009 	msr	sctlr_el1, x9
   85410:	35fffb00 	cbnz	w0, 85370 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0x30>
   85414:	f0000049 	adrp	x9, 90000 <_ZN12ruspiro_boot3mmu7MMU_CFG17h991923868b0492f3E>
   85418:	5280e22c 	mov	w12, #0x711                 	// #1809
   8541c:	91000129 	add	x9, x9, #0x0
   85420:	9140052a 	add	x10, x9, #0x1, lsl #12
   85424:	9140092b 	add	x11, x9, #0x2, lsl #12
   85428:	b241094a 	orr	x10, x10, #0x8000000000000003
   8542c:	b241096b 	orr	x11, x11, #0x8000000000000003
   85430:	4e080d80 	dup	v0.2d, x12
   85434:	5280008c 	mov	w12, #0x4                   	// #4
   85438:	9e670144 	fmov	d4, x10
   8543c:	5280e22a 	mov	w10, #0x711                 	// #1809
   85440:	72a0080a 	movk	w10, #0x40, lsl #16
   85444:	4e080d82 	dup	v2.2d, x12
   85448:	4e080d41 	dup	v1.2d, x10
   8544c:	b000002a 	adrp	x10, 8a000 <memmove>
   85450:	4e181d64 	mov	v4.d[1], x11
   85454:	3dc18143 	ldr	q3, [x10, #1536]
   85458:	aa1f03ea 	mov	x10, xzr
   8545c:	3d800124 	str	q4, [x9]
   85460:	4f555464 	shl	v4.2d, v3.2d, #21
   85464:	8b0a012b 	add	x11, x9, x10
   85468:	4ee28463 	add	v3.2d, v3.2d, v2.2d
   8546c:	9100814a 	add	x10, x10, #0x20
   85470:	f13f015f 	cmp	x10, #0xfc0
   85474:	4ea01c85 	orr	v5.16b, v4.16b, v0.16b
   85478:	4ee18484 	add	v4.2d, v4.2d, v1.2d
   8547c:	3d840165 	str	q5, [x11, #4096]
   85480:	3d840564 	str	q4, [x11, #4112]
   85484:	54fffee1 	b.ne	85460 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0x120>  // b.any
   85488:	b0000029 	adrp	x9, 8a000 <memmove>
   8548c:	b000002a 	adrp	x10, 8a000 <memmove>
   85490:	b000002b 	adrp	x11, 8a000 <memmove>
   85494:	3dc18520 	ldr	q0, [x9, #1552]
   85498:	b0000029 	adrp	x9, 8a000 <memmove>
   8549c:	3dc18941 	ldr	q1, [x10, #1568]
   854a0:	9000006a 	adrp	x10, 91000 <_ZN12ruspiro_boot3mmu7MMU_CFG17h991923868b0492f3E+0x1000>
   854a4:	3dc18d62 	ldr	q2, [x11, #1584]
   854a8:	913f014a 	add	x10, x10, #0xfc0
   854ac:	3dc19123 	ldr	q3, [x9, #1600]
   854b0:	52808029 	mov	w9, #0x401                 	// #1025
   854b4:	72a80009 	movk	w9, #0x4000, lsl #16
   854b8:	ad000540 	stp	q0, q1, [x10]
   854bc:	ad010d42 	stp	q2, q3, [x10, #32]
   854c0:	f9002149 	str	x9, [x10, #64]
   854c4:	d5033a9f 	dsb	ishst
   854c8:	f100051f 	cmp	x8, #0x1
   854cc:	54fff561 	b.ne	85378 <_ZN12ruspiro_boot3mmu14initialize_mmu17hfad4f60de6fc185dE+0x38>  // b.any
   854d0:	d2808008 	mov	x8, #0x400                 	// #1024
   854d4:	d538a209 	mrs	x9, mair_el1
   854d8:	f2a88188 	movk	x8, #0x440c, lsl #16
   854dc:	f2c01fe8 	movk	x8, #0xff, lsl #32
   854e0:	b3409d09 	bfxil	x9, x8, #0, #40
   854e4:	f0000048 	adrp	x8, 90000 <_ZN12ruspiro_boot3mmu7MMU_CFG17h991923868b0492f3E>
   854e8:	91000108 	add	x8, x8, #0x0
   854ec:	d518a209 	msr	mair_el1, x9
   854f0:	d5382009 	mrs	x9, ttbr0_el1
   854f4:	b340bd09 	bfxil	x9, x8, #0, #48
   854f8:	52800808 	mov	w8, #0x40                  	// #64
   854fc:	72a00c08 	movk	w8, #0x60, lsl #16
   85500:	d5182009 	msr	ttbr0_el1, x9
   85504:	d5382049 	mrs	x9, tcr_el1
   85508:	0a080128 	and	w8, w9, w8
   8550c:	5286a329 	mov	w9, #0x3519                	// #13593
   85510:	72a7b329 	movk	w9, #0x3d99, lsl #16
   85514:	2a090108 	orr	w8, w8, w9
   85518:	d5182048 	msr	tcr_el1, x8
   8551c:	d5381008 	mrs	x8, sctlr_el1
   85520:	528200a9 	mov	w9, #0x1005                	// #4101
   85524:	927cf108 	and	x8, x8, #0xfffffffffffffff1
   85528:	aa090108 	orr	x8, x8, x9
   8552c:	d5181008 	msr	sctlr_el1, x8
   85530:	d503201f 	nop
   85534:	d503201f 	nop
   85538:	f84107fe 	ldr	x30, [sp], #16
   8553c:	d65f03c0 	ret
   85540:	b0000020 	adrp	x0, 8a000 <memmove>
   85544:	90000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   85548:	91194000 	add	x0, x0, #0x650
   8554c:	52800261 	mov	w1, #0x13                  	// #19
   85550:	912de042 	add	x2, x2, #0xb78
   85554:	94001219 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   85558:	d4200020 	brk	#0x1
   8555c:	b0000020 	adrp	x0, 8a000 <memmove>
   85560:	90000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   85564:	91194000 	add	x0, x0, #0x650
   85568:	52800261 	mov	w1, #0x13                  	// #19
   8556c:	912e4042 	add	x2, x2, #0xb90
   85570:	94001212 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   85574:	d4200020 	brk	#0x1

0000000000085578 <_ZN4core3ptr18real_drop_in_place17hefe1a65893d74b55E>:
   85578:	14000040 	b	85678 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h1242b4c97eb5cdc4E>
   8557c:	00000000 	.inst	0x00000000 ; undefined

0000000000085580 <_ZN5alloc5alloc8box_free17h4b5582d1d57261afE.llvm.5692450643932149292>:
   85580:	aa0103e8 	mov	x8, x1
   85584:	f9400421 	ldr	x1, [x1, #8]
   85588:	b4000061 	cbz	x1, 85594 <_ZN5alloc5alloc8box_free17h4b5582d1d57261afE.llvm.5692450643932149292+0x14>
   8558c:	f9400902 	ldr	x2, [x8, #16]
   85590:	17fff1fa 	b	81d78 <__rust_dealloc>
   85594:	d65f03c0 	ret

0000000000085598 <_ZN12ruspiro_uart5uart15Uart13new17h45a93afce8267938E>:
   85598:	2a1f03e0 	mov	w0, wzr
   8559c:	d65f03c0 	ret

00000000000855a0 <_ZN12ruspiro_uart5uart15Uart110initialize17h4219467896ec5bbfE>:
   855a0:	a9be53f5 	stp	x21, x20, [sp, #-32]!
   855a4:	a9017bf3 	stp	x19, x30, [sp, #16]
   855a8:	aa0003f3 	mov	x19, x0
   855ac:	b0000040 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   855b0:	2a0203f5 	mov	w21, w2
   855b4:	2a0103f4 	mov	w20, w1
   855b8:	f9445800 	ldr	x0, [x0, #2224]
   855bc:	9400007d 	bl	857b0 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E>
   855c0:	b4000080 	cbz	x0, 855d0 <_ZN12ruspiro_uart5uart15Uart110initialize17h4219467896ec5bbfE+0x30>
   855c4:	a9417bf3 	ldp	x19, x30, [sp, #16]
   855c8:	a8c253f5 	ldp	x21, x20, [sp], #32
   855cc:	d65f03c0 	ret
   855d0:	b0000028 	adrp	x8, 8a000 <memmove>
   855d4:	b0000029 	adrp	x9, 8a000 <memmove>
   855d8:	b000002a 	adrp	x10, 8a000 <memmove>
   855dc:	b000002b 	adrp	x11, 8a000 <memmove>
   855e0:	b000002d 	adrp	x13, 8a000 <memmove>
   855e4:	b000002f 	adrp	x15, 8a000 <memmove>
   855e8:	f943510c 	ldr	x12, [x8, #1696]
   855ec:	52800028 	mov	w8, #0x1                   	// #1
   855f0:	f943552e 	ldr	x14, [x9, #1704]
   855f4:	f9435949 	ldr	x9, [x10, #1712]
   855f8:	5280006a 	mov	w10, #0x3                   	// #3
   855fc:	f9435d6b 	ldr	x11, [x11, #1720]
   85600:	f94361ad 	ldr	x13, [x13, #1728]
   85604:	b9000188 	str	w8, [x12]
   85608:	b90001df 	str	wzr, [x14]
   8560c:	b900013f 	str	wzr, [x9]
   85610:	f94365ec 	ldr	x12, [x15, #1736]
   85614:	528018cf 	mov	w15, #0xc6                  	// #198
   85618:	b900016a 	str	w10, [x11]
   8561c:	531d72ab 	lsl	w11, w21, #3
   85620:	b90001bf 	str	wzr, [x13]
   85624:	b90001df 	str	wzr, [x14]
   85628:	b900018f 	str	w15, [x12]
   8562c:	3400018b 	cbz	w11, 8565c <_ZN12ruspiro_uart5uart15Uart110initialize17h4219467896ec5bbfE+0xbc>
   85630:	b000002c 	adrp	x12, 8a000 <memmove>
   85634:	1acb0a8b 	udiv	w11, w20, w11
   85638:	aa1f03e1 	mov	x1, xzr
   8563c:	5100056b 	sub	w11, w11, #0x1
   85640:	f943698c 	ldr	x12, [x12, #1744]
   85644:	b900018b 	str	w11, [x12]
   85648:	b900012a 	str	w10, [x9]
   8564c:	39000268 	strb	w8, [x19]
   85650:	a9417bf3 	ldp	x19, x30, [sp, #16]
   85654:	a8c253f5 	ldp	x21, x20, [sp], #32
   85658:	d65f03c0 	ret
   8565c:	b0000020 	adrp	x0, 8a000 <memmove>
   85660:	90000042 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   85664:	911cc000 	add	x0, x0, #0x730
   85668:	52800321 	mov	w1, #0x19                  	// #25
   8566c:	912f6042 	add	x2, x2, #0xbd8
   85670:	940011d2 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   85674:	d4200020 	brk	#0x1

0000000000085678 <_ZN68_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$core..ops..drop..Drop$GT$4drop17h1242b4c97eb5cdc4E>:
   85678:	f81e0ff4 	str	x20, [sp, #-32]!
   8567c:	a9017bf3 	stp	x19, x30, [sp, #16]
   85680:	b0000053 	adrp	x19, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85684:	f9445a73 	ldr	x19, [x19, #2224]
   85688:	aa1303e0 	mov	x0, x19
   8568c:	94000713 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   85690:	91004274 	add	x20, x19, #0x10
   85694:	528001c1 	mov	w1, #0xe                   	// #14
   85698:	aa1403e0 	mov	x0, x20
   8569c:	940000f9 	bl	85a80 <_ZN12ruspiro_gpio4Gpio8free_pin17h494155f9dc5a1320E>
   856a0:	aa1403e0 	mov	x0, x20
   856a4:	528001e1 	mov	w1, #0xf                   	// #15
   856a8:	940000f6 	bl	85a80 <_ZN12ruspiro_gpio4Gpio8free_pin17h494155f9dc5a1320E>
   856ac:	aa1303e0 	mov	x0, x19
   856b0:	94000714 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   856b4:	a9417bf3 	ldp	x19, x30, [sp, #16]
   856b8:	f84207f4 	ldr	x20, [sp], #32
   856bc:	d65f03c0 	ret

00000000000856c0 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4putc17haa70c0357f8e52fdE>:
   856c0:	f81d0ff6 	str	x22, [sp, #-48]!
   856c4:	a90153f5 	stp	x21, x20, [sp, #16]
   856c8:	a9027bf3 	stp	x19, x30, [sp, #32]
   856cc:	39400008 	ldrb	w8, [x0]
   856d0:	340001e8 	cbz	w8, 8570c <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4putc17haa70c0357f8e52fdE+0x4c>
   856d4:	b0000028 	adrp	x8, 8a000 <memmove>
   856d8:	2a0103f3 	mov	w19, w1
   856dc:	f9436d15 	ldr	x21, [x8, #1752]
   856e0:	b0000028 	adrp	x8, 8a000 <memmove>
   856e4:	b94002a9 	ldr	w9, [x21]
   856e8:	f9437116 	ldr	x22, [x8, #1760]
   856ec:	372800c9 	tbnz	w9, #5, 85704 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4putc17haa70c0357f8e52fdE+0x44>
   856f0:	52800154 	mov	w20, #0xa                   	// #10
   856f4:	2a1403e0 	mov	w0, w20
   856f8:	94000188 	bl	85d18 <_ZN13ruspiro_timer11sleepcycles17hc35bace728ca53a8E>
   856fc:	b94002a8 	ldr	w8, [x21]
   85700:	362fffa8 	tbz	w8, #5, 856f4 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4putc17haa70c0357f8e52fdE+0x34>
   85704:	12001e68 	and	w8, w19, #0xff
   85708:	b90002c8 	str	w8, [x22]
   8570c:	a9427bf3 	ldp	x19, x30, [sp, #32]
   85710:	a94153f5 	ldp	x21, x20, [sp, #16]
   85714:	f84307f6 	ldr	x22, [sp], #48
   85718:	d65f03c0 	ret
   8571c:	00000000 	.inst	0x00000000 ; undefined

0000000000085720 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE>:
   85720:	f81c0ff8 	str	x24, [sp, #-64]!
   85724:	a9015bf7 	stp	x23, x22, [sp, #16]
   85728:	a90253f5 	stp	x21, x20, [sp, #32]
   8572c:	a9037bf3 	stp	x19, x30, [sp, #48]
   85730:	39400008 	ldrb	w8, [x0]
   85734:	7100011f 	cmp	w8, #0x0
   85738:	fa401844 	ccmp	x2, #0x0, #0x4, ne  // ne = any
   8573c:	54000300 	b.eq	8579c <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE+0x7c>  // b.none
   85740:	b0000028 	adrp	x8, 8a000 <memmove>
   85744:	b0000029 	adrp	x9, 8a000 <memmove>
   85748:	aa0103f3 	mov	x19, x1
   8574c:	8b020037 	add	x23, x1, x2
   85750:	52800154 	mov	w20, #0xa                   	// #10
   85754:	f9436d15 	ldr	x21, [x8, #1752]
   85758:	f9437136 	ldr	x22, [x9, #1760]
   8575c:	b94002a8 	ldr	w8, [x21]
   85760:	91000678 	add	x24, x19, #0x1
   85764:	36280128 	tbz	w8, #5, 85788 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE+0x68>
   85768:	39400268 	ldrb	w8, [x19]
   8576c:	aa1803f3 	mov	x19, x24
   85770:	eb17031f 	cmp	x24, x23
   85774:	b90002c8 	str	w8, [x22]
   85778:	54000120 	b.eq	8579c <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE+0x7c>  // b.none
   8577c:	b94002a8 	ldr	w8, [x21]
   85780:	91000678 	add	x24, x19, #0x1
   85784:	372fff28 	tbnz	w8, #5, 85768 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE+0x48>
   85788:	2a1403e0 	mov	w0, w20
   8578c:	94000163 	bl	85d18 <_ZN13ruspiro_timer11sleepcycles17hc35bace728ca53a8E>
   85790:	b94002a8 	ldr	w8, [x21]
   85794:	362fffa8 	tbz	w8, #5, 85788 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE+0x68>
   85798:	17fffff4 	b	85768 <_ZN75_$LT$ruspiro_uart..uart1..Uart1$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17ha27d1005824120dbE+0x48>
   8579c:	a9437bf3 	ldp	x19, x30, [sp, #48]
   857a0:	a94253f5 	ldp	x21, x20, [sp, #32]
   857a4:	a9415bf7 	ldp	x23, x22, [sp, #16]
   857a8:	f84407f8 	ldr	x24, [sp], #64
   857ac:	d65f03c0 	ret

00000000000857b0 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E>:
   857b0:	d10203ff 	sub	sp, sp, #0x80
   857b4:	f9002bf6 	str	x22, [sp, #80]
   857b8:	a90653f5 	stp	x21, x20, [sp, #96]
   857bc:	a9077bf3 	stp	x19, x30, [sp, #112]
   857c0:	aa0003f3 	mov	x19, x0
   857c4:	940006c5 	bl	872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>
   857c8:	91004274 	add	x20, x19, #0x10
   857cc:	910023e8 	add	x8, sp, #0x8
   857d0:	aa1403e0 	mov	x0, x20
   857d4:	528001c1 	mov	w1, #0xe                   	// #14
   857d8:	9400004e 	bl	85910 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE>
   857dc:	f94007e8 	ldr	x8, [sp, #8]
   857e0:	f100051f 	cmp	x8, #0x1
   857e4:	54000460 	b.eq	85870 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0xc0>  // b.none
   857e8:	f9400bea 	ldr	x10, [sp, #16]
   857ec:	b000002e 	adrp	x14, 8a000 <memmove>
   857f0:	294733eb 	ldp	w11, w12, [sp, #56]
   857f4:	f9401be8 	ldr	x8, [sp, #48]
   857f8:	b94047e9 	ldr	w9, [sp, #68]
   857fc:	b940014d 	ldr	w13, [x10]
   85800:	1acc216f 	lsl	w15, w11, w12
   85804:	121f016b 	and	w11, w11, #0x2
   85808:	f943a9d6 	ldr	x22, [x14, #1872]
   8580c:	1acc216b 	lsl	w11, w11, w12
   85810:	0a2f01ad 	bic	w13, w13, w15
   85814:	2a0b01ab 	orr	w11, w13, w11
   85818:	b900014b 	str	w11, [x10]
   8581c:	b94002ca 	ldr	w10, [x22]
   85820:	121e754b 	and	w11, w10, #0xfffffffc
   85824:	528012ca 	mov	w10, #0x96                  	// #150
   85828:	b90002cb 	str	w11, [x22]
   8582c:	7100054a 	subs	w10, w10, #0x1
   85830:	d503201f 	nop
   85834:	54ffffc1 	b.ne	8582c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0x7c>  // b.any
   85838:	528012ca 	mov	w10, #0x96                  	// #150
   8583c:	b9000109 	str	w9, [x8]
   85840:	7100054a 	subs	w10, w10, #0x1
   85844:	d503201f 	nop
   85848:	54ffffc1 	b.ne	85840 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0x90>  // b.any
   8584c:	b90002df 	str	wzr, [x22]
   85850:	aa1403e0 	mov	x0, x20
   85854:	b9000109 	str	w9, [x8]
   85858:	910023e8 	add	x8, sp, #0x8
   8585c:	528001e1 	mov	w1, #0xf                   	// #15
   85860:	9400002c 	bl	85910 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE>
   85864:	f94007e8 	ldr	x8, [sp, #8]
   85868:	f100051f 	cmp	x8, #0x1
   8586c:	540000a1 	b.ne	85880 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0xd0>  // b.any
   85870:	b0000035 	adrp	x21, 8a000 <memmove>
   85874:	52800154 	mov	w20, #0xa                   	// #10
   85878:	911a5ab5 	add	x21, x21, #0x696
   8587c:	1400001c 	b	858ec <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0x13c>
   85880:	f9400bea 	ldr	x10, [sp, #16]
   85884:	294733eb 	ldp	w11, w12, [sp, #56]
   85888:	f9401be8 	ldr	x8, [sp, #48]
   8588c:	b94047e9 	ldr	w9, [sp, #68]
   85890:	b940014d 	ldr	w13, [x10]
   85894:	1acc216e 	lsl	w14, w11, w12
   85898:	121f016b 	and	w11, w11, #0x2
   8589c:	1acc216b 	lsl	w11, w11, w12
   858a0:	0a2e01ad 	bic	w13, w13, w14
   858a4:	2a0b01ab 	orr	w11, w13, w11
   858a8:	b900014b 	str	w11, [x10]
   858ac:	b94002ca 	ldr	w10, [x22]
   858b0:	121e754b 	and	w11, w10, #0xfffffffc
   858b4:	528012ca 	mov	w10, #0x96                  	// #150
   858b8:	b90002cb 	str	w11, [x22]
   858bc:	7100054a 	subs	w10, w10, #0x1
   858c0:	d503201f 	nop
   858c4:	54ffffc1 	b.ne	858bc <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0x10c>  // b.any
   858c8:	528012ca 	mov	w10, #0x96                  	// #150
   858cc:	b9000109 	str	w9, [x8]
   858d0:	7100054a 	subs	w10, w10, #0x1
   858d4:	d503201f 	nop
   858d8:	54ffffc1 	b.ne	858d0 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$8take_for17hd10d283c7f5c3a18E+0x120>  // b.any
   858dc:	aa1f03f4 	mov	x20, xzr
   858e0:	aa1f03f5 	mov	x21, xzr
   858e4:	b90002df 	str	wzr, [x22]
   858e8:	b9000109 	str	w9, [x8]
   858ec:	aa1303e0 	mov	x0, x19
   858f0:	94000684 	bl	87300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>
   858f4:	aa1503e0 	mov	x0, x21
   858f8:	aa1403e1 	mov	x1, x20
   858fc:	a9477bf3 	ldp	x19, x30, [sp, #112]
   85900:	a94653f5 	ldp	x21, x20, [sp, #96]
   85904:	f9402bf6 	ldr	x22, [sp, #80]
   85908:	910203ff 	add	sp, sp, #0x80
   8590c:	d65f03c0 	ret

0000000000085910 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE>:
   85910:	d10143ff 	sub	sp, sp, #0x50
   85914:	f90023fe 	str	x30, [sp, #64]
   85918:	2a0103e9 	mov	w9, w1
   8591c:	71009c3f 	cmp	w1, #0x27
   85920:	54000848 	b.hi	85a28 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0x118>  // b.pmore
   85924:	3869680a 	ldrb	w10, [x0, x9]
   85928:	5280002b 	mov	w11, #0x1                   	// #1
   8592c:	340000aa 	cbz	w10, 85940 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0x30>
   85930:	f94023fe 	ldr	x30, [sp, #64]
   85934:	f900010b 	str	x11, [x8]
   85938:	910143ff 	add	sp, sp, #0x50
   8593c:	d65f03c0 	ret
   85940:	529999ac 	mov	w12, #0xcccd                	// #52429
   85944:	12001c2a 	and	w10, w1, #0xff
   85948:	72b9998c 	movk	w12, #0xcccc, lsl #16
   8594c:	3829680b 	strb	w11, [x0, x9]
   85950:	b9004fe1 	str	w1, [sp, #76]
   85954:	9bac7d4a 	umull	x10, w10, w12
   85958:	d363fd4b 	lsr	x11, x10, #35
   8595c:	7100157f 	cmp	w11, #0x5
   85960:	54000708 	b.hi	85a40 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0x130>  // b.pmore
   85964:	52800149 	mov	w9, #0xa                   	// #10
   85968:	b000002d 	adrp	x13, 8a000 <memmove>
   8596c:	911d61ad 	add	x13, x13, #0x758
   85970:	5280008a 	mov	w10, #0x4                   	// #4
   85974:	1b098569 	msub	w9, w11, w9, w1
   85978:	72a7e40a 	movk	w10, #0x3f20, lsl #16
   8597c:	52a7e40c 	mov	w12, #0x3f200000            	// #1059061760
   85980:	100000ce 	adr	x14, 85998 <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0x88>
   85984:	386b69af 	ldrb	w15, [x13, x11]
   85988:	8b0f09ce 	add	x14, x14, x15, lsl #2
   8598c:	0b090529 	add	w9, w9, w9, lsl #1
   85990:	12001d29 	and	w9, w9, #0xff
   85994:	d61f01c0 	br	x14
   85998:	aa0a03ec 	mov	x12, x10
   8599c:	14000008 	b	859bc <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0xac>
   859a0:	9100314c 	add	x12, x10, #0xc
   859a4:	14000006 	b	859bc <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0xac>
   859a8:	9100114c 	add	x12, x10, #0x4
   859ac:	14000004 	b	859bc <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0xac>
   859b0:	9100214c 	add	x12, x10, #0x8
   859b4:	14000002 	b	859bc <_ZN12ruspiro_gpio4Gpio7get_pin17ha71946f4fef2438fE+0xac>
   859b8:	9100414c 	add	x12, x10, #0x10
   859bc:	9100614d 	add	x13, x10, #0x18
   859c0:	9100714e 	add	x14, x10, #0x1c
   859c4:	7100803f 	cmp	w1, #0x20
   859c8:	9100914f 	add	x15, x10, #0x24
   859cc:	9100a150 	add	x16, x10, #0x28
   859d0:	9a8e31ad 	csel	x13, x13, x14, cc  // cc = lo, ul, last
   859d4:	9a9031ee 	csel	x14, x15, x16, cc  // cc = lo, ul, last
   859d8:	9100c14f 	add	x15, x10, #0x30
   859dc:	9100d150 	add	x16, x10, #0x34
   859e0:	aa1f03eb 	mov	x11, xzr
   859e4:	9a9031ef 	csel	x15, x15, x16, cc  // cc = lo, ul, last
   859e8:	91025150 	add	x16, x10, #0x94
   859ec:	9102614a 	add	x10, x10, #0x98
   859f0:	a900b50c 	stp	x12, x13, [x8, #8]
   859f4:	9a8a320a 	csel	x10, x16, x10, cc  // cc = lo, ul, last
   859f8:	528000ec 	mov	w12, #0x7                   	// #7
   859fc:	5280002d 	mov	w13, #0x1                   	// #1
   85a00:	a901bd0e 	stp	x14, x15, [x8, #24]
   85a04:	b9004101 	str	w1, [x8, #64]
   85a08:	f900150a 	str	x10, [x8, #40]
   85a0c:	1ac121aa 	lsl	w10, w13, w1
   85a10:	2906250c 	stp	w12, w9, [x8, #48]
   85a14:	2907290a 	stp	w10, w10, [x8, #56]
   85a18:	f94023fe 	ldr	x30, [sp, #64]
   85a1c:	f900010b 	str	x11, [x8]
   85a20:	910143ff 	add	sp, sp, #0x50
   85a24:	d65f03c0 	ret
   85a28:	90000040 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   85a2c:	52800502 	mov	w2, #0x28                  	// #40
   85a30:	912fc000 	add	x0, x0, #0xbf0
   85a34:	aa0903e1 	mov	x1, x9
   85a38:	940010ed 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   85a3c:	d4200020 	brk	#0x1
   85a40:	b0000049 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85a44:	910133eb 	add	x11, sp, #0x4c
   85a48:	9000004a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   85a4c:	90000041 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   85a50:	52800028 	mov	w8, #0x1                   	// #1
   85a54:	9131414a 	add	x10, x10, #0xc50
   85a58:	f9443929 	ldr	x9, [x9, #2160]
   85a5c:	91318021 	add	x1, x1, #0xc60
   85a60:	910003e0 	mov	x0, sp
   85a64:	a9017fff 	stp	xzr, xzr, [sp, #16]
   85a68:	a90023ea 	stp	x10, x8, [sp]
   85a6c:	a90327eb 	stp	x11, x9, [sp, #48]
   85a70:	9100c3e9 	add	x9, sp, #0x30
   85a74:	a90223e9 	stp	x9, x8, [sp, #32]
   85a78:	940010f2 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   85a7c:	d4200020 	brk	#0x1

0000000000085a80 <_ZN12ruspiro_gpio4Gpio8free_pin17h494155f9dc5a1320E>:
   85a80:	f81f0ffe 	str	x30, [sp, #-16]!
   85a84:	2a0103e8 	mov	w8, w1
   85a88:	2a0103e1 	mov	w1, w1
   85a8c:	71009d1f 	cmp	w8, #0x27
   85a90:	540000c8 	b.hi	85aa8 <_ZN12ruspiro_gpio4Gpio8free_pin17h494155f9dc5a1320E+0x28>  // b.pmore
   85a94:	38616808 	ldrb	w8, [x0, x1]
   85a98:	34000048 	cbz	w8, 85aa0 <_ZN12ruspiro_gpio4Gpio8free_pin17h494155f9dc5a1320E+0x20>
   85a9c:	3821681f 	strb	wzr, [x0, x1]
   85aa0:	f84107fe 	ldr	x30, [sp], #16
   85aa4:	d65f03c0 	ret
   85aa8:	90000040 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   85aac:	52800502 	mov	w2, #0x28                  	// #40
   85ab0:	91302000 	add	x0, x0, #0xc08
   85ab4:	940010ce 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   85ab8:	d4200020 	brk	#0x1
   85abc:	00000000 	.inst	0x00000000 ; undefined

0000000000085ac0 <__irq_handler__GpioBank0>:
   85ac0:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
   85ac4:	a90153f5 	stp	x21, x20, [sp, #16]
   85ac8:	a9027bf3 	stp	x19, x30, [sp, #32]
   85acc:	b0000028 	adrp	x8, 8a000 <memmove>
   85ad0:	f9442108 	ldr	x8, [x8, #2112]
   85ad4:	b9400113 	ldr	w19, [x8]
   85ad8:	b9000113 	str	w19, [x8]
   85adc:	34000393 	cbz	w19, 85b4c <__irq_handler__GpioBank0+0x8c>
   85ae0:	b0000054 	adrp	x20, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85ae4:	b0000055 	adrp	x21, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85ae8:	aa1f03f7 	mov	x23, xzr
   85aec:	f9445e94 	ldr	x20, [x20, #2232]
   85af0:	f9444eb5 	ldr	x21, [x21, #2200]
   85af4:	910042f6 	add	x22, x23, #0x10
   85af8:	f10842df 	cmp	x22, #0x210
   85afc:	54000101 	b.ne	85b1c <__irq_handler__GpioBank0+0x5c>  // b.any
   85b00:	14000017 	b	85b5c <__irq_handler__GpioBank0+0x9c>
   85b04:	aa1603f7 	mov	x23, x22
   85b08:	53017e73 	lsr	w19, w19, #1
   85b0c:	34000213 	cbz	w19, 85b4c <__irq_handler__GpioBank0+0x8c>
   85b10:	910042f6 	add	x22, x23, #0x10
   85b14:	f10842df 	cmp	x22, #0x210
   85b18:	54000220 	b.eq	85b5c <__irq_handler__GpioBank0+0x9c>  // b.none
   85b1c:	8b170288 	add	x8, x20, x23
   85b20:	a9400500 	ldp	x0, x1, [x8]
   85b24:	a9007d1f 	stp	xzr, xzr, [x8]
   85b28:	b4000040 	cbz	x0, 85b30 <__irq_handler__GpioBank0+0x70>
   85b2c:	94000047 	bl	85c48 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17haf7fc11e233cabcbE>
   85b30:	8b1702a8 	add	x8, x21, x23
   85b34:	f9400100 	ldr	x0, [x8]
   85b38:	b4fffe60 	cbz	x0, 85b04 <__irq_handler__GpioBank0+0x44>
   85b3c:	f9400508 	ldr	x8, [x8, #8]
   85b40:	f9400d08 	ldr	x8, [x8, #24]
   85b44:	d63f0100 	blr	x8
   85b48:	17ffffef 	b	85b04 <__irq_handler__GpioBank0+0x44>
   85b4c:	a9427bf3 	ldp	x19, x30, [sp, #32]
   85b50:	a94153f5 	ldp	x21, x20, [sp, #16]
   85b54:	a8c35bf7 	ldp	x23, x22, [sp], #48
   85b58:	d65f03c0 	ret
   85b5c:	90000040 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   85b60:	52800401 	mov	w1, #0x20                  	// #32
   85b64:	91308000 	add	x0, x0, #0xc20
   85b68:	52800402 	mov	w2, #0x20                  	// #32
   85b6c:	940010a0 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   85b70:	d4200020 	brk	#0x1
   85b74:	00000000 	.inst	0x00000000 ; undefined

0000000000085b78 <__irq_handler__GpioBank1>:
   85b78:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
   85b7c:	a90153f5 	stp	x21, x20, [sp, #16]
   85b80:	a9027bf3 	stp	x19, x30, [sp, #32]
   85b84:	b0000028 	adrp	x8, 8a000 <memmove>
   85b88:	f9441d08 	ldr	x8, [x8, #2104]
   85b8c:	b9400113 	ldr	w19, [x8]
   85b90:	b9000113 	str	w19, [x8]
   85b94:	34000393 	cbz	w19, 85c04 <__irq_handler__GpioBank1+0x8c>
   85b98:	b0000054 	adrp	x20, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85b9c:	b0000055 	adrp	x21, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85ba0:	aa1f03f7 	mov	x23, xzr
   85ba4:	f9447294 	ldr	x20, [x20, #2272]
   85ba8:	f94462b5 	ldr	x21, [x21, #2240]
   85bac:	910042f6 	add	x22, x23, #0x10
   85bb0:	f105c2df 	cmp	x22, #0x170
   85bb4:	54000101 	b.ne	85bd4 <__irq_handler__GpioBank1+0x5c>  // b.any
   85bb8:	14000017 	b	85c14 <__irq_handler__GpioBank1+0x9c>
   85bbc:	aa1603f7 	mov	x23, x22
   85bc0:	53017e73 	lsr	w19, w19, #1
   85bc4:	34000213 	cbz	w19, 85c04 <__irq_handler__GpioBank1+0x8c>
   85bc8:	910042f6 	add	x22, x23, #0x10
   85bcc:	f105c2df 	cmp	x22, #0x170
   85bd0:	54000220 	b.eq	85c14 <__irq_handler__GpioBank1+0x9c>  // b.none
   85bd4:	8b170288 	add	x8, x20, x23
   85bd8:	a9400500 	ldp	x0, x1, [x8]
   85bdc:	a9007d1f 	stp	xzr, xzr, [x8]
   85be0:	b4000040 	cbz	x0, 85be8 <__irq_handler__GpioBank1+0x70>
   85be4:	94000019 	bl	85c48 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17haf7fc11e233cabcbE>
   85be8:	8b1702a8 	add	x8, x21, x23
   85bec:	f9400100 	ldr	x0, [x8]
   85bf0:	b4fffe60 	cbz	x0, 85bbc <__irq_handler__GpioBank1+0x44>
   85bf4:	f9400508 	ldr	x8, [x8, #8]
   85bf8:	f9400d08 	ldr	x8, [x8, #24]
   85bfc:	d63f0100 	blr	x8
   85c00:	17ffffef 	b	85bbc <__irq_handler__GpioBank1+0x44>
   85c04:	a9427bf3 	ldp	x19, x30, [sp, #32]
   85c08:	a94153f5 	ldp	x21, x20, [sp, #16]
   85c0c:	a8c35bf7 	ldp	x23, x22, [sp], #48
   85c10:	d65f03c0 	ret
   85c14:	528002c1 	mov	w1, #0x16                  	// #22
   85c18:	90000040 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   85c1c:	9130e000 	add	x0, x0, #0xc38
   85c20:	aa0103e2 	mov	x2, x1
   85c24:	94001072 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   85c28:	d4200020 	brk	#0x1
   85c2c:	00000000 	.inst	0x00000000 ; undefined

0000000000085c30 <_ZN5alloc5alloc8box_free17hb51b968a180a3c1fE.llvm.1267023549784938966>:
   85c30:	aa0103e8 	mov	x8, x1
   85c34:	f9400421 	ldr	x1, [x1, #8]
   85c38:	b4000061 	cbz	x1, 85c44 <_ZN5alloc5alloc8box_free17hb51b968a180a3c1fE.llvm.1267023549784938966+0x14>
   85c3c:	f9400902 	ldr	x2, [x8, #16]
   85c40:	17fff04e 	b	81d78 <__rust_dealloc>
   85c44:	d65f03c0 	ret

0000000000085c48 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17haf7fc11e233cabcbE>:
   85c48:	a9bd57f6 	stp	x22, x21, [sp, #-48]!
   85c4c:	a9014ff4 	stp	x20, x19, [sp, #16]
   85c50:	a9027bfd 	stp	x29, x30, [sp, #32]
   85c54:	910083fd 	add	x29, sp, #0x20
   85c58:	f9400435 	ldr	x21, [x1, #8]
   85c5c:	910003e8 	mov	x8, sp
   85c60:	aa0103f3 	mov	x19, x1
   85c64:	aa0003f4 	mov	x20, x0
   85c68:	91003ea9 	add	x9, x21, #0xf
   85c6c:	927ced29 	and	x9, x9, #0xfffffffffffffff0
   85c70:	cb090116 	sub	x22, x8, x9
   85c74:	910002df 	mov	sp, x22
   85c78:	aa1603e0 	mov	x0, x22
   85c7c:	aa1403e1 	mov	x1, x20
   85c80:	aa1503e2 	mov	x2, x21
   85c84:	940010c0 	bl	89f84 <memcpy>
   85c88:	f9400e68 	ldr	x8, [x19, #24]
   85c8c:	aa1603e0 	mov	x0, x22
   85c90:	d63f0100 	blr	x8
   85c94:	b40000b5 	cbz	x21, 85ca8 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17haf7fc11e233cabcbE+0x60>
   85c98:	f9400a62 	ldr	x2, [x19, #16]
   85c9c:	aa1403e0 	mov	x0, x20
   85ca0:	aa1503e1 	mov	x1, x21
   85ca4:	97fff035 	bl	81d78 <__rust_dealloc>
   85ca8:	d10083bf 	sub	sp, x29, #0x20
   85cac:	a9427bfd 	ldp	x29, x30, [sp, #32]
   85cb0:	a9414ff4 	ldp	x20, x19, [sp, #16]
   85cb4:	a8c357f6 	ldp	x22, x21, [sp], #48
   85cb8:	d65f03c0 	ret
   85cbc:	aa0003f5 	mov	x21, x0
   85cc0:	aa1403e0 	mov	x0, x20
   85cc4:	aa1303e1 	mov	x1, x19
   85cc8:	97ffffda 	bl	85c30 <_ZN5alloc5alloc8box_free17hb51b968a180a3c1fE.llvm.1267023549784938966>
   85ccc:	aa1503e0 	mov	x0, x21
   85cd0:	97fff808 	bl	83cf0 <_Unwind_Resume>
   85cd4:	d4200020 	brk	#0x1

0000000000085cd8 <_ZN13ruspiro_timer5sleep17h2196643d932a9abdE>:
   85cd8:	b0000028 	adrp	x8, 8a000 <memmove>
   85cdc:	b0000029 	adrp	x9, 8a000 <memmove>
   85ce0:	f9442508 	ldr	x8, [x8, #2120]
   85ce4:	f9442929 	ldr	x9, [x9, #2128]
   85ce8:	b940010a 	ldr	w10, [x8]
   85cec:	b940012b 	ldr	w11, [x9]
   85cf0:	b3607d6a 	bfi	x10, x11, #32, #32
   85cf4:	ab00014a 	adds	x10, x10, x0
   85cf8:	540000c0 	b.eq	85d10 <_ZN13ruspiro_timer5sleep17h2196643d932a9abdE+0x38>  // b.none
   85cfc:	b940010b 	ldr	w11, [x8]
   85d00:	b940012c 	ldr	w12, [x9]
   85d04:	b3607d8b 	bfi	x11, x12, #32, #32
   85d08:	eb0a017f 	cmp	x11, x10
   85d0c:	54ffff83 	b.cc	85cfc <_ZN13ruspiro_timer5sleep17h2196643d932a9abdE+0x24>  // b.lo, b.ul, b.last
   85d10:	d65f03c0 	ret
   85d14:	00000000 	.inst	0x00000000 ; undefined

0000000000085d18 <_ZN13ruspiro_timer11sleepcycles17hc35bace728ca53a8E>:
   85d18:	34000080 	cbz	w0, 85d28 <_ZN13ruspiro_timer11sleepcycles17hc35bace728ca53a8E+0x10>
   85d1c:	71000400 	subs	w0, w0, #0x1
   85d20:	d503201f 	nop
   85d24:	54ffffc1 	b.ne	85d1c <_ZN13ruspiro_timer11sleepcycles17hc35bace728ca53a8E+0x4>  // b.any
   85d28:	d65f03c0 	ret
   85d2c:	00000000 	.inst	0x00000000 ; undefined

0000000000085d30 <_ZN13ruspiro_timer3now17h886221fe36e27c96E>:
   85d30:	b0000028 	adrp	x8, 8a000 <memmove>
   85d34:	b0000029 	adrp	x9, 8a000 <memmove>
   85d38:	f9442508 	ldr	x8, [x8, #2120]
   85d3c:	f9442929 	ldr	x9, [x9, #2128]
   85d40:	b9400100 	ldr	w0, [x8]
   85d44:	b9400128 	ldr	w8, [x9]
   85d48:	b3607d00 	bfi	x0, x8, #32, #32
   85d4c:	d65f03c0 	ret

0000000000085d50 <_ZN13ruspiro_timer8schedule9Schedules3new17haabb1e685a21967dE>:
   85d50:	b0000049 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85d54:	f9448129 	ldr	x9, [x9, #2304]
   85d58:	a9017d1f 	stp	xzr, xzr, [x8, #16]
   85d5c:	a9027d1f 	stp	xzr, xzr, [x8, #32]
   85d60:	a900251f 	stp	xzr, x9, [x8]
   85d64:	d65f03c0 	ret

0000000000085d68 <_ZN13ruspiro_timer8schedule9Schedules6shrink17h1f1bfbc046d93201E>:
   85d68:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
   85d6c:	aa0003f3 	mov	x19, x0
   85d70:	91002000 	add	x0, x0, #0x8
   85d74:	9400007b 	bl	85f60 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E>
   85d78:	b0000048 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85d7c:	91008269 	add	x9, x19, #0x20
   85d80:	f9448108 	ldr	x8, [x8, #2304]
   85d84:	a9017e7f 	stp	xzr, xzr, [x19, #16]
   85d88:	f9000668 	str	x8, [x19, #8]
   85d8c:	9100a268 	add	x8, x19, #0x28
   85d90:	c89ffe7f 	stlr	xzr, [x19]
   85d94:	c89ffd3f 	stlr	xzr, [x9]
   85d98:	c89ffd1f 	stlr	xzr, [x8]
   85d9c:	a8c17bf3 	ldp	x19, x30, [sp], #16
   85da0:	d65f03c0 	ret
   85da4:	b0000048 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85da8:	f9000a7f 	str	xzr, [x19, #16]
   85dac:	f9448108 	ldr	x8, [x8, #2304]
   85db0:	f9000e7f 	str	xzr, [x19, #24]
   85db4:	f9000668 	str	x8, [x19, #8]
   85db8:	97fff7ce 	bl	83cf0 <_Unwind_Resume>
   85dbc:	d4200020 	brk	#0x1

0000000000085dc0 <__irq_handler__SystemTimer1>:
   85dc0:	b0000028 	adrp	x8, 8a000 <memmove>
   85dc4:	f9408108 	ldr	x8, [x8, #256]
   85dc8:	b9400109 	ldr	w9, [x8]
   85dcc:	37080049 	tbnz	w9, #1, 85dd4 <__irq_handler__SystemTimer1+0x14>
   85dd0:	d65f03c0 	ret
   85dd4:	b0000040 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   85dd8:	52800049 	mov	w9, #0x2                   	// #2
   85ddc:	f9443c00 	ldr	x0, [x0, #2168]
   85de0:	b9000109 	str	w9, [x8]
   85de4:	140000d1 	b	86128 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE>

0000000000085de8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606>:
   85de8:	f9402008 	ldr	x8, [x0, #64]
   85dec:	b4000208 	cbz	x8, 85e2c <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0x44>
   85df0:	d1000508 	sub	x8, x8, #0x1
   85df4:	f940040a 	ldr	x10, [x0, #8]
   85df8:	f9400c09 	ldr	x9, [x0, #24]
   85dfc:	f9002008 	str	x8, [x0, #64]
   85e00:	79401548 	ldrh	w8, [x10, #10]
   85e04:	eb08013f 	cmp	x9, x8
   85e08:	54000182 	b.cs	85e38 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0x50>  // b.hs, b.nlast
   85e0c:	8b090d48 	add	x8, x10, x9, lsl #3
   85e10:	8b09114a 	add	x10, x10, x9, lsl #4
   85e14:	91004108 	add	x8, x8, #0x10
   85e18:	9101a141 	add	x1, x10, #0x68
   85e1c:	9100052a 	add	x10, x9, #0x1
   85e20:	f9000c0a 	str	x10, [x0, #24]
   85e24:	aa0803e0 	mov	x0, x8
   85e28:	d65f03c0 	ret
   85e2c:	aa1f03e1 	mov	x1, xzr
   85e30:	aa0803e0 	mov	x0, x8
   85e34:	d65f03c0 	ret
   85e38:	f9400148 	ldr	x8, [x10]
   85e3c:	b4000128 	cbz	x8, 85e60 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0x78>
   85e40:	f940000c 	ldr	x12, [x0]
   85e44:	f9400809 	ldr	x9, [x0, #16]
   85e48:	7940114b 	ldrh	w11, [x10, #8]
   85e4c:	9100058a 	add	x10, x12, #0x1
   85e50:	7940150c 	ldrh	w12, [x8, #10]
   85e54:	eb0c017f 	cmp	x11, x12
   85e58:	54000202 	b.cs	85e98 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xb0>  // b.hs, b.nlast
   85e5c:	14000017 	b	85eb8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xd0>
   85e60:	aa1f03e9 	mov	x9, xzr
   85e64:	aa1f03eb 	mov	x11, xzr
   85e68:	aa1f03ea 	mov	x10, xzr
   85e6c:	7940150c 	ldrh	w12, [x8, #10]
   85e70:	eb0c017f 	cmp	x11, x12
   85e74:	54000122 	b.cs	85e98 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xb0>  // b.hs, b.nlast
   85e78:	14000010 	b	85eb8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xd0>
   85e7c:	aa1f03eb 	mov	x11, xzr
   85e80:	aa1f03e9 	mov	x9, xzr
   85e84:	aa1f03e8 	mov	x8, xzr
   85e88:	aa1f03ea 	mov	x10, xzr
   85e8c:	7940150c 	ldrh	w12, [x8, #10]
   85e90:	eb0c017f 	cmp	x11, x12
   85e94:	54000123 	b.cc	85eb8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xd0>  // b.lo, b.ul, b.last
   85e98:	f940010c 	ldr	x12, [x8]
   85e9c:	b4ffff0c 	cbz	x12, 85e7c <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0x94>
   85ea0:	7940110b 	ldrh	w11, [x8, #8]
   85ea4:	9100054a 	add	x10, x10, #0x1
   85ea8:	aa0c03e8 	mov	x8, x12
   85eac:	7940150c 	ldrh	w12, [x8, #10]
   85eb0:	eb0c017f 	cmp	x11, x12
   85eb4:	54ffff22 	b.cs	85e98 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xb0>  // b.hs, b.nlast
   85eb8:	8b0b0d0c 	add	x12, x8, x11, lsl #3
   85ebc:	8b0b110d 	add	x13, x8, x11, lsl #4
   85ec0:	91004188 	add	x8, x12, #0x10
   85ec4:	9101a1a1 	add	x1, x13, #0x68
   85ec8:	f940918b 	ldr	x11, [x12, #288]
   85ecc:	f100054a 	subs	x10, x10, #0x1
   85ed0:	54000080 	b.eq	85ee0 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xf8>  // b.none
   85ed4:	f9408d6b 	ldr	x11, [x11, #280]
   85ed8:	f100054a 	subs	x10, x10, #0x1
   85edc:	54ffffc1 	b.ne	85ed4 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606+0xec>  // b.any
   85ee0:	aa1f03ea 	mov	x10, xzr
   85ee4:	a9002c1f 	stp	xzr, x11, [x0]
   85ee8:	a9012809 	stp	x9, x10, [x0, #16]
   85eec:	aa0803e0 	mov	x0, x8
   85ef0:	d65f03c0 	ret
   85ef4:	00000000 	.inst	0x00000000 ; undefined

0000000000085ef8 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$4iter17hea2d6d5dd83487f8E.llvm.1734691536706247606>:
   85ef8:	a9402828 	ldp	x8, x10, [x1]
   85efc:	aa0803e9 	mov	x9, x8
   85f00:	b400014a 	cbz	x10, 85f28 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$4iter17hea2d6d5dd83487f8E.llvm.1734691536706247606+0x30>
   85f04:	aa0a03eb 	mov	x11, x10
   85f08:	f9408d29 	ldr	x9, [x9, #280]
   85f0c:	f100056b 	subs	x11, x11, #0x1
   85f10:	54ffffc1 	b.ne	85f08 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$4iter17hea2d6d5dd83487f8E.llvm.1734691536706247606+0x10>  // b.any
   85f14:	7940150b 	ldrh	w11, [x8, #10]
   85f18:	f100054a 	subs	x10, x10, #0x1
   85f1c:	8b0b0d08 	add	x8, x8, x11, lsl #3
   85f20:	f9408d08 	ldr	x8, [x8, #280]
   85f24:	54ffff81 	b.ne	85f14 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$4iter17hea2d6d5dd83487f8E.llvm.1734691536706247606+0x1c>  // b.any
   85f28:	7940150a 	ldrh	w10, [x8, #10]
   85f2c:	f940082b 	ldr	x11, [x1, #16]
   85f30:	a900241f 	stp	xzr, x9, [x0]
   85f34:	a9017c01 	stp	x1, xzr, [x0, #16]
   85f38:	a902201f 	stp	xzr, x8, [x0, #32]
   85f3c:	a9032801 	stp	x1, x10, [x0, #48]
   85f40:	f900200b 	str	x11, [x0, #64]
   85f44:	d65f03c0 	ret

0000000000085f48 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E>:
   85f48:	aa0103e8 	mov	x8, x1
   85f4c:	f9400421 	ldr	x1, [x1, #8]
   85f50:	b4000061 	cbz	x1, 85f5c <_ZN5alloc5alloc8box_free17h65e1c7f235732191E+0x14>
   85f54:	f9400902 	ldr	x2, [x8, #16]
   85f58:	17ffef88 	b	81d78 <__rust_dealloc>
   85f5c:	d65f03c0 	ret

0000000000085f60 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E>:
   85f60:	a9bc63f9 	stp	x25, x24, [sp, #-64]!
   85f64:	a9015bf7 	stp	x23, x22, [sp, #16]
   85f68:	a90253f5 	stp	x21, x20, [sp, #32]
   85f6c:	a9037bf3 	stp	x19, x30, [sp, #48]
   85f70:	a9402015 	ldp	x21, x8, [x0]
   85f74:	f9400818 	ldr	x24, [x0, #16]
   85f78:	b4000088 	cbz	x8, 85f88 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x28>
   85f7c:	f9408eb5 	ldr	x21, [x21, #280]
   85f80:	f1000508 	subs	x8, x8, #0x1
   85f84:	54ffffc1 	b.ne	85f7c <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x1c>  // b.any
   85f88:	b4000898 	cbz	x24, 86098 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x138>
   85f8c:	aa1f03f9 	mov	x25, xzr
   85f90:	52802313 	mov	w19, #0x118                 	// #280
   85f94:	52802f14 	mov	w20, #0x178                 	// #376
   85f98:	794016a8 	ldrh	w8, [x21, #10]
   85f9c:	eb08033f 	cmp	x25, x8
   85fa0:	54000182 	b.cs	85fd0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x70>  // b.hs, b.nlast
   85fa4:	14000006 	b	85fbc <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x5c>
   85fa8:	d1000718 	sub	x24, x24, #0x1
   85fac:	b4000778 	cbz	x24, 86098 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x138>
   85fb0:	794016a8 	ldrh	w8, [x21, #10]
   85fb4:	eb08033f 	cmp	x25, x8
   85fb8:	540000c2 	b.cs	85fd0 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x70>  // b.hs, b.nlast
   85fbc:	8b1912a8 	add	x8, x21, x25, lsl #4
   85fc0:	91000739 	add	x25, x25, #0x1
   85fc4:	a946dd16 	ldp	x22, x23, [x8, #104]
   85fc8:	b5000576 	cbnz	x22, 86074 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x114>
   85fcc:	17fffff7 	b	85fa8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x48>
   85fd0:	f94002b6 	ldr	x22, [x21]
   85fd4:	b4000096 	cbz	x22, 85fe4 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x84>
   85fd8:	794012b7 	ldrh	w23, [x21, #8]
   85fdc:	52800039 	mov	w25, #0x1                   	// #1
   85fe0:	14000003 	b	85fec <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x8c>
   85fe4:	aa1f03f7 	mov	x23, xzr
   85fe8:	aa1f03f9 	mov	x25, xzr
   85fec:	aa1503e0 	mov	x0, x21
   85ff0:	aa1303e1 	mov	x1, x19
   85ff4:	52800102 	mov	w2, #0x8                   	// #8
   85ff8:	97ffef60 	bl	81d78 <__rust_dealloc>
   85ffc:	794016c8 	ldrh	w8, [x22, #10]
   86000:	eb0802ff 	cmp	x23, x8
   86004:	54000182 	b.cs	86034 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0xd4>  // b.hs, b.nlast
   86008:	14000010 	b	86048 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0xe8>
   8600c:	794012d7 	ldrh	w23, [x22, #8]
   86010:	91000739 	add	x25, x25, #0x1
   86014:	aa1603e0 	mov	x0, x22
   86018:	aa1403e1 	mov	x1, x20
   8601c:	52800102 	mov	w2, #0x8                   	// #8
   86020:	97ffef56 	bl	81d78 <__rust_dealloc>
   86024:	794016a8 	ldrh	w8, [x21, #10]
   86028:	aa1503f6 	mov	x22, x21
   8602c:	eb0802ff 	cmp	x23, x8
   86030:	540000c3 	b.cc	86048 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0xe8>  // b.lo, b.ul, b.last
   86034:	f94002d5 	ldr	x21, [x22]
   86038:	b5fffeb5 	cbnz	x21, 8600c <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0xac>
   8603c:	aa1f03f7 	mov	x23, xzr
   86040:	aa1f03f9 	mov	x25, xzr
   86044:	17fffff4 	b	86014 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0xb4>
   86048:	8b1712c8 	add	x8, x22, x23, lsl #4
   8604c:	8b170ec9 	add	x9, x22, x23, lsl #3
   86050:	a946dd16 	ldp	x22, x23, [x8, #104]
   86054:	f9409135 	ldr	x21, [x9, #288]
   86058:	f1000728 	subs	x8, x25, #0x1
   8605c:	54000080 	b.eq	8606c <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x10c>  // b.none
   86060:	f9408eb5 	ldr	x21, [x21, #280]
   86064:	f1000508 	subs	x8, x8, #0x1
   86068:	54ffffc1 	b.ne	86060 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x100>  // b.any
   8606c:	aa1f03f9 	mov	x25, xzr
   86070:	b4fff9d6 	cbz	x22, 85fa8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x48>
   86074:	f94002e8 	ldr	x8, [x23]
   86078:	aa1603e0 	mov	x0, x22
   8607c:	d63f0100 	blr	x8
   86080:	f94006e1 	ldr	x1, [x23, #8]
   86084:	b4fff921 	cbz	x1, 85fa8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x48>
   86088:	f9400ae2 	ldr	x2, [x23, #16]
   8608c:	aa1603e0 	mov	x0, x22
   86090:	97ffef3a 	bl	81d78 <__rust_dealloc>
   86094:	17ffffc5 	b	85fa8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x48>
   86098:	90000048 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   8609c:	f9448108 	ldr	x8, [x8, #2304]
   860a0:	eb0802bf 	cmp	x21, x8
   860a4:	540002a0 	b.eq	860f8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x198>  // b.none
   860a8:	f94002b4 	ldr	x20, [x21]
   860ac:	52802301 	mov	w1, #0x118                 	// #280
   860b0:	aa1503e0 	mov	x0, x21
   860b4:	52800102 	mov	w2, #0x8                   	// #8
   860b8:	97ffef30 	bl	81d78 <__rust_dealloc>
   860bc:	b40001f4 	cbz	x20, 860f8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x198>
   860c0:	f9400293 	ldr	x19, [x20]
   860c4:	52802f01 	mov	w1, #0x178                 	// #376
   860c8:	aa1403e0 	mov	x0, x20
   860cc:	52800102 	mov	w2, #0x8                   	// #8
   860d0:	97ffef2a 	bl	81d78 <__rust_dealloc>
   860d4:	b4000133 	cbz	x19, 860f8 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x198>
   860d8:	52802f14 	mov	w20, #0x178                 	// #376
   860dc:	f9400275 	ldr	x21, [x19]
   860e0:	aa1303e0 	mov	x0, x19
   860e4:	aa1403e1 	mov	x1, x20
   860e8:	52800102 	mov	w2, #0x8                   	// #8
   860ec:	97ffef23 	bl	81d78 <__rust_dealloc>
   860f0:	aa1503f3 	mov	x19, x21
   860f4:	b5ffff55 	cbnz	x21, 860dc <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0x17c>
   860f8:	a9437bf3 	ldp	x19, x30, [sp, #48]
   860fc:	a94253f5 	ldp	x21, x20, [sp, #32]
   86100:	a9415bf7 	ldp	x23, x22, [sp, #16]
   86104:	a8c463f9 	ldp	x25, x24, [sp], #64
   86108:	d65f03c0 	ret
   8610c:	aa0003f3 	mov	x19, x0
   86110:	aa1603e0 	mov	x0, x22
   86114:	aa1703e1 	mov	x1, x23
   86118:	97ffff8c 	bl	85f48 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E>
   8611c:	aa1303e0 	mov	x0, x19
   86120:	97fff6f4 	bl	83cf0 <_Unwind_Resume>
   86124:	d4200020 	brk	#0x1

0000000000086128 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE>:
   86128:	d10443ff 	sub	sp, sp, #0x110
   8612c:	a90e5bfc 	stp	x28, x22, [sp, #224]
   86130:	a90f53f5 	stp	x21, x20, [sp, #240]
   86134:	a9107bf3 	stp	x19, x30, [sp, #256]
   86138:	aa0003f5 	mov	x21, x0
   8613c:	f8418ea8 	ldr	x8, [x21, #24]!
   86140:	b4000a28 	cbz	x8, 86284 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x15c>
   86144:	aa0003f3 	mov	x19, x0
   86148:	9100c008 	add	x8, x0, #0x30
   8614c:	c85ffd14 	ldaxr	x20, [x8]
   86150:	91000689 	add	x9, x20, #0x1
   86154:	c80afd09 	stlxr	w10, x9, [x8]
   86158:	35ffffaa 	cbnz	w10, 8614c <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x24>
   8615c:	f9400aa8 	ldr	x8, [x21, #16]
   86160:	eb08029f 	cmp	x20, x8
   86164:	54000902 	b.cs	86284 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x15c>  // b.hs, b.nlast
   86168:	910123e0 	add	x0, sp, #0x48
   8616c:	aa1503e1 	mov	x1, x21
   86170:	97ffff62 	bl	85ef8 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$4iter17hea2d6d5dd83487f8E.llvm.1734691536706247606>
   86174:	52800902 	mov	w2, #0x48                  	// #72
   86178:	910243e0 	add	x0, sp, #0x90
   8617c:	910123e1 	add	x1, sp, #0x48
   86180:	94000f81 	bl	89f84 <memcpy>
   86184:	910063e8 	add	x8, sp, #0x18
   86188:	910243e0 	add	x0, sp, #0x90
   8618c:	940000ff 	bl	86588 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E>
   86190:	f94017e2 	ldr	x2, [sp, #40]
   86194:	eb14005f 	cmp	x2, x20
   86198:	54000809 	b.ls	86298 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x170>  // b.plast
   8619c:	f9400fe8 	ldr	x8, [sp, #24]
   861a0:	f8747908 	ldr	x8, [x8, x20, lsl #3]
   861a4:	f9400509 	ldr	x9, [x8, #8]
   861a8:	f90007e9 	str	x9, [sp, #8]
   861ac:	f9400109 	ldr	x9, [x8]
   861b0:	f90003e9 	str	x9, [sp]
   861b4:	3dc003e0 	ldr	q0, [sp]
   861b8:	a9007d1f 	stp	xzr, xzr, [x8]
   861bc:	9e660000 	fmov	x0, d0
   861c0:	3d8027e0 	str	q0, [sp, #144]
   861c4:	b4000740 	cbz	x0, 862ac <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x184>
   861c8:	4e183c01 	mov	x1, v0.d[1]
   861cc:	94000163 	bl	86758 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17h783c3d84f3049961E>
   861d0:	f9400aa8 	ldr	x8, [x21, #16]
   861d4:	91000696 	add	x22, x20, #0x1
   861d8:	eb16011f 	cmp	x8, x22
   861dc:	54000449 	b.ls	86264 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x13c>  // b.plast
   861e0:	910243e0 	add	x0, sp, #0x90
   861e4:	aa1503e1 	mov	x1, x21
   861e8:	97ffff44 	bl	85ef8 <_ZN5alloc11collections5btree3map21BTreeMap$LT$K$C$V$GT$4iter17hea2d6d5dd83487f8E.llvm.1734691536706247606>
   861ec:	52800915 	mov	w21, #0x48                  	// #72
   861f0:	910123e0 	add	x0, sp, #0x48
   861f4:	910243e1 	add	x1, sp, #0x90
   861f8:	aa1503e2 	mov	x2, x21
   861fc:	94000f62 	bl	89f84 <memcpy>
   86200:	910243e0 	add	x0, sp, #0x90
   86204:	910123e1 	add	x1, sp, #0x48
   86208:	aa1503e2 	mov	x2, x21
   8620c:	94000f5e 	bl	89f84 <memcpy>
   86210:	9100c3e8 	add	x8, sp, #0x30
   86214:	910243e0 	add	x0, sp, #0x90
   86218:	9400006e 	bl	863d0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE>
   8621c:	f94023e2 	ldr	x2, [sp, #64]
   86220:	eb16005f 	cmp	x2, x22
   86224:	54000529 	b.ls	862c8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x1a0>  // b.plast
   86228:	f9401be8 	ldr	x8, [sp, #48]
   8622c:	90000029 	adrp	x9, 8a000 <memmove>
   86230:	f9408529 	ldr	x9, [x9, #264]
   86234:	f8767908 	ldr	x8, [x8, x22, lsl #3]
   86238:	f940010a 	ldr	x10, [x8]
   8623c:	b900012a 	str	w10, [x9]
   86240:	91004269 	add	x9, x19, #0x10
   86244:	f9400108 	ldr	x8, [x8]
   86248:	c89ffd28 	stlr	x8, [x9]
   8624c:	f9401fe8 	ldr	x8, [sp, #56]
   86250:	b40000a8 	cbz	x8, 86264 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x13c>
   86254:	f9401be0 	ldr	x0, [sp, #48]
   86258:	52800102 	mov	w2, #0x8                   	// #8
   8625c:	d37df101 	lsl	x1, x8, #3
   86260:	97ffeec6 	bl	81d78 <__rust_dealloc>
   86264:	9100e268 	add	x8, x19, #0x38
   86268:	c89ffd14 	stlr	x20, [x8]
   8626c:	f94013e8 	ldr	x8, [sp, #32]
   86270:	b40000a8 	cbz	x8, 86284 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x15c>
   86274:	f9400fe0 	ldr	x0, [sp, #24]
   86278:	52800102 	mov	w2, #0x8                   	// #8
   8627c:	d37df101 	lsl	x1, x8, #3
   86280:	97ffeebe 	bl	81d78 <__rust_dealloc>
   86284:	a9507bf3 	ldp	x19, x30, [sp, #256]
   86288:	a94f53f5 	ldp	x21, x20, [sp, #240]
   8628c:	a94e5bfc 	ldp	x28, x22, [sp, #224]
   86290:	910443ff 	add	sp, sp, #0x110
   86294:	d65f03c0 	ret
   86298:	f0000020 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   8629c:	aa1403e1 	mov	x1, x20
   862a0:	91324000 	add	x0, x0, #0xc90
   862a4:	94000ed2 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   862a8:	1400000c 	b	862d8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x1b0>
   862ac:	90000020 	adrp	x0, 8a000 <memmove>
   862b0:	f0000022 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   862b4:	91232000 	add	x0, x0, #0x8c8
   862b8:	52800561 	mov	w1, #0x2b                  	// #43
   862bc:	9131e042 	add	x2, x2, #0xc78
   862c0:	94000ebe 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   862c4:	14000005 	b	862d8 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x1b0>
   862c8:	f0000020 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   862cc:	aa1603e1 	mov	x1, x22
   862d0:	91324000 	add	x0, x0, #0xc90
   862d4:	94000ec6 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   862d8:	d4200020 	brk	#0x1
   862dc:	aa0003f3 	mov	x19, x0
   862e0:	9100c3e0 	add	x0, sp, #0x30
   862e4:	9400000d 	bl	86318 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E>
   862e8:	14000006 	b	86300 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x1d8>
   862ec:	aa0003f3 	mov	x19, x0
   862f0:	910243e0 	add	x0, sp, #0x90
   862f4:	94000011 	bl	86338 <_ZN4core3ptr18real_drop_in_place17hc05489121c63229dE>
   862f8:	14000002 	b	86300 <_ZN17ruspiro_singleton18Singleton$LT$T$GT$7use_for17h5cbca72a0fa6df0fE+0x1d8>
   862fc:	aa0003f3 	mov	x19, x0
   86300:	910063e0 	add	x0, sp, #0x18
   86304:	94000005 	bl	86318 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E>
   86308:	aa1303e0 	mov	x0, x19
   8630c:	97fff679 	bl	83cf0 <_Unwind_Resume>
   86310:	d4200020 	brk	#0x1
   86314:	00000000 	.inst	0x00000000 ; undefined

0000000000086318 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E>:
   86318:	f9400408 	ldr	x8, [x0, #8]
   8631c:	b40000a8 	cbz	x8, 86330 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E+0x18>
   86320:	f9400000 	ldr	x0, [x0]
   86324:	52800102 	mov	w2, #0x8                   	// #8
   86328:	d37df101 	lsl	x1, x8, #3
   8632c:	17ffee93 	b	81d78 <__rust_dealloc>
   86330:	d65f03c0 	ret
   86334:	00000000 	.inst	0x00000000 ; undefined

0000000000086338 <_ZN4core3ptr18real_drop_in_place17hc05489121c63229dE>:
   86338:	a9bf7bf3 	stp	x19, x30, [sp, #-16]!
   8633c:	aa0003f3 	mov	x19, x0
   86340:	f9400000 	ldr	x0, [x0]
   86344:	b4000160 	cbz	x0, 86370 <_ZN4core3ptr18real_drop_in_place17hc05489121c63229dE+0x38>
   86348:	f9400668 	ldr	x8, [x19, #8]
   8634c:	f9400108 	ldr	x8, [x8]
   86350:	d63f0100 	blr	x8
   86354:	f9400668 	ldr	x8, [x19, #8]
   86358:	f9400501 	ldr	x1, [x8, #8]
   8635c:	b40000a1 	cbz	x1, 86370 <_ZN4core3ptr18real_drop_in_place17hc05489121c63229dE+0x38>
   86360:	f9400260 	ldr	x0, [x19]
   86364:	f9400902 	ldr	x2, [x8, #16]
   86368:	a8c17bf3 	ldp	x19, x30, [sp], #16
   8636c:	17ffee83 	b	81d78 <__rust_dealloc>
   86370:	a8c17bf3 	ldp	x19, x30, [sp], #16
   86374:	d65f03c0 	ret
   86378:	a9400668 	ldp	x8, x1, [x19]
   8637c:	aa0003f3 	mov	x19, x0
   86380:	aa0803e0 	mov	x0, x8
   86384:	94000005 	bl	86398 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E>
   86388:	aa1303e0 	mov	x0, x19
   8638c:	97fff659 	bl	83cf0 <_Unwind_Resume>
   86390:	d4200020 	brk	#0x1
   86394:	00000000 	.inst	0x00000000 ; undefined

0000000000086398 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E>:
   86398:	aa0103e8 	mov	x8, x1
   8639c:	f9400421 	ldr	x1, [x1, #8]
   863a0:	b4000061 	cbz	x1, 863ac <_ZN5alloc5alloc8box_free17h65e1c7f235732191E+0x14>
   863a4:	f9400902 	ldr	x2, [x8, #16]
   863a8:	17ffee74 	b	81d78 <__rust_dealloc>
   863ac:	d65f03c0 	ret

00000000000863b0 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E>:
   863b0:	f9400408 	ldr	x8, [x0, #8]
   863b4:	b40000a8 	cbz	x8, 863c8 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E+0x18>
   863b8:	f9400000 	ldr	x0, [x0]
   863bc:	52800102 	mov	w2, #0x8                   	// #8
   863c0:	d37df101 	lsl	x1, x8, #3
   863c4:	17ffee6d 	b	81d78 <__rust_dealloc>
   863c8:	d65f03c0 	ret
   863cc:	00000000 	.inst	0x00000000 ; undefined

00000000000863d0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE>:
   863d0:	d10283ff 	sub	sp, sp, #0xa0
   863d4:	a90663f9 	stp	x25, x24, [sp, #96]
   863d8:	a9075bf7 	stp	x23, x22, [sp, #112]
   863dc:	a90853f5 	stp	x21, x20, [sp, #128]
   863e0:	a9097bf3 	stp	x19, x30, [sp, #144]
   863e4:	aa0003f5 	mov	x21, x0
   863e8:	aa0803f3 	mov	x19, x8
   863ec:	97fffe7f 	bl	85de8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606>
   863f0:	aa0003f6 	mov	x22, x0
   863f4:	b40001c0 	cbz	x0, 8642c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x5c>
   863f8:	f94022a8 	ldr	x8, [x21, #64]
   863fc:	b1000508 	adds	x8, x8, #0x1
   86400:	da9f3118 	csinv	x24, x8, xzr, cc  // cc = lo, ul, last
   86404:	d37dff08 	lsr	x8, x24, #61
   86408:	b5000988 	cbnz	x8, 86538 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x168>
   8640c:	d37df317 	lsl	x23, x24, #3
   86410:	b4000177 	cbz	x23, 8643c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x6c>
   86414:	aa1703e0 	mov	x0, x23
   86418:	52800101 	mov	w1, #0x8                   	// #8
   8641c:	97ffee53 	bl	81d68 <__rust_alloc>
   86420:	b4000900 	cbz	x0, 86540 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x170>
   86424:	aa0003f4 	mov	x20, x0
   86428:	14000006 	b	86440 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x70>
   8642c:	52800108 	mov	w8, #0x8                   	// #8
   86430:	f9000a7f 	str	xzr, [x19, #16]
   86434:	a9007e68 	stp	x8, xzr, [x19]
   86438:	14000033 	b	86504 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x134>
   8643c:	52800114 	mov	w20, #0x8                   	// #8
   86440:	52800037 	mov	w23, #0x1                   	// #1
   86444:	52800902 	mov	w2, #0x48                  	// #72
   86448:	910063e0 	add	x0, sp, #0x18
   8644c:	aa1503e1 	mov	x1, x21
   86450:	f9000296 	str	x22, [x20]
   86454:	a90063f4 	stp	x20, x24, [sp]
   86458:	f9000bf7 	str	x23, [sp, #16]
   8645c:	94000eca 	bl	89f84 <memcpy>
   86460:	14000007 	b	8647c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0xac>
   86464:	aa1603e0 	mov	x0, x22
   86468:	52800101 	mov	w1, #0x8                   	// #8
   8646c:	97ffee3f 	bl	81d68 <__rust_alloc>
   86470:	aa0003f4 	mov	x20, x0
   86474:	b5000360 	cbnz	x0, 864e0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x110>
   86478:	1400002c 	b	86528 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x158>
   8647c:	910063e0 	add	x0, sp, #0x18
   86480:	97fffe5a 	bl	85de8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606>
   86484:	aa0003f5 	mov	x21, x0
   86488:	b4000360 	cbz	x0, 864f4 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x124>
   8648c:	eb1802ff 	cmp	x23, x24
   86490:	540002c1 	b.ne	864e8 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x118>  // b.any
   86494:	f9402fe8 	ldr	x8, [sp, #88]
   86498:	b1000508 	adds	x8, x8, #0x1
   8649c:	da9f3108 	csinv	x8, x8, xzr, cc  // cc = lo, ul, last
   864a0:	ab080308 	adds	x8, x24, x8
   864a4:	540003c2 	b.cs	8651c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x14c>  // b.hs, b.nlast
   864a8:	d37ffb09 	lsl	x9, x24, #1
   864ac:	eb08013f 	cmp	x9, x8
   864b0:	9a888139 	csel	x25, x9, x8, hi  // hi = pmore
   864b4:	eb59f7ff 	cmp	xzr, x25, lsr #61
   864b8:	54000321 	b.ne	8651c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x14c>  // b.any
   864bc:	d37df336 	lsl	x22, x25, #3
   864c0:	b4fffd38 	cbz	x24, 86464 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x94>
   864c4:	aa1403e0 	mov	x0, x20
   864c8:	52800102 	mov	w2, #0x8                   	// #8
   864cc:	aa1603e3 	mov	x3, x22
   864d0:	d37df301 	lsl	x1, x24, #3
   864d4:	97ffee2d 	bl	81d88 <__rust_realloc>
   864d8:	aa0003f4 	mov	x20, x0
   864dc:	b4000260 	cbz	x0, 86528 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x158>
   864e0:	aa1903f8 	mov	x24, x25
   864e4:	f90003f4 	str	x20, [sp]
   864e8:	f8377a95 	str	x21, [x20, x23, lsl #3]
   864ec:	910006f7 	add	x23, x23, #0x1
   864f0:	17ffffe3 	b	8647c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0xac>
   864f4:	f94003e8 	ldr	x8, [sp]
   864f8:	a900dff8 	stp	x24, x23, [sp, #8]
   864fc:	f9000a77 	str	x23, [x19, #16]
   86500:	a9006268 	stp	x8, x24, [x19]
   86504:	a9497bf3 	ldp	x19, x30, [sp, #144]
   86508:	a94853f5 	ldp	x21, x20, [sp, #128]
   8650c:	a9475bf7 	ldp	x23, x22, [sp, #112]
   86510:	a94663f9 	ldp	x25, x24, [sp, #96]
   86514:	910283ff 	add	sp, sp, #0xa0
   86518:	d65f03c0 	ret
   8651c:	a900e3f8 	stp	x24, x24, [sp, #8]
   86520:	940003b0 	bl	873e0 <_ZN5alloc7raw_vec17capacity_overflow17hca041f9acaf07fddE>
   86524:	d4200020 	brk	#0x1
   86528:	aa1603e0 	mov	x0, x22
   8652c:	52800101 	mov	w1, #0x8                   	// #8
   86530:	940003b4 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   86534:	d4200020 	brk	#0x1
   86538:	940000ac 	bl	867e8 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h2963793903427e7cE.llvm.1121173358901391528>
   8653c:	17fffffa 	b	86524 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x154>
   86540:	aa1703e0 	mov	x0, x23
   86544:	52800101 	mov	w1, #0x8                   	// #8
   86548:	940003ae 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   8654c:	d4200020 	brk	#0x1
   86550:	14000003 	b	8655c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x18c>
   86554:	aa0003f3 	mov	x19, x0
   86558:	14000007 	b	86574 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17hd319432cfc4315afE+0x1a4>
   8655c:	aa0003f3 	mov	x19, x0
   86560:	aa1303e0 	mov	x0, x19
   86564:	97fff5e3 	bl	83cf0 <_Unwind_Resume>
   86568:	d4200020 	brk	#0x1
   8656c:	aa0003f3 	mov	x19, x0
   86570:	a900dff8 	stp	x24, x23, [sp, #8]
   86574:	910003e0 	mov	x0, sp
   86578:	97ffff8e 	bl	863b0 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E>
   8657c:	aa1303e0 	mov	x0, x19
   86580:	97fff5dc 	bl	83cf0 <_Unwind_Resume>
   86584:	d4200020 	brk	#0x1

0000000000086588 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E>:
   86588:	d10283ff 	sub	sp, sp, #0xa0
   8658c:	a90663f9 	stp	x25, x24, [sp, #96]
   86590:	a9075bf7 	stp	x23, x22, [sp, #112]
   86594:	a90853f5 	stp	x21, x20, [sp, #128]
   86598:	a9097bf3 	stp	x19, x30, [sp, #144]
   8659c:	aa0003f5 	mov	x21, x0
   865a0:	aa0803f3 	mov	x19, x8
   865a4:	97fffe11 	bl	85de8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606>
   865a8:	b40001e0 	cbz	x0, 865e4 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x5c>
   865ac:	f94022a8 	ldr	x8, [x21, #64]
   865b0:	b1000508 	adds	x8, x8, #0x1
   865b4:	da9f3118 	csinv	x24, x8, xzr, cc  // cc = lo, ul, last
   865b8:	d37dff08 	lsr	x8, x24, #61
   865bc:	b50009a8 	cbnz	x8, 866f0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x168>
   865c0:	aa0103f6 	mov	x22, x1
   865c4:	d37df317 	lsl	x23, x24, #3
   865c8:	b4000177 	cbz	x23, 865f4 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x6c>
   865cc:	aa1703e0 	mov	x0, x23
   865d0:	52800101 	mov	w1, #0x8                   	// #8
   865d4:	97ffede5 	bl	81d68 <__rust_alloc>
   865d8:	b4000900 	cbz	x0, 866f8 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x170>
   865dc:	aa0003f4 	mov	x20, x0
   865e0:	14000006 	b	865f8 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x70>
   865e4:	52800108 	mov	w8, #0x8                   	// #8
   865e8:	f9000a7f 	str	xzr, [x19, #16]
   865ec:	a9007e68 	stp	x8, xzr, [x19]
   865f0:	14000033 	b	866bc <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x134>
   865f4:	52800114 	mov	w20, #0x8                   	// #8
   865f8:	52800037 	mov	w23, #0x1                   	// #1
   865fc:	52800902 	mov	w2, #0x48                  	// #72
   86600:	910063e0 	add	x0, sp, #0x18
   86604:	aa1503e1 	mov	x1, x21
   86608:	f9000296 	str	x22, [x20]
   8660c:	a90063f4 	stp	x20, x24, [sp]
   86610:	f9000bf7 	str	x23, [sp, #16]
   86614:	94000e5c 	bl	89f84 <memcpy>
   86618:	14000007 	b	86634 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0xac>
   8661c:	aa1603e0 	mov	x0, x22
   86620:	52800101 	mov	w1, #0x8                   	// #8
   86624:	97ffedd1 	bl	81d68 <__rust_alloc>
   86628:	aa0003f4 	mov	x20, x0
   8662c:	b5000360 	cbnz	x0, 86698 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x110>
   86630:	1400002c 	b	866e0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x158>
   86634:	910063e0 	add	x0, sp, #0x18
   86638:	97fffdec 	bl	85de8 <_ZN108_$LT$alloc..collections..btree..map..Iter$LT$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h994e1d62c90ac780E.llvm.1734691536706247606>
   8663c:	b4000380 	cbz	x0, 866ac <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x124>
   86640:	aa0103f5 	mov	x21, x1
   86644:	eb1802ff 	cmp	x23, x24
   86648:	540002c1 	b.ne	866a0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x118>  // b.any
   8664c:	f9402fe8 	ldr	x8, [sp, #88]
   86650:	b1000508 	adds	x8, x8, #0x1
   86654:	da9f3108 	csinv	x8, x8, xzr, cc  // cc = lo, ul, last
   86658:	ab080308 	adds	x8, x24, x8
   8665c:	540003c2 	b.cs	866d4 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x14c>  // b.hs, b.nlast
   86660:	d37ffb09 	lsl	x9, x24, #1
   86664:	eb08013f 	cmp	x9, x8
   86668:	9a888139 	csel	x25, x9, x8, hi  // hi = pmore
   8666c:	eb59f7ff 	cmp	xzr, x25, lsr #61
   86670:	54000321 	b.ne	866d4 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x14c>  // b.any
   86674:	d37df336 	lsl	x22, x25, #3
   86678:	b4fffd38 	cbz	x24, 8661c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x94>
   8667c:	aa1403e0 	mov	x0, x20
   86680:	52800102 	mov	w2, #0x8                   	// #8
   86684:	aa1603e3 	mov	x3, x22
   86688:	d37df301 	lsl	x1, x24, #3
   8668c:	97ffedbf 	bl	81d88 <__rust_realloc>
   86690:	aa0003f4 	mov	x20, x0
   86694:	b4000260 	cbz	x0, 866e0 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x158>
   86698:	aa1903f8 	mov	x24, x25
   8669c:	f90003f4 	str	x20, [sp]
   866a0:	f8377a95 	str	x21, [x20, x23, lsl #3]
   866a4:	910006f7 	add	x23, x23, #0x1
   866a8:	17ffffe3 	b	86634 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0xac>
   866ac:	f94003e8 	ldr	x8, [sp]
   866b0:	a900dff8 	stp	x24, x23, [sp, #8]
   866b4:	f9000a77 	str	x23, [x19, #16]
   866b8:	a9006268 	stp	x8, x24, [x19]
   866bc:	a9497bf3 	ldp	x19, x30, [sp, #144]
   866c0:	a94853f5 	ldp	x21, x20, [sp, #128]
   866c4:	a9475bf7 	ldp	x23, x22, [sp, #112]
   866c8:	a94663f9 	ldp	x25, x24, [sp, #96]
   866cc:	910283ff 	add	sp, sp, #0xa0
   866d0:	d65f03c0 	ret
   866d4:	a900e3f8 	stp	x24, x24, [sp, #8]
   866d8:	94000342 	bl	873e0 <_ZN5alloc7raw_vec17capacity_overflow17hca041f9acaf07fddE>
   866dc:	d4200020 	brk	#0x1
   866e0:	aa1603e0 	mov	x0, x22
   866e4:	52800101 	mov	w1, #0x8                   	// #8
   866e8:	94000346 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   866ec:	d4200020 	brk	#0x1
   866f0:	9400003e 	bl	867e8 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h2963793903427e7cE.llvm.1121173358901391528>
   866f4:	17fffffa 	b	866dc <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x154>
   866f8:	aa1703e0 	mov	x0, x23
   866fc:	52800101 	mov	w1, #0x8                   	// #8
   86700:	94000340 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   86704:	d4200020 	brk	#0x1
   86708:	14000003 	b	86714 <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x18c>
   8670c:	aa0003f3 	mov	x19, x0
   86710:	14000007 	b	8672c <_ZN80_$LT$alloc..vec..Vec$LT$T$GT$$u20$as$u20$alloc..vec..SpecExtend$LT$T$C$I$GT$$GT$9from_iter17he2470787cf6763b1E+0x1a4>
   86714:	aa0003f3 	mov	x19, x0
   86718:	aa1303e0 	mov	x0, x19
   8671c:	97fff575 	bl	83cf0 <_Unwind_Resume>
   86720:	d4200020 	brk	#0x1
   86724:	aa0003f3 	mov	x19, x0
   86728:	a900dff8 	stp	x24, x23, [sp, #8]
   8672c:	910003e0 	mov	x0, sp
   86730:	97ffff20 	bl	863b0 <_ZN4core3ptr18real_drop_in_place17h6f5b56440ea68aa2E>
   86734:	aa1303e0 	mov	x0, x19
   86738:	97fff56e 	bl	83cf0 <_Unwind_Resume>
   8673c:	d4200020 	brk	#0x1

0000000000086740 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E.llvm.7666731865770800324>:
   86740:	aa0103e8 	mov	x8, x1
   86744:	f9400421 	ldr	x1, [x1, #8]
   86748:	b4000061 	cbz	x1, 86754 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E.llvm.7666731865770800324+0x14>
   8674c:	f9400902 	ldr	x2, [x8, #16]
   86750:	17ffed8a 	b	81d78 <__rust_dealloc>
   86754:	d65f03c0 	ret

0000000000086758 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17h783c3d84f3049961E>:
   86758:	a9bd57f6 	stp	x22, x21, [sp, #-48]!
   8675c:	a9014ff4 	stp	x20, x19, [sp, #16]
   86760:	a9027bfd 	stp	x29, x30, [sp, #32]
   86764:	910083fd 	add	x29, sp, #0x20
   86768:	f9400435 	ldr	x21, [x1, #8]
   8676c:	910003e8 	mov	x8, sp
   86770:	aa0103f3 	mov	x19, x1
   86774:	aa0003f4 	mov	x20, x0
   86778:	91003ea9 	add	x9, x21, #0xf
   8677c:	927ced29 	and	x9, x9, #0xfffffffffffffff0
   86780:	cb090116 	sub	x22, x8, x9
   86784:	910002df 	mov	sp, x22
   86788:	aa1603e0 	mov	x0, x22
   8678c:	aa1403e1 	mov	x1, x20
   86790:	aa1503e2 	mov	x2, x21
   86794:	94000dfc 	bl	89f84 <memcpy>
   86798:	f9400e68 	ldr	x8, [x19, #24]
   8679c:	aa1603e0 	mov	x0, x22
   867a0:	d63f0100 	blr	x8
   867a4:	b40000b5 	cbz	x21, 867b8 <_ZN83_$LT$alloc..boxed..Box$LT$F$GT$$u20$as$u20$core..ops..function..FnOnce$LT$A$GT$$GT$9call_once17h783c3d84f3049961E+0x60>
   867a8:	f9400a62 	ldr	x2, [x19, #16]
   867ac:	aa1403e0 	mov	x0, x20
   867b0:	aa1503e1 	mov	x1, x21
   867b4:	97ffed71 	bl	81d78 <__rust_dealloc>
   867b8:	d10083bf 	sub	sp, x29, #0x20
   867bc:	a9427bfd 	ldp	x29, x30, [sp, #32]
   867c0:	a9414ff4 	ldp	x20, x19, [sp, #16]
   867c4:	a8c357f6 	ldp	x22, x21, [sp], #48
   867c8:	d65f03c0 	ret
   867cc:	aa0003f5 	mov	x21, x0
   867d0:	aa1403e0 	mov	x0, x20
   867d4:	aa1303e1 	mov	x1, x19
   867d8:	97ffffda 	bl	86740 <_ZN5alloc5alloc8box_free17h65e1c7f235732191E.llvm.7666731865770800324>
   867dc:	aa1503e0 	mov	x0, x21
   867e0:	97fff544 	bl	83cf0 <_Unwind_Resume>
   867e4:	d4200020 	brk	#0x1

00000000000867e8 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in28_$u7b$$u7b$closure$u7d$$u7d$17h2963793903427e7cE.llvm.1121173358901391528>:
   867e8:	f81f0ffe 	str	x30, [sp, #-16]!
   867ec:	940002fd 	bl	873e0 <_ZN5alloc7raw_vec17capacity_overflow17hca041f9acaf07fddE>
   867f0:	d4200020 	brk	#0x1
   867f4:	00000000 	.inst	0x00000000 ; undefined

00000000000867f8 <_ZN4core3ptr18real_drop_in_place17h56a1baa74cc3b8bcE>:
   867f8:	f9400401 	ldr	x1, [x0, #8]
   867fc:	b4000081 	cbz	x1, 8680c <_ZN4core3ptr18real_drop_in_place17h56a1baa74cc3b8bcE+0x14>
   86800:	f9400000 	ldr	x0, [x0]
   86804:	52800022 	mov	w2, #0x1                   	// #1
   86808:	17ffed5c 	b	81d78 <__rust_dealloc>
   8680c:	d65f03c0 	ret

0000000000086810 <_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17he9b65cb3b2e3446eE>:
   86810:	f9400008 	ldr	x8, [x0]
   86814:	aa0103e2 	mov	x2, x1
   86818:	f9400809 	ldr	x9, [x0, #16]
   8681c:	aa0803e0 	mov	x0, x8
   86820:	aa0903e1 	mov	x1, x9
   86824:	14000c8b 	b	89a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>

0000000000086828 <_ZN17ruspiro_interrupt16InterruptManager10initialize17hb5cc1913d9bcbf35E>:
   86828:	90000028 	adrp	x8, 8a000 <memmove>
   8682c:	90000029 	adrp	x9, 8a000 <memmove>
   86830:	9000002a 	adrp	x10, 8a000 <memmove>
   86834:	9000002b 	adrp	x11, 8a000 <memmove>
   86838:	1280000c 	mov	w12, #0xffffffff            	// #-1
   8683c:	f9456d08 	ldr	x8, [x8, #2776]
   86840:	f9457129 	ldr	x9, [x9, #2784]
   86844:	f945754a 	ldr	x10, [x10, #2792]
   86848:	f945796b 	ldr	x11, [x11, #2800]
   8684c:	b900010c 	str	w12, [x8]
   86850:	90000028 	adrp	x8, 8a000 <memmove>
   86854:	b900012c 	str	w12, [x9]
   86858:	90000029 	adrp	x9, 8a000 <memmove>
   8685c:	b900014c 	str	w12, [x10]
   86860:	d5033fbf 	dmb	sy
   86864:	b900017f 	str	wzr, [x11]
   86868:	9000002a 	adrp	x10, 8a000 <memmove>
   8686c:	9000002b 	adrp	x11, 8a000 <memmove>
   86870:	f9457d08 	ldr	x8, [x8, #2808]
   86874:	f9458129 	ldr	x9, [x9, #2816]
   86878:	5280010c 	mov	w12, #0x8                   	// #8
   8687c:	f945854a 	ldr	x10, [x10, #2824]
   86880:	f945896b 	ldr	x11, [x11, #2832]
   86884:	b900010c 	str	w12, [x8]
   86888:	b900012c 	str	w12, [x9]
   8688c:	b900014c 	str	w12, [x10]
   86890:	b900016c 	str	w12, [x11]
   86894:	d65f03c0 	ret

0000000000086898 <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E>:
   86898:	f81f0ffe 	str	x30, [sp, #-16]!
   8689c:	2a0103e8 	mov	w8, w1
   868a0:	53051c21 	ubfx	w1, w1, #5, #3
   868a4:	71000c3f 	cmp	w1, #0x3
   868a8:	54000340 	b.eq	86910 <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E+0x78>  // b.none
   868ac:	d37ef429 	lsl	x9, x1, #2
   868b0:	12001d08 	and	w8, w8, #0xff
   868b4:	5280002b 	mov	w11, #0x1                   	// #1
   868b8:	b869680a 	ldr	w10, [x0, x9]
   868bc:	1ac82168 	lsl	w8, w11, w8
   868c0:	2a08014a 	orr	w10, w10, w8
   868c4:	b829680a 	str	w10, [x0, x9]
   868c8:	34000161 	cbz	w1, 868f4 <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E+0x5c>
   868cc:	7100083f 	cmp	w1, #0x2
   868d0:	540000c0 	b.eq	868e8 <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E+0x50>  // b.none
   868d4:	7100043f 	cmp	w1, #0x1
   868d8:	54000161 	b.ne	86904 <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E+0x6c>  // b.any
   868dc:	90000029 	adrp	x9, 8a000 <memmove>
   868e0:	912c8129 	add	x9, x9, #0xb20
   868e4:	14000006 	b	868fc <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E+0x64>
   868e8:	90000029 	adrp	x9, 8a000 <memmove>
   868ec:	912c6129 	add	x9, x9, #0xb18
   868f0:	14000003 	b	868fc <_ZN17ruspiro_interrupt16InterruptManager8activate17h02f29a9347cec033E+0x64>
   868f4:	90000029 	adrp	x9, 8a000 <memmove>
   868f8:	912ca129 	add	x9, x9, #0xb28
   868fc:	f9400129 	ldr	x9, [x9]
   86900:	b9000128 	str	w8, [x9]
   86904:	d5033fbf 	dmb	sy
   86908:	f84107fe 	ldr	x30, [sp], #16
   8690c:	d65f03c0 	ret
   86910:	f0000020 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   86914:	52800062 	mov	w2, #0x3                   	// #3
   86918:	9132a000 	add	x0, x0, #0xca8
   8691c:	94000d34 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   86920:	d4200020 	brk	#0x1
   86924:	00000000 	.inst	0x00000000 ; undefined

0000000000086928 <__exception_handler_default>:
   86928:	d10343ff 	sub	sp, sp, #0xd0
   8692c:	a90c7bf3 	stp	x19, x30, [sp, #192]
   86930:	51000408 	sub	w8, w0, #0x1
   86934:	a9008be1 	stp	x1, x2, [sp, #8]
   86938:	71004d1f 	cmp	w8, #0x13
   8693c:	a90193e3 	stp	x3, x4, [sp, #24]
   86940:	540008c8 	b.hi	86a58 <__exception_handler_default+0x130>  // b.pmore
   86944:	90000029 	adrp	x9, 8a000 <memmove>
   86948:	91258929 	add	x9, x9, #0x962
   8694c:	1000008a 	adr	x10, 8695c <__exception_handler_default+0x34>
   86950:	3868692b 	ldrb	w11, [x9, x8]
   86954:	8b0b094a 	add	x10, x10, x11, lsl #2
   86958:	d61f0140 	br	x10
   8695c:	a94c7bf3 	ldp	x19, x30, [sp, #192]
   86960:	910343ff 	add	sp, sp, #0xd0
   86964:	14000063 	b	86af0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE>
   86968:	52800108 	mov	w8, #0x8                   	// #8
   8696c:	52a0020a 	mov	w10, #0x100000              	// #1048576
   86970:	72a7e408 	movk	w8, #0x3f20, lsl #16
   86974:	b9400109 	ldr	w9, [x8]
   86978:	121d7129 	and	w9, w9, #0xfffffff8
   8697c:	32000129 	orr	w9, w9, #0x1
   86980:	1400004a 	b	86aa8 <__exception_handler_default+0x180>
   86984:	90000048 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   86988:	910023e9 	add	x9, sp, #0x8
   8698c:	910043ea 	add	x10, sp, #0x10
   86990:	910143e0 	add	x0, sp, #0x50
   86994:	9100e3f3 	add	x19, sp, #0x38
   86998:	f9444108 	ldr	x8, [x8, #2176]
   8699c:	a90823e9 	stp	x9, x8, [sp, #128]
   869a0:	910063e9 	add	x9, sp, #0x18
   869a4:	a90923ea 	stp	x10, x8, [sp, #144]
   869a8:	910083ea 	add	x10, sp, #0x20
   869ac:	a90a23e9 	stp	x9, x8, [sp, #160]
   869b0:	52800089 	mov	w9, #0x4                   	// #4
   869b4:	a90b23ea 	stp	x10, x8, [sp, #176]
   869b8:	f0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   869bc:	91338108 	add	x8, x8, #0xce0
   869c0:	910203ea 	add	x10, sp, #0x80
   869c4:	a90527e8 	stp	x8, x9, [sp, #80]
   869c8:	90000028 	adrp	x8, 8a000 <memmove>
   869cc:	91274108 	add	x8, x8, #0x9d0
   869d0:	a90727ea 	stp	x10, x9, [sp, #112]
   869d4:	a90627e8 	stp	x8, x9, [sp, #96]
   869d8:	9100e3e8 	add	x8, sp, #0x38
   869dc:	94000293 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   869e0:	90000008 	adrp	x8, 86000 <_ZN95_$LT$alloc..collections..btree..map..BTreeMap$LT$K$C$V$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h696dde69aab1c8d6E+0xa0>
   869e4:	52800049 	mov	w9, #0x2                   	// #2
   869e8:	91204108 	add	x8, x8, #0x810
   869ec:	a9097fff 	stp	xzr, xzr, [sp, #144]
   869f0:	a902a3f3 	stp	x19, x8, [sp, #40]
   869f4:	f0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   869f8:	91330108 	add	x8, x8, #0xcc0
   869fc:	a90827e8 	stp	x8, x9, [sp, #128]
   86a00:	52800028 	mov	w8, #0x1                   	// #1
   86a04:	9100a3e9 	add	x9, sp, #0x28
   86a08:	a90a23e9 	stp	x9, x8, [sp, #160]
   86a0c:	910143e8 	add	x8, sp, #0x50
   86a10:	910203e0 	add	x0, sp, #0x80
   86a14:	94000285 	bl	87428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>
   86a18:	f94023e1 	ldr	x1, [sp, #64]
   86a1c:	b4000081 	cbz	x1, 86a2c <__exception_handler_default+0x104>
   86a20:	f9401fe0 	ldr	x0, [sp, #56]
   86a24:	52800022 	mov	w2, #0x1                   	// #1
   86a28:	97ffecd4 	bl	81d78 <__rust_dealloc>
   86a2c:	a94523f3 	ldp	x19, x8, [sp, #80]
   86a30:	f94033e1 	ldr	x1, [sp, #96]
   86a34:	a90823f3 	stp	x19, x8, [sp, #128]
   86a38:	f9004be1 	str	x1, [sp, #144]
   86a3c:	aa1303e0 	mov	x0, x19
   86a40:	94000210 	bl	87280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>
   86a44:	f94047e1 	ldr	x1, [sp, #136]
   86a48:	b4000081 	cbz	x1, 86a58 <__exception_handler_default+0x130>
   86a4c:	aa1303e0 	mov	x0, x19
   86a50:	52800022 	mov	w2, #0x1                   	// #1
   86a54:	97ffecc9 	bl	81d78 <__rust_dealloc>
   86a58:	a94c7bf3 	ldp	x19, x30, [sp, #192]
   86a5c:	910343ff 	add	sp, sp, #0xd0
   86a60:	d65f03c0 	ret
   86a64:	52800108 	mov	w8, #0x8                   	// #8
   86a68:	52a0004a 	mov	w10, #0x20000               	// #131072
   86a6c:	72a7e408 	movk	w8, #0x3f20, lsl #16
   86a70:	b85fc109 	ldur	w9, [x8, #-4]
   86a74:	12087129 	and	w9, w9, #0xff1fffff
   86a78:	320b0129 	orr	w9, w9, #0x200000
   86a7c:	b81fc109 	stur	w9, [x8, #-4]
   86a80:	b900150a 	str	w10, [x8, #20]
   86a84:	a94c7bf3 	ldp	x19, x30, [sp, #192]
   86a88:	910343ff 	add	sp, sp, #0xd0
   86a8c:	d65f03c0 	ret
   86a90:	52800108 	mov	w8, #0x8                   	// #8
   86a94:	52a0040a 	mov	w10, #0x200000              	// #2097152
   86a98:	72a7e408 	movk	w8, #0x3f20, lsl #16
   86a9c:	b9400109 	ldr	w9, [x8]
   86aa0:	121a7129 	and	w9, w9, #0xffffffc7
   86aa4:	321d0129 	orr	w9, w9, #0x8
   86aa8:	b9000109 	str	w9, [x8]
   86aac:	b900150a 	str	w10, [x8, #20]
   86ab0:	a94c7bf3 	ldp	x19, x30, [sp, #192]
   86ab4:	910343ff 	add	sp, sp, #0xd0
   86ab8:	d65f03c0 	ret
   86abc:	aa0003f3 	mov	x19, x0
   86ac0:	910203e0 	add	x0, sp, #0x80
   86ac4:	97ffff4d 	bl	867f8 <_ZN4core3ptr18real_drop_in_place17h56a1baa74cc3b8bcE>
   86ac8:	aa1303e0 	mov	x0, x19
   86acc:	97fff489 	bl	83cf0 <_Unwind_Resume>
   86ad0:	d4200020 	brk	#0x1
   86ad4:	aa0003f3 	mov	x19, x0
   86ad8:	9100e3e0 	add	x0, sp, #0x38
   86adc:	97ffff47 	bl	867f8 <_ZN4core3ptr18real_drop_in_place17h56a1baa74cc3b8bcE>
   86ae0:	aa1303e0 	mov	x0, x19
   86ae4:	97fff483 	bl	83cf0 <_Unwind_Resume>
   86ae8:	d4200020 	brk	#0x1
   86aec:	00000000 	.inst	0x00000000 ; undefined

0000000000086af0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE>:
   86af0:	f81d0ff6 	str	x22, [sp, #-48]!
   86af4:	a90153f5 	stp	x21, x20, [sp, #16]
   86af8:	a9027bf3 	stp	x19, x30, [sp, #32]
   86afc:	9400008b 	bl	86d28 <_ZN22ruspiro_interrupt_core26entering_interrupt_handler17h5cb7b4f8ce256795E>
   86b00:	90000028 	adrp	x8, 8a000 <memmove>
   86b04:	90000029 	adrp	x9, 8a000 <memmove>
   86b08:	9000002a 	adrp	x10, 8a000 <memmove>
   86b0c:	9000004b 	adrp	x11, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   86b10:	f9459908 	ldr	x8, [x8, #2864]
   86b14:	f9459d29 	ldr	x9, [x9, #2872]
   86b18:	f945a14a 	ldr	x10, [x10, #2880]
   86b1c:	f944756b 	ldr	x11, [x11, #2280]
   86b20:	b9400108 	ldr	w8, [x8]
   86b24:	b9400129 	ldr	w9, [x9]
   86b28:	b940014a 	ldr	w10, [x10]
   86b2c:	2942356c 	ldp	w12, w13, [x11, #16]
   86b30:	b940196b 	ldr	w11, [x11, #24]
   86b34:	6a080195 	ands	w21, w12, w8
   86b38:	0a0901b4 	and	w20, w13, w9
   86b3c:	0a0a0173 	and	w19, w11, w10
   86b40:	54000260 	b.eq	86b8c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x9c>  // b.none
   86b44:	370803f5 	tbnz	w21, #1, 86bc0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xd0>
   86b48:	37180415 	tbnz	w21, #3, 86bc8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xd8>
   86b4c:	37400435 	tbnz	w21, #8, 86bd0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xe0>
   86b50:	37480455 	tbnz	w21, #9, 86bd8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xe8>
   86b54:	37600475 	tbnz	w21, #12, 86be0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xf0>
   86b58:	37680495 	tbnz	w21, #13, 86be8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xf8>
   86b5c:	377004b5 	tbnz	w21, #14, 86bf0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x100>
   86b60:	377804d5 	tbnz	w21, #15, 86bf8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x108>
   86b64:	36e808d5 	tbz	w21, #29, 86c7c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x18c>
   86b68:	90000028 	adrp	x8, 8a000 <memmove>
   86b6c:	f9456916 	ldr	x22, [x8, #2768]
   86b70:	b94002c8 	ldr	w8, [x22]
   86b74:	37000768 	tbnz	w8, #0, 86c60 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x170>
   86b78:	b94002c8 	ldr	w8, [x22]
   86b7c:	37080788 	tbnz	w8, #1, 86c6c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x17c>
   86b80:	b94002c8 	ldr	w8, [x22]
   86b84:	371007a8 	tbnz	w8, #2, 86c78 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x188>
   86b88:	1400003d 	b	86c7c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x18c>
   86b8c:	350007f4 	cbnz	w20, 86c88 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x198>
   86b90:	34000bf3 	cbz	w19, 86d0c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x21c>
   86b94:	37000393 	tbnz	w19, #0, 86c04 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x114>
   86b98:	370803b3 	tbnz	w19, #1, 86c0c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x11c>
   86b9c:	371003d3 	tbnz	w19, #2, 86c14 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x124>
   86ba0:	371803f3 	tbnz	w19, #3, 86c1c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x12c>
   86ba4:	37200413 	tbnz	w19, #4, 86c24 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x134>
   86ba8:	37280433 	tbnz	w19, #5, 86c2c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x13c>
   86bac:	37300453 	tbnz	w19, #6, 86c34 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x144>
   86bb0:	37380473 	tbnz	w19, #7, 86c3c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x14c>
   86bb4:	37400493 	tbnz	w19, #8, 86c44 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x154>
   86bb8:	374804b3 	tbnz	w19, #9, 86c4c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x15c>
   86bbc:	14000054 	b	86d0c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x21c>
   86bc0:	97fffc80 	bl	85dc0 <__irq_handler__SystemTimer1>
   86bc4:	361ffc55 	tbz	w21, #3, 86b4c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x5c>
   86bc8:	94000056 	bl	86d20 <__irq_handler__Arm>
   86bcc:	3647fc35 	tbz	w21, #8, 86b50 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x60>
   86bd0:	94000054 	bl	86d20 <__irq_handler__Arm>
   86bd4:	364ffc15 	tbz	w21, #9, 86b54 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x64>
   86bd8:	94000052 	bl	86d20 <__irq_handler__Arm>
   86bdc:	3667fbf5 	tbz	w21, #12, 86b58 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x68>
   86be0:	94000050 	bl	86d20 <__irq_handler__Arm>
   86be4:	366ffbd5 	tbz	w21, #13, 86b5c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x6c>
   86be8:	9400004e 	bl	86d20 <__irq_handler__Arm>
   86bec:	3677fbb5 	tbz	w21, #14, 86b60 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x70>
   86bf0:	9400004c 	bl	86d20 <__irq_handler__Arm>
   86bf4:	367ffb95 	tbz	w21, #15, 86b64 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x74>
   86bf8:	9400004a 	bl	86d20 <__irq_handler__Arm>
   86bfc:	37effb75 	tbnz	w21, #29, 86b68 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x78>
   86c00:	1400001f 	b	86c7c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x18c>
   86c04:	94000047 	bl	86d20 <__irq_handler__Arm>
   86c08:	360ffcb3 	tbz	w19, #1, 86b9c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xac>
   86c0c:	94000045 	bl	86d20 <__irq_handler__Arm>
   86c10:	3617fc93 	tbz	w19, #2, 86ba0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xb0>
   86c14:	94000043 	bl	86d20 <__irq_handler__Arm>
   86c18:	361ffc73 	tbz	w19, #3, 86ba4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xb4>
   86c1c:	94000041 	bl	86d20 <__irq_handler__Arm>
   86c20:	3627fc53 	tbz	w19, #4, 86ba8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xb8>
   86c24:	9400003f 	bl	86d20 <__irq_handler__Arm>
   86c28:	362ffc33 	tbz	w19, #5, 86bac <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xbc>
   86c2c:	9400003d 	bl	86d20 <__irq_handler__Arm>
   86c30:	3637fc13 	tbz	w19, #6, 86bb0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xc0>
   86c34:	9400003b 	bl	86d20 <__irq_handler__Arm>
   86c38:	363ffbf3 	tbz	w19, #7, 86bb4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xc4>
   86c3c:	94000039 	bl	86d20 <__irq_handler__Arm>
   86c40:	3647fbd3 	tbz	w19, #8, 86bb8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xc8>
   86c44:	94000037 	bl	86d20 <__irq_handler__Arm>
   86c48:	36480633 	tbz	w19, #9, 86d0c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x21c>
   86c4c:	94000035 	bl	86d20 <__irq_handler__Arm>
   86c50:	a9427bf3 	ldp	x19, x30, [sp, #32]
   86c54:	a94153f5 	ldp	x21, x20, [sp, #16]
   86c58:	f84307f6 	ldr	x22, [sp], #48
   86c5c:	14000039 	b	86d40 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17h4f7222e68fed8263E>
   86c60:	94000030 	bl	86d20 <__irq_handler__Arm>
   86c64:	b94002c8 	ldr	w8, [x22]
   86c68:	360ff8c8 	tbz	w8, #1, 86b80 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x90>
   86c6c:	9400002d 	bl	86d20 <__irq_handler__Arm>
   86c70:	b94002c8 	ldr	w8, [x22]
   86c74:	36100048 	tbz	w8, #2, 86c7c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x18c>
   86c78:	9400002a 	bl	86d20 <__irq_handler__Arm>
   86c7c:	37f001b5 	tbnz	w21, #30, 86cb0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1c0>
   86c80:	37f801d5 	tbnz	w21, #31, 86cb8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1c8>
   86c84:	34000434 	cbz	w20, 86d08 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x218>
   86c88:	378801f4 	tbnz	w20, #17, 86cc4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1d4>
   86c8c:	37900214 	tbnz	w20, #18, 86ccc <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1dc>
   86c90:	37980234 	tbnz	w20, #19, 86cd4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1e4>
   86c94:	37a00254 	tbnz	w20, #20, 86cdc <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1ec>
   86c98:	37a80274 	tbnz	w20, #21, 86ce4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1f4>
   86c9c:	37b00294 	tbnz	w20, #22, 86cec <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1fc>
   86ca0:	37b802b4 	tbnz	w20, #23, 86cf4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x204>
   86ca4:	37c002d4 	tbnz	w20, #24, 86cfc <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x20c>
   86ca8:	37c802f4 	tbnz	w20, #25, 86d04 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x214>
   86cac:	14000017 	b	86d08 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x218>
   86cb0:	9400001c 	bl	86d20 <__irq_handler__Arm>
   86cb4:	36fffe95 	tbz	w21, #31, 86c84 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x194>
   86cb8:	9400001a 	bl	86d20 <__irq_handler__Arm>
   86cbc:	35fffe74 	cbnz	w20, 86c88 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x198>
   86cc0:	14000012 	b	86d08 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x218>
   86cc4:	97fffb7f 	bl	85ac0 <__irq_handler__GpioBank0>
   86cc8:	3697fe54 	tbz	w20, #18, 86c90 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1a0>
   86ccc:	97fffbab 	bl	85b78 <__irq_handler__GpioBank1>
   86cd0:	369ffe34 	tbz	w20, #19, 86c94 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1a4>
   86cd4:	94000013 	bl	86d20 <__irq_handler__Arm>
   86cd8:	36a7fe14 	tbz	w20, #20, 86c98 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1a8>
   86cdc:	94000011 	bl	86d20 <__irq_handler__Arm>
   86ce0:	36affdf4 	tbz	w20, #21, 86c9c <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1ac>
   86ce4:	9400000f 	bl	86d20 <__irq_handler__Arm>
   86ce8:	36b7fdd4 	tbz	w20, #22, 86ca0 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1b0>
   86cec:	9400000d 	bl	86d20 <__irq_handler__Arm>
   86cf0:	36bffdb4 	tbz	w20, #23, 86ca4 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1b4>
   86cf4:	9400000b 	bl	86d20 <__irq_handler__Arm>
   86cf8:	36c7fd94 	tbz	w20, #24, 86ca8 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x1b8>
   86cfc:	94000009 	bl	86d20 <__irq_handler__Arm>
   86d00:	36c80054 	tbz	w20, #25, 86d08 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0x218>
   86d04:	94000007 	bl	86d20 <__irq_handler__Arm>
   86d08:	35fff473 	cbnz	w19, 86b94 <_ZN17ruspiro_interrupt17interrupt_handler17h7af1bab5345f6dfbE+0xa4>
   86d0c:	a9427bf3 	ldp	x19, x30, [sp, #32]
   86d10:	a94153f5 	ldp	x21, x20, [sp, #16]
   86d14:	f84307f6 	ldr	x22, [sp], #48
   86d18:	1400000a 	b	86d40 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17h4f7222e68fed8263E>
   86d1c:	00000000 	.inst	0x00000000 ; undefined

0000000000086d20 <__irq_handler__Arm>:
   86d20:	d65f03c0 	ret
   86d24:	00000000 	.inst	0x00000000 ; undefined

0000000000086d28 <_ZN22ruspiro_interrupt_core26entering_interrupt_handler17h5cb7b4f8ce256795E>:
   86d28:	90000048 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   86d2c:	52800029 	mov	w9, #0x1                   	// #1
   86d30:	f9444508 	ldr	x8, [x8, #2184]
   86d34:	089ffd09 	stlrb	w9, [x8]
   86d38:	d65f03c0 	ret
   86d3c:	00000000 	.inst	0x00000000 ; undefined

0000000000086d40 <_ZN22ruspiro_interrupt_core25leaving_interrupt_handler17h4f7222e68fed8263E>:
   86d40:	90000048 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   86d44:	f9444508 	ldr	x8, [x8, #2184]
   86d48:	089ffd1f 	stlrb	wzr, [x8]
   86d4c:	d65f03c0 	ret

0000000000086d50 <_ZN22ruspiro_interrupt_core17enable_interrupts17hae901d9cabef88e4E>:
   86d50:	d50342ff 	msr	daifclr, #0x2
   86d54:	d5033fdf 	isb
   86d58:	d50341ff 	msr	daifclr, #0x1
   86d5c:	d5033fdf 	isb
   86d60:	d65f03c0 	ret
   86d64:	00000000 	.inst	0x00000000 ; undefined

0000000000086d68 <_ZN15ruspiro_mailbox7Mailbox13get_clockrate17hecd0f87f51b53591E>:
   86d68:	d10203ff 	sub	sp, sp, #0x80
   86d6c:	a9077bf3 	stp	x19, x30, [sp, #112]
   86d70:	aa0803f3 	mov	x19, x8
   86d74:	90000028 	adrp	x8, 8a000 <memmove>
   86d78:	290c07ff 	stp	wzr, w1, [sp, #96]
   86d7c:	52800100 	mov	w0, #0x8                   	// #8
   86d80:	910143e1 	add	x1, sp, #0x50
   86d84:	290d7fff 	stp	wzr, wzr, [sp, #104]
   86d88:	3dc30100 	ldr	q0, [x8, #3072]
   86d8c:	910083e8 	add	x8, sp, #0x20
   86d90:	3d8017e0 	str	q0, [sp, #80]
   86d94:	94000019 	bl	86df8 <_ZN15ruspiro_mailbox9interface12send_message17h1ff252aabf02f3a1E>
   86d98:	f94013e8 	ldr	x8, [sp, #32]
   86d9c:	f100051f 	cmp	x8, #0x1
   86da0:	54000201 	b.ne	86de0 <_ZN15ruspiro_mailbox7Mailbox13get_clockrate17hecd0f87f51b53591E+0x78>  // b.any
   86da4:	f94017e8 	ldr	x8, [sp, #40]
   86da8:	f90003e8 	str	x8, [sp]
   86dac:	f9401be8 	ldr	x8, [sp, #48]
   86db0:	f90007e8 	str	x8, [sp, #8]
   86db4:	3dc003e0 	ldr	q0, [sp]
   86db8:	3d8007e0 	str	q0, [sp, #16]
   86dbc:	f9400fe8 	ldr	x8, [sp, #24]
   86dc0:	f9000a68 	str	x8, [x19, #16]
   86dc4:	52800028 	mov	w8, #0x1                   	// #1
   86dc8:	f9400be9 	ldr	x9, [sp, #16]
   86dcc:	f9000669 	str	x9, [x19, #8]
   86dd0:	b9000268 	str	w8, [x19]
   86dd4:	a9477bf3 	ldp	x19, x30, [sp, #112]
   86dd8:	910203ff 	add	sp, sp, #0x80
   86ddc:	d65f03c0 	ret
   86de0:	b9404be9 	ldr	w9, [sp, #72]
   86de4:	2a1f03e8 	mov	w8, wzr
   86de8:	29002668 	stp	w8, w9, [x19]
   86dec:	a9477bf3 	ldp	x19, x30, [sp, #112]
   86df0:	910203ff 	add	sp, sp, #0x80
   86df4:	d65f03c0 	ret

0000000000086df8 <_ZN15ruspiro_mailbox9interface12send_message17h1ff252aabf02f3a1E>:
   86df8:	a9be53f5 	stp	x21, x20, [sp, #-32]!
   86dfc:	a9017bf3 	stp	x19, x30, [sp, #16]
   86e00:	aa0103f4 	mov	x20, x1
   86e04:	2a0003f5 	mov	w21, w0
   86e08:	aa0803f3 	mov	x19, x8
   86e0c:	94000035 	bl	86ee0 <_ZN13ruspiro_cache15cleaninvalidate17h5908b96b2ee1231dE>
   86e10:	90000028 	adrp	x8, 8a000 <memmove>
   86e14:	f9467108 	ldr	x8, [x8, #3296]
   86e18:	b9400109 	ldr	w9, [x8]
   86e1c:	37ffffe9 	tbnz	w9, #31, 86e18 <_ZN15ruspiro_mailbox9interface12send_message17h1ff252aabf02f3a1E+0x20>
   86e20:	90000029 	adrp	x9, 8a000 <memmove>
   86e24:	9000002a 	adrp	x10, 8a000 <memmove>
   86e28:	9000002c 	adrp	x12, 8a000 <memmove>
   86e2c:	121c668b 	and	w11, w20, #0x3ffffff0
   86e30:	12001ea8 	and	w8, w21, #0xff
   86e34:	f946752d 	ldr	x13, [x9, #3304]
   86e38:	2a08016b 	orr	w11, w11, w8
   86e3c:	f9466949 	ldr	x9, [x10, #3280]
   86e40:	3202056b 	orr	w11, w11, #0xc0000000
   86e44:	f9466d8a 	ldr	x10, [x12, #3288]
   86e48:	b90001ab 	str	w11, [x13]
   86e4c:	b940012b 	ldr	w11, [x9]
   86e50:	37f7ffeb 	tbnz	w11, #30, 86e4c <_ZN15ruspiro_mailbox9interface12send_message17h1ff252aabf02f3a1E+0x54>
   86e54:	b940014b 	ldr	w11, [x10]
   86e58:	12000d6b 	and	w11, w11, #0xf
   86e5c:	6b08017f 	cmp	w11, w8
   86e60:	54ffff61 	b.ne	86e4c <_ZN15ruspiro_mailbox9interface12send_message17h1ff252aabf02f3a1E+0x54>  // b.any
   86e64:	9400001f 	bl	86ee0 <_ZN13ruspiro_cache15cleaninvalidate17h5908b96b2ee1231dE>
   86e68:	92407689 	and	x9, x20, #0x3fffffff
   86e6c:	52b00010 	mov	w16, #0x80000000            	// #-2147483648
   86e70:	b9401d28 	ldr	w8, [x9, #28]
   86e74:	b940192a 	ldr	w10, [x9, #24]
   86e78:	b940152b 	ldr	w11, [x9, #20]
   86e7c:	b940112c 	ldr	w12, [x9, #16]
   86e80:	b9400d2d 	ldr	w13, [x9, #12]
   86e84:	b940092e 	ldr	w14, [x9, #8]
   86e88:	b940012f 	ldr	w15, [x9]
   86e8c:	b9400529 	ldr	w9, [x9, #4]
   86e90:	6b10013f 	cmp	w9, w16
   86e94:	54000141 	b.ne	86ebc <_ZN15ruspiro_mailbox9interface12send_message17h1ff252aabf02f3a1E+0xc4>  // b.any
   86e98:	aa1f03e9 	mov	x9, xzr
   86e9c:	2902426f 	stp	w15, w16, [x19, #16]
   86ea0:	2903366e 	stp	w14, w13, [x19, #24]
   86ea4:	29042e6c 	stp	w12, w11, [x19, #32]
   86ea8:	2905226a 	stp	w10, w8, [x19, #40]
   86eac:	f9000269 	str	x9, [x19]
   86eb0:	a9417bf3 	ldp	x19, x30, [sp, #16]
   86eb4:	a8c253f5 	ldp	x21, x20, [sp], #32
   86eb8:	d65f03c0 	ret
   86ebc:	90000028 	adrp	x8, 8a000 <memmove>
   86ec0:	5280058a 	mov	w10, #0x2c                  	// #44
   86ec4:	91328108 	add	x8, x8, #0xca0
   86ec8:	52800029 	mov	w9, #0x1                   	// #1
   86ecc:	a900aa68 	stp	x8, x10, [x19, #8]
   86ed0:	f9000269 	str	x9, [x19]
   86ed4:	a9417bf3 	ldp	x19, x30, [sp, #16]
   86ed8:	a8c253f5 	ldp	x21, x20, [sp], #32
   86edc:	d65f03c0 	ret

0000000000086ee0 <_ZN13ruspiro_cache15cleaninvalidate17h5908b96b2ee1231dE>:
   86ee0:	1400009f 	b	8715c <__cleaninvalidate_dcache>

0000000000086ee4 <__get_dcache_line_size>:
   86ee4:	d53b0020 	mrs	x0, ctr_el0
   86ee8:	d503201f 	nop
   86eec:	d3504c00 	ubfx	x0, x0, #16, #4
   86ef0:	d2800081 	mov	x1, #0x4                   	// #4
   86ef4:	9ac02020 	lsl	x0, x1, x0
   86ef8:	d65f03c0 	ret

0000000000086efc <__get_icache_line_size>:
   86efc:	d53b0020 	mrs	x0, ctr_el0
   86f00:	d503201f 	nop
   86f04:	92400c00 	and	x0, x0, #0xf
   86f08:	d2800081 	mov	x1, #0x4                   	// #4
   86f0c:	9ac02020 	lsl	x0, x1, x0
   86f10:	d65f03c0 	ret

0000000000086f14 <__invalidate_dcache>:
   86f14:	d10403ff 	sub	sp, sp, #0x100
   86f18:	a90007e0 	stp	x0, x1, [sp]
   86f1c:	a9010fe2 	stp	x2, x3, [sp, #16]
   86f20:	a90217e4 	stp	x4, x5, [sp, #32]
   86f24:	a9031fe6 	stp	x6, x7, [sp, #48]
   86f28:	a90427e8 	stp	x8, x9, [sp, #64]
   86f2c:	a9052fea 	stp	x10, x11, [sp, #80]
   86f30:	a90637ec 	stp	x12, x13, [sp, #96]
   86f34:	a9073fee 	stp	x14, x15, [sp, #112]
   86f38:	a90847f0 	stp	x16, x17, [sp, #128]
   86f3c:	a9094ff2 	stp	x18, x19, [sp, #144]
   86f40:	a90a57f4 	stp	x20, x21, [sp, #160]
   86f44:	a90b5ff6 	stp	x22, x23, [sp, #176]
   86f48:	a90c67f8 	stp	x24, x25, [sp, #192]
   86f4c:	a90d6ffa 	stp	x26, x27, [sp, #208]
   86f50:	a90e77fc 	stp	x28, x29, [sp, #224]
   86f54:	f9007bfe 	str	x30, [sp, #240]
   86f58:	d5033f9f 	dsb	sy
   86f5c:	d5390020 	mrs	x0, clidr_el1
   86f60:	92680803 	and	x3, x0, #0x7000000
   86f64:	d357fc63 	lsr	x3, x3, #23
   86f68:	b40003c3 	cbz	x3, 86fe0 <ifinished>
   86f6c:	d280000a 	mov	x10, #0x0                   	// #0

0000000000086f70 <iloop1>:
   86f70:	8b4a0542 	add	x2, x10, x10, lsr #1
   86f74:	9ac22401 	lsr	x1, x0, x2
   86f78:	92400821 	and	x1, x1, #0x7
   86f7c:	f100083f 	cmp	x1, #0x2
   86f80:	540002ab 	b.lt	86fd4 <iskip>  // b.tstop
   86f84:	d51a000a 	msr	csselr_el1, x10
   86f88:	d5033fdf 	isb
   86f8c:	d5390001 	mrs	x1, ccsidr_el1
   86f90:	92400822 	and	x2, x1, #0x7
   86f94:	91001042 	add	x2, x2, #0x4
   86f98:	d2807fe4 	mov	x4, #0x3ff                 	// #1023
   86f9c:	8a410c84 	and	x4, x4, x1, lsr #3
   86fa0:	5ac01085 	clz	w5, w4
   86fa4:	d28fffe7 	mov	x7, #0x7fff                	// #32767
   86fa8:	8a4134e7 	and	x7, x7, x1, lsr #13

0000000000086fac <iloop2>:
   86fac:	aa0403e9 	mov	x9, x4

0000000000086fb0 <iloop3>:
   86fb0:	9ac52126 	lsl	x6, x9, x5
   86fb4:	aa06014b 	orr	x11, x10, x6
   86fb8:	9ac220e6 	lsl	x6, x7, x2
   86fbc:	aa06016b 	orr	x11, x11, x6
   86fc0:	d508764b 	dc	isw, x11
   86fc4:	f1000529 	subs	x9, x9, #0x1
   86fc8:	54ffff4a 	b.ge	86fb0 <iloop3>  // b.tcont
   86fcc:	f10004e7 	subs	x7, x7, #0x1
   86fd0:	54fffeea 	b.ge	86fac <iloop2>  // b.tcont

0000000000086fd4 <iskip>:
   86fd4:	9100094a 	add	x10, x10, #0x2
   86fd8:	eb0a007f 	cmp	x3, x10
   86fdc:	54fffcac 	b.gt	86f70 <iloop1>

0000000000086fe0 <ifinished>:
   86fe0:	d280000a 	mov	x10, #0x0                   	// #0
   86fe4:	d51a000a 	msr	csselr_el1, x10
   86fe8:	d5033f9f 	dsb	sy
   86fec:	d5033fdf 	isb
   86ff0:	a94007e0 	ldp	x0, x1, [sp]
   86ff4:	a9410fe2 	ldp	x2, x3, [sp, #16]
   86ff8:	a94217e4 	ldp	x4, x5, [sp, #32]
   86ffc:	a9431fe6 	ldp	x6, x7, [sp, #48]
   87000:	a94427e8 	ldp	x8, x9, [sp, #64]
   87004:	a9452fea 	ldp	x10, x11, [sp, #80]
   87008:	a94637ec 	ldp	x12, x13, [sp, #96]
   8700c:	a9473fee 	ldp	x14, x15, [sp, #112]
   87010:	a94847f0 	ldp	x16, x17, [sp, #128]
   87014:	a9494ff2 	ldp	x18, x19, [sp, #144]
   87018:	a94a57f4 	ldp	x20, x21, [sp, #160]
   8701c:	a94b5ff6 	ldp	x22, x23, [sp, #176]
   87020:	a94c67f8 	ldp	x24, x25, [sp, #192]
   87024:	a94d6ffa 	ldp	x26, x27, [sp, #208]
   87028:	a94e77fc 	ldp	x28, x29, [sp, #224]
   8702c:	f9407bfe 	ldr	x30, [sp, #240]
   87030:	910403ff 	add	sp, sp, #0x100
   87034:	d65f03c0 	ret

0000000000087038 <__clean_dcache>:
   87038:	d10403ff 	sub	sp, sp, #0x100
   8703c:	a90007e0 	stp	x0, x1, [sp]
   87040:	a9010fe2 	stp	x2, x3, [sp, #16]
   87044:	a90217e4 	stp	x4, x5, [sp, #32]
   87048:	a9031fe6 	stp	x6, x7, [sp, #48]
   8704c:	a90427e8 	stp	x8, x9, [sp, #64]
   87050:	a9052fea 	stp	x10, x11, [sp, #80]
   87054:	a90637ec 	stp	x12, x13, [sp, #96]
   87058:	a9073fee 	stp	x14, x15, [sp, #112]
   8705c:	a90847f0 	stp	x16, x17, [sp, #128]
   87060:	a9094ff2 	stp	x18, x19, [sp, #144]
   87064:	a90a57f4 	stp	x20, x21, [sp, #160]
   87068:	a90b5ff6 	stp	x22, x23, [sp, #176]
   8706c:	a90c67f8 	stp	x24, x25, [sp, #192]
   87070:	a90d6ffa 	stp	x26, x27, [sp, #208]
   87074:	a90e77fc 	stp	x28, x29, [sp, #224]
   87078:	f9007bfe 	str	x30, [sp, #240]
   8707c:	d5033f9f 	dsb	sy
   87080:	d5390020 	mrs	x0, clidr_el1
   87084:	92680803 	and	x3, x0, #0x7000000
   87088:	d357fc63 	lsr	x3, x3, #23
   8708c:	b40003c3 	cbz	x3, 87104 <cfinished>
   87090:	d280000a 	mov	x10, #0x0                   	// #0

0000000000087094 <cloop1>:
   87094:	8b4a0542 	add	x2, x10, x10, lsr #1
   87098:	9ac22401 	lsr	x1, x0, x2
   8709c:	92400821 	and	x1, x1, #0x7
   870a0:	f100083f 	cmp	x1, #0x2
   870a4:	540002ab 	b.lt	870f8 <cskip>  // b.tstop
   870a8:	d51a000a 	msr	csselr_el1, x10
   870ac:	d5033fdf 	isb
   870b0:	d5390001 	mrs	x1, ccsidr_el1
   870b4:	92400822 	and	x2, x1, #0x7
   870b8:	91001042 	add	x2, x2, #0x4
   870bc:	d2807fe4 	mov	x4, #0x3ff                 	// #1023
   870c0:	8a410c84 	and	x4, x4, x1, lsr #3
   870c4:	5ac01085 	clz	w5, w4
   870c8:	d28fffe7 	mov	x7, #0x7fff                	// #32767
   870cc:	8a4134e7 	and	x7, x7, x1, lsr #13

00000000000870d0 <cloop2>:
   870d0:	aa0403e9 	mov	x9, x4

00000000000870d4 <cloop3>:
   870d4:	9ac52126 	lsl	x6, x9, x5
   870d8:	aa06014b 	orr	x11, x10, x6
   870dc:	9ac220e6 	lsl	x6, x7, x2
   870e0:	aa06016b 	orr	x11, x11, x6
   870e4:	d5087a4b 	dc	csw, x11
   870e8:	f1000529 	subs	x9, x9, #0x1
   870ec:	54ffff4a 	b.ge	870d4 <cloop3>  // b.tcont
   870f0:	f10004e7 	subs	x7, x7, #0x1
   870f4:	54fffeea 	b.ge	870d0 <cloop2>  // b.tcont

00000000000870f8 <cskip>:
   870f8:	9100094a 	add	x10, x10, #0x2
   870fc:	eb0a007f 	cmp	x3, x10
   87100:	54fffcac 	b.gt	87094 <cloop1>

0000000000087104 <cfinished>:
   87104:	d280000a 	mov	x10, #0x0                   	// #0
   87108:	d51a000a 	msr	csselr_el1, x10
   8710c:	d5033f9f 	dsb	sy
   87110:	d5033fdf 	isb
   87114:	a94007e0 	ldp	x0, x1, [sp]
   87118:	a9410fe2 	ldp	x2, x3, [sp, #16]
   8711c:	a94217e4 	ldp	x4, x5, [sp, #32]
   87120:	a9431fe6 	ldp	x6, x7, [sp, #48]
   87124:	a94427e8 	ldp	x8, x9, [sp, #64]
   87128:	a9452fea 	ldp	x10, x11, [sp, #80]
   8712c:	a94637ec 	ldp	x12, x13, [sp, #96]
   87130:	a9473fee 	ldp	x14, x15, [sp, #112]
   87134:	a94847f0 	ldp	x16, x17, [sp, #128]
   87138:	a9494ff2 	ldp	x18, x19, [sp, #144]
   8713c:	a94a57f4 	ldp	x20, x21, [sp, #160]
   87140:	a94b5ff6 	ldp	x22, x23, [sp, #176]
   87144:	a94c67f8 	ldp	x24, x25, [sp, #192]
   87148:	a94d6ffa 	ldp	x26, x27, [sp, #208]
   8714c:	a94e77fc 	ldp	x28, x29, [sp, #224]
   87150:	f9407bfe 	ldr	x30, [sp, #240]
   87154:	910403ff 	add	sp, sp, #0x100
   87158:	d65f03c0 	ret

000000000008715c <__cleaninvalidate_dcache>:
   8715c:	d10403ff 	sub	sp, sp, #0x100
   87160:	a90007e0 	stp	x0, x1, [sp]
   87164:	a9010fe2 	stp	x2, x3, [sp, #16]
   87168:	a90217e4 	stp	x4, x5, [sp, #32]
   8716c:	a9031fe6 	stp	x6, x7, [sp, #48]
   87170:	a90427e8 	stp	x8, x9, [sp, #64]
   87174:	a9052fea 	stp	x10, x11, [sp, #80]
   87178:	a90637ec 	stp	x12, x13, [sp, #96]
   8717c:	a9073fee 	stp	x14, x15, [sp, #112]
   87180:	a90847f0 	stp	x16, x17, [sp, #128]
   87184:	a9094ff2 	stp	x18, x19, [sp, #144]
   87188:	a90a57f4 	stp	x20, x21, [sp, #160]
   8718c:	a90b5ff6 	stp	x22, x23, [sp, #176]
   87190:	a90c67f8 	stp	x24, x25, [sp, #192]
   87194:	a90d6ffa 	stp	x26, x27, [sp, #208]
   87198:	a90e77fc 	stp	x28, x29, [sp, #224]
   8719c:	f9007bfe 	str	x30, [sp, #240]
   871a0:	d5033f9f 	dsb	sy
   871a4:	d5390020 	mrs	x0, clidr_el1
   871a8:	92680803 	and	x3, x0, #0x7000000
   871ac:	d357fc63 	lsr	x3, x3, #23
   871b0:	b40003c3 	cbz	x3, 87228 <finished>
   871b4:	d280000a 	mov	x10, #0x0                   	// #0

00000000000871b8 <loop1>:
   871b8:	8b4a0542 	add	x2, x10, x10, lsr #1
   871bc:	9ac22401 	lsr	x1, x0, x2
   871c0:	92400821 	and	x1, x1, #0x7
   871c4:	f100083f 	cmp	x1, #0x2
   871c8:	540002ab 	b.lt	8721c <skip>  // b.tstop
   871cc:	d51a000a 	msr	csselr_el1, x10
   871d0:	d5033fdf 	isb
   871d4:	d5390001 	mrs	x1, ccsidr_el1
   871d8:	92400822 	and	x2, x1, #0x7
   871dc:	91001042 	add	x2, x2, #0x4
   871e0:	d2807fe4 	mov	x4, #0x3ff                 	// #1023
   871e4:	8a410c84 	and	x4, x4, x1, lsr #3
   871e8:	5ac01085 	clz	w5, w4
   871ec:	d28fffe7 	mov	x7, #0x7fff                	// #32767
   871f0:	8a4134e7 	and	x7, x7, x1, lsr #13

00000000000871f4 <loop2>:
   871f4:	aa0403e9 	mov	x9, x4

00000000000871f8 <loop3>:
   871f8:	9ac52126 	lsl	x6, x9, x5
   871fc:	aa06014b 	orr	x11, x10, x6
   87200:	9ac220e6 	lsl	x6, x7, x2
   87204:	aa06016b 	orr	x11, x11, x6
   87208:	d5087e4b 	dc	cisw, x11
   8720c:	f1000529 	subs	x9, x9, #0x1
   87210:	54ffff4a 	b.ge	871f8 <loop3>  // b.tcont
   87214:	f10004e7 	subs	x7, x7, #0x1
   87218:	54fffeea 	b.ge	871f4 <loop2>  // b.tcont

000000000008721c <skip>:
   8721c:	9100094a 	add	x10, x10, #0x2
   87220:	eb0a007f 	cmp	x3, x10
   87224:	54fffcac 	b.gt	871b8 <loop1>

0000000000087228 <finished>:
   87228:	d280000a 	mov	x10, #0x0                   	// #0
   8722c:	d51a000a 	msr	csselr_el1, x10
   87230:	d5033f9f 	dsb	sy
   87234:	d5033fdf 	isb
   87238:	a94007e0 	ldp	x0, x1, [sp]
   8723c:	a9410fe2 	ldp	x2, x3, [sp, #16]
   87240:	a94217e4 	ldp	x4, x5, [sp, #32]
   87244:	a9431fe6 	ldp	x6, x7, [sp, #48]
   87248:	a94427e8 	ldp	x8, x9, [sp, #64]
   8724c:	a9452fea 	ldp	x10, x11, [sp, #80]
   87250:	a94637ec 	ldp	x12, x13, [sp, #96]
   87254:	a9473fee 	ldp	x14, x15, [sp, #112]
   87258:	a94847f0 	ldp	x16, x17, [sp, #128]
   8725c:	a9494ff2 	ldp	x18, x19, [sp, #144]
   87260:	a94a57f4 	ldp	x20, x21, [sp, #160]
   87264:	a94b5ff6 	ldp	x22, x23, [sp, #176]
   87268:	a94c67f8 	ldp	x24, x25, [sp, #192]
   8726c:	a94d6ffa 	ldp	x26, x27, [sp, #208]
   87270:	a94e77fc 	ldp	x28, x29, [sp, #224]
   87274:	f9407bfe 	ldr	x30, [sp, #240]
   87278:	910403ff 	add	sp, sp, #0x100
   8727c:	d65f03c0 	ret

0000000000087280 <_ZN15ruspiro_console5print17h057cac26d371b76dE>:
   87280:	f0000028 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   87284:	d000002b 	adrp	x11, 8d000 <GCC_except_table3+0xa5c>
   87288:	9134816b 	add	x11, x11, #0xd20
   8728c:	aa0103e2 	mov	x2, x1
   87290:	aa0003e1 	mov	x1, x0
   87294:	f9446508 	ldr	x8, [x8, #2248]
   87298:	f8410d09 	ldr	x9, [x8, #16]!
   8729c:	f100013f 	cmp	x9, #0x0
   872a0:	f940050a 	ldr	x10, [x8, #8]
   872a4:	9a890108 	csel	x8, x8, x9, eq  // eq = none
   872a8:	aa0803e0 	mov	x0, x8
   872ac:	9a8a0169 	csel	x9, x11, x10, eq  // eq = none
   872b0:	f9401123 	ldr	x3, [x9, #32]
   872b4:	d61f0060 	br	x3

00000000000872b8 <_ZN80_$LT$ruspiro_console..DefaultConsole$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4putc17h919eff5ef8bc0da7E>:
   872b8:	d65f03c0 	ret
   872bc:	00000000 	.inst	0x00000000 ; undefined

00000000000872c0 <_ZN80_$LT$ruspiro_console..DefaultConsole$u20$as$u20$ruspiro_console..ConsoleImpl$GT$4puts17hd66da91bfbb092a9E>:
   872c0:	d65f03c0 	ret
   872c4:	00000000 	.inst	0x00000000 ; undefined

00000000000872c8 <_ZN73_$LT$ruspiro_console..DefaultConsole$u20$as$u20$core..ops..drop..Drop$GT$4drop17h4170deec3560f4acE>:
   872c8:	d65f03c0 	ret
   872cc:	00000000 	.inst	0x00000000 ; undefined

00000000000872d0 <_ZN12ruspiro_lock8spinlock8Spinlock3new17h0a3a855f75e3ab12E>:
   872d0:	3900011f 	strb	wzr, [x8]
   872d4:	d65f03c0 	ret

00000000000872d8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E>:
   872d8:	52800028 	mov	w8, #0x1                   	// #1
   872dc:	085ffc09 	ldaxrb	w9, [x0]
   872e0:	34000089 	cbz	w9, 872f0 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E+0x18>
   872e4:	d5033f5f 	clrex
   872e8:	085ffc09 	ldaxrb	w9, [x0]
   872ec:	35ffffc9 	cbnz	w9, 872e4 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E+0xc>
   872f0:	0809fc08 	stlxrb	w9, w8, [x0]
   872f4:	35ffffa9 	cbnz	w9, 872e8 <_ZN12ruspiro_lock8spinlock8Spinlock6aquire17h93e053530659f177E+0x10>
   872f8:	d65f03c0 	ret
   872fc:	00000000 	.inst	0x00000000 ; undefined

0000000000087300 <_ZN12ruspiro_lock8spinlock8Spinlock7release17h540c080833faeca3E>:
   87300:	089ffc1f 	stlrb	wzr, [x0]
   87304:	d65f03c0 	ret

0000000000087308 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246>:
   87308:	f81d0ff6 	str	x22, [sp, #-48]!
   8730c:	a90153f5 	stp	x21, x20, [sp, #16]
   87310:	a9027bf3 	stp	x19, x30, [sp, #32]
   87314:	aa0103f6 	mov	x22, x1
   87318:	f9400421 	ldr	x1, [x1, #8]
   8731c:	aa0003f3 	mov	x19, x0
   87320:	cb020028 	sub	x8, x1, x2
   87324:	eb03011f 	cmp	x8, x3
   87328:	54000322 	b.cs	8738c <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x84>  // b.hs, b.nlast
   8732c:	ab030054 	adds	x20, x2, x3
   87330:	2a0403f5 	mov	w21, w4
   87334:	1a9f37e8 	cset	w8, cs  // cs = hs, nlast
   87338:	360000c5 	tbz	w5, #0, 87350 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x48>
   8733c:	370000c8 	tbnz	w8, #0, 87354 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x4c>
   87340:	d37ff828 	lsl	x8, x1, #1
   87344:	eb14011f 	cmp	x8, x20
   87348:	9a948114 	csel	x20, x8, x20, hi  // hi = pmore
   8734c:	14000009 	b	87370 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x68>
   87350:	34000108 	cbz	w8, 87370 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x68>
   87354:	52800028 	mov	w8, #0x1                   	// #1
   87358:	a900fe7f 	stp	xzr, xzr, [x19, #8]
   8735c:	f9000268 	str	x8, [x19]
   87360:	a9427bf3 	ldp	x19, x30, [sp, #32]
   87364:	a94153f5 	ldp	x21, x20, [sp, #16]
   87368:	f84307f6 	ldr	x22, [sp], #48
   8736c:	d65f03c0 	ret
   87370:	b4000181 	cbz	x1, 873a0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x98>
   87374:	f94002c0 	ldr	x0, [x22]
   87378:	52800022 	mov	w2, #0x1                   	// #1
   8737c:	aa1403e3 	mov	x3, x20
   87380:	97ffea82 	bl	81d88 <__rust_realloc>
   87384:	b4000160 	cbz	x0, 873b0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0xa8>
   87388:	a90052c0 	stp	x0, x20, [x22]
   8738c:	f900027f 	str	xzr, [x19]
   87390:	a9427bf3 	ldp	x19, x30, [sp, #32]
   87394:	a94153f5 	ldp	x21, x20, [sp, #16]
   87398:	f84307f6 	ldr	x22, [sp], #48
   8739c:	d65f03c0 	ret
   873a0:	52800021 	mov	w1, #0x1                   	// #1
   873a4:	aa1403e0 	mov	x0, x20
   873a8:	97ffea70 	bl	81d68 <__rust_alloc>
   873ac:	b5fffee0 	cbnz	x0, 87388 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0x80>
   873b0:	37000115 	tbnz	w21, #0, 873d0 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246+0xc8>
   873b4:	52800028 	mov	w8, #0x1                   	// #1
   873b8:	a9005268 	stp	x8, x20, [x19]
   873bc:	f9000a68 	str	x8, [x19, #16]
   873c0:	a9427bf3 	ldp	x19, x30, [sp, #32]
   873c4:	a94153f5 	ldp	x21, x20, [sp, #16]
   873c8:	f84307f6 	ldr	x22, [sp], #48
   873cc:	d65f03c0 	ret
   873d0:	52800021 	mov	w1, #0x1                   	// #1
   873d4:	aa1403e0 	mov	x0, x20
   873d8:	9400000a 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   873dc:	d4200020 	brk	#0x1

00000000000873e0 <_ZN5alloc7raw_vec17capacity_overflow17hca041f9acaf07fddE>:
   873e0:	f81f0ffe 	str	x30, [sp, #-16]!
   873e4:	f0000000 	adrp	x0, 8a000 <memmove>
   873e8:	d0000022 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   873ec:	91361800 	add	x0, x0, #0xd86
   873f0:	9135a042 	add	x2, x2, #0xd68
   873f4:	52800221 	mov	w1, #0x11                  	// #17
   873f8:	94000a70 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   873fc:	d4200020 	brk	#0x1

0000000000087400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>:
   87400:	f81f0ffe 	str	x30, [sp, #-16]!
   87404:	97ffea65 	bl	81d98 <rust_oom>
   87408:	d4200020 	brk	#0x1

000000000008740c <_ZN4core3ptr18real_drop_in_place17h42fca1a2b3617b56E>:
   8740c:	f9400401 	ldr	x1, [x0, #8]
   87410:	b4000081 	cbz	x1, 87420 <_ZN4core3ptr18real_drop_in_place17h42fca1a2b3617b56E+0x14>
   87414:	f9400000 	ldr	x0, [x0]
   87418:	52800022 	mov	w2, #0x1                   	// #1
   8741c:	17ffea57 	b	81d78 <__rust_dealloc>
   87420:	d65f03c0 	ret

0000000000087424 <_ZN4core3ptr18real_drop_in_place17hd47bedfd3c930ce8E>:
   87424:	d65f03c0 	ret

0000000000087428 <_ZN5alloc3fmt6format17hafdd08834ed4019dE>:
   87428:	d10203ff 	sub	sp, sp, #0x80
   8742c:	f9002bf6 	str	x22, [sp, #80]
   87430:	a90653f5 	stp	x21, x20, [sp, #96]
   87434:	a9077bf3 	stp	x19, x30, [sp, #112]
   87438:	a9402809 	ldp	x9, x10, [x0]
   8743c:	aa0003f4 	mov	x20, x0
   87440:	aa0803f3 	mov	x19, x8
   87444:	d37ced4b 	lsl	x11, x10, #4
   87448:	b400012b 	cbz	x11, 8746c <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x44>
   8744c:	d1004168 	sub	x8, x11, #0x10
   87450:	d344fd08 	lsr	x8, x8, #4
   87454:	91000508 	add	x8, x8, #0x1
   87458:	f100151f 	cmp	x8, #0x5
   8745c:	54000102 	b.cs	8747c <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x54>  // b.hs, b.nlast
   87460:	aa1f03f5 	mov	x21, xzr
   87464:	aa0903e8 	mov	x8, x9
   87468:	14000019 	b	874cc <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xa4>
   8746c:	aa1f03f5 	mov	x21, xzr
   87470:	f9401688 	ldr	x8, [x20, #40]
   87474:	b50003c8 	cbnz	x8, 874ec <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xc4>
   87478:	14000026 	b	87510 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xe8>
   8747c:	9240050c 	and	x12, x8, #0x3
   87480:	f240051f 	tst	x8, #0x3
   87484:	5280008d 	mov	w13, #0x4                   	// #4
   87488:	9a8c01ac 	csel	x12, x13, x12, eq  // eq = none
   8748c:	cb0c010c 	sub	x12, x8, x12
   87490:	9100a12b 	add	x11, x9, #0x28
   87494:	6f00e400 	movi	v0.2d, #0x0
   87498:	8b0c1128 	add	x8, x9, x12, lsl #4
   8749c:	6f00e401 	movi	v1.2d, #0x0
   874a0:	d100816d 	sub	x13, x11, #0x20
   874a4:	4c408d62 	ld2	{v2.2d, v3.2d}, [x11]
   874a8:	4c408da4 	ld2	{v4.2d, v5.2d}, [x13]
   874ac:	f100118c 	subs	x12, x12, #0x4
   874b0:	9101016b 	add	x11, x11, #0x40
   874b4:	4ee18441 	add	v1.2d, v2.2d, v1.2d
   874b8:	4ee08480 	add	v0.2d, v4.2d, v0.2d
   874bc:	54ffff21 	b.ne	874a0 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x78>  // b.any
   874c0:	4ee08420 	add	v0.2d, v1.2d, v0.2d
   874c4:	5ef1b800 	addp	d0, v0.2d
   874c8:	9e660015 	fmov	x21, d0
   874cc:	8b0a112b 	add	x11, x9, x10, lsl #4
   874d0:	f940050c 	ldr	x12, [x8, #8]
   874d4:	91004108 	add	x8, x8, #0x10
   874d8:	eb08017f 	cmp	x11, x8
   874dc:	8b150195 	add	x21, x12, x21
   874e0:	54ffff81 	b.ne	874d0 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xa8>  // b.any
   874e4:	f9401688 	ldr	x8, [x20, #40]
   874e8:	b4000148 	cbz	x8, 87510 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xe8>
   874ec:	b400062a 	cbz	x10, 875b0 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x188>
   874f0:	f9400528 	ldr	x8, [x9, #8]
   874f4:	b5000068 	cbnz	x8, 87500 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xd8>
   874f8:	f10042bf 	cmp	x21, #0x10
   874fc:	54000063 	b.cc	87508 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xe0>  // b.lo, b.ul, b.last
   87500:	ab1502b5 	adds	x21, x21, x21
   87504:	54000063 	b.cc	87510 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0xe8>  // b.lo, b.ul, b.last
   87508:	aa1f03f5 	mov	x21, xzr
   8750c:	14000008 	b	8752c <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x104>
   87510:	b40000f5 	cbz	x21, 8752c <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x104>
   87514:	52800021 	mov	w1, #0x1                   	// #1
   87518:	aa1503e0 	mov	x0, x21
   8751c:	97ffea13 	bl	81d68 <__rust_alloc>
   87520:	b4000540 	cbz	x0, 875c8 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x1a0>
   87524:	910023f6 	add	x22, sp, #0x8
   87528:	14000003 	b	87534 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x10c>
   8752c:	910023f6 	add	x22, sp, #0x8
   87530:	52800020 	mov	w0, #0x1                   	// #1
   87534:	ad408282 	ldp	q2, q0, [x20, #16]
   87538:	3dc00281 	ldr	q1, [x20]
   8753c:	910023e8 	add	x8, sp, #0x8
   87540:	a900d7e0 	stp	x0, x21, [sp, #8]
   87544:	f9000fff 	str	xzr, [sp, #24]
   87548:	f9002fe8 	str	x8, [sp, #88]
   8754c:	ad0183e2 	stp	q2, q0, [sp, #48]
   87550:	3d800be1 	str	q1, [sp, #32]
   87554:	d0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   87558:	9136e021 	add	x1, x1, #0xdb8
   8755c:	910163e0 	add	x0, sp, #0x58
   87560:	910083e2 	add	x2, sp, #0x20
   87564:	940004fe 	bl	8895c <_ZN4core3fmt5write17h8a62c0058826f9fdE>
   87568:	35000140 	cbnz	w0, 87590 <_ZN5alloc3fmt6format17hafdd08834ed4019dE+0x168>
   8756c:	f9400ac8 	ldr	x8, [x22, #16]
   87570:	3dc002c0 	ldr	q0, [x22]
   87574:	a94653f5 	ldp	x21, x20, [sp, #96]
   87578:	f9402bf6 	ldr	x22, [sp, #80]
   8757c:	f9000a68 	str	x8, [x19, #16]
   87580:	3d800260 	str	q0, [x19]
   87584:	a9477bf3 	ldp	x19, x30, [sp, #112]
   87588:	910203ff 	add	sp, sp, #0x80
   8758c:	d65f03c0 	ret
   87590:	f0000000 	adrp	x0, 8a000 <memmove>
   87594:	d0000023 	adrp	x3, 8d000 <GCC_except_table3+0xa5c>
   87598:	91381000 	add	x0, x0, #0xe04
   8759c:	91366063 	add	x3, x3, #0xd98
   875a0:	910083e2 	add	x2, sp, #0x20
   875a4:	52800661 	mov	w1, #0x33                  	// #51
   875a8:	940003fa 	bl	88590 <_ZN4core6result13unwrap_failed17hfed3e99faf88cc75E>
   875ac:	d4200020 	brk	#0x1
   875b0:	d0000020 	adrp	x0, 8d000 <GCC_except_table3+0xa5c>
   875b4:	91360000 	add	x0, x0, #0xd80
   875b8:	aa1f03e1 	mov	x1, xzr
   875bc:	aa1f03e2 	mov	x2, xzr
   875c0:	94000a0b 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   875c4:	d4200020 	brk	#0x1
   875c8:	52800021 	mov	w1, #0x1                   	// #1
   875cc:	aa1503e0 	mov	x0, x21
   875d0:	97ffff8c 	bl	87400 <_ZN5alloc5alloc18handle_alloc_error17h11286e57f71cf9c1E>
   875d4:	d4200020 	brk	#0x1
   875d8:	aa0003f3 	mov	x19, x0
   875dc:	910023e0 	add	x0, sp, #0x8
   875e0:	97ffff8b 	bl	8740c <_ZN4core3ptr18real_drop_in_place17h42fca1a2b3617b56E>
   875e4:	aa1303e0 	mov	x0, x19
   875e8:	97fff1c2 	bl	83cf0 <_Unwind_Resume>
   875ec:	d4200020 	brk	#0x1

00000000000875f0 <_ZN4core3ptr18real_drop_in_place17h5e2dd1ff29bb03afE>:
   875f0:	d65f03c0 	ret

00000000000875f4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h15ff56101df3fae3E>:
   875f4:	f81f0ffe 	str	x30, [sp, #-16]!
   875f8:	f9400000 	ldr	x0, [x0]
   875fc:	9400003c 	bl	876ec <_ZN5alloc6string6String4push17he1a9748861885544E>
   87600:	2a1f03e0 	mov	w0, wzr
   87604:	f84107fe 	ldr	x30, [sp], #16
   87608:	d65f03c0 	ret

000000000008760c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h4b77e6b68f45fb31E>:
   8760c:	d10103ff 	sub	sp, sp, #0x40
   87610:	f9400008 	ldr	x8, [x0]
   87614:	ad408021 	ldp	q1, q0, [x1, #16]
   87618:	3dc00022 	ldr	q2, [x1]
   8761c:	d0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   87620:	9136e021 	add	x1, x1, #0xdb8
   87624:	9100e3e0 	add	x0, sp, #0x38
   87628:	910003e2 	mov	x2, sp
   8762c:	a90323fe 	stp	x30, x8, [sp, #48]
   87630:	ad0083e1 	stp	q1, q0, [sp, #16]
   87634:	3d8003e2 	str	q2, [sp]
   87638:	940004c9 	bl	8895c <_ZN4core3fmt5write17h8a62c0058826f9fdE>
   8763c:	f9401bfe 	ldr	x30, [sp, #48]
   87640:	910103ff 	add	sp, sp, #0x40
   87644:	d65f03c0 	ret

0000000000087648 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17he9d74f9bfe98dc02E>:
   87648:	d10103ff 	sub	sp, sp, #0x40
   8764c:	a90253f5 	stp	x21, x20, [sp, #32]
   87650:	a9037bf3 	stp	x19, x30, [sp, #48]
   87654:	f9400015 	ldr	x21, [x0]
   87658:	aa0203f3 	mov	x19, x2
   8765c:	aa0103f4 	mov	x20, x1
   87660:	910023e0 	add	x0, sp, #0x8
   87664:	f9400aa2 	ldr	x2, [x21, #16]
   87668:	52800024 	mov	w4, #0x1                   	// #1
   8766c:	52800025 	mov	w5, #0x1                   	// #1
   87670:	aa1503e1 	mov	x1, x21
   87674:	aa1303e3 	mov	x3, x19
   87678:	97ffff24 	bl	87308 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246>
   8767c:	f94007e8 	ldr	x8, [sp, #8]
   87680:	f100051f 	cmp	x8, #0x1
   87684:	540001e0 	b.eq	876c0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17he9d74f9bfe98dc02E+0x78>  // b.none
   87688:	f9400aa8 	ldr	x8, [x21, #16]
   8768c:	f94002a9 	ldr	x9, [x21]
   87690:	aa1303e1 	mov	x1, x19
   87694:	aa1403e2 	mov	x2, x20
   87698:	8b13010a 	add	x10, x8, x19
   8769c:	8b080120 	add	x0, x9, x8
   876a0:	aa1303e3 	mov	x3, x19
   876a4:	f9000aaa 	str	x10, [x21, #16]
   876a8:	94000075 	bl	8787c <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hbd7577f53ed2872bE>
   876ac:	a9437bf3 	ldp	x19, x30, [sp, #48]
   876b0:	a94253f5 	ldp	x21, x20, [sp, #32]
   876b4:	2a1f03e0 	mov	w0, wzr
   876b8:	910103ff 	add	sp, sp, #0x40
   876bc:	d65f03c0 	ret
   876c0:	f9400fe8 	ldr	x8, [sp, #24]
   876c4:	b5000068 	cbnz	x8, 876d0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17he9d74f9bfe98dc02E+0x88>
   876c8:	97ffff46 	bl	873e0 <_ZN5alloc7raw_vec17capacity_overflow17hca041f9acaf07fddE>
   876cc:	d4200020 	brk	#0x1
   876d0:	f0000000 	adrp	x0, 8a000 <memmove>
   876d4:	d0000022 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   876d8:	91357800 	add	x0, x0, #0xd5e
   876dc:	91354042 	add	x2, x2, #0xd50
   876e0:	52800501 	mov	w1, #0x28                  	// #40
   876e4:	940009b5 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   876e8:	d4200020 	brk	#0x1

00000000000876ec <_ZN5alloc6string6String4push17he1a9748861885544E>:
   876ec:	d10103ff 	sub	sp, sp, #0x40
   876f0:	f90013f4 	str	x20, [sp, #32]
   876f4:	a9037bf3 	stp	x19, x30, [sp, #48]
   876f8:	2a0103f4 	mov	w20, w1
   876fc:	7102003f 	cmp	w1, #0x80
   87700:	aa0003f3 	mov	x19, x0
   87704:	540002e2 	b.cs	87760 <_ZN5alloc6string6String4push17he1a9748861885544E+0x74>  // b.hs, b.nlast
   87708:	a9408a68 	ldp	x8, x2, [x19, #8]
   8770c:	eb08005f 	cmp	x2, x8
   87710:	54000161 	b.ne	8773c <_ZN5alloc6string6String4push17he1a9748861885544E+0x50>  // b.any
   87714:	910023e0 	add	x0, sp, #0x8
   87718:	52800023 	mov	w3, #0x1                   	// #1
   8771c:	52800024 	mov	w4, #0x1                   	// #1
   87720:	52800025 	mov	w5, #0x1                   	// #1
   87724:	aa1303e1 	mov	x1, x19
   87728:	97fffef8 	bl	87308 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246>
   8772c:	f94007e8 	ldr	x8, [sp, #8]
   87730:	f100051f 	cmp	x8, #0x1
   87734:	540008e0 	b.eq	87850 <_ZN5alloc6string6String4push17he1a9748861885544E+0x164>  // b.none
   87738:	f9400a62 	ldr	x2, [x19, #16]
   8773c:	f9400268 	ldr	x8, [x19]
   87740:	38226914 	strb	w20, [x8, x2]
   87744:	f9400a68 	ldr	x8, [x19, #16]
   87748:	91000508 	add	x8, x8, #0x1
   8774c:	f9000a68 	str	x8, [x19, #16]
   87750:	a9437bf3 	ldp	x19, x30, [sp, #48]
   87754:	f94013f4 	ldr	x20, [sp, #32]
   87758:	910103ff 	add	sp, sp, #0x40
   8775c:	d65f03c0 	ret
   87760:	7120029f 	cmp	w20, #0x800
   87764:	b9002fff 	str	wzr, [sp, #44]
   87768:	54000122 	b.cs	8778c <_ZN5alloc6string6String4push17he1a9748861885544E+0xa0>  // b.hs, b.nlast
   8776c:	52801808 	mov	w8, #0xc0                  	// #192
   87770:	52801009 	mov	w9, #0x80                  	// #128
   87774:	33062a88 	bfxil	w8, w20, #6, #5
   87778:	33001689 	bfxil	w9, w20, #0, #6
   8777c:	3900b3e8 	strb	w8, [sp, #44]
   87780:	3900b7e9 	strb	w9, [sp, #45]
   87784:	52800054 	mov	w20, #0x2                   	// #2
   87788:	1400001b 	b	877f4 <_ZN5alloc6string6String4push17he1a9748861885544E+0x108>
   8778c:	7140429f 	cmp	w20, #0x10, lsl #12
   87790:	54000182 	b.cs	877c0 <_ZN5alloc6string6String4push17he1a9748861885544E+0xd4>  // b.hs, b.nlast
   87794:	52801c08 	mov	w8, #0xe0                  	// #224
   87798:	52801009 	mov	w9, #0x80                  	// #128
   8779c:	5280100a 	mov	w10, #0x80                  	// #128
   877a0:	330c3e88 	bfxil	w8, w20, #12, #4
   877a4:	33062e8a 	bfxil	w10, w20, #6, #6
   877a8:	33001689 	bfxil	w9, w20, #0, #6
   877ac:	3900b3e8 	strb	w8, [sp, #44]
   877b0:	3900b7ea 	strb	w10, [sp, #45]
   877b4:	3900bbe9 	strb	w9, [sp, #46]
   877b8:	52800074 	mov	w20, #0x3                   	// #3
   877bc:	1400000e 	b	877f4 <_ZN5alloc6string6String4push17he1a9748861885544E+0x108>
   877c0:	53127e88 	lsr	w8, w20, #18
   877c4:	52801009 	mov	w9, #0x80                  	// #128
   877c8:	5280100a 	mov	w10, #0x80                  	// #128
   877cc:	5280100b 	mov	w11, #0x80                  	// #128
   877d0:	321c0d08 	orr	w8, w8, #0xf0
   877d4:	330c468a 	bfxil	w10, w20, #12, #6
   877d8:	33062e8b 	bfxil	w11, w20, #6, #6
   877dc:	33001689 	bfxil	w9, w20, #0, #6
   877e0:	52800094 	mov	w20, #0x4                   	// #4
   877e4:	3900b3e8 	strb	w8, [sp, #44]
   877e8:	3900b7ea 	strb	w10, [sp, #45]
   877ec:	3900bbeb 	strb	w11, [sp, #46]
   877f0:	3900bfe9 	strb	w9, [sp, #47]
   877f4:	f9400a62 	ldr	x2, [x19, #16]
   877f8:	910023e0 	add	x0, sp, #0x8
   877fc:	52800024 	mov	w4, #0x1                   	// #1
   87800:	52800025 	mov	w5, #0x1                   	// #1
   87804:	aa1303e1 	mov	x1, x19
   87808:	aa1403e3 	mov	x3, x20
   8780c:	97fffebf 	bl	87308 <_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_internal17hd107c9e501aacdb9E.llvm.3976591549805142246>
   87810:	f94007e8 	ldr	x8, [sp, #8]
   87814:	f100051f 	cmp	x8, #0x1
   87818:	540001c0 	b.eq	87850 <_ZN5alloc6string6String4push17he1a9748861885544E+0x164>  // b.none
   8781c:	f9400a68 	ldr	x8, [x19, #16]
   87820:	f9400269 	ldr	x9, [x19]
   87824:	9100b3e2 	add	x2, sp, #0x2c
   87828:	aa1403e1 	mov	x1, x20
   8782c:	8b14010a 	add	x10, x8, x20
   87830:	8b080120 	add	x0, x9, x8
   87834:	aa1403e3 	mov	x3, x20
   87838:	f9000a6a 	str	x10, [x19, #16]
   8783c:	94000010 	bl	8787c <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hbd7577f53ed2872bE>
   87840:	a9437bf3 	ldp	x19, x30, [sp, #48]
   87844:	f94013f4 	ldr	x20, [sp, #32]
   87848:	910103ff 	add	sp, sp, #0x40
   8784c:	d65f03c0 	ret
   87850:	f9400fe8 	ldr	x8, [sp, #24]
   87854:	b5000068 	cbnz	x8, 87860 <_ZN5alloc6string6String4push17he1a9748861885544E+0x174>
   87858:	97fffee2 	bl	873e0 <_ZN5alloc7raw_vec17capacity_overflow17hca041f9acaf07fddE>
   8785c:	d4200020 	brk	#0x1
   87860:	f0000000 	adrp	x0, 8a000 <memmove>
   87864:	d0000022 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   87868:	91357800 	add	x0, x0, #0xd5e
   8786c:	91354042 	add	x2, x2, #0xd50
   87870:	52800501 	mov	w1, #0x28                  	// #40
   87874:	94000951 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   87878:	d4200020 	brk	#0x1

000000000008787c <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hbd7577f53ed2872bE>:
   8787c:	d10303ff 	sub	sp, sp, #0xc0
   87880:	f9005bfe 	str	x30, [sp, #176]
   87884:	eb03003f 	cmp	x1, x3
   87888:	a9008fe1 	stp	x1, x3, [sp, #8]
   8788c:	540000e1 	b.ne	878a8 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hbd7577f53ed2872bE+0x2c>  // b.any
   87890:	f9405bfe 	ldr	x30, [sp, #176]
   87894:	aa0203e8 	mov	x8, x2
   87898:	aa0103e2 	mov	x2, x1
   8789c:	aa0803e1 	mov	x1, x8
   878a0:	910303ff 	add	sp, sp, #0xc0
   878a4:	140009b8 	b	89f84 <memcpy>
   878a8:	910043e9 	add	x9, sp, #0x10
   878ac:	d000002a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   878b0:	910023e8 	add	x8, sp, #0x8
   878b4:	9138614a 	add	x10, x10, #0xe18
   878b8:	f9005fe9 	str	x9, [sp, #184]
   878bc:	90000009 	adrp	x9, 87000 <ifinished+0x20>
   878c0:	5280002b 	mov	w11, #0x1                   	// #1
   878c4:	5280010c 	mov	w12, #0x8                   	// #8
   878c8:	a907abe8 	stp	x8, x10, [sp, #120]
   878cc:	9101e3e8 	add	x8, sp, #0x78
   878d0:	9124b129 	add	x9, x9, #0x92c
   878d4:	a9097fff 	stp	xzr, xzr, [sp, #144]
   878d8:	f90047eb 	str	x11, [sp, #136]
   878dc:	a90a7fec 	stp	x12, xzr, [sp, #160]
   878e0:	a904a7e8 	stp	x8, x9, [sp, #72]
   878e4:	f0000028 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   878e8:	f9447908 	ldr	x8, [x8, #2288]
   878ec:	9102e3ea 	add	x10, sp, #0xb8
   878f0:	910203eb 	add	x11, sp, #0x80
   878f4:	a905a7ea 	stp	x10, x9, [sp, #88]
   878f8:	d0000029 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   878fc:	9137a129 	add	x9, x9, #0xde8
   87900:	a906a3eb 	stp	x11, x8, [sp, #104]
   87904:	52800068 	mov	w8, #0x3                   	// #3
   87908:	d0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   8790c:	a901a3e9 	stp	x9, x8, [sp, #24]
   87910:	910123e9 	add	x9, sp, #0x48
   87914:	9138a021 	add	x1, x1, #0xe28
   87918:	910063e0 	add	x0, sp, #0x18
   8791c:	a902ffff 	stp	xzr, xzr, [sp, #40]
   87920:	a903a3e9 	stp	x9, x8, [sp, #56]
   87924:	94000947 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   87928:	d4200020 	brk	#0x1

000000000008792c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he8d80eda9e7ff584E>:
   8792c:	f81e0ff4 	str	x20, [sp, #-32]!
   87930:	a9017bf3 	stp	x19, x30, [sp, #16]
   87934:	f9400014 	ldr	x20, [x0]
   87938:	aa0103e0 	mov	x0, x1
   8793c:	aa0103f3 	mov	x19, x1
   87940:	940006ea 	bl	894e8 <_ZN4core3fmt9Formatter15debug_lower_hex17h597d04d17268b5b5E>
   87944:	360000c0 	tbz	w0, #0, 8795c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he8d80eda9e7ff584E+0x30>
   87948:	aa1303e1 	mov	x1, x19
   8794c:	a9417bf3 	ldp	x19, x30, [sp, #16]
   87950:	aa1403e0 	mov	x0, x20
   87954:	f84207f4 	ldr	x20, [sp], #32
   87958:	1400000e 	b	87990 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h9d17b57bf7f81c93E>
   8795c:	aa1303e0 	mov	x0, x19
   87960:	940006e5 	bl	894f4 <_ZN4core3fmt9Formatter15debug_upper_hex17h69356f446087d521E>
   87964:	360000c0 	tbz	w0, #0, 8797c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he8d80eda9e7ff584E+0x50>
   87968:	aa1303e1 	mov	x1, x19
   8796c:	a9417bf3 	ldp	x19, x30, [sp, #16]
   87970:	aa1403e0 	mov	x0, x20
   87974:	f84207f4 	ldr	x20, [sp], #32
   87978:	1400002b 	b	87a24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17h3f96354a0cf1bb83E>
   8797c:	aa1303e1 	mov	x1, x19
   87980:	a9417bf3 	ldp	x19, x30, [sp, #16]
   87984:	aa1403e0 	mov	x0, x20
   87988:	f84207f4 	ldr	x20, [sp], #32
   8798c:	140001cd 	b	880c0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E>

0000000000087990 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h9d17b57bf7f81c93E>:
   87990:	d10243ff 	sub	sp, sp, #0x90
   87994:	f90043fe 	str	x30, [sp, #128]
   87998:	f940000b 	ldr	x11, [x0]
   8799c:	aa0103e8 	mov	x8, x1
   879a0:	aa1f03e9 	mov	x9, xzr
   879a4:	910003ea 	mov	x10, sp
   879a8:	12000d6e 	and	w14, w11, #0xf
   879ac:	5280060f 	mov	w15, #0x30                  	// #48
   879b0:	d344fd6d 	lsr	x13, x11, #4
   879b4:	33000d6f 	bfxil	w15, w11, #0, #4
   879b8:	11015dcb 	add	w11, w14, #0x57
   879bc:	710029df 	cmp	w14, #0xa
   879c0:	8b09014c 	add	x12, x10, x9
   879c4:	1a8b31eb 	csel	w11, w15, w11, cc  // cc = lo, ul, last
   879c8:	3901fd8b 	strb	w11, [x12, #127]
   879cc:	d1000529 	sub	x9, x9, #0x1
   879d0:	aa0d03eb 	mov	x11, x13
   879d4:	b5fffead 	cbnz	x13, 879a8 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h9d17b57bf7f81c93E+0x18>
   879d8:	91020120 	add	x0, x9, #0x80
   879dc:	f102041f 	cmp	x0, #0x81
   879e0:	540001c2 	b.cs	87a18 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17h9d17b57bf7f81c93E+0x88>  // b.hs, b.nlast
   879e4:	910003ea 	mov	x10, sp
   879e8:	cb0903e5 	neg	x5, x9
   879ec:	8b090149 	add	x9, x10, x9
   879f0:	f0000002 	adrp	x2, 8a000 <memmove>
   879f4:	91020124 	add	x4, x9, #0x80
   879f8:	913ca042 	add	x2, x2, #0xf28
   879fc:	52800021 	mov	w1, #0x1                   	// #1
   87a00:	52800043 	mov	w3, #0x2                   	// #2
   87a04:	aa0803e0 	mov	x0, x8
   87a08:	940004bb 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   87a0c:	f94043fe 	ldr	x30, [sp, #128]
   87a10:	910243ff 	add	sp, sp, #0x90
   87a14:	d65f03c0 	ret
   87a18:	52801001 	mov	w1, #0x80                  	// #128
   87a1c:	94000309 	bl	88640 <_ZN4core5slice22slice_index_order_fail17hc28cc47052966335E>
   87a20:	d4200020 	brk	#0x1

0000000000087a24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17h3f96354a0cf1bb83E>:
   87a24:	d10243ff 	sub	sp, sp, #0x90
   87a28:	f90043fe 	str	x30, [sp, #128]
   87a2c:	f940000b 	ldr	x11, [x0]
   87a30:	aa0103e8 	mov	x8, x1
   87a34:	aa1f03e9 	mov	x9, xzr
   87a38:	910003ea 	mov	x10, sp
   87a3c:	12000d6e 	and	w14, w11, #0xf
   87a40:	5280060f 	mov	w15, #0x30                  	// #48
   87a44:	d344fd6d 	lsr	x13, x11, #4
   87a48:	33000d6f 	bfxil	w15, w11, #0, #4
   87a4c:	1100ddcb 	add	w11, w14, #0x37
   87a50:	710029df 	cmp	w14, #0xa
   87a54:	8b09014c 	add	x12, x10, x9
   87a58:	1a8b31eb 	csel	w11, w15, w11, cc  // cc = lo, ul, last
   87a5c:	3901fd8b 	strb	w11, [x12, #127]
   87a60:	d1000529 	sub	x9, x9, #0x1
   87a64:	aa0d03eb 	mov	x11, x13
   87a68:	b5fffead 	cbnz	x13, 87a3c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17h3f96354a0cf1bb83E+0x18>
   87a6c:	91020120 	add	x0, x9, #0x80
   87a70:	f102041f 	cmp	x0, #0x81
   87a74:	540001c2 	b.cs	87aac <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17h3f96354a0cf1bb83E+0x88>  // b.hs, b.nlast
   87a78:	910003ea 	mov	x10, sp
   87a7c:	cb0903e5 	neg	x5, x9
   87a80:	8b090149 	add	x9, x10, x9
   87a84:	f0000002 	adrp	x2, 8a000 <memmove>
   87a88:	91020124 	add	x4, x9, #0x80
   87a8c:	913ca042 	add	x2, x2, #0xf28
   87a90:	52800021 	mov	w1, #0x1                   	// #1
   87a94:	52800043 	mov	w3, #0x2                   	// #2
   87a98:	aa0803e0 	mov	x0, x8
   87a9c:	94000496 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   87aa0:	f94043fe 	ldr	x30, [sp, #128]
   87aa4:	910243ff 	add	sp, sp, #0x90
   87aa8:	d65f03c0 	ret
   87aac:	52801001 	mov	w1, #0x80                  	// #128
   87ab0:	940002e4 	bl	88640 <_ZN4core5slice22slice_index_order_fail17hc28cc47052966335E>
   87ab4:	d4200020 	brk	#0x1

0000000000087ab8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E>:
   87ab8:	d10283ff 	sub	sp, sp, #0xa0
   87abc:	a90853f5 	stp	x21, x20, [sp, #128]
   87ac0:	a9097bf3 	stp	x19, x30, [sp, #144]
   87ac4:	b9405029 	ldr	w9, [x1, #80]
   87ac8:	aa0103f3 	mov	x19, x1
   87acc:	aa0003f4 	mov	x20, x0
   87ad0:	37200529 	tbnz	w9, #4, 87b74 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0xbc>
   87ad4:	f9400288 	ldr	x8, [x20]
   87ad8:	372807a9 	tbnz	w9, #5, 87bcc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x114>
   87adc:	d0000029 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   87ae0:	f9472129 	ldr	x9, [x9, #3648]
   87ae4:	d344fd0a 	lsr	x10, x8, #4
   87ae8:	f109c55f 	cmp	x10, #0x271
   87aec:	54000ac3 	b.cc	87c44 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x18c>  // b.lo, b.ul, b.last
   87af0:	d28b296c 	mov	x12, #0x594b                	// #22859
   87af4:	f2a710cc 	movk	x12, #0x3886, lsl #16
   87af8:	529c1feb 	mov	w11, #0xe0ff                	// #57599
   87afc:	f2d8bacc 	movk	x12, #0xc5d6, lsl #32
   87b00:	5290a3ee 	mov	w14, #0x851f                	// #34079
   87b04:	aa1f03ea 	mov	x10, xzr
   87b08:	72a0beab 	movk	w11, #0x5f5, lsl #16
   87b0c:	f2e68dac 	movk	x12, #0x346d, lsl #48
   87b10:	5284e20d 	mov	w13, #0x2710                	// #10000
   87b14:	72aa3d6e 	movk	w14, #0x51eb, lsl #16
   87b18:	52800c8f 	mov	w15, #0x64                  	// #100
   87b1c:	910003f0 	mov	x16, sp
   87b20:	aa0803f1 	mov	x17, x8
   87b24:	9bcc7d08 	umulh	x8, x8, x12
   87b28:	d34bfd08 	lsr	x8, x8, #11
   87b2c:	1b0dc512 	msub	w18, w8, w13, w17
   87b30:	12003e40 	and	w0, w18, #0xffff
   87b34:	9bae7c00 	umull	x0, w0, w14
   87b38:	d365fc00 	lsr	x0, x0, #37
   87b3c:	78607921 	ldrh	w1, [x9, x0, lsl #1]
   87b40:	1b0fc812 	msub	w18, w0, w15, w18
   87b44:	8b0a0200 	add	x0, x16, x10
   87b48:	92403e52 	and	x18, x18, #0xffff
   87b4c:	78023001 	sturh	w1, [x0, #35]
   87b50:	78727932 	ldrh	w18, [x9, x18, lsl #1]
   87b54:	eb0b023f 	cmp	x17, x11
   87b58:	d100114a 	sub	x10, x10, #0x4
   87b5c:	78025012 	sturh	w18, [x0, #37]
   87b60:	54fffe08 	b.hi	87b20 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x68>  // b.pmore
   87b64:	91009d4a 	add	x10, x10, #0x27
   87b68:	f1018d1f 	cmp	x8, #0x63
   87b6c:	5400072c 	b.gt	87c50 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x198>
   87b70:	14000045 	b	87c84 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x1cc>
   87b74:	f940028a 	ldr	x10, [x20]
   87b78:	aa1f03e8 	mov	x8, xzr
   87b7c:	910003e9 	mov	x9, sp
   87b80:	12000d4d 	and	w13, w10, #0xf
   87b84:	5280060e 	mov	w14, #0x30                  	// #48
   87b88:	d344fd4c 	lsr	x12, x10, #4
   87b8c:	33000d4e 	bfxil	w14, w10, #0, #4
   87b90:	11015daa 	add	w10, w13, #0x57
   87b94:	710029bf 	cmp	w13, #0xa
   87b98:	8b08012b 	add	x11, x9, x8
   87b9c:	1a8a31ca 	csel	w10, w14, w10, cc  // cc = lo, ul, last
   87ba0:	3901fd6a 	strb	w10, [x11, #127]
   87ba4:	d1000508 	sub	x8, x8, #0x1
   87ba8:	aa0c03ea 	mov	x10, x12
   87bac:	b5fffeac 	cbnz	x12, 87b80 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0xc8>
   87bb0:	91020100 	add	x0, x8, #0x80
   87bb4:	f102041f 	cmp	x0, #0x81
   87bb8:	54001c02 	b.cs	87f38 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x480>  // b.hs, b.nlast
   87bbc:	910003e9 	mov	x9, sp
   87bc0:	cb0803e5 	neg	x5, x8
   87bc4:	8b080128 	add	x8, x9, x8
   87bc8:	14000015 	b	87c1c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x164>
   87bcc:	aa1f03e9 	mov	x9, xzr
   87bd0:	910003ea 	mov	x10, sp
   87bd4:	12000d0d 	and	w13, w8, #0xf
   87bd8:	5280060e 	mov	w14, #0x30                  	// #48
   87bdc:	d344fd0c 	lsr	x12, x8, #4
   87be0:	33000d0e 	bfxil	w14, w8, #0, #4
   87be4:	1100dda8 	add	w8, w13, #0x37
   87be8:	710029bf 	cmp	w13, #0xa
   87bec:	8b09014b 	add	x11, x10, x9
   87bf0:	1a8831c8 	csel	w8, w14, w8, cc  // cc = lo, ul, last
   87bf4:	3901fd68 	strb	w8, [x11, #127]
   87bf8:	d1000529 	sub	x9, x9, #0x1
   87bfc:	aa0c03e8 	mov	x8, x12
   87c00:	b5fffeac 	cbnz	x12, 87bd4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x11c>
   87c04:	91020120 	add	x0, x9, #0x80
   87c08:	f102041f 	cmp	x0, #0x81
   87c0c:	54001962 	b.cs	87f38 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x480>  // b.hs, b.nlast
   87c10:	910003e8 	mov	x8, sp
   87c14:	cb0903e5 	neg	x5, x9
   87c18:	8b090108 	add	x8, x8, x9
   87c1c:	f0000002 	adrp	x2, 8a000 <memmove>
   87c20:	91020104 	add	x4, x8, #0x80
   87c24:	913ca042 	add	x2, x2, #0xf28
   87c28:	52800021 	mov	w1, #0x1                   	// #1
   87c2c:	52800043 	mov	w3, #0x2                   	// #2
   87c30:	aa1303e0 	mov	x0, x19
   87c34:	52800035 	mov	w21, #0x1                   	// #1
   87c38:	9400042f 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   87c3c:	36000520 	tbz	w0, #0, 87ce0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x228>
   87c40:	140000b9 	b	87f24 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x46c>
   87c44:	528004ea 	mov	w10, #0x27                  	// #39
   87c48:	f1018d1f 	cmp	x8, #0x63
   87c4c:	540001cd 	b.le	87c84 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x1cc>
   87c50:	5290a3ec 	mov	w12, #0x851f                	// #34079
   87c54:	12003d0b 	and	w11, w8, #0xffff
   87c58:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   87c5c:	9bac7d6b 	umull	x11, w11, w12
   87c60:	d365fd6b 	lsr	x11, x11, #37
   87c64:	52800c8c 	mov	w12, #0x64                  	// #100
   87c68:	1b0ca168 	msub	w8, w11, w12, w8
   87c6c:	92403d08 	and	x8, x8, #0xffff
   87c70:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   87c74:	d100094a 	sub	x10, x10, #0x2
   87c78:	910003ec 	mov	x12, sp
   87c7c:	782a6988 	strh	w8, [x12, x10]
   87c80:	aa0b03e8 	mov	x8, x11
   87c84:	f100291f 	cmp	x8, #0xa
   87c88:	540000ca 	b.ge	87ca0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x1e8>  // b.tcont
   87c8c:	d1000549 	sub	x9, x10, #0x1
   87c90:	1100c108 	add	w8, w8, #0x30
   87c94:	910003ea 	mov	x10, sp
   87c98:	38296948 	strb	w8, [x10, x9]
   87c9c:	14000005 	b	87cb0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x1f8>
   87ca0:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   87ca4:	d1000949 	sub	x9, x10, #0x2
   87ca8:	910003ea 	mov	x10, sp
   87cac:	78296948 	strh	w8, [x10, x9]
   87cb0:	910003e8 	mov	x8, sp
   87cb4:	528004ea 	mov	w10, #0x27                  	// #39
   87cb8:	f0000002 	adrp	x2, 8a000 <memmove>
   87cbc:	8b090104 	add	x4, x8, x9
   87cc0:	cb090145 	sub	x5, x10, x9
   87cc4:	913fd042 	add	x2, x2, #0xff4
   87cc8:	52800021 	mov	w1, #0x1                   	// #1
   87ccc:	aa1303e0 	mov	x0, x19
   87cd0:	aa1f03e3 	mov	x3, xzr
   87cd4:	52800035 	mov	w21, #0x1                   	// #1
   87cd8:	94000407 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   87cdc:	35001240 	cbnz	w0, 87f24 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x46c>
   87ce0:	a9420660 	ldp	x0, x1, [x19, #32]
   87ce4:	d0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   87ce8:	91392108 	add	x8, x8, #0xe48
   87cec:	52800035 	mov	w21, #0x1                   	// #1
   87cf0:	a90057e8 	stp	x8, x21, [sp]
   87cf4:	52800108 	mov	w8, #0x8                   	// #8
   87cf8:	910003e2 	mov	x2, sp
   87cfc:	a9017fff 	stp	xzr, xzr, [sp, #16]
   87d00:	a9027fe8 	stp	x8, xzr, [sp, #32]
   87d04:	94000316 	bl	8895c <_ZN4core3fmt5write17h8a62c0058826f9fdE>
   87d08:	370010e0 	tbnz	w0, #0, 87f24 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x46c>
   87d0c:	b9405269 	ldr	w9, [x19, #80]
   87d10:	37200789 	tbnz	w9, #4, 87e00 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x348>
   87d14:	f9400688 	ldr	x8, [x20, #8]
   87d18:	37280a29 	tbnz	w9, #5, 87e5c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x3a4>
   87d1c:	d0000029 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   87d20:	f9472129 	ldr	x9, [x9, #3648]
   87d24:	d344fd0a 	lsr	x10, x8, #4
   87d28:	f109c55f 	cmp	x10, #0x271
   87d2c:	54000d43 	b.cc	87ed4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x41c>  // b.lo, b.ul, b.last
   87d30:	d28b296c 	mov	x12, #0x594b                	// #22859
   87d34:	f2a710cc 	movk	x12, #0x3886, lsl #16
   87d38:	529c1feb 	mov	w11, #0xe0ff                	// #57599
   87d3c:	f2d8bacc 	movk	x12, #0xc5d6, lsl #32
   87d40:	5290a3ee 	mov	w14, #0x851f                	// #34079
   87d44:	aa1f03ea 	mov	x10, xzr
   87d48:	72a0beab 	movk	w11, #0x5f5, lsl #16
   87d4c:	f2e68dac 	movk	x12, #0x346d, lsl #48
   87d50:	5284e20d 	mov	w13, #0x2710                	// #10000
   87d54:	72aa3d6e 	movk	w14, #0x51eb, lsl #16
   87d58:	52800c8f 	mov	w15, #0x64                  	// #100
   87d5c:	910003f0 	mov	x16, sp
   87d60:	aa0803f1 	mov	x17, x8
   87d64:	9bcc7d08 	umulh	x8, x8, x12
   87d68:	d34bfd08 	lsr	x8, x8, #11
   87d6c:	1b0dc512 	msub	w18, w8, w13, w17
   87d70:	12003e40 	and	w0, w18, #0xffff
   87d74:	9bae7c00 	umull	x0, w0, w14
   87d78:	d365fc00 	lsr	x0, x0, #37
   87d7c:	78607921 	ldrh	w1, [x9, x0, lsl #1]
   87d80:	1b0fc812 	msub	w18, w0, w15, w18
   87d84:	8b0a0200 	add	x0, x16, x10
   87d88:	92403e52 	and	x18, x18, #0xffff
   87d8c:	78023001 	sturh	w1, [x0, #35]
   87d90:	78727932 	ldrh	w18, [x9, x18, lsl #1]
   87d94:	eb0b023f 	cmp	x17, x11
   87d98:	d100114a 	sub	x10, x10, #0x4
   87d9c:	78025012 	sturh	w18, [x0, #37]
   87da0:	54fffe08 	b.hi	87d60 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x2a8>  // b.pmore
   87da4:	91009d4a 	add	x10, x10, #0x27
   87da8:	f1018d1f 	cmp	x8, #0x63
   87dac:	540001cd 	b.le	87de4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x32c>
   87db0:	5290a3ec 	mov	w12, #0x851f                	// #34079
   87db4:	12003d0b 	and	w11, w8, #0xffff
   87db8:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   87dbc:	9bac7d6b 	umull	x11, w11, w12
   87dc0:	d365fd6b 	lsr	x11, x11, #37
   87dc4:	52800c8c 	mov	w12, #0x64                  	// #100
   87dc8:	1b0ca168 	msub	w8, w11, w12, w8
   87dcc:	92403d08 	and	x8, x8, #0xffff
   87dd0:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   87dd4:	d100094a 	sub	x10, x10, #0x2
   87dd8:	910003ec 	mov	x12, sp
   87ddc:	782a6988 	strh	w8, [x12, x10]
   87de0:	aa0b03e8 	mov	x8, x11
   87de4:	f100291f 	cmp	x8, #0xa
   87de8:	540007ea 	b.ge	87ee4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x42c>  // b.tcont
   87dec:	d1000549 	sub	x9, x10, #0x1
   87df0:	1100c108 	add	w8, w8, #0x30
   87df4:	910003ea 	mov	x10, sp
   87df8:	38296948 	strb	w8, [x10, x9]
   87dfc:	1400003e 	b	87ef4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x43c>
   87e00:	f940068a 	ldr	x10, [x20, #8]
   87e04:	aa1f03e8 	mov	x8, xzr
   87e08:	910003e9 	mov	x9, sp
   87e0c:	12000d4d 	and	w13, w10, #0xf
   87e10:	5280060e 	mov	w14, #0x30                  	// #48
   87e14:	d344fd4c 	lsr	x12, x10, #4
   87e18:	33000d4e 	bfxil	w14, w10, #0, #4
   87e1c:	11015daa 	add	w10, w13, #0x57
   87e20:	710029bf 	cmp	w13, #0xa
   87e24:	8b08012b 	add	x11, x9, x8
   87e28:	1a8a31ca 	csel	w10, w14, w10, cc  // cc = lo, ul, last
   87e2c:	3901fd6a 	strb	w10, [x11, #127]
   87e30:	d1000508 	sub	x8, x8, #0x1
   87e34:	aa0c03ea 	mov	x10, x12
   87e38:	b5fffeac 	cbnz	x12, 87e0c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x354>
   87e3c:	91020100 	add	x0, x8, #0x80
   87e40:	f102041f 	cmp	x0, #0x81
   87e44:	540007a2 	b.cs	87f38 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x480>  // b.hs, b.nlast
   87e48:	910003e9 	mov	x9, sp
   87e4c:	cb0803e5 	neg	x5, x8
   87e50:	8b080128 	add	x8, x9, x8
   87e54:	f0000002 	adrp	x2, 8a000 <memmove>
   87e58:	14000016 	b	87eb0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x3f8>
   87e5c:	aa1f03e9 	mov	x9, xzr
   87e60:	910003ea 	mov	x10, sp
   87e64:	12000d0d 	and	w13, w8, #0xf
   87e68:	5280060e 	mov	w14, #0x30                  	// #48
   87e6c:	d344fd0c 	lsr	x12, x8, #4
   87e70:	33000d0e 	bfxil	w14, w8, #0, #4
   87e74:	1100dda8 	add	w8, w13, #0x37
   87e78:	710029bf 	cmp	w13, #0xa
   87e7c:	8b09014b 	add	x11, x10, x9
   87e80:	1a8831c8 	csel	w8, w14, w8, cc  // cc = lo, ul, last
   87e84:	3901fd68 	strb	w8, [x11, #127]
   87e88:	d1000529 	sub	x9, x9, #0x1
   87e8c:	aa0c03e8 	mov	x8, x12
   87e90:	b5fffeac 	cbnz	x12, 87e64 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x3ac>
   87e94:	91020120 	add	x0, x9, #0x80
   87e98:	f102041f 	cmp	x0, #0x81
   87e9c:	540004e2 	b.cs	87f38 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x480>  // b.hs, b.nlast
   87ea0:	910003e8 	mov	x8, sp
   87ea4:	8b090108 	add	x8, x8, x9
   87ea8:	f0000002 	adrp	x2, 8a000 <memmove>
   87eac:	cb0903e5 	neg	x5, x9
   87eb0:	91020104 	add	x4, x8, #0x80
   87eb4:	913ca042 	add	x2, x2, #0xf28
   87eb8:	52800021 	mov	w1, #0x1                   	// #1
   87ebc:	52800043 	mov	w3, #0x2                   	// #2
   87ec0:	aa1303e0 	mov	x0, x19
   87ec4:	9400038c 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   87ec8:	360002c0 	tbz	w0, #0, 87f20 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x468>
   87ecc:	52800035 	mov	w21, #0x1                   	// #1
   87ed0:	14000015 	b	87f24 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x46c>
   87ed4:	528004ea 	mov	w10, #0x27                  	// #39
   87ed8:	f1018d1f 	cmp	x8, #0x63
   87edc:	54fff84d 	b.le	87de4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x32c>
   87ee0:	17ffffb4 	b	87db0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x2f8>
   87ee4:	78687928 	ldrh	w8, [x9, x8, lsl #1]
   87ee8:	d1000949 	sub	x9, x10, #0x2
   87eec:	910003ea 	mov	x10, sp
   87ef0:	78296948 	strh	w8, [x10, x9]
   87ef4:	910003e8 	mov	x8, sp
   87ef8:	528004ea 	mov	w10, #0x27                  	// #39
   87efc:	f0000002 	adrp	x2, 8a000 <memmove>
   87f00:	8b090104 	add	x4, x8, x9
   87f04:	cb090145 	sub	x5, x10, x9
   87f08:	913fd042 	add	x2, x2, #0xff4
   87f0c:	52800021 	mov	w1, #0x1                   	// #1
   87f10:	aa1303e0 	mov	x0, x19
   87f14:	aa1f03e3 	mov	x3, xzr
   87f18:	94000377 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   87f1c:	35fffd80 	cbnz	w0, 87ecc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17hf4908916f6858b11E+0x414>
   87f20:	2a1f03f5 	mov	w21, wzr
   87f24:	2a1503e0 	mov	w0, w21
   87f28:	a9497bf3 	ldp	x19, x30, [sp, #144]
   87f2c:	a94853f5 	ldp	x21, x20, [sp, #128]
   87f30:	910283ff 	add	sp, sp, #0xa0
   87f34:	d65f03c0 	ret
   87f38:	52801001 	mov	w1, #0x80                  	// #128
   87f3c:	940001c1 	bl	88640 <_ZN4core5slice22slice_index_order_fail17hc28cc47052966335E>
   87f40:	d4200020 	brk	#0x1

0000000000087f44 <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hf53c1b775f6b0d1eE>:
   87f44:	d2902d20 	mov	x0, #0x8169                	// #33129
   87f48:	f2b805c0 	movk	x0, #0xc02e, lsl #16
   87f4c:	f2d7a2e0 	movk	x0, #0xbd17, lsl #32
   87f50:	f2f84aa0 	movk	x0, #0xc255, lsl #48
   87f54:	d65f03c0 	ret

0000000000087f58 <_ZN4core5panic9PanicInfo8location17h99607b6ab81c0b4dE>:
   87f58:	f9400c00 	ldr	x0, [x0, #24]
   87f5c:	d65f03c0 	ret

0000000000087f60 <_ZN4core5panic8Location4file17heb49df6102de4e30E>:
   87f60:	a9400408 	ldp	x8, x1, [x0]
   87f64:	aa0803e0 	mov	x0, x8
   87f68:	d65f03c0 	ret

0000000000087f6c <_ZN4core5panic8Location4line17h4e0ac00bd2f31693E>:
   87f6c:	b9401000 	ldr	w0, [x0, #16]
   87f70:	d65f03c0 	ret

0000000000087f74 <_ZN4core5panic8Location6column17h0f6be5edfbf47b79E>:
   87f74:	b9401400 	ldr	w0, [x0, #20]
   87f78:	d65f03c0 	ret

0000000000087f7c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E>:
   87f7c:	d10103ff 	sub	sp, sp, #0x40
   87f80:	f9001bfe 	str	x30, [sp, #48]
   87f84:	b9400009 	ldr	w9, [x0]
   87f88:	d0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   87f8c:	f9472108 	ldr	x8, [x8, #3648]
   87f90:	aa0103e0 	mov	x0, x1
   87f94:	d3447d2a 	ubfx	x10, x9, #4, #28
   87f98:	7109c55f 	cmp	w10, #0x271
   87f9c:	54000443 	b.cc	88024 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0xa8>  // b.lo, b.ul, b.last
   87fa0:	d28b296b 	mov	x11, #0x594b                	// #22859
   87fa4:	f2a710cb 	movk	x11, #0x3886, lsl #16
   87fa8:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   87fac:	5290a3ed 	mov	w13, #0x851f                	// #34079
   87fb0:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   87fb4:	aa1f03ea 	mov	x10, xzr
   87fb8:	f2e68dab 	movk	x11, #0x346d, lsl #48
   87fbc:	5284e20c 	mov	w12, #0x2710                	// #10000
   87fc0:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
   87fc4:	52800c8e 	mov	w14, #0x64                  	// #100
   87fc8:	910023ef 	add	x15, sp, #0x8
   87fcc:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   87fd0:	aa0903f1 	mov	x17, x9
   87fd4:	9bcb7d29 	umulh	x9, x9, x11
   87fd8:	d34bfd29 	lsr	x9, x9, #11
   87fdc:	1b0cc532 	msub	w18, w9, w12, w17
   87fe0:	12003e41 	and	w1, w18, #0xffff
   87fe4:	9bad7c21 	umull	x1, w1, w13
   87fe8:	d365fc21 	lsr	x1, x1, #37
   87fec:	78617902 	ldrh	w2, [x8, x1, lsl #1]
   87ff0:	1b0ec832 	msub	w18, w1, w14, w18
   87ff4:	8b0a01e1 	add	x1, x15, x10
   87ff8:	92403e52 	and	x18, x18, #0xffff
   87ffc:	78023022 	sturh	w2, [x1, #35]
   88000:	78727912 	ldrh	w18, [x8, x18, lsl #1]
   88004:	eb10023f 	cmp	x17, x16
   88008:	d100114a 	sub	x10, x10, #0x4
   8800c:	78025032 	sturh	w18, [x1, #37]
   88010:	54fffe08 	b.hi	87fd0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0x54>  // b.pmore
   88014:	91009d4a 	add	x10, x10, #0x27
   88018:	f1018d3f 	cmp	x9, #0x63
   8801c:	540000a8 	b.hi	88030 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0xb4>  // b.pmore
   88020:	14000011 	b	88064 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0xe8>
   88024:	528004ea 	mov	w10, #0x27                  	// #39
   88028:	f1018d3f 	cmp	x9, #0x63
   8802c:	540001c9 	b.ls	88064 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0xe8>  // b.plast
   88030:	5290a3ec 	mov	w12, #0x851f                	// #34079
   88034:	12003d2b 	and	w11, w9, #0xffff
   88038:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   8803c:	9bac7d6b 	umull	x11, w11, w12
   88040:	d365fd6b 	lsr	x11, x11, #37
   88044:	52800c8c 	mov	w12, #0x64                  	// #100
   88048:	1b0ca569 	msub	w9, w11, w12, w9
   8804c:	92403d29 	and	x9, x9, #0xffff
   88050:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   88054:	d100094a 	sub	x10, x10, #0x2
   88058:	910023ec 	add	x12, sp, #0x8
   8805c:	782a6989 	strh	w9, [x12, x10]
   88060:	aa0b03e9 	mov	x9, x11
   88064:	f100293f 	cmp	x9, #0xa
   88068:	540000ca 	b.ge	88080 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0x104>  // b.tcont
   8806c:	d1000548 	sub	x8, x10, #0x1
   88070:	1100c129 	add	w9, w9, #0x30
   88074:	910023ea 	add	x10, sp, #0x8
   88078:	38286949 	strb	w9, [x10, x8]
   8807c:	14000005 	b	88090 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0x114>
   88080:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   88084:	d1000948 	sub	x8, x10, #0x2
   88088:	910023ea 	add	x10, sp, #0x8
   8808c:	78286949 	strh	w9, [x10, x8]
   88090:	910023e9 	add	x9, sp, #0x8
   88094:	528004ea 	mov	w10, #0x27                  	// #39
   88098:	d0000002 	adrp	x2, 8a000 <memmove>
   8809c:	8b080124 	add	x4, x9, x8
   880a0:	cb080145 	sub	x5, x10, x8
   880a4:	913fd042 	add	x2, x2, #0xff4
   880a8:	52800021 	mov	w1, #0x1                   	// #1
   880ac:	aa1f03e3 	mov	x3, xzr
   880b0:	94000311 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   880b4:	f9401bfe 	ldr	x30, [sp, #48]
   880b8:	910103ff 	add	sp, sp, #0x40
   880bc:	d65f03c0 	ret

00000000000880c0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E>:
   880c0:	d10103ff 	sub	sp, sp, #0x40
   880c4:	f9001bfe 	str	x30, [sp, #48]
   880c8:	f9400009 	ldr	x9, [x0]
   880cc:	b0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   880d0:	f9472108 	ldr	x8, [x8, #3648]
   880d4:	aa0103e0 	mov	x0, x1
   880d8:	d344fd2a 	lsr	x10, x9, #4
   880dc:	f109c55f 	cmp	x10, #0x271
   880e0:	54000443 	b.cc	88168 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0xa8>  // b.lo, b.ul, b.last
   880e4:	d28b296b 	mov	x11, #0x594b                	// #22859
   880e8:	f2a710cb 	movk	x11, #0x3886, lsl #16
   880ec:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   880f0:	5290a3ed 	mov	w13, #0x851f                	// #34079
   880f4:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   880f8:	aa1f03ea 	mov	x10, xzr
   880fc:	f2e68dab 	movk	x11, #0x346d, lsl #48
   88100:	5284e20c 	mov	w12, #0x2710                	// #10000
   88104:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
   88108:	52800c8e 	mov	w14, #0x64                  	// #100
   8810c:	910023ef 	add	x15, sp, #0x8
   88110:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   88114:	aa0903f1 	mov	x17, x9
   88118:	9bcb7d29 	umulh	x9, x9, x11
   8811c:	d34bfd29 	lsr	x9, x9, #11
   88120:	1b0cc532 	msub	w18, w9, w12, w17
   88124:	12003e41 	and	w1, w18, #0xffff
   88128:	9bad7c21 	umull	x1, w1, w13
   8812c:	d365fc21 	lsr	x1, x1, #37
   88130:	78617902 	ldrh	w2, [x8, x1, lsl #1]
   88134:	1b0ec832 	msub	w18, w1, w14, w18
   88138:	8b0a01e1 	add	x1, x15, x10
   8813c:	92403e52 	and	x18, x18, #0xffff
   88140:	78023022 	sturh	w2, [x1, #35]
   88144:	78727912 	ldrh	w18, [x8, x18, lsl #1]
   88148:	eb10023f 	cmp	x17, x16
   8814c:	d100114a 	sub	x10, x10, #0x4
   88150:	78025032 	sturh	w18, [x1, #37]
   88154:	54fffe08 	b.hi	88114 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0x54>  // b.pmore
   88158:	91009d4a 	add	x10, x10, #0x27
   8815c:	f1018d3f 	cmp	x9, #0x63
   88160:	540000ac 	b.gt	88174 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0xb4>
   88164:	14000011 	b	881a8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0xe8>
   88168:	528004ea 	mov	w10, #0x27                  	// #39
   8816c:	f1018d3f 	cmp	x9, #0x63
   88170:	540001cd 	b.le	881a8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0xe8>
   88174:	5290a3ec 	mov	w12, #0x851f                	// #34079
   88178:	12003d2b 	and	w11, w9, #0xffff
   8817c:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   88180:	9bac7d6b 	umull	x11, w11, w12
   88184:	d365fd6b 	lsr	x11, x11, #37
   88188:	52800c8c 	mov	w12, #0x64                  	// #100
   8818c:	1b0ca569 	msub	w9, w11, w12, w9
   88190:	92403d29 	and	x9, x9, #0xffff
   88194:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   88198:	d100094a 	sub	x10, x10, #0x2
   8819c:	910023ec 	add	x12, sp, #0x8
   881a0:	782a6989 	strh	w9, [x12, x10]
   881a4:	aa0b03e9 	mov	x9, x11
   881a8:	f100293f 	cmp	x9, #0xa
   881ac:	540000ca 	b.ge	881c4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0x104>  // b.tcont
   881b0:	d1000548 	sub	x8, x10, #0x1
   881b4:	1100c129 	add	w9, w9, #0x30
   881b8:	910023ea 	add	x10, sp, #0x8
   881bc:	38286949 	strb	w9, [x10, x8]
   881c0:	14000005 	b	881d4 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hd5aecdcee7d35043E+0x114>
   881c4:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   881c8:	d1000948 	sub	x8, x10, #0x2
   881cc:	910023ea 	add	x10, sp, #0x8
   881d0:	78286949 	strh	w9, [x10, x8]
   881d4:	910023e9 	add	x9, sp, #0x8
   881d8:	528004ea 	mov	w10, #0x27                  	// #39
   881dc:	d0000002 	adrp	x2, 8a000 <memmove>
   881e0:	8b080124 	add	x4, x9, x8
   881e4:	cb080145 	sub	x5, x10, x8
   881e8:	913fd042 	add	x2, x2, #0xff4
   881ec:	52800021 	mov	w1, #0x1                   	// #1
   881f0:	aa1f03e3 	mov	x3, xzr
   881f4:	940002c0 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   881f8:	f9401bfe 	ldr	x30, [sp, #48]
   881fc:	910103ff 	add	sp, sp, #0x40
   88200:	d65f03c0 	ret

0000000000088204 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE>:
   88204:	d10383ff 	sub	sp, sp, #0xe0
   88208:	f9006bfe 	str	x30, [sp, #208]
   8820c:	f104043f 	cmp	x1, #0x101
   88210:	a9008fe2 	stp	x2, x3, [sp, #8]
   88214:	54000082 	b.cs	88224 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x20>  // b.hs, b.nlast
   88218:	52800029 	mov	w9, #0x1                   	// #1
   8821c:	aa0103e8 	mov	x8, x1
   88220:	14000015 	b	88274 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x70>
   88224:	aa1f03e8 	mov	x8, xzr
   88228:	91040009 	add	x9, x0, #0x100
   8822c:	d103fc2a 	sub	x10, x1, #0xff
   88230:	9104010b 	add	x11, x8, #0x100
   88234:	eb01017f 	cmp	x11, x1
   88238:	54000082 	b.cs	88248 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x44>  // b.hs, b.nlast
   8823c:	38e8692b 	ldrsb	w11, [x9, x8]
   88240:	3101057f 	cmn	w11, #0x41
   88244:	5400014c 	b.gt	8826c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x68>
   88248:	b103fd1f 	cmn	x8, #0xff
   8824c:	d100050b 	sub	x11, x8, #0x1
   88250:	54000080 	b.eq	88260 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x5c>  // b.none
   88254:	eb08015f 	cmp	x10, x8
   88258:	aa0b03e8 	mov	x8, x11
   8825c:	54fffea1 	b.ne	88230 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x2c>  // b.any
   88260:	2a1f03e9 	mov	w9, wzr
   88264:	91040168 	add	x8, x11, #0x100
   88268:	14000003 	b	88274 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x70>
   8826c:	2a1f03e9 	mov	w9, wzr
   88270:	91040108 	add	x8, x8, #0x100
   88274:	a901a3e0 	stp	x0, x8, [sp, #24]
   88278:	f0000008 	adrp	x8, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   8827c:	f000000a 	adrp	x10, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88280:	91049508 	add	x8, x8, #0x125
   88284:	9104a94a 	add	x10, x10, #0x12a
   88288:	7100013f 	cmp	w9, #0x0
   8828c:	528000a9 	mov	w9, #0x5                   	// #5
   88290:	9a881148 	csel	x8, x10, x8, ne  // ne = any
   88294:	9a8913e9 	csel	x9, xzr, x9, ne  // ne = any
   88298:	eb01005f 	cmp	x2, x1
   8829c:	a902a7e8 	stp	x8, x9, [sp, #40]
   882a0:	54001168 	b.hi	884cc <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x2c8>  // b.pmore
   882a4:	eb01007f 	cmp	x3, x1
   882a8:	54001128 	b.hi	884cc <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x2c8>  // b.pmore
   882ac:	eb03005f 	cmp	x2, x3
   882b0:	54001408 	b.hi	88530 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x32c>  // b.pmore
   882b4:	b40000e2 	cbz	x2, 882d0 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0xcc>
   882b8:	eb02003f 	cmp	x1, x2
   882bc:	540000a0 	b.eq	882d0 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0xcc>  // b.none
   882c0:	540000a9 	b.ls	882d4 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0xd0>  // b.plast
   882c4:	38e26808 	ldrsb	w8, [x0, x2]
   882c8:	3101011f 	cmn	w8, #0x40
   882cc:	5400004b 	b.lt	882d4 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0xd0>  // b.tstop
   882d0:	aa0303e2 	mov	x2, x3
   882d4:	f9001fe2 	str	x2, [sp, #56]
   882d8:	b40001e2 	cbz	x2, 88314 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x110>
   882dc:	eb01005f 	cmp	x2, x1
   882e0:	540001a0 	b.eq	88314 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x110>  // b.none
   882e4:	91000429 	add	x9, x1, #0x1
   882e8:	eb01005f 	cmp	x2, x1
   882ec:	54000082 	b.cs	882fc <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0xf8>  // b.hs, b.nlast
   882f0:	38e26808 	ldrsb	w8, [x0, x2]
   882f4:	3101011f 	cmn	w8, #0x40
   882f8:	540000ea 	b.ge	88314 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x110>  // b.tcont
   882fc:	f1000448 	subs	x8, x2, #0x1
   88300:	540000c0 	b.eq	88318 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x114>  // b.none
   88304:	eb02013f 	cmp	x9, x2
   88308:	aa0803e2 	mov	x2, x8
   8830c:	54fffee1 	b.ne	882e8 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0xe4>  // b.any
   88310:	14000002 	b	88318 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x114>
   88314:	aa0203e8 	mov	x8, x2
   88318:	eb01011f 	cmp	x8, x1
   8831c:	54000101 	b.ne	8833c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x138>  // b.any
   88320:	f0000000 	adrp	x0, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88324:	b0000022 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   88328:	91008400 	add	x0, x0, #0x21
   8832c:	91396042 	add	x2, x2, #0xe58
   88330:	52800561 	mov	w1, #0x2b                  	// #43
   88334:	940006a1 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   88338:	d4200020 	brk	#0x1
   8833c:	8b080009 	add	x9, x0, x8
   88340:	aa0903ec 	mov	x12, x9
   88344:	38c0158b 	ldrsb	w11, [x12], #1
   88348:	12001d6a 	and	w10, w11, #0xff
   8834c:	37f8008b 	tbnz	w11, #31, 8835c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x158>
   88350:	b900dfea 	str	w10, [sp, #220]
   88354:	52800029 	mov	w9, #0x1                   	// #1
   88358:	1400003d 	b	8844c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x248>
   8835c:	8b01000b 	add	x11, x0, x1
   88360:	eb0b019f 	cmp	x12, x11
   88364:	54000161 	b.ne	88390 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x18c>  // b.any
   88368:	2a1f03e9 	mov	w9, wzr
   8836c:	aa0b03ed 	mov	x13, x11
   88370:	71037d5f 	cmp	w10, #0xdf
   88374:	1200114c 	and	w12, w10, #0x1f
   88378:	54000188 	b.hi	883a8 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x1a4>  // b.pmore
   8837c:	331a1189 	bfi	w9, w12, #6, #5
   88380:	7102013f 	cmp	w9, #0x80
   88384:	b900dfe9 	str	w9, [sp, #220]
   88388:	54000503 	b.cc	88428 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x224>  // b.lo, b.ul, b.last
   8838c:	14000029 	b	88430 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x22c>
   88390:	3940052c 	ldrb	w12, [x9, #1]
   88394:	9100092d 	add	x13, x9, #0x2
   88398:	12001589 	and	w9, w12, #0x3f
   8839c:	71037d5f 	cmp	w10, #0xdf
   883a0:	1200114c 	and	w12, w10, #0x1f
   883a4:	54fffec9 	b.ls	8837c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x178>  // b.plast
   883a8:	eb0b01bf 	cmp	x13, x11
   883ac:	54000181 	b.ne	883dc <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x1d8>  // b.any
   883b0:	2a1f03ee 	mov	w14, wzr
   883b4:	aa0b03ed 	mov	x13, x11
   883b8:	7103c15f 	cmp	w10, #0xf0
   883bc:	331a152e 	bfi	w14, w9, #6, #6
   883c0:	54000182 	b.cs	883f0 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x1ec>  // b.hs, b.nlast
   883c4:	3314118e 	bfi	w14, w12, #12, #5
   883c8:	2a0e03e9 	mov	w9, w14
   883cc:	7102013f 	cmp	w9, #0x80
   883d0:	b900dfe9 	str	w9, [sp, #220]
   883d4:	540002a3 	b.cc	88428 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x224>  // b.lo, b.ul, b.last
   883d8:	14000016 	b	88430 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x22c>
   883dc:	384015ae 	ldrb	w14, [x13], #1
   883e0:	120015ce 	and	w14, w14, #0x3f
   883e4:	7103c15f 	cmp	w10, #0xf0
   883e8:	331a152e 	bfi	w14, w9, #6, #6
   883ec:	54fffec3 	b.cc	883c4 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x1c0>  // b.lo, b.ul, b.last
   883f0:	eb0b01bf 	cmp	x13, x11
   883f4:	54000061 	b.ne	88400 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x1fc>  // b.any
   883f8:	2a1f03e9 	mov	w9, wzr
   883fc:	14000003 	b	88408 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x204>
   88400:	394001a9 	ldrb	w9, [x13]
   88404:	12001529 	and	w9, w9, #0x3f
   88408:	530e098a 	ubfiz	w10, w12, #18, #3
   8840c:	331a2dca 	bfi	w10, w14, #6, #12
   88410:	2a090149 	orr	w9, w10, w9
   88414:	7144413f 	cmp	w9, #0x110, lsl #12
   88418:	54fff840 	b.eq	88320 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x11c>  // b.none
   8841c:	7102013f 	cmp	w9, #0x80
   88420:	b900dfe9 	str	w9, [sp, #220]
   88424:	54000062 	b.cs	88430 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x22c>  // b.hs, b.nlast
   88428:	52800029 	mov	w9, #0x1                   	// #1
   8842c:	14000008 	b	8844c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x248>
   88430:	7120013f 	cmp	w9, #0x800
   88434:	54000062 	b.cs	88440 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x23c>  // b.hs, b.nlast
   88438:	52800049 	mov	w9, #0x2                   	// #2
   8843c:	14000004 	b	8844c <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE+0x248>
   88440:	7140413f 	cmp	w9, #0x10, lsl #12
   88444:	52800069 	mov	w9, #0x3                   	// #3
   88448:	9a893529 	cinc	x9, x9, cs  // cs = hs, nlast
   8844c:	d000002b 	adrp	x11, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88450:	f944496b 	ldr	x11, [x11, #2192]
   88454:	8b080129 	add	x9, x9, x8
   88458:	9100e3ea 	add	x10, sp, #0x38
   8845c:	d000002d 	adrp	x13, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88460:	f94469ad 	ldr	x13, [x13, #2256]
   88464:	a90427e8 	stp	x8, x9, [sp, #64]
   88468:	f0ffffe8 	adrp	x8, 87000 <ifinished+0x20>
   8846c:	a9082fea 	stp	x10, x11, [sp, #128]
   88470:	b000000a 	adrp	x10, 89000 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x30c>
   88474:	910103ee 	add	x14, sp, #0x40
   88478:	912ae108 	add	x8, x8, #0xab8
   8847c:	910063e9 	add	x9, sp, #0x18
   88480:	9136914a 	add	x10, x10, #0xda4
   88484:	a90a23ee 	stp	x14, x8, [sp, #160]
   88488:	9100a3e8 	add	x8, sp, #0x28
   8848c:	a90b2be9 	stp	x9, x10, [sp, #176]
   88490:	b0000029 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   88494:	913c4129 	add	x9, x9, #0xf10
   88498:	a90c2be8 	stp	x8, x10, [sp, #192]
   8849c:	528000a8 	mov	w8, #0x5                   	// #5
   884a0:	910373ec 	add	x12, sp, #0xdc
   884a4:	a90523e9 	stp	x9, x8, [sp, #80]
   884a8:	910203e9 	add	x9, sp, #0x80
   884ac:	b0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   884b0:	a90937ec 	stp	x12, x13, [sp, #144]
   884b4:	a9067fff 	stp	xzr, xzr, [sp, #96]
   884b8:	a90723e9 	stp	x9, x8, [sp, #112]
   884bc:	913d8021 	add	x1, x1, #0xf60
   884c0:	910143e0 	add	x0, sp, #0x50
   884c4:	9400065f 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   884c8:	d4200020 	brk	#0x1
   884cc:	d0000029 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   884d0:	f9444929 	ldr	x9, [x9, #2192]
   884d4:	910103e8 	add	x8, sp, #0x40
   884d8:	b000000c 	adrp	x12, 89000 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x30c>
   884dc:	9136918c 	add	x12, x12, #0xda4
   884e0:	a90827e8 	stp	x8, x9, [sp, #128]
   884e4:	9100a3e8 	add	x8, sp, #0x28
   884e8:	b0000029 	adrp	x9, 8d000 <GCC_except_table3+0xa5c>
   884ec:	eb01005f 	cmp	x2, x1
   884f0:	9139c129 	add	x9, x9, #0xe70
   884f4:	a90a33e8 	stp	x8, x12, [sp, #160]
   884f8:	52800068 	mov	w8, #0x3                   	// #3
   884fc:	b0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   88500:	910063ea 	add	x10, sp, #0x18
   88504:	9a83804b 	csel	x11, x2, x3, hi  // hi = pmore
   88508:	a90523e9 	stp	x9, x8, [sp, #80]
   8850c:	910203e9 	add	x9, sp, #0x80
   88510:	913a8021 	add	x1, x1, #0xea0
   88514:	a90933ea 	stp	x10, x12, [sp, #144]
   88518:	a9067fff 	stp	xzr, xzr, [sp, #96]
   8851c:	f90023eb 	str	x11, [sp, #64]
   88520:	a90723e9 	stp	x9, x8, [sp, #112]
   88524:	910143e0 	add	x0, sp, #0x50
   88528:	94000646 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   8852c:	d4200020 	brk	#0x1
   88530:	d0000029 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88534:	f9444929 	ldr	x9, [x9, #2192]
   88538:	910023e8 	add	x8, sp, #0x8
   8853c:	910043ea 	add	x10, sp, #0x10
   88540:	910063eb 	add	x11, sp, #0x18
   88544:	a90827e8 	stp	x8, x9, [sp, #128]
   88548:	b0000008 	adrp	x8, 89000 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x30c>
   8854c:	91369108 	add	x8, x8, #0xda4
   88550:	a90927ea 	stp	x10, x9, [sp, #144]
   88554:	9100a3e9 	add	x9, sp, #0x28
   88558:	b000002a 	adrp	x10, 8d000 <GCC_except_table3+0xa5c>
   8855c:	a90a23eb 	stp	x11, x8, [sp, #160]
   88560:	913ae14a 	add	x10, x10, #0xeb8
   88564:	a90b23e9 	stp	x9, x8, [sp, #176]
   88568:	52800088 	mov	w8, #0x4                   	// #4
   8856c:	910203e9 	add	x9, sp, #0x80
   88570:	b0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   88574:	a9067fff 	stp	xzr, xzr, [sp, #96]
   88578:	a90523ea 	stp	x10, x8, [sp, #80]
   8857c:	a90723e9 	stp	x9, x8, [sp, #112]
   88580:	913be021 	add	x1, x1, #0xef8
   88584:	910143e0 	add	x0, sp, #0x50
   88588:	9400062e 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   8858c:	d4200020 	brk	#0x1

0000000000088590 <_ZN4core6result13unwrap_failed17hfed3e99faf88cc75E>:
   88590:	a9b807e0 	stp	x0, x1, [sp, #-128]!
   88594:	b0000009 	adrp	x9, 89000 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x30c>
   88598:	910003e8 	mov	x8, sp
   8859c:	91369129 	add	x9, x9, #0xda4
   885a0:	b000000b 	adrp	x11, 89000 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x30c>
   885a4:	b000002c 	adrp	x12, 8d000 <GCC_except_table3+0xa5c>
   885a8:	b0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   885ac:	910043ea 	add	x10, sp, #0x10
   885b0:	9136616b 	add	x11, x11, #0xd98
   885b4:	913e418c 	add	x12, x12, #0xf90
   885b8:	5280004d 	mov	w13, #0x2                   	// #2
   885bc:	a90527e8 	stp	x8, x9, [sp, #80]
   885c0:	910143e8 	add	x8, sp, #0x50
   885c4:	913ec021 	add	x1, x1, #0xfb0
   885c8:	910083e0 	add	x0, sp, #0x20
   885cc:	a9010fe2 	stp	x2, x3, [sp, #16]
   885d0:	a9037fff 	stp	xzr, xzr, [sp, #48]
   885d4:	a906fbeb 	stp	x11, x30, [sp, #104]
   885d8:	f90033ea 	str	x10, [sp, #96]
   885dc:	a90237ec 	stp	x12, x13, [sp, #32]
   885e0:	a90437e8 	stp	x8, x13, [sp, #64]
   885e4:	94000617 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   885e8:	d4200020 	brk	#0x1

00000000000885ec <_ZN4core5slice20slice_index_len_fail17hb8f8be31125a5e48E>:
   885ec:	d101c3ff 	sub	sp, sp, #0x70
   885f0:	a90607fe 	stp	x30, x1, [sp, #96]
   885f4:	f90007e0 	str	x0, [sp, #8]
   885f8:	d0000029 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   885fc:	f9444929 	ldr	x9, [x9, #2192]
   88600:	910023e8 	add	x8, sp, #0x8
   88604:	9101a3ea 	add	x10, sp, #0x68
   88608:	b0000021 	adrp	x1, 8d000 <GCC_except_table3+0xa5c>
   8860c:	a90427e8 	stp	x8, x9, [sp, #64]
   88610:	b0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   88614:	913f2108 	add	x8, x8, #0xfc8
   88618:	a90527ea 	stp	x10, x9, [sp, #80]
   8861c:	52800049 	mov	w9, #0x2                   	// #2
   88620:	a90127e8 	stp	x8, x9, [sp, #16]
   88624:	910103e8 	add	x8, sp, #0x40
   88628:	913fa021 	add	x1, x1, #0xfe8
   8862c:	910043e0 	add	x0, sp, #0x10
   88630:	a9027fff 	stp	xzr, xzr, [sp, #32]
   88634:	a90327e8 	stp	x8, x9, [sp, #48]
   88638:	94000602 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   8863c:	d4200020 	brk	#0x1

0000000000088640 <_ZN4core5slice22slice_index_order_fail17hc28cc47052966335E>:
   88640:	d101c3ff 	sub	sp, sp, #0x70
   88644:	a90607fe 	stp	x30, x1, [sp, #96]
   88648:	f90007e0 	str	x0, [sp, #8]
   8864c:	d0000029 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88650:	f9444929 	ldr	x9, [x9, #2192]
   88654:	910023e8 	add	x8, sp, #0x8
   88658:	9101a3ea 	add	x10, sp, #0x68
   8865c:	d0000021 	adrp	x1, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88660:	a90427e8 	stp	x8, x9, [sp, #64]
   88664:	d0000028 	adrp	x8, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88668:	91000108 	add	x8, x8, #0x0
   8866c:	a90527ea 	stp	x10, x9, [sp, #80]
   88670:	52800049 	mov	w9, #0x2                   	// #2
   88674:	a90127e8 	stp	x8, x9, [sp, #16]
   88678:	910103e8 	add	x8, sp, #0x40
   8867c:	91008021 	add	x1, x1, #0x20
   88680:	910043e0 	add	x0, sp, #0x10
   88684:	a9027fff 	stp	xzr, xzr, [sp, #32]
   88688:	a90327e8 	stp	x8, x9, [sp, #48]
   8868c:	940005ed 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   88690:	d4200020 	brk	#0x1

0000000000088694 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393>:
   88694:	f81f0ffe 	str	x30, [sp, #-16]!
   88698:	b4000322 	cbz	x2, 886fc <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x68>
   8869c:	aa1f03e9 	mov	x9, xzr
   886a0:	8b02042a 	add	x10, x1, x2, lsl #1
   886a4:	39400028 	ldrb	w8, [x1]
   886a8:	3940042b 	ldrb	w11, [x1, #1]
   886ac:	12181c0c 	and	w12, w0, #0xff00
   886b0:	91000821 	add	x1, x1, #0x2
   886b4:	6b4c211f 	cmp	w8, w12, lsr #8
   886b8:	8b0b0128 	add	x8, x9, x11
   886bc:	54000181 	b.ne	886ec <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x58>  // b.any
   886c0:	eb09011f 	cmp	x8, x9
   886c4:	54000723 	b.cc	887a8 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x114>  // b.lo, b.ul, b.last
   886c8:	eb04011f 	cmp	x8, x4
   886cc:	54000768 	b.hi	887b8 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x124>  // b.pmore
   886d0:	8b090069 	add	x9, x3, x9
   886d4:	b40000eb 	cbz	x11, 886f0 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x5c>
   886d8:	3840152c 	ldrb	w12, [x9], #1
   886dc:	d100056b 	sub	x11, x11, #0x1
   886e0:	6b20019f 	cmp	w12, w0, uxtb
   886e4:	54ffff81 	b.ne	886d4 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x40>  // b.any
   886e8:	14000021 	b	8876c <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0xd8>
   886ec:	54000088 	b.hi	886fc <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x68>  // b.pmore
   886f0:	eb0a003f 	cmp	x1, x10
   886f4:	aa0803e9 	mov	x9, x8
   886f8:	54fffd61 	b.ne	886a4 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x10>  // b.any
   886fc:	b4000406 	cbz	x6, 8877c <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0xe8>
   88700:	8b0600a9 	add	x9, x5, x6
   88704:	910004ab 	add	x11, x5, #0x1
   88708:	12003c0a 	and	w10, w0, #0xffff
   8870c:	52800028 	mov	w8, #0x1                   	// #1
   88710:	39c000ad 	ldrsb	w13, [x5]
   88714:	12001dac 	and	w12, w13, #0xff
   88718:	37f800ad 	tbnz	w13, #31, 8872c <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x98>
   8871c:	aa0b03e5 	mov	x5, x11
   88720:	6b0c014a 	subs	w10, w10, w12
   88724:	54000165 	b.pl	88750 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0xbc>  // b.nfrst
   88728:	1400000e 	b	88760 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0xcc>
   8872c:	eb09017f 	cmp	x11, x9
   88730:	540002e0 	b.eq	8878c <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0xf8>  // b.none
   88734:	3840156d 	ldrb	w13, [x11], #1
   88738:	1200198c 	and	w12, w12, #0x7f
   8873c:	3318198d 	bfi	w13, w12, #8, #7
   88740:	aa0b03e5 	mov	x5, x11
   88744:	2a0d03ec 	mov	w12, w13
   88748:	6b0c014a 	subs	w10, w10, w12
   8874c:	540000a4 	b.mi	88760 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0xcc>  // b.first
   88750:	52000108 	eor	w8, w8, #0x1
   88754:	eb0900bf 	cmp	x5, x9
   88758:	910004ab 	add	x11, x5, #0x1
   8875c:	54fffda1 	b.ne	88710 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393+0x7c>  // b.any
   88760:	12000100 	and	w0, w8, #0x1
   88764:	f84107fe 	ldr	x30, [sp], #16
   88768:	d65f03c0 	ret
   8876c:	2a1f03e8 	mov	w8, wzr
   88770:	12000100 	and	w0, w8, #0x1
   88774:	f84107fe 	ldr	x30, [sp], #16
   88778:	d65f03c0 	ret
   8877c:	52800028 	mov	w8, #0x1                   	// #1
   88780:	12000100 	and	w0, w8, #0x1
   88784:	f84107fe 	ldr	x30, [sp], #16
   88788:	d65f03c0 	ret
   8878c:	f0000000 	adrp	x0, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88790:	b0000022 	adrp	x2, 8d000 <GCC_except_table3+0xa5c>
   88794:	9106a400 	add	x0, x0, #0x1a9
   88798:	913de042 	add	x2, x2, #0xf78
   8879c:	52800561 	mov	w1, #0x2b                  	// #43
   887a0:	94000586 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   887a4:	d4200020 	brk	#0x1
   887a8:	aa0903e0 	mov	x0, x9
   887ac:	aa0803e1 	mov	x1, x8
   887b0:	97ffffa4 	bl	88640 <_ZN4core5slice22slice_index_order_fail17hc28cc47052966335E>
   887b4:	d4200020 	brk	#0x1
   887b8:	aa0803e0 	mov	x0, x8
   887bc:	aa0403e1 	mov	x1, x4
   887c0:	97ffff8b 	bl	885ec <_ZN4core5slice20slice_index_len_fail17hb8f8be31125a5e48E>
   887c4:	d4200020 	brk	#0x1

00000000000887c8 <_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17h79c5f61e1ede7911E>:
   887c8:	f81f0ffe 	str	x30, [sp, #-16]!
   887cc:	a9402408 	ldp	x8, x9, [x0]
   887d0:	f940080a 	ldr	x10, [x0, #16]
   887d4:	a9400500 	ldp	x0, x1, [x8]
   887d8:	f9400122 	ldr	x2, [x9]
   887dc:	f9400143 	ldr	x3, [x10]
   887e0:	97fffe89 	bl	88204 <_ZN4core3str16slice_error_fail17h425dbdac94e61d3eE>
   887e4:	d4200020 	brk	#0x1

00000000000887e8 <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052>:
   887e8:	d10103ff 	sub	sp, sp, #0x40
   887ec:	f9001bfe 	str	x30, [sp, #48]
   887f0:	f9400009 	ldr	x9, [x0]
   887f4:	b0000028 	adrp	x8, 8d000 <GCC_except_table3+0xa5c>
   887f8:	f9472108 	ldr	x8, [x8, #3648]
   887fc:	aa0103e0 	mov	x0, x1
   88800:	d344fd2a 	lsr	x10, x9, #4
   88804:	f109c55f 	cmp	x10, #0x271
   88808:	54000443 	b.cc	88890 <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0xa8>  // b.lo, b.ul, b.last
   8880c:	d28b296b 	mov	x11, #0x594b                	// #22859
   88810:	f2a710cb 	movk	x11, #0x3886, lsl #16
   88814:	f2d8bacb 	movk	x11, #0xc5d6, lsl #32
   88818:	5290a3ed 	mov	w13, #0x851f                	// #34079
   8881c:	529c1ff0 	mov	w16, #0xe0ff                	// #57599
   88820:	aa1f03ea 	mov	x10, xzr
   88824:	f2e68dab 	movk	x11, #0x346d, lsl #48
   88828:	5284e20c 	mov	w12, #0x2710                	// #10000
   8882c:	72aa3d6d 	movk	w13, #0x51eb, lsl #16
   88830:	52800c8e 	mov	w14, #0x64                  	// #100
   88834:	910023ef 	add	x15, sp, #0x8
   88838:	72a0beb0 	movk	w16, #0x5f5, lsl #16
   8883c:	aa0903f1 	mov	x17, x9
   88840:	9bcb7d29 	umulh	x9, x9, x11
   88844:	d34bfd29 	lsr	x9, x9, #11
   88848:	1b0cc532 	msub	w18, w9, w12, w17
   8884c:	12003e41 	and	w1, w18, #0xffff
   88850:	9bad7c21 	umull	x1, w1, w13
   88854:	d365fc21 	lsr	x1, x1, #37
   88858:	78617902 	ldrh	w2, [x8, x1, lsl #1]
   8885c:	1b0ec832 	msub	w18, w1, w14, w18
   88860:	8b0a01e1 	add	x1, x15, x10
   88864:	92403e52 	and	x18, x18, #0xffff
   88868:	78023022 	sturh	w2, [x1, #35]
   8886c:	78727912 	ldrh	w18, [x8, x18, lsl #1]
   88870:	eb10023f 	cmp	x17, x16
   88874:	d100114a 	sub	x10, x10, #0x4
   88878:	78025032 	sturh	w18, [x1, #37]
   8887c:	54fffe08 	b.hi	8883c <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0x54>  // b.pmore
   88880:	91009d4a 	add	x10, x10, #0x27
   88884:	f1018d3f 	cmp	x9, #0x63
   88888:	540000ac 	b.gt	8889c <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0xb4>
   8888c:	14000011 	b	888d0 <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0xe8>
   88890:	528004ea 	mov	w10, #0x27                  	// #39
   88894:	f1018d3f 	cmp	x9, #0x63
   88898:	540001cd 	b.le	888d0 <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0xe8>
   8889c:	5290a3ec 	mov	w12, #0x851f                	// #34079
   888a0:	12003d2b 	and	w11, w9, #0xffff
   888a4:	72aa3d6c 	movk	w12, #0x51eb, lsl #16
   888a8:	9bac7d6b 	umull	x11, w11, w12
   888ac:	d365fd6b 	lsr	x11, x11, #37
   888b0:	52800c8c 	mov	w12, #0x64                  	// #100
   888b4:	1b0ca569 	msub	w9, w11, w12, w9
   888b8:	92403d29 	and	x9, x9, #0xffff
   888bc:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   888c0:	d100094a 	sub	x10, x10, #0x2
   888c4:	910023ec 	add	x12, sp, #0x8
   888c8:	782a6989 	strh	w9, [x12, x10]
   888cc:	aa0b03e9 	mov	x9, x11
   888d0:	f100293f 	cmp	x9, #0xa
   888d4:	540000ca 	b.ge	888ec <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0x104>  // b.tcont
   888d8:	d1000548 	sub	x8, x10, #0x1
   888dc:	1100c129 	add	w9, w9, #0x30
   888e0:	910023ea 	add	x10, sp, #0x8
   888e4:	38286949 	strb	w9, [x10, x8]
   888e8:	14000005 	b	888fc <_ZN4core3fmt10ArgumentV110show_usize17ha1e84bcb02156c3cE.llvm.8388827262579940052+0x114>
   888ec:	78697909 	ldrh	w9, [x8, x9, lsl #1]
   888f0:	d1000948 	sub	x8, x10, #0x2
   888f4:	910023ea 	add	x10, sp, #0x8
   888f8:	78286949 	strh	w9, [x10, x8]
   888fc:	910023e9 	add	x9, sp, #0x8
   88900:	528004ea 	mov	w10, #0x27                  	// #39
   88904:	d0000002 	adrp	x2, 8a000 <memmove>
   88908:	8b080124 	add	x4, x9, x8
   8890c:	cb080145 	sub	x5, x10, x8
   88910:	913fd042 	add	x2, x2, #0xff4
   88914:	52800021 	mov	w1, #0x1                   	// #1
   88918:	aa1f03e3 	mov	x3, xzr
   8891c:	940000f6 	bl	88cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>
   88920:	f9401bfe 	ldr	x30, [sp, #48]
   88924:	910103ff 	add	sp, sp, #0x40
   88928:	d65f03c0 	ret

000000000008892c <_ZN57_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd2a103fe643b72cE>:
   8892c:	d10103ff 	sub	sp, sp, #0x40
   88930:	f9001bfe 	str	x30, [sp, #48]
   88934:	ad408002 	ldp	q2, q0, [x0, #16]
   88938:	3dc00001 	ldr	q1, [x0]
   8893c:	a9420420 	ldp	x0, x1, [x1, #32]
   88940:	910003e2 	mov	x2, sp
   88944:	ad0083e2 	stp	q2, q0, [sp, #16]
   88948:	3d8003e1 	str	q1, [sp]
   8894c:	94000004 	bl	8895c <_ZN4core3fmt5write17h8a62c0058826f9fdE>
   88950:	f9401bfe 	ldr	x30, [sp, #48]
   88954:	910103ff 	add	sp, sp, #0x40
   88958:	d65f03c0 	ret

000000000008895c <_ZN4core3fmt5write17h8a62c0058826f9fdE>:
   8895c:	d10303ff 	sub	sp, sp, #0xc0
   88960:	f90033fc 	str	x28, [sp, #96]
   88964:	a9076bfb 	stp	x27, x26, [sp, #112]
   88968:	a90863f9 	stp	x25, x24, [sp, #128]
   8896c:	a9095bf7 	stp	x23, x22, [sp, #144]
   88970:	a90a53f5 	stp	x21, x20, [sp, #160]
   88974:	a90b7bf3 	stp	x19, x30, [sp, #176]
   88978:	a9422056 	ldp	x22, x8, [x2, #32]
   8897c:	f0000009 	adrp	x9, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88980:	fd476120 	ldr	d0, [x9, #3776]
   88984:	f9400855 	ldr	x21, [x2, #16]
   88988:	5280006a 	mov	w10, #0x3                   	// #3
   8898c:	8b0812c9 	add	x9, x22, x8, lsl #4
   88990:	f9000bff 	str	xzr, [sp, #16]
   88994:	f90003ff 	str	xzr, [sp]
   88998:	a90207e0 	stp	x0, x1, [sp, #32]
   8899c:	390163ea 	strb	w10, [sp, #88]
   889a0:	a90423f6 	stp	x22, x8, [sp, #64]
   889a4:	a90327f6 	stp	x22, x9, [sp, #48]
   889a8:	fd002be0 	str	d0, [sp, #80]
   889ac:	b4001295 	cbz	x21, 88bfc <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x2a0>
   889b0:	f9400c48 	ldr	x8, [x2, #24]
   889b4:	a9405053 	ldp	x19, x20, [x2]
   889b8:	9240e508 	and	x8, x8, #0x3ffffffffffffff
   889bc:	eb14011f 	cmp	x8, x20
   889c0:	9a888296 	csel	x22, x20, x8, hi  // hi = pmore
   889c4:	b4001536 	cbz	x22, 88c68 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x30c>
   889c8:	a9400a68 	ldp	x8, x2, [x19]
   889cc:	f9400c29 	ldr	x9, [x1, #24]
   889d0:	aa0803e1 	mov	x1, x8
   889d4:	d63f0120 	blr	x9
   889d8:	370015a0 	tbnz	w0, #0, 88c8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x330>
   889dc:	f000001a 	adrp	x26, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   889e0:	f000001b 	adrp	x27, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   889e4:	9000001c 	adrp	x28, 88000 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h91eb9388040862d4E+0x84>
   889e8:	910082b7 	add	x23, x21, #0x20
   889ec:	91006278 	add	x24, x19, #0x18
   889f0:	52800039 	mov	w25, #0x1                   	// #1
   889f4:	913b235a 	add	x26, x26, #0xec8
   889f8:	913b337b 	add	x27, x27, #0xecc
   889fc:	911fa39c 	add	x28, x28, #0x7e8
   88a00:	52800035 	mov	w21, #0x1                   	// #1
   88a04:	394062e8 	ldrb	w8, [x23, #24]
   88a08:	390163e8 	strb	w8, [sp, #88]
   88a0c:	fd400ae0 	ldr	d0, [x23, #16]
   88a10:	0ea00800 	rev64	v0.2s, v0.2s
   88a14:	fd002be0 	str	d0, [sp, #80]
   88a18:	a94006e8 	ldp	x8, x1, [x23]
   88a1c:	100000a9 	adr	x9, 88a30 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0xd4>
   88a20:	38686b4a 	ldrb	w10, [x26, x8]
   88a24:	8b0a0929 	add	x9, x9, x10, lsl #2
   88a28:	aa1f03e8 	mov	x8, xzr
   88a2c:	d61f0120 	br	x9
   88a30:	a90007f9 	stp	x25, x1, [sp]
   88a34:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   88a38:	100000a9 	adr	x9, 88a4c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0xf0>
   88a3c:	38686b6a 	ldrb	w10, [x27, x8]
   88a40:	8b0a0929 	add	x9, x9, x10, lsl #2
   88a44:	aa1f03e8 	mov	x8, xzr
   88a48:	d61f0120 	br	x9
   88a4c:	a94327e8 	ldp	x8, x9, [sp, #48]
   88a50:	eb09011f 	cmp	x8, x9
   88a54:	54000c80 	b.eq	88be4 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x288>  // b.none
   88a58:	91004109 	add	x9, x8, #0x10
   88a5c:	f9001be9 	str	x9, [sp, #48]
   88a60:	f9400509 	ldr	x9, [x8, #8]
   88a64:	eb1c013f 	cmp	x9, x28
   88a68:	54000be1 	b.ne	88be4 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x288>  // b.any
   88a6c:	f9400108 	ldr	x8, [x8]
   88a70:	14000041 	b	88b74 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x218>
   88a74:	f94027e2 	ldr	x2, [sp, #72]
   88a78:	eb01005f 	cmp	x2, x1
   88a7c:	54001269 	b.ls	88cc8 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x36c>  // b.plast
   88a80:	f94023e8 	ldr	x8, [sp, #64]
   88a84:	8b011109 	add	x9, x8, x1, lsl #4
   88a88:	f9400529 	ldr	x9, [x9, #8]
   88a8c:	eb1c013f 	cmp	x9, x28
   88a90:	540004e1 	b.ne	88b2c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x1d0>  // b.any
   88a94:	d37cec29 	lsl	x9, x1, #4
   88a98:	f8696908 	ldr	x8, [x8, x9]
   88a9c:	f9400108 	ldr	x8, [x8]
   88aa0:	a90023f9 	stp	x25, x8, [sp]
   88aa4:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   88aa8:	10fffd29 	adr	x9, 88a4c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0xf0>
   88aac:	38686b6a 	ldrb	w10, [x27, x8]
   88ab0:	8b0a0929 	add	x9, x9, x10, lsl #2
   88ab4:	aa1f03e8 	mov	x8, xzr
   88ab8:	d61f0120 	br	x9
   88abc:	a90107e8 	stp	x8, x1, [sp, #16]
   88ac0:	f85e02e8 	ldur	x8, [x23, #-32]
   88ac4:	f100051f 	cmp	x8, #0x1
   88ac8:	54000621 	b.ne	88b8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x230>  // b.any
   88acc:	f85e82e1 	ldur	x1, [x23, #-24]
   88ad0:	f94027e2 	ldr	x2, [sp, #72]
   88ad4:	eb02003f 	cmp	x1, x2
   88ad8:	54000f02 	b.cs	88cb8 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x35c>  // b.hs, b.nlast
   88adc:	f94023e8 	ldr	x8, [sp, #64]
   88ae0:	8b011108 	add	x8, x8, x1, lsl #4
   88ae4:	1400002f 	b	88ba0 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x244>
   88ae8:	a94327e8 	ldp	x8, x9, [sp, #48]
   88aec:	eb09011f 	cmp	x8, x9
   88af0:	540001e0 	b.eq	88b2c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x1d0>  // b.none
   88af4:	91004109 	add	x9, x8, #0x10
   88af8:	f9001be9 	str	x9, [sp, #48]
   88afc:	f9400509 	ldr	x9, [x8, #8]
   88b00:	eb1c013f 	cmp	x9, x28
   88b04:	54000141 	b.ne	88b2c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x1d0>  // b.any
   88b08:	f9400108 	ldr	x8, [x8]
   88b0c:	f9400108 	ldr	x8, [x8]
   88b10:	a90023f9 	stp	x25, x8, [sp]
   88b14:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   88b18:	10fff9a9 	adr	x9, 88a4c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0xf0>
   88b1c:	38686b6a 	ldrb	w10, [x27, x8]
   88b20:	8b0a0929 	add	x9, x9, x10, lsl #2
   88b24:	aa1f03e8 	mov	x8, xzr
   88b28:	d61f0120 	br	x9
   88b2c:	aa1f03e8 	mov	x8, xzr
   88b30:	a90023e8 	stp	x8, x8, [sp]
   88b34:	a97f06e8 	ldp	x8, x1, [x23, #-16]
   88b38:	10fff8a9 	adr	x9, 88a4c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0xf0>
   88b3c:	38686b6a 	ldrb	w10, [x27, x8]
   88b40:	8b0a0929 	add	x9, x9, x10, lsl #2
   88b44:	aa1f03e8 	mov	x8, xzr
   88b48:	d61f0120 	br	x9
   88b4c:	f94027e2 	ldr	x2, [sp, #72]
   88b50:	eb01005f 	cmp	x2, x1
   88b54:	54000ba9 	b.ls	88cc8 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x36c>  // b.plast
   88b58:	f94023e8 	ldr	x8, [sp, #64]
   88b5c:	8b011109 	add	x9, x8, x1, lsl #4
   88b60:	f9400529 	ldr	x9, [x9, #8]
   88b64:	eb1c013f 	cmp	x9, x28
   88b68:	540003e1 	b.ne	88be4 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x288>  // b.any
   88b6c:	d37cec29 	lsl	x9, x1, #4
   88b70:	f8696908 	ldr	x8, [x8, x9]
   88b74:	f9400101 	ldr	x1, [x8]
   88b78:	52800028 	mov	w8, #0x1                   	// #1
   88b7c:	a90107e8 	stp	x8, x1, [sp, #16]
   88b80:	f85e02e8 	ldur	x8, [x23, #-32]
   88b84:	f100051f 	cmp	x8, #0x1
   88b88:	54fffa20 	b.eq	88acc <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x170>  // b.none
   88b8c:	a94327e8 	ldp	x8, x9, [sp, #48]
   88b90:	eb09011f 	cmp	x8, x9
   88b94:	54000a20 	b.eq	88cd8 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x37c>  // b.none
   88b98:	91004109 	add	x9, x8, #0x10
   88b9c:	f9001be9 	str	x9, [sp, #48]
   88ba0:	91002109 	add	x9, x8, #0x8
   88ba4:	f9400100 	ldr	x0, [x8]
   88ba8:	f9400128 	ldr	x8, [x9]
   88bac:	910003e1 	mov	x1, sp
   88bb0:	d63f0100 	blr	x8
   88bb4:	370006c0 	tbnz	w0, #0, 88c8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x330>
   88bb8:	eb1602bf 	cmp	x21, x22
   88bbc:	54000582 	b.cs	88c6c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x310>  // b.hs, b.nlast
   88bc0:	a94223e0 	ldp	x0, x8, [sp, #32]
   88bc4:	a97f8b01 	ldp	x1, x2, [x24, #-8]
   88bc8:	910006b5 	add	x21, x21, #0x1
   88bcc:	f9400d08 	ldr	x8, [x8, #24]
   88bd0:	d63f0100 	blr	x8
   88bd4:	910102f7 	add	x23, x23, #0x40
   88bd8:	91004318 	add	x24, x24, #0x10
   88bdc:	3607f140 	tbz	w0, #0, 88a04 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0xa8>
   88be0:	1400002b 	b	88c8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x330>
   88be4:	aa1f03e8 	mov	x8, xzr
   88be8:	a90107e8 	stp	x8, x1, [sp, #16]
   88bec:	f85e02e8 	ldur	x8, [x23, #-32]
   88bf0:	f100051f 	cmp	x8, #0x1
   88bf4:	54fff6c0 	b.eq	88acc <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x170>  // b.none
   88bf8:	17ffffe5 	b	88b8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x230>
   88bfc:	a9405053 	ldp	x19, x20, [x2]
   88c00:	eb14011f 	cmp	x8, x20
   88c04:	9a888297 	csel	x23, x20, x8, hi  // hi = pmore
   88c08:	b4000317 	cbz	x23, 88c68 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x30c>
   88c0c:	a9400a68 	ldp	x8, x2, [x19]
   88c10:	f9400c29 	ldr	x9, [x1, #24]
   88c14:	aa0803e1 	mov	x1, x8
   88c18:	d63f0120 	blr	x9
   88c1c:	37000380 	tbnz	w0, #0, 88c8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x330>
   88c20:	aa1f03f8 	mov	x24, xzr
   88c24:	52800035 	mov	w21, #0x1                   	// #1
   88c28:	8b1802c8 	add	x8, x22, x24
   88c2c:	a9402100 	ldp	x0, x8, [x8]
   88c30:	910003e1 	mov	x1, sp
   88c34:	d63f0100 	blr	x8
   88c38:	370002a0 	tbnz	w0, #0, 88c8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x330>
   88c3c:	eb1702bf 	cmp	x21, x23
   88c40:	54000162 	b.cs	88c6c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x310>  // b.hs, b.nlast
   88c44:	a94223e0 	ldp	x0, x8, [sp, #32]
   88c48:	8b180269 	add	x9, x19, x24
   88c4c:	a9410921 	ldp	x1, x2, [x9, #16]
   88c50:	910006b5 	add	x21, x21, #0x1
   88c54:	f9400d08 	ldr	x8, [x8, #24]
   88c58:	d63f0100 	blr	x8
   88c5c:	91004318 	add	x24, x24, #0x10
   88c60:	3607fe40 	tbz	w0, #0, 88c28 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x2cc>
   88c64:	1400000a 	b	88c8c <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x330>
   88c68:	aa1f03f5 	mov	x21, xzr
   88c6c:	eb15029f 	cmp	x20, x21
   88c70:	54000129 	b.ls	88c94 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x338>  // b.plast
   88c74:	a94223e0 	ldp	x0, x8, [sp, #32]
   88c78:	8b151269 	add	x9, x19, x21, lsl #4
   88c7c:	a9400921 	ldp	x1, x2, [x9]
   88c80:	f9400d08 	ldr	x8, [x8, #24]
   88c84:	d63f0100 	blr	x8
   88c88:	36000060 	tbz	w0, #0, 88c94 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x338>
   88c8c:	52800020 	mov	w0, #0x1                   	// #1
   88c90:	14000002 	b	88c98 <_ZN4core3fmt5write17h8a62c0058826f9fdE+0x33c>
   88c94:	2a1f03e0 	mov	w0, wzr
   88c98:	a94b7bf3 	ldp	x19, x30, [sp, #176]
   88c9c:	a94a53f5 	ldp	x21, x20, [sp, #160]
   88ca0:	a9495bf7 	ldp	x23, x22, [sp, #144]
   88ca4:	a94863f9 	ldp	x25, x24, [sp, #128]
   88ca8:	a9476bfb 	ldp	x27, x26, [sp, #112]
   88cac:	f94033fc 	ldr	x28, [sp, #96]
   88cb0:	910303ff 	add	sp, sp, #0xc0
   88cb4:	d65f03c0 	ret
   88cb8:	d0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88cbc:	91198000 	add	x0, x0, #0x660
   88cc0:	9400044b 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   88cc4:	d4200020 	brk	#0x1
   88cc8:	d0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88ccc:	9119e000 	add	x0, x0, #0x678
   88cd0:	94000447 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   88cd4:	d4200020 	brk	#0x1
   88cd8:	f0000000 	adrp	x0, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88cdc:	d0000022 	adrp	x2, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   88ce0:	913cb800 	add	x0, x0, #0xf2e
   88ce4:	91192042 	add	x2, x2, #0x648
   88ce8:	52800561 	mov	w1, #0x2b                  	// #43
   88cec:	94000433 	bl	89db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>
   88cf0:	d4200020 	brk	#0x1

0000000000088cf4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE>:
   88cf4:	f81b0ffa 	str	x26, [sp, #-80]!
   88cf8:	a90163f9 	stp	x25, x24, [sp, #16]
   88cfc:	a9025bf7 	stp	x23, x22, [sp, #32]
   88d00:	a90353f5 	stp	x21, x20, [sp, #48]
   88d04:	a9047bf3 	stp	x19, x30, [sp, #64]
   88d08:	aa0503f4 	mov	x20, x5
   88d0c:	aa0403f5 	mov	x21, x4
   88d10:	aa0303f6 	mov	x22, x3
   88d14:	aa0203f7 	mov	x23, x2
   88d18:	aa0003f3 	mov	x19, x0
   88d1c:	34000201 	cbz	w1, 88d5c <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x68>
   88d20:	b9405268 	ldr	w8, [x19, #80]
   88d24:	52800569 	mov	w9, #0x2b                  	// #43
   88d28:	52a0022a 	mov	w10, #0x110000              	// #1114112
   88d2c:	9240010b 	and	x11, x8, #0x1
   88d30:	7100017f 	cmp	w11, #0x0
   88d34:	1a890158 	csel	w24, w10, w9, eq  // eq = none
   88d38:	8b140169 	add	x9, x11, x20
   88d3c:	36100188 	tbz	w8, #2, 88d6c <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x78>
   88d40:	aa1603eb 	mov	x11, x22
   88d44:	b4000616 	cbz	x22, 88e04 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x110>
   88d48:	f10006df 	cmp	x22, #0x1
   88d4c:	54000281 	b.ne	88d9c <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0xa8>  // b.any
   88d50:	aa1f03eb 	mov	x11, xzr
   88d54:	aa1703ea 	mov	x10, x23
   88d58:	14000024 	b	88de8 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0xf4>
   88d5c:	b9405268 	ldr	w8, [x19, #80]
   88d60:	91000689 	add	x9, x20, #0x1
   88d64:	528005b8 	mov	w24, #0x2d                  	// #45
   88d68:	3717fec8 	tbnz	w8, #2, 88d40 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x4c>
   88d6c:	aa1f03f6 	mov	x22, xzr
   88d70:	aa1f03f7 	mov	x23, xzr
   88d74:	f940026a 	ldr	x10, [x19]
   88d78:	f100055f 	cmp	x10, #0x1
   88d7c:	540004e0 	b.eq	88e18 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x124>  // b.none
   88d80:	aa1303e0 	mov	x0, x19
   88d84:	2a1803e1 	mov	w1, w24
   88d88:	aa1703e2 	mov	x2, x23
   88d8c:	aa1603e3 	mov	x3, x22
   88d90:	940000a8 	bl	89030 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E>
   88d94:	34000720 	cbz	w0, 88e78 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x184>
   88d98:	14000091 	b	88fdc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2e8>
   88d9c:	927ffacd 	and	x13, x22, #0xfffffffffffffffe
   88da0:	aa1f03eb 	mov	x11, xzr
   88da4:	aa1f03ec 	mov	x12, xzr
   88da8:	8b0d02ea 	add	x10, x23, x13
   88dac:	910006ee 	add	x14, x23, #0x1
   88db0:	aa0d03ef 	mov	x15, x13
   88db4:	385ff1d0 	ldurb	w16, [x14, #-1]
   88db8:	384025d1 	ldrb	w17, [x14], #2
   88dbc:	121a0610 	and	w16, w16, #0xc0
   88dc0:	121a0631 	and	w17, w17, #0xc0
   88dc4:	7102021f 	cmp	w16, #0x80
   88dc8:	9a8b156b 	cinc	x11, x11, eq  // eq = none
   88dcc:	7102023f 	cmp	w17, #0x80
   88dd0:	9a8c158c 	cinc	x12, x12, eq  // eq = none
   88dd4:	f10009ef 	subs	x15, x15, #0x2
   88dd8:	54fffee1 	b.ne	88db4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0xc0>  // b.any
   88ddc:	eb1601bf 	cmp	x13, x22
   88de0:	8b0b018b 	add	x11, x12, x11
   88de4:	54000100 	b.eq	88e04 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x110>  // b.none
   88de8:	8b1602ec 	add	x12, x23, x22
   88dec:	3840154d 	ldrb	w13, [x10], #1
   88df0:	121a05ad 	and	w13, w13, #0xc0
   88df4:	710201bf 	cmp	w13, #0x80
   88df8:	9a8b156b 	cinc	x11, x11, eq  // eq = none
   88dfc:	eb0a019f 	cmp	x12, x10
   88e00:	54ffff61 	b.ne	88dec <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0xf8>  // b.any
   88e04:	8b160129 	add	x9, x9, x22
   88e08:	cb0b0129 	sub	x9, x9, x11
   88e0c:	f940026a 	ldr	x10, [x19]
   88e10:	f100055f 	cmp	x10, #0x1
   88e14:	54fffb61 	b.ne	88d80 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x8c>  // b.any
   88e18:	f940066a 	ldr	x10, [x19, #8]
   88e1c:	eb09015a 	subs	x26, x10, x9
   88e20:	54000209 	b.ls	88e60 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x16c>  // b.plast
   88e24:	371803e8 	tbnz	w8, #3, 88ea0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x1ac>
   88e28:	39416269 	ldrb	w9, [x19, #88]
   88e2c:	f000000a 	adrp	x10, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88e30:	913b514a 	add	x10, x10, #0xed4
   88e34:	aa1f03e8 	mov	x8, xzr
   88e38:	71000d3f 	cmp	w9, #0x3
   88e3c:	1a9f1529 	csinc	w9, w9, wzr, ne  // ne = any
   88e40:	100000ab 	adr	x11, 88e54 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x160>
   88e44:	3869694c 	ldrb	w12, [x10, x9]
   88e48:	8b0c096b 	add	x11, x11, x12, lsl #2
   88e4c:	aa1a03f9 	mov	x25, x26
   88e50:	d61f0160 	br	x11
   88e54:	aa1f03f9 	mov	x25, xzr
   88e58:	aa1a03e8 	mov	x8, x26
   88e5c:	1400002c 	b	88f0c <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x218>
   88e60:	aa1303e0 	mov	x0, x19
   88e64:	2a1803e1 	mov	w1, w24
   88e68:	aa1703e2 	mov	x2, x23
   88e6c:	aa1603e3 	mov	x3, x22
   88e70:	94000070 	bl	89030 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E>
   88e74:	37000b40 	tbnz	w0, #0, 88fdc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2e8>
   88e78:	a9422260 	ldp	x0, x8, [x19, #32]
   88e7c:	aa1503e1 	mov	x1, x21
   88e80:	aa1403e2 	mov	x2, x20
   88e84:	a9447bf3 	ldp	x19, x30, [sp, #64]
   88e88:	f9400d03 	ldr	x3, [x8, #24]
   88e8c:	a94353f5 	ldp	x21, x20, [sp, #48]
   88e90:	a9425bf7 	ldp	x23, x22, [sp, #32]
   88e94:	a94163f9 	ldp	x25, x24, [sp, #16]
   88e98:	f84507fa 	ldr	x26, [sp], #80
   88e9c:	d61f0060 	br	x3
   88ea0:	52800608 	mov	w8, #0x30                  	// #48
   88ea4:	52800039 	mov	w25, #0x1                   	// #1
   88ea8:	aa1303e0 	mov	x0, x19
   88eac:	2a1803e1 	mov	w1, w24
   88eb0:	aa1703e2 	mov	x2, x23
   88eb4:	aa1603e3 	mov	x3, x22
   88eb8:	b9005668 	str	w8, [x19, #84]
   88ebc:	39016279 	strb	w25, [x19, #88]
   88ec0:	9400005c 	bl	89030 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E>
   88ec4:	370008e0 	tbnz	w0, #0, 88fe0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2ec>
   88ec8:	39416269 	ldrb	w9, [x19, #88]
   88ecc:	f000000a 	adrp	x10, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   88ed0:	913b414a 	add	x10, x10, #0xed0
   88ed4:	aa1f03e8 	mov	x8, xzr
   88ed8:	71000d3f 	cmp	w9, #0x3
   88edc:	1a9f1529 	csinc	w9, w9, wzr, ne  // ne = any
   88ee0:	100000ab 	adr	x11, 88ef4 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x200>
   88ee4:	3869694c 	ldrb	w12, [x10, x9]
   88ee8:	8b0c096b 	add	x11, x11, x12, lsl #2
   88eec:	aa1a03f7 	mov	x23, x26
   88ef0:	d61f0160 	br	x11
   88ef4:	aa1f03f7 	mov	x23, xzr
   88ef8:	aa1a03e8 	mov	x8, x26
   88efc:	14000028 	b	88f9c <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2a8>
   88f00:	91000749 	add	x9, x26, #0x1
   88f04:	d341ff48 	lsr	x8, x26, #1
   88f08:	d341fd39 	lsr	x25, x9, #1
   88f0c:	9100051a 	add	x26, x8, #0x1
   88f10:	f100075a 	subs	x26, x26, #0x1
   88f14:	540000e0 	b.eq	88f30 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x23c>  // b.none
   88f18:	a9422260 	ldp	x0, x8, [x19, #32]
   88f1c:	b9405661 	ldr	w1, [x19, #84]
   88f20:	f9401108 	ldr	x8, [x8, #32]
   88f24:	d63f0100 	blr	x8
   88f28:	3607ff40 	tbz	w0, #0, 88f10 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x21c>
   88f2c:	1400002c 	b	88fdc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2e8>
   88f30:	b940567a 	ldr	w26, [x19, #84]
   88f34:	aa1303e0 	mov	x0, x19
   88f38:	2a1803e1 	mov	w1, w24
   88f3c:	aa1703e2 	mov	x2, x23
   88f40:	aa1603e3 	mov	x3, x22
   88f44:	9400003b 	bl	89030 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E>
   88f48:	370004a0 	tbnz	w0, #0, 88fdc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2e8>
   88f4c:	a9422260 	ldp	x0, x8, [x19, #32]
   88f50:	aa1503e1 	mov	x1, x21
   88f54:	aa1403e2 	mov	x2, x20
   88f58:	f9400d08 	ldr	x8, [x8, #24]
   88f5c:	d63f0100 	blr	x8
   88f60:	370003e0 	tbnz	w0, #0, 88fdc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2e8>
   88f64:	a9424e74 	ldp	x20, x19, [x19, #32]
   88f68:	91000735 	add	x21, x25, #0x1
   88f6c:	52800039 	mov	w25, #0x1                   	// #1
   88f70:	f10006b5 	subs	x21, x21, #0x1
   88f74:	540005a0 	b.eq	89028 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x334>  // b.none
   88f78:	f9401268 	ldr	x8, [x19, #32]
   88f7c:	aa1403e0 	mov	x0, x20
   88f80:	2a1a03e1 	mov	w1, w26
   88f84:	d63f0100 	blr	x8
   88f88:	3607ff40 	tbz	w0, #0, 88f70 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x27c>
   88f8c:	14000015 	b	88fe0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2ec>
   88f90:	91000749 	add	x9, x26, #0x1
   88f94:	d341ff48 	lsr	x8, x26, #1
   88f98:	d341fd37 	lsr	x23, x9, #1
   88f9c:	91000516 	add	x22, x8, #0x1
   88fa0:	f10006d6 	subs	x22, x22, #0x1
   88fa4:	540000e0 	b.eq	88fc0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2cc>  // b.none
   88fa8:	a9422260 	ldp	x0, x8, [x19, #32]
   88fac:	b9405661 	ldr	w1, [x19, #84]
   88fb0:	f9401108 	ldr	x8, [x8, #32]
   88fb4:	d63f0100 	blr	x8
   88fb8:	3607ff40 	tbz	w0, #0, 88fa0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2ac>
   88fbc:	14000008 	b	88fdc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2e8>
   88fc0:	a9422260 	ldp	x0, x8, [x19, #32]
   88fc4:	b9405676 	ldr	w22, [x19, #84]
   88fc8:	aa1503e1 	mov	x1, x21
   88fcc:	aa1403e2 	mov	x2, x20
   88fd0:	f9400d08 	ldr	x8, [x8, #24]
   88fd4:	d63f0100 	blr	x8
   88fd8:	36000120 	tbz	w0, #0, 88ffc <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x308>
   88fdc:	52800039 	mov	w25, #0x1                   	// #1
   88fe0:	2a1903e0 	mov	w0, w25
   88fe4:	a9447bf3 	ldp	x19, x30, [sp, #64]
   88fe8:	a94353f5 	ldp	x21, x20, [sp, #48]
   88fec:	a9425bf7 	ldp	x23, x22, [sp, #32]
   88ff0:	a94163f9 	ldp	x25, x24, [sp, #16]
   88ff4:	f84507fa 	ldr	x26, [sp], #80
   88ff8:	d65f03c0 	ret
   88ffc:	a9424e74 	ldp	x20, x19, [x19, #32]
   89000:	910006f5 	add	x21, x23, #0x1
   89004:	52800039 	mov	w25, #0x1                   	// #1
   89008:	f10006b5 	subs	x21, x21, #0x1
   8900c:	540000e0 	b.eq	89028 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x334>  // b.none
   89010:	f9401268 	ldr	x8, [x19, #32]
   89014:	aa1403e0 	mov	x0, x20
   89018:	2a1603e1 	mov	w1, w22
   8901c:	d63f0100 	blr	x8
   89020:	3607ff40 	tbz	w0, #0, 89008 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x314>
   89024:	17ffffef 	b	88fe0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2ec>
   89028:	2a1f03f9 	mov	w25, wzr
   8902c:	17ffffed 	b	88fe0 <_ZN4core3fmt9Formatter12pad_integral17h7e8c63c0873c34edE+0x2ec>

0000000000089030 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E>:
   89030:	a9be53f5 	stp	x21, x20, [sp, #-32]!
   89034:	a9017bf3 	stp	x19, x30, [sp, #16]
   89038:	aa0303f3 	mov	x19, x3
   8903c:	aa0203f4 	mov	x20, x2
   89040:	7144403f 	cmp	w1, #0x110, lsl #12
   89044:	aa0003f5 	mov	x21, x0
   89048:	54000120 	b.eq	8906c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E+0x3c>  // b.none
   8904c:	a94222a0 	ldp	x0, x8, [x21, #32]
   89050:	f9401108 	ldr	x8, [x8, #32]
   89054:	d63f0100 	blr	x8
   89058:	340000a0 	cbz	w0, 8906c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E+0x3c>
   8905c:	52800020 	mov	w0, #0x1                   	// #1
   89060:	a9417bf3 	ldp	x19, x30, [sp, #16]
   89064:	a8c253f5 	ldp	x21, x20, [sp], #32
   89068:	d65f03c0 	ret
   8906c:	b4000114 	cbz	x20, 8908c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17h12b6fe78af5c8844E+0x5c>
   89070:	a94222a0 	ldp	x0, x8, [x21, #32]
   89074:	aa1303e2 	mov	x2, x19
   89078:	a9417bf3 	ldp	x19, x30, [sp, #16]
   8907c:	aa1403e1 	mov	x1, x20
   89080:	f9400d03 	ldr	x3, [x8, #24]
   89084:	a8c253f5 	ldp	x21, x20, [sp], #32
   89088:	d61f0060 	br	x3
   8908c:	2a1f03e0 	mov	w0, wzr
   89090:	a9417bf3 	ldp	x19, x30, [sp, #16]
   89094:	a8c253f5 	ldp	x21, x20, [sp], #32
   89098:	d65f03c0 	ret

000000000008909c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE>:
   8909c:	a9bd5bf7 	stp	x23, x22, [sp, #-48]!
   890a0:	a90153f5 	stp	x21, x20, [sp, #16]
   890a4:	a9027bf3 	stp	x19, x30, [sp, #32]
   890a8:	f9400008 	ldr	x8, [x0]
   890ac:	f9400809 	ldr	x9, [x0, #16]
   890b0:	aa0203f4 	mov	x20, x2
   890b4:	aa0003f3 	mov	x19, x0
   890b8:	f100051f 	cmp	x8, #0x1
   890bc:	aa0103f5 	mov	x21, x1
   890c0:	54000081 	b.ne	890d0 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x34>  // b.any
   890c4:	f100053f 	cmp	x9, #0x1
   890c8:	54000080 	b.eq	890d8 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x3c>  // b.none
   890cc:	1400006f 	b	89288 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1ec>
   890d0:	f100053f 	cmp	x9, #0x1
   890d4:	540013a1 	b.ne	89348 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2ac>  // b.any
   890d8:	b4000d54 	cbz	x20, 89280 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1e4>
   890dc:	aa1503eb 	mov	x11, x21
   890e0:	f9400e69 	ldr	x9, [x19, #24]
   890e4:	38c0156c 	ldrsb	w12, [x11], #1
   890e8:	8b1402aa 	add	x10, x21, x20
   890ec:	36f8052c 	tbz	w12, #31, 89190 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xf4>
   890f0:	f100069f 	cmp	x20, #0x1
   890f4:	12001d8c 	and	w12, w12, #0xff
   890f8:	540001a1 	b.ne	8912c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x90>  // b.any
   890fc:	2a1f03ed 	mov	w13, wzr
   89100:	aa0a03ee 	mov	x14, x10
   89104:	7103819f 	cmp	w12, #0xe0
   89108:	54000443 	b.cc	89190 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xf4>  // b.lo, b.ul, b.last
   8910c:	eb0a01df 	cmp	x14, x10
   89110:	540001e0 	b.eq	8914c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xb0>  // b.none
   89114:	384015cb 	ldrb	w11, [x14], #1
   89118:	1200156f 	and	w15, w11, #0x3f
   8911c:	aa0e03eb 	mov	x11, x14
   89120:	7103c19f 	cmp	w12, #0xf0
   89124:	540001c2 	b.cs	8915c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xc0>  // b.hs, b.nlast
   89128:	1400001a 	b	89190 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xf4>
   8912c:	394006ad 	ldrb	w13, [x21, #1]
   89130:	91000aab 	add	x11, x21, #0x2
   89134:	aa0b03ee 	mov	x14, x11
   89138:	120015ad 	and	w13, w13, #0x3f
   8913c:	531a65ad 	lsl	w13, w13, #6
   89140:	7103819f 	cmp	w12, #0xe0
   89144:	54fffe42 	b.cs	8910c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x70>  // b.hs, b.nlast
   89148:	14000012 	b	89190 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xf4>
   8914c:	2a1f03ef 	mov	w15, wzr
   89150:	aa0a03ee 	mov	x14, x10
   89154:	7103c19f 	cmp	w12, #0xf0
   89158:	540001c3 	b.cc	89190 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xf4>  // b.lo, b.ul, b.last
   8915c:	eb0a01df 	cmp	x14, x10
   89160:	2a0d01ed 	orr	w13, w15, w13
   89164:	540000a0 	b.eq	89178 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xdc>  // b.none
   89168:	384015cb 	ldrb	w11, [x14], #1
   8916c:	1200156f 	and	w15, w11, #0x3f
   89170:	aa0e03eb 	mov	x11, x14
   89174:	14000002 	b	8917c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0xe0>
   89178:	2a1f03ef 	mov	w15, wzr
   8917c:	530e098c 	ubfiz	w12, w12, #18, #3
   89180:	331a2dac 	bfi	w12, w13, #6, #12
   89184:	2a0f018c 	orr	w12, w12, w15
   89188:	7144419f 	cmp	w12, #0x110, lsl #12
   8918c:	540007a0 	b.eq	89280 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1e4>  // b.none
   89190:	b40006e9 	cbz	x9, 8926c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1d0>
   89194:	cb15016e 	sub	x14, x11, x21
   89198:	eb0b015f 	cmp	x10, x11
   8919c:	54000221 	b.ne	891e0 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x144>  // b.any
   891a0:	14000038 	b	89280 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1e4>
   891a4:	3840160d 	ldrb	w13, [x16], #1
   891a8:	120015af 	and	w15, w13, #0x3f
   891ac:	aa1003ed 	mov	x13, x16
   891b0:	530e09ce 	ubfiz	w14, w14, #18, #3
   891b4:	331a2e2e 	bfi	w14, w17, #6, #12
   891b8:	2a0f01ce 	orr	w14, w14, w15
   891bc:	714441df 	cmp	w14, #0x110, lsl #12
   891c0:	54000600 	b.eq	89280 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1e4>  // b.none
   891c4:	cb0b018b 	sub	x11, x12, x11
   891c8:	d1000529 	sub	x9, x9, #0x1
   891cc:	8b0d016e 	add	x14, x11, x13
   891d0:	aa0d03eb 	mov	x11, x13
   891d4:	b4000ce9 	cbz	x9, 89370 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2d4>
   891d8:	eb0b015f 	cmp	x10, x11
   891dc:	54000520 	b.eq	89280 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1e4>  // b.none
   891e0:	aa0b03ed 	mov	x13, x11
   891e4:	aa0e03ec 	mov	x12, x14
   891e8:	38c015ae 	ldrsb	w14, [x13], #1
   891ec:	36fffece 	tbz	w14, #31, 891c4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x128>
   891f0:	eb0a01bf 	cmp	x13, x10
   891f4:	12001dce 	and	w14, w14, #0xff
   891f8:	54000260 	b.eq	89244 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1a8>  // b.none
   891fc:	3940056f 	ldrb	w15, [x11, #1]
   89200:	9100096d 	add	x13, x11, #0x2
   89204:	aa0d03f0 	mov	x16, x13
   89208:	120015ef 	and	w15, w15, #0x3f
   8920c:	710381df 	cmp	w14, #0xe0
   89210:	54fffda3 	b.cc	891c4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x128>  // b.lo, b.ul, b.last
   89214:	eb0a021f 	cmp	x16, x10
   89218:	54000200 	b.eq	89258 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1bc>  // b.none
   8921c:	3840160d 	ldrb	w13, [x16], #1
   89220:	120015b1 	and	w17, w13, #0x3f
   89224:	aa1003ed 	mov	x13, x16
   89228:	7103c1df 	cmp	w14, #0xf0
   8922c:	54fffcc3 	b.cc	891c4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x128>  // b.lo, b.ul, b.last
   89230:	eb0a021f 	cmp	x16, x10
   89234:	331a15f1 	bfi	w17, w15, #6, #6
   89238:	54fffb61 	b.ne	891a4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x108>  // b.any
   8923c:	2a1f03ef 	mov	w15, wzr
   89240:	17ffffdc 	b	891b0 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x114>
   89244:	2a1f03ef 	mov	w15, wzr
   89248:	aa0a03f0 	mov	x16, x10
   8924c:	710381df 	cmp	w14, #0xe0
   89250:	54fffba3 	b.cc	891c4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x128>  // b.lo, b.ul, b.last
   89254:	17fffff0 	b	89214 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x178>
   89258:	2a1f03f1 	mov	w17, wzr
   8925c:	aa0a03f0 	mov	x16, x10
   89260:	7103c1df 	cmp	w14, #0xf0
   89264:	54fffb03 	b.cc	891c4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x128>  // b.lo, b.ul, b.last
   89268:	17fffff2 	b	89230 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x194>
   8926c:	aa1f03ec 	mov	x12, xzr
   89270:	aa1503e9 	mov	x9, x21
   89274:	f100013f 	cmp	x9, #0x0
   89278:	9a8c0294 	csel	x20, x20, x12, eq  // eq = none
   8927c:	9a8902b5 	csel	x21, x21, x9, eq  // eq = none
   89280:	f100051f 	cmp	x8, #0x1
   89284:	54000621 	b.ne	89348 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2ac>  // b.any
   89288:	b40000d4 	cbz	x20, 892a0 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x204>
   8928c:	f100069f 	cmp	x20, #0x1
   89290:	54000141 	b.ne	892b8 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x21c>  // b.any
   89294:	aa1f03e9 	mov	x9, xzr
   89298:	aa1503e8 	mov	x8, x21
   8929c:	1400001a 	b	89304 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x268>
   892a0:	aa1f03e9 	mov	x9, xzr
   892a4:	f9400668 	ldr	x8, [x19, #8]
   892a8:	cb090289 	sub	x9, x20, x9
   892ac:	eb08013f 	cmp	x9, x8
   892b0:	54000403 	b.cc	89330 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x294>  // b.lo, b.ul, b.last
   892b4:	14000025 	b	89348 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2ac>
   892b8:	927ffa8b 	and	x11, x20, #0xfffffffffffffffe
   892bc:	aa1f03e9 	mov	x9, xzr
   892c0:	aa1f03ea 	mov	x10, xzr
   892c4:	8b0b02a8 	add	x8, x21, x11
   892c8:	910006ac 	add	x12, x21, #0x1
   892cc:	aa0b03ed 	mov	x13, x11
   892d0:	385ff18e 	ldurb	w14, [x12, #-1]
   892d4:	3840258f 	ldrb	w15, [x12], #2
   892d8:	121a05ce 	and	w14, w14, #0xc0
   892dc:	121a05ef 	and	w15, w15, #0xc0
   892e0:	710201df 	cmp	w14, #0x80
   892e4:	9a891529 	cinc	x9, x9, eq  // eq = none
   892e8:	710201ff 	cmp	w15, #0x80
   892ec:	9a8a154a 	cinc	x10, x10, eq  // eq = none
   892f0:	f10009ad 	subs	x13, x13, #0x2
   892f4:	54fffee1 	b.ne	892d0 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x234>  // b.any
   892f8:	eb0b029f 	cmp	x20, x11
   892fc:	8b090149 	add	x9, x10, x9
   89300:	54000100 	b.eq	89320 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x284>  // b.none
   89304:	8b1402aa 	add	x10, x21, x20
   89308:	3840150b 	ldrb	w11, [x8], #1
   8930c:	121a056b 	and	w11, w11, #0xc0
   89310:	7102017f 	cmp	w11, #0x80
   89314:	9a891529 	cinc	x9, x9, eq  // eq = none
   89318:	eb08015f 	cmp	x10, x8
   8931c:	54ffff61 	b.ne	89308 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x26c>  // b.any
   89320:	f9400668 	ldr	x8, [x19, #8]
   89324:	cb090289 	sub	x9, x20, x9
   89328:	eb08013f 	cmp	x9, x8
   8932c:	540000e2 	b.cs	89348 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2ac>  // b.hs, b.nlast
   89330:	b40001d4 	cbz	x20, 89368 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2cc>
   89334:	f100069f 	cmp	x20, #0x1
   89338:	54000321 	b.ne	8939c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x300>  // b.any
   8933c:	aa1f03ea 	mov	x10, xzr
   89340:	aa1503e9 	mov	x9, x21
   89344:	14000029 	b	893e8 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x34c>
   89348:	a9422260 	ldp	x0, x8, [x19, #32]
   8934c:	aa1503e1 	mov	x1, x21
   89350:	aa1403e2 	mov	x2, x20
   89354:	a9427bf3 	ldp	x19, x30, [sp, #32]
   89358:	f9400d03 	ldr	x3, [x8, #24]
   8935c:	a94153f5 	ldp	x21, x20, [sp, #16]
   89360:	a8c35bf7 	ldp	x23, x22, [sp], #48
   89364:	d61f0060 	br	x3
   89368:	aa1f03ea 	mov	x10, xzr
   8936c:	14000026 	b	89404 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x368>
   89370:	b4fff80c 	cbz	x12, 89270 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1d4>
   89374:	eb14019f 	cmp	x12, x20
   89378:	54fff7c0 	b.eq	89270 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1d4>  // b.none
   8937c:	eb14019f 	cmp	x12, x20
   89380:	54000082 	b.cs	89390 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x2f4>  // b.hs, b.nlast
   89384:	38ec6aa9 	ldrsb	w9, [x21, x12]
   89388:	3101013f 	cmn	w9, #0x40
   8938c:	54fff72a 	b.ge	89270 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1d4>  // b.tcont
   89390:	aa1f03e9 	mov	x9, xzr
   89394:	aa1f03ec 	mov	x12, xzr
   89398:	17ffffb7 	b	89274 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x1d8>
   8939c:	927ffa8c 	and	x12, x20, #0xfffffffffffffffe
   893a0:	aa1f03ea 	mov	x10, xzr
   893a4:	aa1f03eb 	mov	x11, xzr
   893a8:	8b0c02a9 	add	x9, x21, x12
   893ac:	910006ad 	add	x13, x21, #0x1
   893b0:	aa0c03ee 	mov	x14, x12
   893b4:	385ff1af 	ldurb	w15, [x13, #-1]
   893b8:	384025b0 	ldrb	w16, [x13], #2
   893bc:	121a05ef 	and	w15, w15, #0xc0
   893c0:	121a0610 	and	w16, w16, #0xc0
   893c4:	710201ff 	cmp	w15, #0x80
   893c8:	9a8a154a 	cinc	x10, x10, eq  // eq = none
   893cc:	7102021f 	cmp	w16, #0x80
   893d0:	9a8b156b 	cinc	x11, x11, eq  // eq = none
   893d4:	f10009ce 	subs	x14, x14, #0x2
   893d8:	54fffee1 	b.ne	893b4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x318>  // b.any
   893dc:	eb0c029f 	cmp	x20, x12
   893e0:	8b0a016a 	add	x10, x11, x10
   893e4:	54000100 	b.eq	89404 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x368>  // b.none
   893e8:	8b1402ab 	add	x11, x21, x20
   893ec:	3840152c 	ldrb	w12, [x9], #1
   893f0:	121a058c 	and	w12, w12, #0xc0
   893f4:	7102019f 	cmp	w12, #0x80
   893f8:	9a8a154a 	cinc	x10, x10, eq  // eq = none
   893fc:	eb09017f 	cmp	x11, x9
   89400:	54ffff61 	b.ne	893ec <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x350>  // b.any
   89404:	3941626b 	ldrb	w11, [x19, #88]
   89408:	cb14014a 	sub	x10, x10, x20
   8940c:	8b080148 	add	x8, x10, x8
   89410:	aa1f03e9 	mov	x9, xzr
   89414:	71000d7f 	cmp	w11, #0x3
   89418:	1a8b03ea 	csel	w10, wzr, w11, eq  // eq = none
   8941c:	d000000b 	adrp	x11, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89420:	913b616b 	add	x11, x11, #0xed8
   89424:	100000ac 	adr	x12, 89438 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x39c>
   89428:	386a696d 	ldrb	w13, [x11, x10]
   8942c:	8b0d098c 	add	x12, x12, x13, lsl #2
   89430:	aa0803f7 	mov	x23, x8
   89434:	d61f0180 	br	x12
   89438:	aa1f03f7 	mov	x23, xzr
   8943c:	aa0803e9 	mov	x9, x8
   89440:	14000004 	b	89450 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x3b4>
   89444:	d341fd09 	lsr	x9, x8, #1
   89448:	91000508 	add	x8, x8, #0x1
   8944c:	d341fd17 	lsr	x23, x8, #1
   89450:	91000536 	add	x22, x9, #0x1
   89454:	f10006d6 	subs	x22, x22, #0x1
   89458:	540000e0 	b.eq	89474 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x3d8>  // b.none
   8945c:	a9422260 	ldp	x0, x8, [x19, #32]
   89460:	b9405661 	ldr	w1, [x19, #84]
   89464:	f9401108 	ldr	x8, [x8, #32]
   89468:	d63f0100 	blr	x8
   8946c:	3607ff40 	tbz	w0, #0, 89454 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x3b8>
   89470:	14000011 	b	894b4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x418>
   89474:	a9422260 	ldp	x0, x8, [x19, #32]
   89478:	b9405676 	ldr	w22, [x19, #84]
   8947c:	aa1503e1 	mov	x1, x21
   89480:	aa1403e2 	mov	x2, x20
   89484:	f9400d08 	ldr	x8, [x8, #24]
   89488:	d63f0100 	blr	x8
   8948c:	37000140 	tbnz	w0, #0, 894b4 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x418>
   89490:	a9424e74 	ldp	x20, x19, [x19, #32]
   89494:	910006f5 	add	x21, x23, #0x1
   89498:	f10006b5 	subs	x21, x21, #0x1
   8949c:	54000160 	b.eq	894c8 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x42c>  // b.none
   894a0:	f9401268 	ldr	x8, [x19, #32]
   894a4:	aa1403e0 	mov	x0, x20
   894a8:	2a1603e1 	mov	w1, w22
   894ac:	d63f0100 	blr	x8
   894b0:	3607ff40 	tbz	w0, #0, 89498 <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE+0x3fc>
   894b4:	52800020 	mov	w0, #0x1                   	// #1
   894b8:	a9427bf3 	ldp	x19, x30, [sp, #32]
   894bc:	a94153f5 	ldp	x21, x20, [sp, #16]
   894c0:	a8c35bf7 	ldp	x23, x22, [sp], #48
   894c4:	d65f03c0 	ret
   894c8:	2a1f03e0 	mov	w0, wzr
   894cc:	a9427bf3 	ldp	x19, x30, [sp, #32]
   894d0:	a94153f5 	ldp	x21, x20, [sp, #16]
   894d4:	a8c35bf7 	ldp	x23, x22, [sp], #48
   894d8:	d65f03c0 	ret

00000000000894dc <_ZN4core3fmt9Formatter9alternate17h55b61d4eb6831511E>:
   894dc:	39414008 	ldrb	w8, [x0, #80]
   894e0:	53020900 	ubfx	w0, w8, #2, #1
   894e4:	d65f03c0 	ret

00000000000894e8 <_ZN4core3fmt9Formatter15debug_lower_hex17h597d04d17268b5b5E>:
   894e8:	39414008 	ldrb	w8, [x0, #80]
   894ec:	53041100 	ubfx	w0, w8, #4, #1
   894f0:	d65f03c0 	ret

00000000000894f4 <_ZN4core3fmt9Formatter15debug_upper_hex17h69356f446087d521E>:
   894f4:	39414008 	ldrb	w8, [x0, #80]
   894f8:	53051500 	ubfx	w0, w8, #5, #1
   894fc:	d65f03c0 	ret

0000000000089500 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E>:
   89500:	d10283ff 	sub	sp, sp, #0xa0
   89504:	a9046ffc 	stp	x28, x27, [sp, #64]
   89508:	a90567fa 	stp	x26, x25, [sp, #80]
   8950c:	a9065ff8 	stp	x24, x23, [sp, #96]
   89510:	a90757f6 	stp	x22, x21, [sp, #112]
   89514:	a9084ff4 	stp	x20, x19, [sp, #128]
   89518:	a9097bfd 	stp	x29, x30, [sp, #144]
   8951c:	a9422448 	ldp	x8, x9, [x2, #32]
   89520:	aa0103f4 	mov	x20, x1
   89524:	aa0003f6 	mov	x22, x0
   89528:	52800441 	mov	w1, #0x22                  	// #34
   8952c:	f9401129 	ldr	x9, [x9, #32]
   89530:	aa0803e0 	mov	x0, x8
   89534:	aa0203f3 	mov	x19, x2
   89538:	d63f0120 	blr	x9
   8953c:	35002520 	cbnz	w0, 899e0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4e0>
   89540:	aa1f03f9 	mov	x25, xzr
   89544:	b4002314 	cbz	x20, 899a4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4a4>
   89548:	aa1f03fb 	mov	x27, xzr
   8954c:	8b1402da 	add	x26, x22, x20
   89550:	aa1603f5 	mov	x21, x22
   89554:	aa1503e9 	mov	x9, x21
   89558:	38c0152a 	ldrsb	w10, [x9], #1
   8955c:	aa1503f8 	mov	x24, x21
   89560:	12001d48 	and	w8, w10, #0xff
   89564:	37f8012a 	tbnz	w10, #31, 89588 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x88>
   89568:	aa0903f5 	mov	x21, x9
   8956c:	2a0803fd 	mov	w29, w8
   89570:	510027a8 	sub	w8, w29, #0x9
   89574:	7100791f 	cmp	w8, #0x1e
   89578:	54000749 	b.ls	89660 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x160>  // b.plast
   8957c:	710173bf 	cmp	w29, #0x5c
   89580:	540015a1 	b.ne	89834 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x334>  // b.any
   89584:	1400003f 	b	89680 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x180>
   89588:	eb1a013f 	cmp	x9, x26
   8958c:	540002c0 	b.eq	895e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0xe4>  // b.none
   89590:	394006a9 	ldrb	w9, [x21, #1]
   89594:	91000aaa 	add	x10, x21, #0x2
   89598:	aa0a03f5 	mov	x21, x10
   8959c:	1200153d 	and	w29, w9, #0x3f
   895a0:	71037d1f 	cmp	w8, #0xdf
   895a4:	12001109 	and	w9, w8, #0x1f
   895a8:	540002a9 	b.ls	895fc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0xfc>  // b.plast
   895ac:	eb1a015f 	cmp	x10, x26
   895b0:	54000300 	b.eq	89610 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x110>  // b.none
   895b4:	3840154b 	ldrb	w11, [x10], #1
   895b8:	1200156b 	and	w11, w11, #0x3f
   895bc:	aa0a03f5 	mov	x21, x10
   895c0:	7103c11f 	cmp	w8, #0xf0
   895c4:	331a17ab 	bfi	w11, w29, #6, #6
   895c8:	540002e3 	b.cc	89624 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x124>  // b.lo, b.ul, b.last
   895cc:	eb1a015f 	cmp	x10, x26
   895d0:	54000360 	b.eq	8963c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x13c>  // b.none
   895d4:	38401548 	ldrb	w8, [x10], #1
   895d8:	12001508 	and	w8, w8, #0x3f
   895dc:	aa0a03f5 	mov	x21, x10
   895e0:	14000018 	b	89640 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x140>
   895e4:	2a1f03fd 	mov	w29, wzr
   895e8:	aa0903f5 	mov	x21, x9
   895ec:	aa1a03ea 	mov	x10, x26
   895f0:	71037d1f 	cmp	w8, #0xdf
   895f4:	12001109 	and	w9, w8, #0x1f
   895f8:	54fffda8 	b.hi	895ac <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0xac>  // b.pmore
   895fc:	331a113d 	bfi	w29, w9, #6, #5
   89600:	510027a8 	sub	w8, w29, #0x9
   89604:	7100791f 	cmp	w8, #0x1e
   89608:	540002c9 	b.ls	89660 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x160>  // b.plast
   8960c:	17ffffdc 	b	8957c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x7c>
   89610:	2a1f03eb 	mov	w11, wzr
   89614:	aa1a03ea 	mov	x10, x26
   89618:	7103c11f 	cmp	w8, #0xf0
   8961c:	331a17ab 	bfi	w11, w29, #6, #6
   89620:	54fffd62 	b.cs	895cc <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0xcc>  // b.hs, b.nlast
   89624:	3314112b 	bfi	w11, w9, #12, #5
   89628:	2a0b03fd 	mov	w29, w11
   8962c:	510027a8 	sub	w8, w29, #0x9
   89630:	7100791f 	cmp	w8, #0x1e
   89634:	54000169 	b.ls	89660 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x160>  // b.plast
   89638:	17ffffd1 	b	8957c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x7c>
   8963c:	2a1f03e8 	mov	w8, wzr
   89640:	530e0929 	ubfiz	w9, w9, #18, #3
   89644:	331a2d69 	bfi	w9, w11, #6, #12
   89648:	2a08013d 	orr	w29, w9, w8
   8964c:	714443bf 	cmp	w29, #0x110, lsl #12
   89650:	54001aa0 	b.eq	899a4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4a4>  // b.none
   89654:	510027a8 	sub	w8, w29, #0x9
   89658:	7100791f 	cmp	w8, #0x1e
   8965c:	54fff908 	b.hi	8957c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x7c>  // b.pmore
   89660:	d000000b 	adrp	x11, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89664:	913b716b 	add	x11, x11, #0xedc
   89668:	100000c9 	adr	x9, 89680 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x180>
   8966c:	3868696a 	ldrb	w10, [x11, x8]
   89670:	8b0a0929 	add	x9, x9, x10, lsl #2
   89674:	52800e97 	mov	w23, #0x74                  	// #116
   89678:	5280005c 	mov	w28, #0x2                   	// #2
   8967c:	d61f0120 	br	x9
   89680:	5280005c 	mov	w28, #0x2                   	// #2
   89684:	2a1d03f7 	mov	w23, w29
   89688:	eb190362 	subs	x2, x27, x25
   8968c:	a900d3f6 	stp	x22, x20, [sp, #8]
   89690:	a901eff9 	stp	x25, x27, [sp, #24]
   89694:	54001ce3 	b.cc	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>  // b.lo, b.ul, b.last
   89698:	b40000f9 	cbz	x25, 896b4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x1b4>
   8969c:	eb14033f 	cmp	x25, x20
   896a0:	540000a0 	b.eq	896b4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x1b4>  // b.none
   896a4:	54001c62 	b.cs	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>  // b.hs, b.nlast
   896a8:	38f96ac8 	ldrsb	w8, [x22, x25]
   896ac:	3101051f 	cmn	w8, #0x41
   896b0:	54001c0d 	b.le	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>
   896b4:	b40000fb 	cbz	x27, 896d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x1d0>
   896b8:	eb14037f 	cmp	x27, x20
   896bc:	540000a0 	b.eq	896d0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x1d0>  // b.none
   896c0:	54001b82 	b.cs	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>  // b.hs, b.nlast
   896c4:	38fb6ac8 	ldrsb	w8, [x22, x27]
   896c8:	3101051f 	cmn	w8, #0x41
   896cc:	54001b2d 	b.le	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>
   896d0:	a9422260 	ldp	x0, x8, [x19, #32]
   896d4:	8b1902c1 	add	x1, x22, x25
   896d8:	f9400d08 	ldr	x8, [x8, #24]
   896dc:	d63f0100 	blr	x8
   896e0:	37001800 	tbnz	w0, #0, 899e0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4e0>
   896e4:	528000b9 	mov	w25, #0x5                   	// #5
   896e8:	14000007 	b	89704 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x204>
   896ec:	2a1f03fc 	mov	w28, wzr
   896f0:	2a1703e1 	mov	w1, w23
   896f4:	a9422260 	ldp	x0, x8, [x19, #32]
   896f8:	f9401108 	ldr	x8, [x8, #32]
   896fc:	d63f0100 	blr	x8
   89700:	37001700 	tbnz	w0, #0, 899e0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4e0>
   89704:	d000000b 	adrp	x11, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89708:	2a1c03e8 	mov	w8, w28
   8970c:	913bed6b 	add	x11, x11, #0xefb
   89710:	10fffee9 	adr	x9, 896ec <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x1ec>
   89714:	3868696a 	ldrb	w10, [x11, x8]
   89718:	8b0a0929 	add	x9, x9, x10, lsl #2
   8971c:	52800b81 	mov	w1, #0x5c                  	// #92
   89720:	5280003c 	mov	w28, #0x1                   	// #1
   89724:	d61f0120 	br	x9
   89728:	d000000b 	adrp	x11, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   8972c:	92401f28 	and	x8, x25, #0xff
   89730:	913bfd6b 	add	x11, x11, #0xeff
   89734:	10fffe09 	adr	x9, 896f4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x1f4>
   89738:	3868696a 	ldrb	w10, [x11, x8]
   8973c:	8b0a0929 	add	x9, x9, x10, lsl #2
   89740:	5280007c 	mov	w28, #0x3                   	// #3
   89744:	52800b81 	mov	w1, #0x5c                  	// #92
   89748:	52800099 	mov	w25, #0x4                   	// #4
   8974c:	d61f0120 	br	x9
   89750:	2a1f03f9 	mov	w25, wzr
   89754:	5280007c 	mov	w28, #0x3                   	// #3
   89758:	52800fa1 	mov	w1, #0x7d                  	// #125
   8975c:	a9422260 	ldp	x0, x8, [x19, #32]
   89760:	f9401108 	ldr	x8, [x8, #32]
   89764:	d63f0100 	blr	x8
   89768:	3607fce0 	tbz	w0, #0, 89704 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x204>
   8976c:	1400009d 	b	899e0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4e0>
   89770:	5280007c 	mov	w28, #0x3                   	// #3
   89774:	52800059 	mov	w25, #0x2                   	// #2
   89778:	52800f61 	mov	w1, #0x7b                  	// #123
   8977c:	a9422260 	ldp	x0, x8, [x19, #32]
   89780:	f9401108 	ldr	x8, [x8, #32]
   89784:	d63f0100 	blr	x8
   89788:	3607fbe0 	tbz	w0, #0, 89704 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x204>
   8978c:	14000095 	b	899e0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4e0>
   89790:	f94003ec 	ldr	x12, [sp]
   89794:	52800609 	mov	w9, #0x30                  	// #48
   89798:	531e0988 	ubfiz	w8, w12, #2, #3
   8979c:	1ac827a8 	lsr	w8, w29, w8
   897a0:	12000d0b 	and	w11, w8, #0xf
   897a4:	33000d09 	bfxil	w9, w8, #0, #4
   897a8:	11015d68 	add	w8, w11, #0x57
   897ac:	7100297f 	cmp	w11, #0xa
   897b0:	d100058a 	sub	x10, x12, #0x1
   897b4:	1a883121 	csel	w1, w9, w8, cc  // cc = lo, ul, last
   897b8:	f100019f 	cmp	x12, #0x0
   897bc:	52800028 	mov	w8, #0x1                   	// #1
   897c0:	1a880519 	cinc	w25, w8, ne  // ne = any
   897c4:	9a8a03e8 	csel	x8, xzr, x10, eq  // eq = none
   897c8:	f90003e8 	str	x8, [sp]
   897cc:	14000003 	b	897d8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x2d8>
   897d0:	52800079 	mov	w25, #0x3                   	// #3
   897d4:	52800ea1 	mov	w1, #0x75                  	// #117
   897d8:	5280007c 	mov	w28, #0x3                   	// #3
   897dc:	a9422260 	ldp	x0, x8, [x19, #32]
   897e0:	f9401108 	ldr	x8, [x8, #32]
   897e4:	d63f0100 	blr	x8
   897e8:	3607f8e0 	tbz	w0, #0, 89704 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x204>
   897ec:	1400007d 	b	899e0 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4e0>
   897f0:	710203bf 	cmp	w29, #0x80
   897f4:	54000062 	b.cs	89800 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x300>  // b.hs, b.nlast
   897f8:	52800028 	mov	w8, #0x1                   	// #1
   897fc:	14000008 	b	8981c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x31c>
   89800:	712003bf 	cmp	w29, #0x800
   89804:	54000062 	b.cs	89810 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x310>  // b.hs, b.nlast
   89808:	52800048 	mov	w8, #0x2                   	// #2
   8980c:	14000004 	b	8981c <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x31c>
   89810:	714043bf 	cmp	w29, #0x10, lsl #12
   89814:	52800068 	mov	w8, #0x3                   	// #3
   89818:	9a883508 	cinc	x8, x8, cs  // cs = hs, nlast
   8981c:	8b1b0119 	add	x25, x8, x27
   89820:	cb180368 	sub	x8, x27, x24
   89824:	eb15035f 	cmp	x26, x21
   89828:	8b15011b 	add	x27, x8, x21
   8982c:	54ffe941 	b.ne	89554 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x54>  // b.any
   89830:	1400005d 	b	899a4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4a4>
   89834:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89838:	9100e000 	add	x0, x0, #0x38
   8983c:	2a1d03e1 	mov	w1, w29
   89840:	9400018a 	bl	89e68 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E>
   89844:	350009a0 	cbnz	w0, 89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>
   89848:	714043bf 	cmp	w29, #0x10, lsl #12
   8984c:	540002e2 	b.cs	898a8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x3a8>  // b.hs, b.nlast
   89850:	d0000001 	adrp	x1, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89854:	d0000003 	adrp	x3, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89858:	d0000005 	adrp	x5, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   8985c:	52800522 	mov	w2, #0x29                  	// #41
   89860:	528024a4 	mov	w4, #0x125                 	// #293
   89864:	52802746 	mov	w6, #0x13a                 	// #314
   89868:	2a1d03e0 	mov	w0, w29
   8986c:	910da021 	add	x1, x1, #0x368
   89870:	910ee863 	add	x3, x3, #0x3ba
   89874:	91137ca5 	add	x5, x5, #0x4df
   89878:	97fffb87 	bl	88694 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393>
   8987c:	3707fd20 	tbnz	w0, #0, 89820 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x320>
   89880:	1400003e 	b	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>
   89884:	52800e57 	mov	w23, #0x72                  	// #114
   89888:	14000002 	b	89890 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x390>
   8988c:	52800dd7 	mov	w23, #0x6e                  	// #110
   89890:	5280005c 	mov	w28, #0x2                   	// #2
   89894:	eb190362 	subs	x2, x27, x25
   89898:	a900d3f6 	stp	x22, x20, [sp, #8]
   8989c:	a901eff9 	stp	x25, x27, [sp, #24]
   898a0:	54ffefc2 	b.cs	89698 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x198>  // b.hs, b.nlast
   898a4:	14000063 	b	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>
   898a8:	714083bf 	cmp	w29, #0x20, lsl #12
   898ac:	540001c2 	b.cs	898e4 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x3e4>  // b.hs, b.nlast
   898b0:	d0000001 	adrp	x1, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   898b4:	d0000003 	adrp	x3, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   898b8:	d0000005 	adrp	x5, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   898bc:	52800462 	mov	w2, #0x23                  	// #35
   898c0:	528014c4 	mov	w4, #0xa6                  	// #166
   898c4:	52803306 	mov	w6, #0x198                 	// #408
   898c8:	2a1d03e0 	mov	w0, w29
   898cc:	91186421 	add	x1, x1, #0x619
   898d0:	91197c63 	add	x3, x3, #0x65f
   898d4:	911c14a5 	add	x5, x5, #0x705
   898d8:	97fffb6f 	bl	88694 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393>
   898dc:	3707fa20 	tbnz	w0, #0, 89820 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x320>
   898e0:	14000026 	b	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>
   898e4:	529fc208 	mov	w8, #0xfe10                	// #65040
   898e8:	72bffe28 	movk	w8, #0xfff1, lsl #16
   898ec:	529fc209 	mov	w9, #0xfe10                	// #65040
   898f0:	0b0803a8 	add	w8, w29, w8
   898f4:	72a00049 	movk	w9, #0x2, lsl #16
   898f8:	6b09011f 	cmp	w8, w9
   898fc:	540003e3 	b.cc	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>  // b.lo, b.ul, b.last
   89900:	5280bc48 	mov	w8, #0x5e2                 	// #1506
   89904:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89908:	5280dc49 	mov	w9, #0x6e2                 	// #1762
   8990c:	0b0803a8 	add	w8, w29, w8
   89910:	72a00169 	movk	w9, #0xb, lsl #16
   89914:	6b09011f 	cmp	w8, w9
   89918:	54000303 	b.cc	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>  // b.lo, b.ul, b.last
   8991c:	1138f508 	add	w8, w8, #0xe3d
   89920:	71307d1f 	cmp	w8, #0xc1f
   89924:	540002a3 	b.cc	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>  // b.lo, b.ul, b.last
   89928:	52862bc8 	mov	w8, #0x315e                	// #12638
   8992c:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89930:	0b0803a8 	add	w8, w29, w8
   89934:	7100391f 	cmp	w8, #0xe
   89938:	54000203 	b.cc	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>  // b.lo, b.ul, b.last
   8993c:	529703c9 	mov	w9, #0xb81e                	// #47134
   89940:	121f4fa8 	and	w8, w29, #0x1ffffe
   89944:	72a00049 	movk	w9, #0x2, lsl #16
   89948:	6b09011f 	cmp	w8, w9
   8994c:	54000160 	b.eq	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>  // b.none
   89950:	528b2528 	mov	w8, #0x5929                	// #22825
   89954:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89958:	0b0803a8 	add	w8, w29, w8
   8995c:	7100a51f 	cmp	w8, #0x29
   89960:	540000c3 	b.cc	89978 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x478>  // b.lo, b.ul, b.last
   89964:	52891968 	mov	w8, #0x48cb                	// #18635
   89968:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   8996c:	0b0803a8 	add	w8, w29, w8
   89970:	7100291f 	cmp	w8, #0xa
   89974:	54fff568 	b.hi	89820 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x320>  // b.pmore
   89978:	320003a8 	orr	w8, w29, #0x1
   8997c:	5ac01108 	clz	w8, w8
   89980:	53027d08 	lsr	w8, w8, #2
   89984:	52000908 	eor	w8, w8, #0x7
   89988:	5280007c 	mov	w28, #0x3                   	// #3
   8998c:	f90003e8 	str	x8, [sp]
   89990:	eb190362 	subs	x2, x27, x25
   89994:	a900d3f6 	stp	x22, x20, [sp, #8]
   89998:	a901eff9 	stp	x25, x27, [sp, #24]
   8999c:	54ffe7e2 	b.cs	89698 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x198>  // b.hs, b.nlast
   899a0:	14000024 	b	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>
   899a4:	a900d3f6 	stp	x22, x20, [sp, #8]
   899a8:	a901d3f9 	stp	x25, x20, [sp, #24]
   899ac:	b40000f9 	cbz	x25, 899c8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4c8>
   899b0:	eb14033f 	cmp	x25, x20
   899b4:	540000a0 	b.eq	899c8 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x4c8>  // b.none
   899b8:	540003c2 	b.cs	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>  // b.hs, b.nlast
   899bc:	38f96ac8 	ldrsb	w8, [x22, x25]
   899c0:	3101051f 	cmn	w8, #0x41
   899c4:	5400036d 	b.le	89a30 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x530>
   899c8:	a9422260 	ldp	x0, x8, [x19, #32]
   899cc:	8b1902c1 	add	x1, x22, x25
   899d0:	cb190282 	sub	x2, x20, x25
   899d4:	f9400d08 	ldr	x8, [x8, #24]
   899d8:	d63f0100 	blr	x8
   899dc:	36000140 	tbz	w0, #0, 89a04 <_ZN40_$LT$str$u20$as$u20$core..fmt..Debug$GT$3fmt17h04dd3c8427bc5502E+0x504>
   899e0:	a9497bfd 	ldp	x29, x30, [sp, #144]
   899e4:	a9484ff4 	ldp	x20, x19, [sp, #128]
   899e8:	a94757f6 	ldp	x22, x21, [sp, #112]
   899ec:	a9465ff8 	ldp	x24, x23, [sp, #96]
   899f0:	a94567fa 	ldp	x26, x25, [sp, #80]
   899f4:	a9446ffc 	ldp	x28, x27, [sp, #64]
   899f8:	52800020 	mov	w0, #0x1                   	// #1
   899fc:	910283ff 	add	sp, sp, #0xa0
   89a00:	d65f03c0 	ret
   89a04:	a9422260 	ldp	x0, x8, [x19, #32]
   89a08:	a9497bfd 	ldp	x29, x30, [sp, #144]
   89a0c:	a9484ff4 	ldp	x20, x19, [sp, #128]
   89a10:	a94757f6 	ldp	x22, x21, [sp, #112]
   89a14:	f9401102 	ldr	x2, [x8, #32]
   89a18:	a9465ff8 	ldp	x24, x23, [sp, #96]
   89a1c:	a94567fa 	ldp	x26, x25, [sp, #80]
   89a20:	a9446ffc 	ldp	x28, x27, [sp, #64]
   89a24:	52800441 	mov	w1, #0x22                  	// #34
   89a28:	910283ff 	add	sp, sp, #0xa0
   89a2c:	d61f0040 	br	x2
   89a30:	910023e8 	add	x8, sp, #0x8
   89a34:	910063e9 	add	x9, sp, #0x18
   89a38:	910083ea 	add	x10, sp, #0x20
   89a3c:	9100a3e0 	add	x0, sp, #0x28
   89a40:	a902a7e8 	stp	x8, x9, [sp, #40]
   89a44:	f9001fea 	str	x10, [sp, #56]
   89a48:	97fffb60 	bl	887c8 <_ZN4core3str6traits101_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..Range$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17h79c5f61e1ede7911E>
   89a4c:	d4200020 	brk	#0x1

0000000000089a50 <_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h5a9de3cd403484d2E>:
   89a50:	aa0103e8 	mov	x8, x1
   89a54:	aa0003e1 	mov	x1, x0
   89a58:	aa0203e0 	mov	x0, x2
   89a5c:	aa0803e2 	mov	x2, x8
   89a60:	17fffd8f 	b	8909c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE>

0000000000089a64 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E>:
   89a64:	a9bb6bfb 	stp	x27, x26, [sp, #-80]!
   89a68:	a90163f9 	stp	x25, x24, [sp, #16]
   89a6c:	a9025bf7 	stp	x23, x22, [sp, #32]
   89a70:	a90353f5 	stp	x21, x20, [sp, #48]
   89a74:	a9047bf3 	stp	x19, x30, [sp, #64]
   89a78:	a9422428 	ldp	x8, x9, [x1, #32]
   89a7c:	aa0103f3 	mov	x19, x1
   89a80:	aa0003f4 	mov	x20, x0
   89a84:	528004e1 	mov	w1, #0x27                  	// #39
   89a88:	f9401129 	ldr	x9, [x9, #32]
   89a8c:	aa0803e0 	mov	x0, x8
   89a90:	d63f0120 	blr	x9
   89a94:	34000100 	cbz	w0, 89ab4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x50>
   89a98:	a9447bf3 	ldp	x19, x30, [sp, #64]
   89a9c:	a94353f5 	ldp	x21, x20, [sp, #48]
   89aa0:	a9425bf7 	ldp	x23, x22, [sp, #32]
   89aa4:	a94163f9 	ldp	x25, x24, [sp, #16]
   89aa8:	52800020 	mov	w0, #0x1                   	// #1
   89aac:	a8c56bfb 	ldp	x27, x26, [sp], #80
   89ab0:	d65f03c0 	ret
   89ab4:	b9400294 	ldr	w20, [x20]
   89ab8:	51002688 	sub	w8, w20, #0x9
   89abc:	7100791f 	cmp	w8, #0x1e
   89ac0:	54000188 	b.hi	89af0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x8c>  // b.pmore
   89ac4:	d0000009 	adrp	x9, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89ac8:	913c1529 	add	x9, x9, #0xf05
   89acc:	100000ca 	adr	x10, 89ae4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x80>
   89ad0:	3868692b 	ldrb	w11, [x9, x8]
   89ad4:	8b0b094a 	add	x10, x10, x11, lsl #2
   89ad8:	52800057 	mov	w23, #0x2                   	// #2
   89adc:	52800e96 	mov	w22, #0x74                  	// #116
   89ae0:	d61f0140 	br	x10
   89ae4:	52800057 	mov	w23, #0x2                   	// #2
   89ae8:	52800dd6 	mov	w22, #0x6e                  	// #110
   89aec:	1400001c 	b	89b5c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0xf8>
   89af0:	7101729f 	cmp	w20, #0x5c
   89af4:	54000081 	b.ne	89b04 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0xa0>  // b.any
   89af8:	52800057 	mov	w23, #0x2                   	// #2
   89afc:	2a1403f6 	mov	w22, w20
   89b00:	14000054 	b	89c50 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1ec>
   89b04:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89b08:	9100e000 	add	x0, x0, #0x38
   89b0c:	2a1403e1 	mov	w1, w20
   89b10:	940000d6 	bl	89e68 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E>
   89b14:	35000940 	cbnz	w0, 89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>
   89b18:	7140429f 	cmp	w20, #0x10, lsl #12
   89b1c:	54000222 	b.cs	89b60 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0xfc>  // b.hs, b.nlast
   89b20:	d0000001 	adrp	x1, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89b24:	d0000003 	adrp	x3, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89b28:	d0000005 	adrp	x5, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89b2c:	910da021 	add	x1, x1, #0x368
   89b30:	910ee863 	add	x3, x3, #0x3ba
   89b34:	91137ca5 	add	x5, x5, #0x4df
   89b38:	52800522 	mov	w2, #0x29                  	// #41
   89b3c:	528024a4 	mov	w4, #0x125                 	// #293
   89b40:	52802746 	mov	w6, #0x13a                 	// #314
   89b44:	2a1403e0 	mov	w0, w20
   89b48:	97fffad3 	bl	88694 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393>
   89b4c:	37000720 	tbnz	w0, #0, 89c30 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1cc>
   89b50:	1400003b 	b	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>
   89b54:	52800057 	mov	w23, #0x2                   	// #2
   89b58:	52800e56 	mov	w22, #0x72                  	// #114
   89b5c:	1400003d 	b	89c50 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1ec>
   89b60:	7140829f 	cmp	w20, #0x20, lsl #12
   89b64:	540001c2 	b.cs	89b9c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x138>  // b.hs, b.nlast
   89b68:	d0000001 	adrp	x1, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89b6c:	d0000003 	adrp	x3, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89b70:	d0000005 	adrp	x5, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89b74:	91186421 	add	x1, x1, #0x619
   89b78:	91197c63 	add	x3, x3, #0x65f
   89b7c:	911c14a5 	add	x5, x5, #0x705
   89b80:	52800462 	mov	w2, #0x23                  	// #35
   89b84:	528014c4 	mov	w4, #0xa6                  	// #166
   89b88:	52803306 	mov	w6, #0x198                 	// #408
   89b8c:	2a1403e0 	mov	w0, w20
   89b90:	97fffac1 	bl	88694 <_ZN4core7unicode9printable5check17h898a6b051241e38fE.llvm.729544327176691393>
   89b94:	370004e0 	tbnz	w0, #0, 89c30 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1cc>
   89b98:	14000029 	b	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>
   89b9c:	529fc208 	mov	w8, #0xfe10                	// #65040
   89ba0:	72bffe28 	movk	w8, #0xfff1, lsl #16
   89ba4:	529fc209 	mov	w9, #0xfe10                	// #65040
   89ba8:	0b080288 	add	w8, w20, w8
   89bac:	72a00049 	movk	w9, #0x2, lsl #16
   89bb0:	6b09011f 	cmp	w8, w9
   89bb4:	54000443 	b.cc	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.lo, b.ul, b.last
   89bb8:	5280bc48 	mov	w8, #0x5e2                 	// #1506
   89bbc:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89bc0:	5280dc49 	mov	w9, #0x6e2                 	// #1762
   89bc4:	0b080288 	add	w8, w20, w8
   89bc8:	72a00169 	movk	w9, #0xb, lsl #16
   89bcc:	6b09011f 	cmp	w8, w9
   89bd0:	54000363 	b.cc	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.lo, b.ul, b.last
   89bd4:	1138f508 	add	w8, w8, #0xe3d
   89bd8:	71307d1f 	cmp	w8, #0xc1f
   89bdc:	54000303 	b.cc	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.lo, b.ul, b.last
   89be0:	52862bc8 	mov	w8, #0x315e                	// #12638
   89be4:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89be8:	0b080288 	add	w8, w20, w8
   89bec:	7100391f 	cmp	w8, #0xe
   89bf0:	54000263 	b.cc	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.lo, b.ul, b.last
   89bf4:	529703c9 	mov	w9, #0xb81e                	// #47134
   89bf8:	121f4e88 	and	w8, w20, #0x1ffffe
   89bfc:	72a00049 	movk	w9, #0x2, lsl #16
   89c00:	6b09011f 	cmp	w8, w9
   89c04:	540001c0 	b.eq	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.none
   89c08:	528b2528 	mov	w8, #0x5929                	// #22825
   89c0c:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89c10:	0b080288 	add	w8, w20, w8
   89c14:	7100a51f 	cmp	w8, #0x29
   89c18:	54000123 	b.cc	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.lo, b.ul, b.last
   89c1c:	52891968 	mov	w8, #0x48cb                	// #18635
   89c20:	72bfffa8 	movk	w8, #0xfffd, lsl #16
   89c24:	0b080288 	add	w8, w20, w8
   89c28:	7100291f 	cmp	w8, #0xa
   89c2c:	54000089 	b.ls	89c3c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1d8>  // b.plast
   89c30:	52800037 	mov	w23, #0x1                   	// #1
   89c34:	2a1403f6 	mov	w22, w20
   89c38:	14000006 	b	89c50 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x1ec>
   89c3c:	32000288 	orr	w8, w20, #0x1
   89c40:	5ac01108 	clz	w8, w8
   89c44:	53027d08 	lsr	w8, w8, #2
   89c48:	52000915 	eor	w21, w8, #0x7
   89c4c:	52800077 	mov	w23, #0x3                   	// #3
   89c50:	d0000018 	adrp	x24, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89c54:	d0000019 	adrp	x25, 8b000 <anon.8ff4ccf118441c8923d0deb749b0e8dc.13.llvm.3403828548517995196+0xc>
   89c58:	528000bb 	mov	w27, #0x5                   	// #5
   89c5c:	913c9318 	add	x24, x24, #0xf24
   89c60:	913ca339 	add	x25, x25, #0xf28
   89c64:	5280003a 	mov	w26, #0x1                   	// #1
   89c68:	14000008 	b	89c88 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x224>
   89c6c:	5280007b 	mov	w27, #0x3                   	// #3
   89c70:	52800ea1 	mov	w1, #0x75                  	// #117
   89c74:	52800077 	mov	w23, #0x3                   	// #3
   89c78:	a9422260 	ldp	x0, x8, [x19, #32]
   89c7c:	f9401108 	ldr	x8, [x8, #32]
   89c80:	d63f0100 	blr	x8
   89c84:	3707f0a0 	tbnz	w0, #0, 89a98 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x34>
   89c88:	2a1703e8 	mov	w8, w23
   89c8c:	10ffff69 	adr	x9, 89c78 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x214>
   89c90:	38686b0a 	ldrb	w10, [x24, x8]
   89c94:	8b0a0929 	add	x9, x9, x10, lsl #2
   89c98:	52800b81 	mov	w1, #0x5c                  	// #92
   89c9c:	52800037 	mov	w23, #0x1                   	// #1
   89ca0:	d61f0120 	br	x9
   89ca4:	714442df 	cmp	w22, #0x110, lsl #12
   89ca8:	540005a0 	b.eq	89d5c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x2f8>  // b.none
   89cac:	2a1f03f7 	mov	w23, wzr
   89cb0:	2a1603e1 	mov	w1, w22
   89cb4:	a9422260 	ldp	x0, x8, [x19, #32]
   89cb8:	f9401108 	ldr	x8, [x8, #32]
   89cbc:	d63f0100 	blr	x8
   89cc0:	3607fe40 	tbz	w0, #0, 89c88 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x224>
   89cc4:	17ffff75 	b	89a98 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x34>
   89cc8:	92401f68 	and	x8, x27, #0xff
   89ccc:	10fffd09 	adr	x9, 89c6c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x208>
   89cd0:	38686b2a 	ldrb	w10, [x25, x8]
   89cd4:	8b0a0929 	add	x9, x9, x10, lsl #2
   89cd8:	52800077 	mov	w23, #0x3                   	// #3
   89cdc:	52800b81 	mov	w1, #0x5c                  	// #92
   89ce0:	5280009b 	mov	w27, #0x4                   	// #4
   89ce4:	d61f0120 	br	x9
   89ce8:	2a1f03fb 	mov	w27, wzr
   89cec:	52800077 	mov	w23, #0x3                   	// #3
   89cf0:	52800fa1 	mov	w1, #0x7d                  	// #125
   89cf4:	a9422260 	ldp	x0, x8, [x19, #32]
   89cf8:	f9401108 	ldr	x8, [x8, #32]
   89cfc:	d63f0100 	blr	x8
   89d00:	3607fc40 	tbz	w0, #0, 89c88 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x224>
   89d04:	17ffff65 	b	89a98 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x34>
   89d08:	531e0aa8 	ubfiz	w8, w21, #2, #3
   89d0c:	1ac82688 	lsr	w8, w20, w8
   89d10:	52800609 	mov	w9, #0x30                  	// #48
   89d14:	12000d0b 	and	w11, w8, #0xf
   89d18:	33000d09 	bfxil	w9, w8, #0, #4
   89d1c:	11015d68 	add	w8, w11, #0x57
   89d20:	7100297f 	cmp	w11, #0xa
   89d24:	d10006aa 	sub	x10, x21, #0x1
   89d28:	1a883121 	csel	w1, w9, w8, cc  // cc = lo, ul, last
   89d2c:	f10002bf 	cmp	x21, #0x0
   89d30:	1a9a075b 	cinc	w27, w26, ne  // ne = any
   89d34:	9a8a03f5 	csel	x21, xzr, x10, eq  // eq = none
   89d38:	17ffffcf 	b	89c74 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x210>
   89d3c:	52800077 	mov	w23, #0x3                   	// #3
   89d40:	5280005b 	mov	w27, #0x2                   	// #2
   89d44:	52800f61 	mov	w1, #0x7b                  	// #123
   89d48:	a9422260 	ldp	x0, x8, [x19, #32]
   89d4c:	f9401108 	ldr	x8, [x8, #32]
   89d50:	d63f0100 	blr	x8
   89d54:	3607f9a0 	tbz	w0, #0, 89c88 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x224>
   89d58:	17ffff50 	b	89a98 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17h00b04bf6c5b33926E+0x34>
   89d5c:	a9422260 	ldp	x0, x8, [x19, #32]
   89d60:	a9447bf3 	ldp	x19, x30, [sp, #64]
   89d64:	a94353f5 	ldp	x21, x20, [sp, #48]
   89d68:	a9425bf7 	ldp	x23, x22, [sp, #32]
   89d6c:	f9401102 	ldr	x2, [x8, #32]
   89d70:	a94163f9 	ldp	x25, x24, [sp, #16]
   89d74:	528004e1 	mov	w1, #0x27                  	// #39
   89d78:	a8c56bfb 	ldp	x27, x26, [sp], #80
   89d7c:	d61f0040 	br	x2

0000000000089d80 <_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h5121424df1fe32d8E>:
   89d80:	a9422020 	ldp	x0, x8, [x1, #32]
   89d84:	f0000001 	adrp	x1, 8c000 <anon.bea45d2b58bc3fc773c7dc5b1c0cd0b9.68.llvm.729544327176691393+0x8fb>
   89d88:	9100c821 	add	x1, x1, #0x32
   89d8c:	528000a2 	mov	w2, #0x5                   	// #5
   89d90:	f9400d03 	ldr	x3, [x8, #24]
   89d94:	d61f0060 	br	x3

0000000000089d98 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5b563bce026e6d02E>:
   89d98:	a9402000 	ldp	x0, x8, [x0]
   89d9c:	f9400d02 	ldr	x2, [x8, #24]
   89da0:	d61f0040 	br	x2

0000000000089da4 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h6b6bc846148ca92bE>:
   89da4:	a9400808 	ldp	x8, x2, [x0]
   89da8:	aa0103e0 	mov	x0, x1
   89dac:	aa0803e1 	mov	x1, x8
   89db0:	17fffcbb 	b	8909c <_ZN4core3fmt9Formatter3pad17he1b58303487473eaE>

0000000000089db4 <_ZN4core3ptr18real_drop_in_place17hc37155acbf14398aE>:
   89db4:	d65f03c0 	ret

0000000000089db8 <_ZN4core9panicking5panic17h9428e358a2a56b0bE>:
   89db8:	d10143ff 	sub	sp, sp, #0x50
   89dbc:	a903fbe1 	stp	x1, x30, [sp, #56]
   89dc0:	a90283ff 	stp	xzr, x0, [sp, #40]
   89dc4:	9100c3e8 	add	x8, sp, #0x30
   89dc8:	52800029 	mov	w9, #0x1                   	// #1
   89dcc:	5280010a 	mov	w10, #0x8                   	// #8
   89dd0:	910003e0 	mov	x0, sp
   89dd4:	aa0203e1 	mov	x1, x2
   89dd8:	a9017fff 	stp	xzr, xzr, [sp, #16]
   89ddc:	a90027e8 	stp	x8, x9, [sp]
   89de0:	f90013ea 	str	x10, [sp, #32]
   89de4:	94000017 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   89de8:	d4200020 	brk	#0x1

0000000000089dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>:
   89dec:	d101c3ff 	sub	sp, sp, #0x70
   89df0:	a9060bfe 	stp	x30, x2, [sp, #96]
   89df4:	f90007e1 	str	x1, [sp, #8]
   89df8:	b000002a 	adrp	x10, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89dfc:	f944494a 	ldr	x10, [x10, #2192]
   89e00:	9101a3e9 	add	x9, sp, #0x68
   89e04:	910023eb 	add	x11, sp, #0x8
   89e08:	aa0003e8 	mov	x8, x0
   89e0c:	a9042be9 	stp	x9, x10, [sp, #64]
   89e10:	b0000029 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89e14:	911ac129 	add	x9, x9, #0x6b0
   89e18:	a9052beb 	stp	x11, x10, [sp, #80]
   89e1c:	5280004a 	mov	w10, #0x2                   	// #2
   89e20:	a9012be9 	stp	x9, x10, [sp, #16]
   89e24:	910103e9 	add	x9, sp, #0x40
   89e28:	910043e0 	add	x0, sp, #0x10
   89e2c:	aa0803e1 	mov	x1, x8
   89e30:	a9027fff 	stp	xzr, xzr, [sp, #32]
   89e34:	a9032be9 	stp	x9, x10, [sp, #48]
   89e38:	94000002 	bl	89e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>
   89e3c:	d4200020 	brk	#0x1

0000000000089e40 <_ZN4core9panicking9panic_fmt17hb8a63420dcd6dc09E>:
   89e40:	d100c3ff 	sub	sp, sp, #0x30
   89e44:	a901fbe1 	stp	x1, x30, [sp, #24]
   89e48:	b0000029 	adrp	x9, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89e4c:	52800028 	mov	w8, #0x1                   	// #1
   89e50:	911a4129 	add	x9, x9, #0x690
   89e54:	f9000be0 	str	x0, [sp, #16]
   89e58:	910003e0 	mov	x0, sp
   89e5c:	a90027e8 	stp	x8, x9, [sp]
   89e60:	97ffe7b2 	bl	83d28 <rust_begin_unwind>
   89e64:	d4200020 	brk	#0x1

0000000000089e68 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E>:
   89e68:	f81f0ffe 	str	x30, [sp, #-16]!
   89e6c:	7120003f 	cmp	w1, #0x800
   89e70:	54000082 	b.cs	89e80 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0x18>  // b.hs, b.nlast
   89e74:	53067c28 	lsr	w8, w1, #6
   89e78:	8b284c08 	add	x8, x0, w8, uxtw #3
   89e7c:	14000020 	b	89efc <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0x94>
   89e80:	7140403f 	cmp	w1, #0x10, lsl #12
   89e84:	54000182 	b.cs	89eb4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0x4c>  // b.hs, b.nlast
   89e88:	53067c28 	lsr	w8, w1, #6
   89e8c:	d1008108 	sub	x8, x8, #0x20
   89e90:	f10f7d1f 	cmp	x8, #0x3df
   89e94:	54000428 	b.hi	89f18 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0xb0>  // b.pmore
   89e98:	8b080008 	add	x8, x0, x8
   89e9c:	3944c108 	ldrb	w8, [x8, #304]
   89ea0:	f9408402 	ldr	x2, [x0, #264]
   89ea4:	eb08005f 	cmp	x2, x8
   89ea8:	54000449 	b.ls	89f30 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0xc8>  // b.plast
   89eac:	f9408009 	ldr	x9, [x0, #256]
   89eb0:	14000012 	b	89ef8 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0x90>
   89eb4:	530c7c28 	lsr	w8, w1, #12
   89eb8:	d1004108 	sub	x8, x8, #0x10
   89ebc:	f104011f 	cmp	x8, #0x100
   89ec0:	54000422 	b.cs	89f44 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0xdc>  // b.hs, b.nlast
   89ec4:	8b080008 	add	x8, x0, x8
   89ec8:	39544109 	ldrb	w9, [x8, #1296]
   89ecc:	f9408c02 	ldr	x2, [x0, #280]
   89ed0:	53062c28 	ubfx	w8, w1, #6, #6
   89ed4:	b37a1d28 	bfi	x8, x9, #6, #8
   89ed8:	eb02011f 	cmp	x8, x2
   89edc:	54000402 	b.cs	89f5c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0xf4>  // b.hs, b.nlast
   89ee0:	f9408809 	ldr	x9, [x0, #272]
   89ee4:	f9409402 	ldr	x2, [x0, #296]
   89ee8:	38686928 	ldrb	w8, [x9, x8]
   89eec:	eb08005f 	cmp	x2, x8
   89ef0:	54000409 	b.ls	89f70 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17hb6b47b189ad12b68E+0x108>  // b.plast
   89ef4:	f9409009 	ldr	x9, [x0, #288]
   89ef8:	8b080d28 	add	x8, x9, x8, lsl #3
   89efc:	f9400108 	ldr	x8, [x8]
   89f00:	52800029 	mov	w9, #0x1                   	// #1
   89f04:	9ac12129 	lsl	x9, x9, x1
   89f08:	ea09011f 	tst	x8, x9
   89f0c:	1a9f07e0 	cset	w0, ne  // ne = any
   89f10:	f84107fe 	ldr	x30, [sp], #16
   89f14:	d65f03c0 	ret
   89f18:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89f1c:	911b4000 	add	x0, x0, #0x6d0
   89f20:	52807c02 	mov	w2, #0x3e0                 	// #992
   89f24:	aa0803e1 	mov	x1, x8
   89f28:	97ffffb1 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   89f2c:	d4200020 	brk	#0x1
   89f30:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89f34:	911ba000 	add	x0, x0, #0x6e8
   89f38:	aa0803e1 	mov	x1, x8
   89f3c:	97ffffac 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   89f40:	d4200020 	brk	#0x1
   89f44:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89f48:	911c0000 	add	x0, x0, #0x700
   89f4c:	52802002 	mov	w2, #0x100                 	// #256
   89f50:	aa0803e1 	mov	x1, x8
   89f54:	97ffffa6 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   89f58:	d4200020 	brk	#0x1
   89f5c:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89f60:	911c6000 	add	x0, x0, #0x718
   89f64:	aa0803e1 	mov	x1, x8
   89f68:	97ffffa1 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   89f6c:	d4200020 	brk	#0x1
   89f70:	b0000020 	adrp	x0, 8e000 <_ZN4core3fmt3num14DEC_DIGITS_LUT17h46bba502bada2534E+0x1c0>
   89f74:	911cc000 	add	x0, x0, #0x730
   89f78:	aa0803e1 	mov	x1, x8
   89f7c:	97ffff9c 	bl	89dec <_ZN4core9panicking18panic_bounds_check17h045baa56c9a3a340E>
   89f80:	d4200020 	brk	#0x1

0000000000089f84 <memcpy>:
   89f84:	b4000222 	cbz	x2, 89fc8 <memcpy+0x44>
   89f88:	f1007c5f 	cmp	x2, #0x1f
   89f8c:	540000e9 	b.ls	89fa8 <memcpy+0x24>  // b.plast
   89f90:	8b020028 	add	x8, x1, x2
   89f94:	eb00011f 	cmp	x8, x0
   89f98:	540001a9 	b.ls	89fcc <memcpy+0x48>  // b.plast
   89f9c:	8b020008 	add	x8, x0, x2
   89fa0:	eb01011f 	cmp	x8, x1
   89fa4:	54000149 	b.ls	89fcc <memcpy+0x48>  // b.plast
   89fa8:	aa1f03e8 	mov	x8, xzr
   89fac:	cb080049 	sub	x9, x2, x8
   89fb0:	8b08000a 	add	x10, x0, x8
   89fb4:	8b080028 	add	x8, x1, x8
   89fb8:	3840150b 	ldrb	w11, [x8], #1
   89fbc:	f1000529 	subs	x9, x9, #0x1
   89fc0:	3800154b 	strb	w11, [x10], #1
   89fc4:	54ffffa1 	b.ne	89fb8 <memcpy+0x34>  // b.any
   89fc8:	d65f03c0 	ret
   89fcc:	927be848 	and	x8, x2, #0xffffffffffffffe0
   89fd0:	91004029 	add	x9, x1, #0x10
   89fd4:	9100400a 	add	x10, x0, #0x10
   89fd8:	aa0803eb 	mov	x11, x8
   89fdc:	ad7f8520 	ldp	q0, q1, [x9, #-16]
   89fe0:	91008129 	add	x9, x9, #0x20
   89fe4:	f100816b 	subs	x11, x11, #0x20
   89fe8:	ad3f8540 	stp	q0, q1, [x10, #-16]
   89fec:	9100814a 	add	x10, x10, #0x20
   89ff0:	54ffff61 	b.ne	89fdc <memcpy+0x58>  // b.any
   89ff4:	eb02011f 	cmp	x8, x2
   89ff8:	54fffda1 	b.ne	89fac <memcpy+0x28>  // b.any
   89ffc:	17fffff3 	b	89fc8 <memcpy+0x44>

000000000008a000 <memmove>:
   8a000:	eb00003f 	cmp	x1, x0
   8a004:	54000142 	b.cs	8a02c <memmove+0x2c>  // b.hs, b.nlast
   8a008:	b4000342 	cbz	x2, 8a070 <memmove+0x70>
   8a00c:	d1000408 	sub	x8, x0, #0x1
   8a010:	d1000429 	sub	x9, x1, #0x1
   8a014:	3862692a 	ldrb	w10, [x9, x2]
   8a018:	f100044b 	subs	x11, x2, #0x1
   8a01c:	3822690a 	strb	w10, [x8, x2]
   8a020:	aa0b03e2 	mov	x2, x11
   8a024:	54ffff81 	b.ne	8a014 <memmove+0x14>  // b.any
   8a028:	14000012 	b	8a070 <memmove+0x70>
   8a02c:	b4000222 	cbz	x2, 8a070 <memmove+0x70>
   8a030:	f1007c5f 	cmp	x2, #0x1f
   8a034:	540000e9 	b.ls	8a050 <memmove+0x50>  // b.plast
   8a038:	8b020028 	add	x8, x1, x2
   8a03c:	eb00011f 	cmp	x8, x0
   8a040:	540001a9 	b.ls	8a074 <memmove+0x74>  // b.plast
   8a044:	8b020008 	add	x8, x0, x2
   8a048:	eb01011f 	cmp	x8, x1
   8a04c:	54000149 	b.ls	8a074 <memmove+0x74>  // b.plast
   8a050:	aa1f03e8 	mov	x8, xzr
   8a054:	cb080049 	sub	x9, x2, x8
   8a058:	8b08000a 	add	x10, x0, x8
   8a05c:	8b080028 	add	x8, x1, x8
   8a060:	3840150b 	ldrb	w11, [x8], #1
   8a064:	f1000529 	subs	x9, x9, #0x1
   8a068:	3800154b 	strb	w11, [x10], #1
   8a06c:	54ffffa1 	b.ne	8a060 <memmove+0x60>  // b.any
   8a070:	d65f03c0 	ret
   8a074:	927be848 	and	x8, x2, #0xffffffffffffffe0
   8a078:	91004029 	add	x9, x1, #0x10
   8a07c:	9100400a 	add	x10, x0, #0x10
   8a080:	aa0803eb 	mov	x11, x8
   8a084:	ad7f8520 	ldp	q0, q1, [x9, #-16]
   8a088:	91008129 	add	x9, x9, #0x20
   8a08c:	f100816b 	subs	x11, x11, #0x20
   8a090:	ad3f8540 	stp	q0, q1, [x10, #-16]
   8a094:	9100814a 	add	x10, x10, #0x20
   8a098:	54ffff61 	b.ne	8a084 <memmove+0x84>  // b.any
   8a09c:	eb02011f 	cmp	x8, x2
   8a0a0:	54fffda1 	b.ne	8a054 <memmove+0x54>  // b.any
   8a0a4:	17fffff3 	b	8a070 <memmove+0x70>

000000000008a0a8 <memset>:
   8a0a8:	b4000282 	cbz	x2, 8a0f8 <memset+0x50>
   8a0ac:	f1007c5f 	cmp	x2, #0x1f
   8a0b0:	54000068 	b.hi	8a0bc <memset+0x14>  // b.pmore
   8a0b4:	aa1f03e8 	mov	x8, xzr
   8a0b8:	1400000b 	b	8a0e4 <memset+0x3c>
   8a0bc:	927be848 	and	x8, x2, #0xffffffffffffffe0
   8a0c0:	4e010c20 	dup	v0.16b, w1
   8a0c4:	91004009 	add	x9, x0, #0x10
   8a0c8:	aa0803ea 	mov	x10, x8
   8a0cc:	ad3f8120 	stp	q0, q0, [x9, #-16]
   8a0d0:	f100814a 	subs	x10, x10, #0x20
   8a0d4:	91008129 	add	x9, x9, #0x20
   8a0d8:	54ffffa1 	b.ne	8a0cc <memset+0x24>  // b.any
   8a0dc:	eb02011f 	cmp	x8, x2
   8a0e0:	540000c0 	b.eq	8a0f8 <memset+0x50>  // b.none
   8a0e4:	cb080049 	sub	x9, x2, x8
   8a0e8:	8b080008 	add	x8, x0, x8
   8a0ec:	f1000529 	subs	x9, x9, #0x1
   8a0f0:	38001501 	strb	w1, [x8], #1
   8a0f4:	54ffffc1 	b.ne	8a0ec <memset+0x44>  // b.any
   8a0f8:	d65f03c0 	ret
