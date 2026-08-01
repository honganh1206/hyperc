
kernel.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
       0:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
       4:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
       9:	e8 df 00 00 00       	call   0xed
       e:	f4                   	hlt
       f:	eb fd                	jmp    0xe
      11:	f3 0f 1e fa          	endbr64
      15:	48 31 c0             	xor    rax,rax
      18:	48 c7 c2 08 00 20 00 	mov    rdx,0x200008
      1f:	b9 81 00 00 c0       	mov    ecx,0xc0000081
      24:	b8 d5 7f 3f 00       	mov    eax,0x3f7fd5
      29:	48 31 d2             	xor    rdx,rdx
      2c:	b9 84 00 00 c0       	mov    ecx,0xc0000084
      31:	0f 30                	wrmsr
      33:	48 8d 05 24 01 00 00 	lea    rax,[rip+0x124]        # 0x15e
      3a:	48 c7 c2 80 00 00 00 	mov    rdx,0x80
      41:	b9 82 00 00 c0       	mov    ecx,0xc0000082
      46:	0f 30                	wrmsr
      48:	31 c0                	xor    eax,eax
      4a:	c3                   	ret
      4b:	f3 0f 1e fa          	endbr64
      4f:	41 57                	push   r15
      51:	49 89 ff             	mov    r15,rdi
      54:	41 56                	push   r14
      56:	41 55                	push   r13
      58:	4c 8d 2c fd 00 00 00 	lea    r13,[rdi*8+0x0]
      5f:	00 
      60:	41 54                	push   r12
      62:	55                   	push   rbp
      63:	53                   	push   rbx
      64:	48 89 f3             	mov    rbx,rsi
      67:	52                   	push   rdx
      68:	4a 8b 6c 2e f8       	mov    rbp,QWORD PTR [rsi+r13*1-0x8]
      6d:	48 8d 7d 01          	lea    rdi,[rbp+0x1]
      71:	e8 ef 11 00 00       	call   0x1265
      76:	be 00 10 00 00       	mov    esi,0x1000
      7b:	48 01 c5             	add    rbp,rax
      7e:	48 29 dd             	sub    rbp,rbx
      81:	48 63 ed             	movsxd rbp,ebp
      84:	48 89 ef             	mov    rdi,rbp
      87:	e8 c5 09 00 00       	call   0xa51
      8c:	48 89 c7             	mov    rdi,rax
      8f:	49 89 c6             	mov    r14,rax
      92:	e8 41 0c 00 00       	call   0xcd8
      97:	ba 03 00 00 00       	mov    edx,0x3
      9c:	48 89 c6             	mov    rsi,rax
      9f:	48 89 c7             	mov    rdi,rax
      a2:	49 89 c4             	mov    r12,rax
      a5:	e8 bf 0d 00 00       	call   0xe69
      aa:	31 c0                	xor    eax,eax
      ac:	49 39 c7             	cmp    r15,rax
      af:	74 13                	je     0xc4
      b1:	48 8b 14 c3          	mov    rdx,QWORD PTR [rbx+rax*8]
      b5:	48 29 da             	sub    rdx,rbx
      b8:	4c 01 e2             	add    rdx,r12
      bb:	48 89 14 c3          	mov    QWORD PTR [rbx+rax*8],rdx
      bf:	48 ff c0             	inc    rax
      c2:	eb e8                	jmp    0xac
      c4:	48 89 ea             	mov    rdx,rbp
      c7:	48 89 de             	mov    rsi,rbx
      ca:	4c 89 f7             	mov    rdi,r14
      cd:	e8 46 11 00 00       	call   0x1218
      d2:	48 8b 3b             	mov    rdi,QWORD PTR [rbx]
      d5:	4b 8d 54 25 00       	lea    rdx,[r13+r12*1+0x0]
      da:	58                   	pop    rax
      db:	4c 89 e6             	mov    rsi,r12
      de:	5b                   	pop    rbx
      df:	5d                   	pop    rbp
      e0:	41 5c                	pop    r12
      e2:	41 5d                	pop    r13
      e4:	41 5e                	pop    r14
      e6:	41 5f                	pop    r15
      e8:	e9 28 01 00 00       	jmp    0x215
      ed:	f3 0f 1e fa          	endbr64
      f1:	41 54                	push   r12
      f3:	31 c0                	xor    eax,eax
      f5:	49 89 cc             	mov    r12,rcx
      f8:	55                   	push   rbp
      f9:	48 89 d5             	mov    rbp,rdx
      fc:	53                   	push   rbx
      fd:	48 89 fb             	mov    rbx,rdi
     100:	48 0f ba eb 27       	bts    rbx,0x27
     105:	48 83 ec 10          	sub    rsp,0x10
     109:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
     10e:	e8 7c 0b 00 00       	call   0xc8f
     113:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
     118:	48 89 df             	mov    rdi,rbx
     11b:	e8 8f 08 00 00       	call   0x9af
     120:	31 c0                	xor    eax,eax
     122:	e8 ea fe ff ff       	call   0x11
     127:	85 c0                	test   eax,eax
     129:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
     12d:	75 11                	jne    0x140
     12f:	4c 89 e6             	mov    rsi,r12
     132:	48 89 ef             	mov    rdi,rbp
     135:	e8 11 ff ff ff       	call   0x4b
     13a:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
     13e:	eb 05                	jmp    0x145
     140:	b8 01 00 00 00       	mov    eax,0x1
     145:	48 83 c4 10          	add    rsp,0x10
     149:	5b                   	pop    rbx
     14a:	5d                   	pop    rbp
     14b:	41 5c                	pop    r12
     14d:	c3                   	ret
	...
     15e:	48 89 25 f1 ff ff ff 	mov    QWORD PTR [rip+0xfffffffffffffff1],rsp        # 0x156
     165:	48 8b 25 e2 ff ff ff 	mov    rsp,QWORD PTR [rip+0xffffffffffffffe2]        # 0x14e
     16c:	57                   	push   rdi
     16d:	56                   	push   rsi
     16e:	52                   	push   rdx
     16f:	51                   	push   rcx
     170:	41 50                	push   r8
     172:	41 51                	push   r9
     174:	41 52                	push   r10
     176:	41 53                	push   r11
     178:	4c 89 d1             	mov    rcx,r10
     17b:	e8 17 00 00 00       	call   0x197
     180:	41 5b                	pop    r11
     182:	41 5a                	pop    r10
     184:	41 59                	pop    r9
     186:	41 58                	pop    r8
     188:	59                   	pop    rcx
     189:	5a                   	pop    rdx
     18a:	5e                   	pop    rsi
     18b:	5f                   	pop    rdi
     18c:	48 8b 25 c3 ff ff ff 	mov    rsp,QWORD PTR [rip+0xffffffffffffffc3]        # 0x156
     193:	48                   	rex.W
     194:	48 0f 07             	sysretq
     197:	f3 0f 1e fa          	endbr64
     19b:	89 c0                	mov    eax,eax
     19d:	83 f8 3c             	cmp    eax,0x3c
     1a0:	77 19                	ja     0x1bb
     1a2:	89 c0                	mov    eax,eax
     1a4:	4c 8d 15 75 2e 00 00 	lea    r10,[rip+0x2e75]        # 0x3020
     1ab:	49 8b 04 c2          	mov    rax,QWORD PTR [r10+rax*8]
     1af:	48 85 c0             	test   rax,rax
     1b2:	74 07                	je     0x1bb
     1b4:	48 0f ba e8 27       	bts    rax,0x27
     1b9:	ff e0                	jmp    rax
     1bb:	48 c7 c0 da ff ff ff 	mov    rax,0xffffffffffffffda
     1c2:	c3                   	ret
     1c3:	55                   	push   rbp
     1c4:	48 89 fe             	mov    rsi,rdi
     1c7:	ba 08 00 00 00       	mov    edx,0x8
     1cc:	31 ed                	xor    ebp,ebp
     1ce:	53                   	push   rbx
     1cf:	48 89 fb             	mov    rbx,rdi
     1d2:	31 ff                	xor    edi,edi
     1d4:	51                   	push   rcx
     1d5:	e8 ed 0e 00 00       	call   0x10c7
     1da:	85 c0                	test   eax,eax
     1dc:	75 29                	jne    0x207
     1de:	bd f2 ff ff ff       	mov    ebp,0xfffffff2
     1e3:	eb 2a                	jmp    0x20f
     1e5:	e8 86 0f 00 00       	call   0x1170
     1ea:	85 c0                	test   eax,eax
     1ec:	74 f0                	je     0x1de
     1ee:	48 83 c3 08          	add    rbx,0x8
     1f2:	31 ff                	xor    edi,edi
     1f4:	ba 08 00 00 00       	mov    edx,0x8
     1f9:	ff c5                	inc    ebp
     1fb:	48 89 de             	mov    rsi,rbx
     1fe:	e8 c4 0e 00 00       	call   0x10c7
     203:	85 c0                	test   eax,eax
     205:	74 d7                	je     0x1de
     207:	48 8b 3b             	mov    rdi,QWORD PTR [rbx]
     20a:	48 85 ff             	test   rdi,rdi
     20d:	75 d6                	jne    0x1e5
     20f:	89 e8                	mov    eax,ebp
     211:	5a                   	pop    rdx
     212:	5b                   	pop    rbx
     213:	5d                   	pop    rbp
     214:	c3                   	ret
     215:	f3 0f 1e fa          	endbr64
     219:	41 57                	push   r15
     21b:	41 56                	push   r14
     21d:	41 55                	push   r13
     21f:	49 89 f5             	mov    r13,rsi
     222:	41 54                	push   r12
     224:	55                   	push   rbp
     225:	53                   	push   rbx
     226:	48 83 ec 38          	sub    rsp,0x38
     22a:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
     22f:	e8 83 04 00 00       	call   0x6b7
     234:	89 c3                	mov    ebx,eax
     236:	85 c0                	test   eax,eax
     238:	0f 88 50 03 00 00    	js     0x58e
     23e:	31 f6                	xor    esi,esi
     240:	bf 00 10 00 00       	mov    edi,0x1000
     245:	e8 07 08 00 00       	call   0xa51
     24a:	48 89 c7             	mov    rdi,rax
     24d:	48 89 c5             	mov    rbp,rax
     250:	e8 83 0a 00 00       	call   0xcd8
     255:	ba 00 10 00 00       	mov    edx,0x1000
     25a:	89 df                	mov    edi,ebx
     25c:	48 89 c6             	mov    rsi,rax
     25f:	e8 1d 06 00 00       	call   0x881
     264:	ba 10 00 00 00       	mov    edx,0x10
     269:	48 8d 35 f0 19 00 00 	lea    rsi,[rip+0x19f0]        # 0x1c60
     270:	48 89 ef             	mov    rdi,rbp
     273:	e8 ad 0f 00 00       	call   0x1225
     278:	89 04 24             	mov    DWORD PTR [rsp],eax
     27b:	85 c0                	test   eax,eax
     27d:	0f 85 fb 02 00 00    	jne    0x57e
     283:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
     287:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
     28c:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
     28f:	8d 50 fe             	lea    edx,[rax-0x2]
     292:	66 83 fa 01          	cmp    dx,0x1
     296:	0f 87 e2 02 00 00    	ja     0x57e
     29c:	66 83 f8 03          	cmp    ax,0x3
     2a0:	ba 00 00 00 00       	mov    edx,0x0
     2a5:	48 b8 00 40 55 55 55 	movabs rax,0x555555554000
     2ac:	55 00 00 
     2af:	48 0f 45 c2          	cmovne rax,rdx
     2b3:	48 83 7d 20 40       	cmp    QWORD PTR [rbp+0x20],0x40
     2b8:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
     2bd:	0f 85 c2 02 00 00    	jne    0x585
     2c3:	66 83 7d 36 38       	cmp    WORD PTR [rbp+0x36],0x38
     2c8:	0f 85 b7 02 00 00    	jne    0x585
     2ce:	0f b7 45 38          	movzx  eax,WORD PTR [rbp+0x38]
     2d2:	4c 8d 75 40          	lea    r14,[rbp+0x40]
     2d6:	48 6b c0 38          	imul   rax,rax,0x38
     2da:	48 83 c0 40          	add    rax,0x40
     2de:	48 3d 00 10 00 00    	cmp    rax,0x1000
     2e4:	0f 87 9b 02 00 00    	ja     0x585
     2ea:	0f b7 45 38          	movzx  eax,WORD PTR [rbp+0x38]
     2ee:	39 04 24             	cmp    DWORD PTR [rsp],eax
     2f1:	0f 8d e3 00 00 00    	jge    0x3da
     2f7:	41 83 3e 01          	cmp    DWORD PTR [r14],0x1
     2fb:	74 09                	je     0x306
     2fd:	ff 04 24             	inc    DWORD PTR [rsp]
     300:	49 83 c6 38          	add    r14,0x38
     304:	eb e4                	jmp    0x2ea
     306:	4d 8b 66 10          	mov    r12,QWORD PTR [r14+0x10]
     30a:	4d 8b 7e 20          	mov    r15,QWORD PTR [r14+0x20]
     30e:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
     313:	4c 89 e0             	mov    rax,r12
     316:	4d 01 fc             	add    r12,r15
     319:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
     31f:	48 01 c8             	add    rax,rcx
     322:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
     327:	41 f7 c4 ff 0f 00 00 	test   r12d,0xfff
     32e:	74 0e                	je     0x33e
     330:	49 81 e4 00 f0 ff ff 	and    r12,0xfffffffffffff000
     337:	49 81 c4 00 10 00 00 	add    r12,0x1000
     33e:	41 8b 7e 04          	mov    edi,DWORD PTR [r14+0x4]
     342:	e8 a6 0c 00 00       	call   0xfed
     347:	4d 8b 4e 08          	mov    r9,QWORD PTR [r14+0x8]
     34b:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
     350:	41 89 d8             	mov    r8d,ebx
     353:	89 c2                	mov    edx,eax
     355:	b9 10 00 00 00       	mov    ecx,0x10
     35a:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
     35e:	4c 89 ce             	mov    rsi,r9
     361:	49 81 e1 00 f0 ff ff 	and    r9,0xfffffffffffff000
     368:	81 e6 ff 0f 00 00    	and    esi,0xfff
     36e:	4c 01 fe             	add    rsi,r15
     371:	e8 39 02 00 00       	call   0x5af
     376:	48 39 44 24 10       	cmp    QWORD PTR [rsp+0x10],rax
     37b:	8b 54 24 28          	mov    edx,DWORD PTR [rsp+0x28]
     37f:	74 0a                	je     0x38b
     381:	85 c0                	test   eax,eax
     383:	0f 88 03 02 00 00    	js     0x58c
     389:	eb 7a                	jmp    0x405
     38b:	49 8b 76 28          	mov    rsi,QWORD PTR [r14+0x28]
     38f:	49 39 f7             	cmp    r15,rsi
     392:	0f 83 65 ff ff ff    	jae    0x2fd
     398:	49 03 76 10          	add    rsi,QWORD PTR [r14+0x10]
     39c:	f7 c6 ff 0f 00 00    	test   esi,0xfff
     3a2:	74 0e                	je     0x3b2
     3a4:	48 81 e6 00 f0 ff ff 	and    rsi,0xfffffffffffff000
     3ab:	48 81 c6 00 10 00 00 	add    rsi,0x1000
     3b2:	49 39 f4             	cmp    r12,rsi
     3b5:	0f 84 42 ff ff ff    	je     0x2fd
     3bb:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
     3c0:	4c 29 e6             	sub    rsi,r12
     3c3:	4d 8d 3c 04          	lea    r15,[r12+rax*1]
     3c7:	4c 89 ff             	mov    rdi,r15
     3ca:	e8 a4 07 00 00       	call   0xb73
     3cf:	49 39 c7             	cmp    r15,rax
     3d2:	0f 84 25 ff ff ff    	je     0x2fd
     3d8:	eb 21                	jmp    0x3fb
     3da:	48 bd 00 f0 fb ff ff 	movabs rbp,0x7ffffffbf000
     3e1:	7f 00 00 
     3e4:	ba 03 00 00 00       	mov    edx,0x3
     3e9:	be 00 00 04 00       	mov    esi,0x40000
     3ee:	48 89 ef             	mov    rdi,rbp
     3f1:	e8 7d 07 00 00       	call   0xb73
     3f6:	48 39 e8             	cmp    rax,rbp
     3f9:	74 0a                	je     0x405
     3fb:	bb f4 ff ff ff       	mov    ebx,0xfffffff4
     400:	e9 89 01 00 00       	jmp    0x58e
     405:	89 df                	mov    edi,ebx
     407:	e8 f7 03 00 00       	call   0x803
     40c:	4c 89 ef             	mov    rdi,r13
     40f:	e8 af fd ff ff       	call   0x1c3
     414:	89 c5                	mov    ebp,eax
     416:	85 c0                	test   eax,eax
     418:	79 0a                	jns    0x424
     41a:	bb f2 ff ff ff       	mov    ebx,0xfffffff2
     41f:	e9 6a 01 00 00       	jmp    0x58e
     424:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
     429:	e8 95 fd ff ff       	call   0x1c3
     42e:	41 89 c6             	mov    r14d,eax
     431:	85 c0                	test   eax,eax
     433:	78 e5                	js     0x41a
     435:	49 bf 00 e0 ff ff ff 	movabs r15,0x7fffffffe000
     43c:	7f 00 00 
     43f:	8d 5c 05 00          	lea    ebx,[rbp+rax*1+0x0]
     443:	31 f6                	xor    esi,esi
     445:	8d 7b 02             	lea    edi,[rbx+0x2]
     448:	48 63 ff             	movsxd rdi,edi
     44b:	48 c1 e7 03          	shl    rdi,0x3
     44f:	e8 fd 05 00 00       	call   0xa51
     454:	41 8d 56 ff          	lea    edx,[r14-0x1]
     458:	49 89 c4             	mov    r12,rax
     45b:	48 63 c5             	movsxd rax,ebp
     45e:	48 63 d2             	movsxd rdx,edx
     461:	48 89 04 24          	mov    QWORD PTR [rsp],rax
     465:	4d 8d 0c c4          	lea    r9,[r12+rax*8]
     469:	83 fa ff             	cmp    edx,0xffffffff
     46c:	74 3d                	je     0x4ab
     46e:	49 8b 7c d5 00       	mov    rdi,QWORD PTR [r13+rdx*8+0x0]
     473:	4c 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],r9
     478:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
     47d:	e8 e3 0d 00 00       	call   0x1265
     482:	48 8b 54 24 10       	mov    rdx,QWORD PTR [rsp+0x10]
     487:	4c 8b 4c 24 28       	mov    r9,QWORD PTR [rsp+0x28]
     48c:	48 8d 48 01          	lea    rcx,[rax+0x1]
     490:	48 8b 44 24 18       	mov    rax,QWORD PTR [rsp+0x18]
     495:	49 29 cf             	sub    r15,rcx
     498:	4d 89 7c d1 08       	mov    QWORD PTR [r9+rdx*8+0x8],r15
     49d:	4c 89 ff             	mov    rdi,r15
     4a0:	48 8b 34 d0          	mov    rsi,QWORD PTR [rax+rdx*8]
     4a4:	48 ff ca             	dec    rdx
     4a7:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
     4a9:	eb be                	jmp    0x469
     4ab:	8d 55 ff             	lea    edx,[rbp-0x1]
     4ae:	48 63 d2             	movsxd rdx,edx
     4b1:	83 fa ff             	cmp    edx,0xffffffff
     4b4:	74 2e                	je     0x4e4
     4b6:	49 8b 7c d5 00       	mov    rdi,QWORD PTR [r13+rdx*8+0x0]
     4bb:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
     4c0:	e8 a0 0d 00 00       	call   0x1265
     4c5:	48 8b 54 24 10       	mov    rdx,QWORD PTR [rsp+0x10]
     4ca:	48 8d 48 01          	lea    rcx,[rax+0x1]
     4ce:	49 29 cf             	sub    r15,rcx
     4d1:	4d 89 3c d4          	mov    QWORD PTR [r12+rdx*8],r15
     4d5:	4c 89 ff             	mov    rdi,r15
     4d8:	49 8b 74 d5 00       	mov    rsi,QWORD PTR [r13+rdx*8+0x0]
     4dd:	48 ff ca             	dec    rdx
     4e0:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
     4e2:	eb cd                	jmp    0x4b1
     4e4:	42 8d 44 35 01       	lea    eax,[rbp+r14*1+0x1]
     4e9:	49 83 e7 f0          	and    r15,0xfffffffffffffff0
     4ed:	a8 01                	test   al,0x1
     4ef:	74 04                	je     0x4f5
     4f1:	49 83 ef 08          	sub    r15,0x8
     4f5:	8d 6b 01             	lea    ebp,[rbx+0x1]
     4f8:	4c 89 fa             	mov    rdx,r15
     4fb:	48 63 c5             	movsxd rax,ebp
     4fe:	49 8b 0c c4          	mov    rcx,QWORD PTR [r12+rax*8]
     502:	48 ff c8             	dec    rax
     505:	48 83 ea 08          	sub    rdx,0x8
     509:	89 c3                	mov    ebx,eax
     50b:	48 89 0a             	mov    QWORD PTR [rdx],rcx
     50e:	83 f8 ff             	cmp    eax,0xffffffff
     511:	75 eb                	jne    0x4fe
     513:	89 ed                	mov    ebp,ebp
     515:	4c 89 e7             	mov    rdi,r12
     518:	e8 d9 04 00 00       	call   0x9f6
     51d:	48 6b ed f8          	imul   rbp,rbp,0xfffffffffffffff8
     521:	48 8b 04 24          	mov    rax,QWORD PTR [rsp]
     525:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
     52a:	49 8d 54 2f f0       	lea    rdx,[r15+rbp*1-0x10]
     52f:	48 89 02             	mov    QWORD PTR [rdx],rax
     532:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
     537:	48 01 c8             	add    rax,rcx
     53a:	48 89 25 0d fc ff ff 	mov    QWORD PTR [rip+0xfffffffffffffc0d],rsp        # 0x14e
     541:	48 89 c1             	mov    rcx,rax
     544:	49 c7 c3 02 00 00 00 	mov    r11,0x2
     54b:	48 89 d4             	mov    rsp,rdx
     54e:	48 31 c0             	xor    rax,rax
     551:	48 31 db             	xor    rbx,rbx
     554:	48 31 d2             	xor    rdx,rdx
     557:	48 31 ff             	xor    rdi,rdi
     55a:	48 31 f6             	xor    rsi,rsi
     55d:	48 31 ed             	xor    rbp,rbp
     560:	4d 31 c0             	xor    r8,r8
     563:	4d 31 c9             	xor    r9,r9
     566:	4d 31 d2             	xor    r10,r10
     569:	4d 31 e4             	xor    r12,r12
     56c:	4d 31 ed             	xor    r13,r13
     56f:	4d 31 f6             	xor    r14,r14
     572:	4d 31 ff             	xor    r15,r15
     575:	48 31 ed             	xor    rbp,rbp
     578:	48                   	rex.W
     579:	48 0f 07             	sysretq
     57c:	eb 10                	jmp    0x58e
     57e:	bb f8 ff ff ff       	mov    ebx,0xfffffff8
     583:	eb 09                	jmp    0x58e
     585:	bb ea ff ff ff       	mov    ebx,0xffffffea
     58a:	eb 02                	jmp    0x58e
     58c:	89 c3                	mov    ebx,eax
     58e:	48 83 c4 38          	add    rsp,0x38
     592:	89 d8                	mov    eax,ebx
     594:	5b                   	pop    rbx
     595:	5d                   	pop    rbp
     596:	41 5c                	pop    r12
     598:	41 5d                	pop    r13
     59a:	41 5e                	pop    r14
     59c:	41 5f                	pop    r15
     59e:	c3                   	ret
     59f:	f3 0f 1e fa          	endbr64
     5a3:	89 fe                	mov    esi,edi
     5a5:	bf 05 80 00 00       	mov    edi,0x8005
     5aa:	e9 92 03 00 00       	jmp    0x941
     5af:	f3 0f 1e fa          	endbr64
     5b3:	41 57                	push   r15
     5b5:	41 56                	push   r14
     5b7:	41 55                	push   r13
     5b9:	41 54                	push   r12
     5bb:	55                   	push   rbp
     5bc:	53                   	push   rbx
     5bd:	41 52                	push   r10
     5bf:	f7 c7 ff 0f 00 00    	test   edi,0xfff
     5c5:	0f 85 cd 00 00 00    	jne    0x698
     5cb:	48 89 f5             	mov    rbp,rsi
     5ce:	48 85 f6             	test   rsi,rsi
     5d1:	0f 84 c1 00 00 00    	je     0x698
     5d7:	80 e1 10             	and    cl,0x10
     5da:	41 89 d7             	mov    r15d,edx
     5dd:	45 89 c5             	mov    r13d,r8d
     5e0:	4d 89 ce             	mov    r14,r9
     5e3:	74 37                	je     0x61c
     5e5:	48 85 ff             	test   rdi,rdi
     5e8:	74 32                	je     0x61c
     5ea:	48 c7 c3 ea ff ff ff 	mov    rbx,0xffffffffffffffea
     5f1:	48 81 ff ff ff 1f 00 	cmp    rdi,0x1fffff
     5f8:	0f 86 aa 00 00 00    	jbe    0x6a8
     5fe:	48 89 f8             	mov    rax,rdi
     601:	48 c1 e8 30          	shr    rax,0x30
     605:	0f 85 9d 00 00 00    	jne    0x6a8
     60b:	48 89 f8             	mov    rax,rdi
     60e:	48 c1 e8 27          	shr    rax,0x27
     612:	48 ff c8             	dec    rax
     615:	75 07                	jne    0x61e
     617:	e9 8c 00 00 00       	jmp    0x6a8
     61c:	31 ff                	xor    edi,edi
     61e:	49 89 ec             	mov    r12,rbp
     621:	f7 c5 ff 0f 00 00    	test   ebp,0xfff
     627:	74 0e                	je     0x637
     629:	49 81 e4 00 f0 ff ff 	and    r12,0xfffffffffffff000
     630:	49 81 c4 00 10 00 00 	add    r12,0x1000
     637:	44 89 fa             	mov    edx,r15d
     63a:	4c 89 e6             	mov    rsi,r12
     63d:	83 ca 03             	or     edx,0x3
     640:	e8 2e 05 00 00       	call   0xb73
     645:	48 89 c3             	mov    rbx,rax
     648:	48 85 c0             	test   rax,rax
     64b:	74 54                	je     0x6a1
     64d:	45 85 ed             	test   r13d,r13d
     650:	78 36                	js     0x688
     652:	31 d2                	xor    edx,edx
     654:	44 89 f6             	mov    esi,r14d
     657:	44 89 ef             	mov    edi,r13d
     65a:	e8 b4 01 00 00       	call   0x813
     65f:	85 c0                	test   eax,eax
     661:	79 05                	jns    0x668
     663:	48 63 d8             	movsxd rbx,eax
     666:	eb 40                	jmp    0x6a8
     668:	ba 01 00 00 00       	mov    edx,0x1
     66d:	be 01 00 00 00       	mov    esi,0x1
     672:	48 89 df             	mov    rdi,rbx
     675:	e8 7f 06 00 00       	call   0xcf9
     67a:	48 89 ea             	mov    rdx,rbp
     67d:	44 89 ef             	mov    edi,r13d
     680:	48 89 c6             	mov    rsi,rax
     683:	e8 f9 01 00 00       	call   0x881
     688:	44 89 fa             	mov    edx,r15d
     68b:	4c 89 e6             	mov    rsi,r12
     68e:	48 89 df             	mov    rdi,rbx
     691:	e8 82 05 00 00       	call   0xc18
     696:	eb 10                	jmp    0x6a8
     698:	48 c7 c3 ea ff ff ff 	mov    rbx,0xffffffffffffffea
     69f:	eb 07                	jmp    0x6a8
     6a1:	48 c7 c3 f4 ff ff ff 	mov    rbx,0xfffffffffffffff4
     6a8:	5a                   	pop    rdx
     6a9:	48 89 d8             	mov    rax,rbx
     6ac:	5b                   	pop    rbx
     6ad:	5d                   	pop    rbp
     6ae:	41 5c                	pop    r12
     6b0:	41 5d                	pop    r13
     6b2:	41 5e                	pop    r14
     6b4:	41 5f                	pop    r15
     6b6:	c3                   	ret
     6b7:	f3 0f 1e fa          	endbr64
     6bb:	55                   	push   rbp
     6bc:	53                   	push   rbx
     6bd:	bb f2 ff ff ff       	mov    ebx,0xfffffff2
     6c2:	48 83 ec 18          	sub    rsp,0x18
     6c6:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
     6cb:	e8 a0 0a 00 00       	call   0x1170
     6d0:	85 c0                	test   eax,eax
     6d2:	74 31                	je     0x705
     6d4:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
     6d9:	bb f4 ff ff ff       	mov    ebx,0xfffffff4
     6de:	e8 de 0a 00 00       	call   0x11c1
     6e3:	48 89 c5             	mov    rbp,rax
     6e6:	48 85 c0             	test   rax,rax
     6e9:	74 1a                	je     0x705
     6eb:	48 89 c7             	mov    rdi,rax
     6ee:	e8 e5 05 00 00       	call   0xcd8
     6f3:	48 89 c7             	mov    rdi,rax
     6f6:	e8 76 01 00 00       	call   0x871
     6fb:	48 89 ef             	mov    rdi,rbp
     6fe:	89 c3                	mov    ebx,eax
     700:	e8 f1 02 00 00       	call   0x9f6
     705:	48 83 c4 18          	add    rsp,0x18
     709:	89 d8                	mov    eax,ebx
     70b:	5b                   	pop    rbx
     70c:	5d                   	pop    rbp
     70d:	c3                   	ret
     70e:	f3 0f 1e fa          	endbr64
     712:	41 56                	push   r14
     714:	41 55                	push   r13
     716:	49 c7 c5 f7 ff ff ff 	mov    r13,0xfffffffffffffff7
     71d:	41 54                	push   r12
     71f:	55                   	push   rbp
     720:	53                   	push   rbx
     721:	85 ff                	test   edi,edi
     723:	78 5b                	js     0x780
     725:	41 89 fe             	mov    r14d,edi
     728:	bf 01 00 00 00       	mov    edi,0x1
     72d:	48 89 f5             	mov    rbp,rsi
     730:	49 89 d4             	mov    r12,rdx
     733:	e8 8f 09 00 00       	call   0x10c7
     738:	49 c7 c5 f2 ff ff ff 	mov    r13,0xfffffffffffffff2
     73f:	85 c0                	test   eax,eax
     741:	74 3d                	je     0x780
     743:	31 f6                	xor    esi,esi
     745:	4c 89 e7             	mov    rdi,r12
     748:	e8 04 03 00 00       	call   0xa51
     74d:	48 89 c7             	mov    rdi,rax
     750:	48 89 c3             	mov    rbx,rax
     753:	e8 80 05 00 00       	call   0xcd8
     758:	4c 89 e2             	mov    rdx,r12
     75b:	44 89 f7             	mov    edi,r14d
     75e:	48 89 c6             	mov    rsi,rax
     761:	e8 1b 01 00 00       	call   0x881
     766:	4c 63 e8             	movsxd r13,eax
     769:	4d 85 ed             	test   r13,r13
     76c:	78 0a                	js     0x778
     76e:	89 c1                	mov    ecx,eax
     770:	48 89 ef             	mov    rdi,rbp
     773:	48 89 de             	mov    rsi,rbx
     776:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
     778:	48 89 df             	mov    rdi,rbx
     77b:	e8 76 02 00 00       	call   0x9f6
     780:	5b                   	pop    rbx
     781:	4c 89 e8             	mov    rax,r13
     784:	5d                   	pop    rbp
     785:	41 5c                	pop    r12
     787:	41 5d                	pop    r13
     789:	41 5e                	pop    r14
     78b:	c3                   	ret
     78c:	f3 0f 1e fa          	endbr64
     790:	41 56                	push   r14
     792:	41 55                	push   r13
     794:	49 c7 c5 f7 ff ff ff 	mov    r13,0xfffffffffffffff7
     79b:	41 54                	push   r12
     79d:	55                   	push   rbp
     79e:	53                   	push   rbx
     79f:	85 ff                	test   edi,edi
     7a1:	78 54                	js     0x7f7
     7a3:	41 89 fe             	mov    r14d,edi
     7a6:	31 ff                	xor    edi,edi
     7a8:	49 89 f4             	mov    r12,rsi
     7ab:	48 89 d3             	mov    rbx,rdx
     7ae:	e8 14 09 00 00       	call   0x10c7
     7b3:	49 c7 c5 f2 ff ff ff 	mov    r13,0xfffffffffffffff2
     7ba:	85 c0                	test   eax,eax
     7bc:	74 39                	je     0x7f7
     7be:	31 f6                	xor    esi,esi
     7c0:	48 89 df             	mov    rdi,rbx
     7c3:	e8 89 02 00 00       	call   0xa51
     7c8:	4c 89 e6             	mov    rsi,r12
     7cb:	48 89 d9             	mov    rcx,rbx
     7ce:	48 89 c7             	mov    rdi,rax
     7d1:	48 89 c5             	mov    rbp,rax
     7d4:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
     7d6:	48 89 c7             	mov    rdi,rax
     7d9:	e8 fa 04 00 00       	call   0xcd8
     7de:	44 89 f7             	mov    edi,r14d
     7e1:	48 89 da             	mov    rdx,rbx
     7e4:	48 89 c6             	mov    rsi,rax
     7e7:	e8 f5 00 00 00       	call   0x8e1
     7ec:	48 89 ef             	mov    rdi,rbp
     7ef:	4c 63 e8             	movsxd r13,eax
     7f2:	e8 ff 01 00 00       	call   0x9f6
     7f7:	5b                   	pop    rbx
     7f8:	4c 89 e8             	mov    rax,r13
     7fb:	5d                   	pop    rbp
     7fc:	41 5c                	pop    r12
     7fe:	41 5d                	pop    r13
     800:	41 5e                	pop    r14
     802:	c3                   	ret
     803:	f3 0f 1e fa          	endbr64
     807:	89 fe                	mov    esi,edi
     809:	bf 03 80 00 00       	mov    edi,0x8003
     80e:	e9 2e 01 00 00       	jmp    0x941
     813:	f3 0f 1e fa          	endbr64
     817:	41 55                	push   r13
     819:	41 89 fd             	mov    r13d,edi
     81c:	bf 0c 00 00 00       	mov    edi,0xc
     821:	41 54                	push   r12
     823:	41 89 f4             	mov    r12d,esi
     826:	31 f6                	xor    esi,esi
     828:	55                   	push   rbp
     829:	89 d5                	mov    ebp,edx
     82b:	53                   	push   rbx
     82c:	48 83 ec 18          	sub    rsp,0x18
     830:	e8 1c 02 00 00       	call   0xa51
     835:	44 89 28             	mov    DWORD PTR [rax],r13d
     838:	48 89 c7             	mov    rdi,rax
     83b:	48 89 c3             	mov    rbx,rax
     83e:	44 89 60 04          	mov    DWORD PTR [rax+0x4],r12d
     842:	89 68 08             	mov    DWORD PTR [rax+0x8],ebp
     845:	e8 8e 04 00 00       	call   0xcd8
     84a:	bf 04 80 00 00       	mov    edi,0x8004
     84f:	89 c6                	mov    esi,eax
     851:	e8 eb 00 00 00       	call   0x941
     856:	48 89 df             	mov    rdi,rbx
     859:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
     85d:	e8 94 01 00 00       	call   0x9f6
     862:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
     866:	48 83 c4 18          	add    rsp,0x18
     86a:	5b                   	pop    rbx
     86b:	5d                   	pop    rbp
     86c:	41 5c                	pop    r12
     86e:	41 5d                	pop    r13
     870:	c3                   	ret
     871:	f3 0f 1e fa          	endbr64
     875:	89 fe                	mov    esi,edi
     877:	bf 00 80 00 00       	mov    edi,0x8000
     87c:	e9 c0 00 00 00       	jmp    0x941
     881:	f3 0f 1e fa          	endbr64
     885:	41 55                	push   r13
     887:	49 89 f5             	mov    r13,rsi
     88a:	31 f6                	xor    esi,esi
     88c:	41 54                	push   r12
     88e:	49 89 d4             	mov    r12,rdx
     891:	55                   	push   rbp
     892:	48 63 ef             	movsxd rbp,edi
     895:	bf 18 00 00 00       	mov    edi,0x18
     89a:	53                   	push   rbx
     89b:	48 83 ec 18          	sub    rsp,0x18
     89f:	e8 ad 01 00 00       	call   0xa51
     8a4:	48 89 28             	mov    QWORD PTR [rax],rbp
     8a7:	48 89 c7             	mov    rdi,rax
     8aa:	48 89 c3             	mov    rbx,rax
     8ad:	4c 89 68 08          	mov    QWORD PTR [rax+0x8],r13
     8b1:	4c 89 60 10          	mov    QWORD PTR [rax+0x10],r12
     8b5:	e8 1e 04 00 00       	call   0xcd8
     8ba:	bf 01 80 00 00       	mov    edi,0x8001
     8bf:	89 c6                	mov    esi,eax
     8c1:	e8 7b 00 00 00       	call   0x941
     8c6:	48 89 df             	mov    rdi,rbx
     8c9:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
     8cd:	e8 24 01 00 00       	call   0x9f6
     8d2:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
     8d6:	48 83 c4 18          	add    rsp,0x18
     8da:	5b                   	pop    rbx
     8db:	5d                   	pop    rbp
     8dc:	41 5c                	pop    r12
     8de:	41 5d                	pop    r13
     8e0:	c3                   	ret
     8e1:	f3 0f 1e fa          	endbr64
     8e5:	41 55                	push   r13
     8e7:	49 89 f5             	mov    r13,rsi
     8ea:	31 f6                	xor    esi,esi
     8ec:	41 54                	push   r12
     8ee:	49 89 d4             	mov    r12,rdx
     8f1:	55                   	push   rbp
     8f2:	48 63 ef             	movsxd rbp,edi
     8f5:	bf 18 00 00 00       	mov    edi,0x18
     8fa:	53                   	push   rbx
     8fb:	48 83 ec 18          	sub    rsp,0x18
     8ff:	e8 4d 01 00 00       	call   0xa51
     904:	48 89 28             	mov    QWORD PTR [rax],rbp
     907:	48 89 c7             	mov    rdi,rax
     90a:	48 89 c3             	mov    rbx,rax
     90d:	4c 89 68 08          	mov    QWORD PTR [rax+0x8],r13
     911:	4c 89 60 10          	mov    QWORD PTR [rax+0x10],r12
     915:	e8 be 03 00 00       	call   0xcd8
     91a:	bf 02 80 00 00       	mov    edi,0x8002
     91f:	89 c6                	mov    esi,eax
     921:	e8 1b 00 00 00       	call   0x941
     926:	48 89 df             	mov    rdi,rbx
     929:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
     92d:	e8 c4 00 00 00       	call   0x9f6
     932:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
     936:	48 83 c4 18          	add    rsp,0x18
     93a:	5b                   	pop    rbx
     93b:	5d                   	pop    rbp
     93c:	41 5c                	pop    r12
     93e:	41 5d                	pop    r13
     940:	c3                   	ret
     941:	f3 0f 1e fa          	endbr64
     945:	66 89 fa             	mov    dx,di
     948:	89 f0                	mov    eax,esi
     94a:	ef                   	out    dx,eax
     94b:	ed                   	in     eax,dx
     94c:	89 c7                	mov    edi,eax
     94e:	89 f8                	mov    eax,edi
     950:	c3                   	ret
     951:	48 8b 05 f0 28 00 00 	mov    rax,QWORD PTR [rip+0x28f0]        # 0x3248
     958:	48 8d 15 d9 28 00 00 	lea    rdx,[rip+0x28d9]        # 0x3238
     95f:	48 85 c0             	test   rax,rax
     962:	74 11                	je     0x975
     964:	48 8b 0f             	mov    rcx,QWORD PTR [rdi]
     967:	48 39 08             	cmp    QWORD PTR [rax],rcx
     96a:	73 09                	jae    0x975
     96c:	48 89 c2             	mov    rdx,rax
     96f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
     973:	eb ea                	jmp    0x95f
     975:	48 89 7a 10          	mov    QWORD PTR [rdx+0x10],rdi
     979:	48 89 47 10          	mov    QWORD PTR [rdi+0x10],rax
     97d:	c3                   	ret
     97e:	48 8b 15 a3 28 00 00 	mov    rdx,QWORD PTR [rip+0x28a3]        # 0x3228
     985:	31 c0                	xor    eax,eax
     987:	48 39 fa             	cmp    rdx,rdi
     98a:	72 22                	jb     0x9ae
     98c:	48 8b 05 8d 28 00 00 	mov    rax,QWORD PTR [rip+0x288d]        # 0x3220
     993:	48 29 fa             	sub    rdx,rdi
     996:	48 89 15 8b 28 00 00 	mov    QWORD PTR [rip+0x288b],rdx        # 0x3228
     99d:	48 89 38             	mov    QWORD PTR [rax],rdi
     9a0:	48 01 c7             	add    rdi,rax
     9a3:	48 83 c0 10          	add    rax,0x10
     9a7:	48 89 3d 72 28 00 00 	mov    QWORD PTR [rip+0x2872],rdi        # 0x3220
     9ae:	c3                   	ret
     9af:	f3 0f 1e fa          	endbr64
     9b3:	48 85 f6             	test   rsi,rsi
     9b6:	74 08                	je     0x9c0
     9b8:	f7 c6 ff 0f 00 00    	test   esi,0xfff
     9be:	74 0d                	je     0x9cd
     9c0:	50                   	push   rax
     9c1:	48 8d 3d a9 12 00 00 	lea    rdi,[rip+0x12a9]        # 0x1c71
     9c8:	e8 27 08 00 00       	call   0x11f4
     9cd:	48 8d 15 64 28 00 00 	lea    rdx,[rip+0x2864]        # 0x3238
     9d4:	48 89 3d 45 28 00 00 	mov    QWORD PTR [rip+0x2845],rdi        # 0x3220
     9db:	b9 06 00 00 00       	mov    ecx,0x6
     9e0:	31 c0                	xor    eax,eax
     9e2:	48 89 3d 47 28 00 00 	mov    QWORD PTR [rip+0x2847],rdi        # 0x3230
     9e9:	48 89 d7             	mov    rdi,rdx
     9ec:	f3 ab                	rep stos DWORD PTR es:[rdi],eax
     9ee:	48 89 35 33 28 00 00 	mov    QWORD PTR [rip+0x2833],rsi        # 0x3228
     9f5:	c3                   	ret
     9f6:	f3 0f 1e fa          	endbr64
     9fa:	48 85 ff             	test   rdi,rdi
     9fd:	74 51                	je     0xa50
     9ff:	48 8b 47 f0          	mov    rax,QWORD PTR [rdi-0x10]
     a03:	be fe ff ff ff       	mov    esi,0xfffffffe
     a08:	48 8d 57 f0          	lea    rdx,[rdi-0x10]
     a0c:	48 8d 48 ff          	lea    rcx,[rax-0x1]
     a10:	48 39 ce             	cmp    rsi,rcx
     a13:	72 26                	jb     0xa3b
     a15:	a8 0f                	test   al,0xf
     a17:	75 22                	jne    0xa3b
     a19:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
     a1d:	48 39 0d fc 27 00 00 	cmp    QWORD PTR [rip+0x27fc],rcx        # 0x3220
     a24:	75 22                	jne    0xa48
     a26:	48 01 05 fb 27 00 00 	add    QWORD PTR [rip+0x27fb],rax        # 0x3228
     a2d:	31 c0                	xor    eax,eax
     a2f:	48 89 15 ea 27 00 00 	mov    QWORD PTR [rip+0x27ea],rdx        # 0x3220
     a36:	48 89 47 f0          	mov    QWORD PTR [rdi-0x10],rax
     a3a:	c3                   	ret
     a3b:	52                   	push   rdx
     a3c:	48 8d 3d 57 12 00 00 	lea    rdi,[rip+0x1257]        # 0x1c9a
     a43:	e8 ac 07 00 00       	call   0x11f4
     a48:	48 89 d7             	mov    rdi,rdx
     a4b:	e9 01 ff ff ff       	jmp    0x951
     a50:	c3                   	ret
     a51:	f3 0f 1e fa          	endbr64
     a55:	b8 ff ff ff ff       	mov    eax,0xffffffff
     a5a:	48 39 f8             	cmp    rax,rdi
     a5d:	0f 82 0d 01 00 00    	jb     0xb70
     a63:	4c 8d 47 10          	lea    r8,[rdi+0x10]
     a67:	55                   	push   rbp
     a68:	53                   	push   rbx
     a69:	48 89 fb             	mov    rbx,rdi
     a6c:	51                   	push   rcx
     a6d:	41 f7 c0 7f 00 00 00 	test   r8d,0x7f
     a74:	74 08                	je     0xa7e
     a76:	49 83 e0 80          	and    r8,0xffffffffffffff80
     a7a:	49 83 e8 80          	sub    r8,0xffffffffffffff80
     a7e:	85 f6                	test   esi,esi
     a80:	75 7a                	jne    0xafc
     a82:	48 8b 35 bf 27 00 00 	mov    rsi,QWORD PTR [rip+0x27bf]        # 0x3248
     a89:	48 8d 15 a8 27 00 00 	lea    rdx,[rip+0x27a8]        # 0x3238
     a90:	bf fe ff ff ff       	mov    edi,0xfffffffe
     a95:	48 85 f6             	test   rsi,rsi
     a98:	74 55                	je     0xaef
     a9a:	48 8b 06             	mov    rax,QWORD PTR [rsi]
     a9d:	48 8d 48 ff          	lea    rcx,[rax-0x1]
     aa1:	48 39 cf             	cmp    rdi,rcx
     aa4:	72 15                	jb     0xabb
     aa6:	a8 0f                	test   al,0xf
     aa8:	75 11                	jne    0xabb
     aaa:	48 8b 4e 10          	mov    rcx,QWORD PTR [rsi+0x10]
     aae:	4c 39 c0             	cmp    rax,r8
     ab1:	73 14                	jae    0xac7
     ab3:	48 89 f2             	mov    rdx,rsi
     ab6:	48 89 ce             	mov    rsi,rcx
     ab9:	eb da                	jmp    0xa95
     abb:	48 8d 3d f6 11 00 00 	lea    rdi,[rip+0x11f6]        # 0x1cb8
     ac2:	e8 2d 07 00 00       	call   0x11f4
     ac7:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
     acb:	49 39 c0             	cmp    r8,rax
     ace:	74 0f                	je     0xadf
     ad0:	4a 8d 3c 06          	lea    rdi,[rsi+r8*1]
     ad4:	4c 29 c0             	sub    rax,r8
     ad7:	48 89 07             	mov    QWORD PTR [rdi],rax
     ada:	e8 72 fe ff ff       	call   0x951
     adf:	0f 57 c0             	xorps  xmm0,xmm0
     ae2:	4c 89 06             	mov    QWORD PTR [rsi],r8
     ae5:	48 83 c6 10          	add    rsi,0x10
     ae9:	0f 11 46 f8          	movups XMMWORD PTR [rsi-0x8],xmm0
     aed:	eb 70                	jmp    0xb5f
     aef:	4c 89 c7             	mov    rdi,r8
     af2:	e8 87 fe ff ff       	call   0x97e
     af7:	48 89 c6             	mov    rsi,rax
     afa:	eb 63                	jmp    0xb5f
     afc:	81 fe 00 10 00 00    	cmp    esi,0x1000
     b02:	74 0c                	je     0xb10
     b04:	48 8d 3d db 11 00 00 	lea    rdi,[rip+0x11db]        # 0x1ce6
     b0b:	e8 e4 06 00 00       	call   0x11f4
     b10:	bf f0 0f 00 00       	mov    edi,0xff0
     b15:	48 2b 3d 04 27 00 00 	sub    rdi,QWORD PTR [rip+0x2704]        # 0x3220
     b1c:	81 e7 ff 0f 00 00    	and    edi,0xfff
     b22:	74 0f                	je     0xb33
     b24:	e8 55 fe ff ff       	call   0x97e
     b29:	48 89 c6             	mov    rsi,rax
     b2c:	48 85 c0             	test   rax,rax
     b2f:	75 04                	jne    0xb35
     b31:	eb 2c                	jmp    0xb5f
     b33:	31 f6                	xor    esi,esi
     b35:	4c 89 c7             	mov    rdi,r8
     b38:	e8 41 fe ff ff       	call   0x97e
     b3d:	48 89 f7             	mov    rdi,rsi
     b40:	48 89 c5             	mov    rbp,rax
     b43:	e8 ae fe ff ff       	call   0x9f6
     b48:	48 89 ee             	mov    rsi,rbp
     b4b:	f7 c5 ff 0f 00 00    	test   ebp,0xfff
     b51:	74 0c                	je     0xb5f
     b53:	48 8d 3d b1 11 00 00 	lea    rdi,[rip+0x11b1]        # 0x1d0b
     b5a:	e8 95 06 00 00       	call   0x11f4
     b5f:	31 c0                	xor    eax,eax
     b61:	48 89 d9             	mov    rcx,rbx
     b64:	48 89 f7             	mov    rdi,rsi
     b67:	f3 aa                	rep stos BYTE PTR es:[rdi],al
     b69:	48 89 f0             	mov    rax,rsi
     b6c:	5a                   	pop    rdx
     b6d:	5b                   	pop    rbx
     b6e:	5d                   	pop    rbp
     b6f:	c3                   	ret
     b70:	31 c0                	xor    eax,eax
     b72:	c3                   	ret
     b73:	f3 0f 1e fa          	endbr64
     b77:	41 56                	push   r14
     b79:	41 55                	push   r13
     b7b:	41 54                	push   r12
     b7d:	55                   	push   rbp
     b7e:	53                   	push   rbx
     b7f:	48 85 f6             	test   rsi,rsi
     b82:	74 0f                	je     0xb93
     b84:	49 89 f4             	mov    r12,rsi
     b87:	48 89 f5             	mov    rbp,rsi
     b8a:	41 81 e4 ff 0f 00 00 	and    r12d,0xfff
     b91:	74 0c                	je     0xb9f
     b93:	48 8d 3d 9d 11 00 00 	lea    rdi,[rip+0x119d]        # 0x1d37
     b9a:	e8 55 06 00 00       	call   0x11f4
     b9f:	48 89 fb             	mov    rbx,rdi
     ba2:	be 00 10 00 00       	mov    esi,0x1000
     ba7:	48 89 ef             	mov    rdi,rbp
     baa:	41 89 d6             	mov    r14d,edx
     bad:	e8 9f fe ff ff       	call   0xa51
     bb2:	49 89 c5             	mov    r13,rax
     bb5:	48 85 c0             	test   rax,rax
     bb8:	74 50                	je     0xc0a
     bba:	48 83 3d 3e 24 00 00 	cmp    QWORD PTR [rip+0x243e],0xffffffffffffffff        # 0x3000
     bc1:	ff 
     bc2:	75 11                	jne    0xbd5
     bc4:	48 b8 00 f0 ff f7 ff 	movabs rax,0x7ffff7fff000
     bcb:	7f 00 00 
     bce:	48 89 05 2b 24 00 00 	mov    QWORD PTR [rip+0x242b],rax        # 0x3000
     bd5:	48 85 db             	test   rbx,rbx
     bd8:	75 11                	jne    0xbeb
     bda:	48 8b 1d 1f 24 00 00 	mov    rbx,QWORD PTR [rip+0x241f]        # 0x3000
     be1:	48 29 eb             	sub    rbx,rbp
     be4:	48 89 1d 15 24 00 00 	mov    QWORD PTR [rip+0x2415],rbx        # 0x3000
     beb:	4b 8d 74 25 00       	lea    rsi,[r13+r12*1+0x0]
     bf0:	4a 8d 3c 23          	lea    rdi,[rbx+r12*1]
     bf4:	44 89 f2             	mov    edx,r14d
     bf7:	49 81 c4 00 10 00 00 	add    r12,0x1000
     bfe:	e8 66 02 00 00       	call   0xe69
     c03:	49 39 ec             	cmp    r12,rbp
     c06:	72 e3                	jb     0xbeb
     c08:	eb 02                	jmp    0xc0c
     c0a:	31 db                	xor    ebx,ebx
     c0c:	48 89 d8             	mov    rax,rbx
     c0f:	5b                   	pop    rbx
     c10:	5d                   	pop    rbp
     c11:	41 5c                	pop    r12
     c13:	41 5d                	pop    r13
     c15:	41 5e                	pop    r14
     c17:	c3                   	ret
     c18:	f3 0f 1e fa          	endbr64
     c1c:	b8 ea ff ff ff       	mov    eax,0xffffffea
     c21:	f7 c7 ff 0f 00 00    	test   edi,0xfff
     c27:	75 65                	jne    0xc8e
     c29:	41 55                	push   r13
     c2b:	41 89 d5             	mov    r13d,edx
     c2e:	41 54                	push   r12
     c30:	49 89 f4             	mov    r12,rsi
     c33:	55                   	push   rbp
     c34:	48 89 fd             	mov    rbp,rdi
     c37:	53                   	push   rbx
     c38:	48 89 fb             	mov    rbx,rdi
     c3b:	51                   	push   rcx
     c3c:	48 89 d8             	mov    rax,rbx
     c3f:	48 29 e8             	sub    rax,rbp
     c42:	4c 39 e0             	cmp    rax,r12
     c45:	73 3d                	jae    0xc84
     c47:	48 81 fb ff ff 1f 00 	cmp    rbx,0x1fffff
     c4e:	77 07                	ja     0xc57
     c50:	b8 f3 ff ff ff       	mov    eax,0xfffffff3
     c55:	eb 2f                	jmp    0xc86
     c57:	48 89 d8             	mov    rax,rbx
     c5a:	48 c1 e8 30          	shr    rax,0x30
     c5e:	75 f0                	jne    0xc50
     c60:	48 89 d8             	mov    rax,rbx
     c63:	48 c1 e8 27          	shr    rax,0x27
     c67:	48 ff c8             	dec    rax
     c6a:	74 e4                	je     0xc50
     c6c:	48 89 df             	mov    rdi,rbx
     c6f:	44 89 ee             	mov    esi,r13d
     c72:	48 81 c3 00 10 00 00 	add    rbx,0x1000
     c79:	e8 92 03 00 00       	call   0x1010
     c7e:	85 c0                	test   eax,eax
     c80:	74 ba                	je     0xc3c
     c82:	eb cc                	jmp    0xc50
     c84:	31 c0                	xor    eax,eax
     c86:	5a                   	pop    rdx
     c87:	5b                   	pop    rbx
     c88:	5d                   	pop    rbp
     c89:	41 5c                	pop    r12
     c8b:	41 5d                	pop    r13
     c8d:	c3                   	ret
     c8e:	c3                   	ret
     c8f:	f3 0f 1e fa          	endbr64
     c93:	0f 20 da             	mov    rdx,cr3
     c96:	48 8d 82 00 30 00 00 	lea    rax,[rdx+0x3000]
     c9d:	48 83 c8 03          	or     rax,0x3
     ca1:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
     ca5:	48 8d 82 00 40 00 00 	lea    rax,[rdx+0x4000]
     cac:	48 83 c8 03          	or     rax,0x3
     cb0:	48 89 82 00 30 00 00 	mov    QWORD PTR [rdx+0x3000],rax
     cb7:	31 c0                	xor    eax,eax
     cb9:	48 89 c1             	mov    rcx,rax
     cbc:	48 c1 e1 15          	shl    rcx,0x15
     cc0:	48 83 c9 03          	or     rcx,0x3
     cc4:	48 89 8c c2 00 40 00 	mov    QWORD PTR [rdx+rax*8+0x4000],rcx
     ccb:	00 
     ccc:	48 ff c0             	inc    rax
     ccf:	48 3d 00 02 00 00    	cmp    rax,0x200
     cd5:	75 e2                	jne    0xcb9
     cd7:	c3                   	ret
     cd8:	f3 0f 1e fa          	endbr64
     cdc:	48 0f ba e7 27       	bt     rdi,0x27
     ce1:	72 0d                	jb     0xcf0
     ce3:	50                   	push   rax
     ce4:	48 8d 3d 63 10 00 00 	lea    rdi,[rip+0x1063]        # 0x1d4e
     ceb:	e8 04 05 00 00       	call   0x11f4
     cf0:	48 89 f8             	mov    rax,rdi
     cf3:	48 0f ba f8 27       	btc    rax,0x27
     cf8:	c3                   	ret
     cf9:	f3 0f 1e fa          	endbr64
     cfd:	48 89 f8             	mov    rax,rdi
     d00:	41 89 d0             	mov    r8d,edx
     d03:	48 c1 e8 27          	shr    rax,0x27
     d07:	25 ff 01 00 00       	and    eax,0x1ff
     d0c:	41 0f 20 d9          	mov    r9,cr3
     d10:	49 0f ba e9 27       	bts    r9,0x27
     d15:	49 8b 14 c1          	mov    rdx,QWORD PTR [r9+rax*8]
     d19:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     d1d:	f6 c2 01             	test   dl,0x1
     d20:	0f 84 42 01 00 00    	je     0xe68
     d26:	53                   	push   rbx
     d27:	48 89 fb             	mov    rbx,rdi
     d2a:	85 f6                	test   esi,esi
     d2c:	74 09                	je     0xd37
     d2e:	f6 c2 04             	test   dl,0x4
     d31:	0f 84 2f 01 00 00    	je     0xe66
     d37:	45 85 c0             	test   r8d,r8d
     d3a:	74 0d                	je     0xd49
     d3c:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     d40:	f6 c2 02             	test   dl,0x2
     d43:	0f 84 1d 01 00 00    	je     0xe66
     d49:	48 b8 00 f0 ff ff 7f 	movabs rax,0xffffff7ffffff000
     d50:	ff ff ff 
     d53:	48 21 c2             	and    rdx,rax
     d56:	48 89 d8             	mov    rax,rbx
     d59:	48 c1 e8 1e          	shr    rax,0x1e
     d5d:	48 0f ba ea 27       	bts    rdx,0x27
     d62:	25 ff 01 00 00       	and    eax,0x1ff
     d67:	48 8b 0c c2          	mov    rcx,QWORD PTR [rdx+rax*8]
     d6b:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     d6f:	f6 c1 01             	test   cl,0x1
     d72:	0f 84 ee 00 00 00    	je     0xe66
     d78:	85 f6                	test   esi,esi
     d7a:	74 09                	je     0xd85
     d7c:	f6 c1 04             	test   cl,0x4
     d7f:	0f 84 e1 00 00 00    	je     0xe66
     d85:	45 85 c0             	test   r8d,r8d
     d88:	74 0d                	je     0xd97
     d8a:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     d8e:	f6 c1 02             	test   cl,0x2
     d91:	0f 84 cf 00 00 00    	je     0xe66
     d97:	48 89 df             	mov    rdi,rbx
     d9a:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     d9e:	48 c1 ef 15          	shr    rdi,0x15
     da2:	81 e7 ff 01 00 00    	and    edi,0x1ff
     da8:	49 8b 14 f9          	mov    rdx,QWORD PTR [r9+rdi*8]
     dac:	f6 c2 01             	test   dl,0x1
     daf:	0f 84 b1 00 00 00    	je     0xe66
     db5:	85 f6                	test   esi,esi
     db7:	74 09                	je     0xdc2
     db9:	f6 c2 04             	test   dl,0x4
     dbc:	0f 84 a4 00 00 00    	je     0xe66
     dc2:	45 85 c0             	test   r8d,r8d
     dc5:	74 0d                	je     0xdd4
     dc7:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     dcb:	f6 c2 02             	test   dl,0x2
     dce:	0f 84 92 00 00 00    	je     0xe66
     dd4:	49 ba 00 f0 ff ff 7f 	movabs r10,0xffffff7ffffff000
     ddb:	ff ff ff 
     dde:	49 b9 00 00 00 00 80 	movabs r9,0x8000000000
     de5:	00 00 00 
     de8:	4c 21 d1             	and    rcx,r10
     deb:	4c 09 c9             	or     rcx,r9
     dee:	48 8b 04 f9          	mov    rax,QWORD PTR [rcx+rdi*8]
     df2:	a8 80                	test   al,0x80
     df4:	74 11                	je     0xe07
     df6:	48 25 00 00 e0 ff    	and    rax,0xffffffffffe00000
     dfc:	81 e3 ff ff 1f 00    	and    ebx,0x1fffff
     e02:	48 09 d8             	or     rax,rbx
     e05:	eb 5f                	jmp    0xe66
     e07:	48 89 d8             	mov    rax,rbx
     e0a:	4c 21 d2             	and    rdx,r10
     e0d:	48 c1 e8 0c          	shr    rax,0xc
     e11:	4c 09 ca             	or     rdx,r9
     e14:	25 ff 01 00 00       	and    eax,0x1ff
     e19:	48 8b 3c c2          	mov    rdi,QWORD PTR [rdx+rax*8]
     e1d:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     e21:	f7 c7 01 00 00 00    	test   edi,0x1
     e27:	74 3d                	je     0xe66
     e29:	85 f6                	test   esi,esi
     e2b:	74 08                	je     0xe35
     e2d:	f7 c7 04 00 00 00    	test   edi,0x4
     e33:	74 31                	je     0xe66
     e35:	45 85 c0             	test   r8d,r8d
     e38:	74 0c                	je     0xe46
     e3a:	48 83 c8 ff          	or     rax,0xffffffffffffffff
     e3e:	f7 c7 02 00 00 00    	test   edi,0x2
     e44:	74 20                	je     0xe66
     e46:	48 b8 00 f0 ff ff 7f 	movabs rax,0xffffff7ffffff000
     e4d:	ff ff ff 
     e50:	81 e3 ff 0f 00 00    	and    ebx,0xfff
     e56:	48 21 c7             	and    rdi,rax
     e59:	48 0f ba ef 27       	bts    rdi,0x27
     e5e:	e8 75 fe ff ff       	call   0xcd8
     e63:	48 01 d8             	add    rax,rbx
     e66:	5b                   	pop    rbx
     e67:	c3                   	ret
     e68:	c3                   	ret
     e69:	f3 0f 1e fa          	endbr64
     e6d:	41 56                	push   r14
     e6f:	41 55                	push   r13
     e71:	41 54                	push   r12
     e73:	55                   	push   rbp
     e74:	53                   	push   rbx
     e75:	48 81 ff ff ff 1f 00 	cmp    rdi,0x1fffff
     e7c:	76 19                	jbe    0xe97
     e7e:	48 89 f8             	mov    rax,rdi
     e81:	49 89 fd             	mov    r13,rdi
     e84:	48 c1 e8 30          	shr    rax,0x30
     e88:	75 0d                	jne    0xe97
     e8a:	48 89 f9             	mov    rcx,rdi
     e8d:	48 c1 e9 27          	shr    rcx,0x27
     e91:	48 83 f9 01          	cmp    rcx,0x1
     e95:	75 09                	jne    0xea0
     e97:	48 8d 3d ea 0e 00 00 	lea    rdi,[rip+0xeea]        # 0x1d88
     e9e:	eb 55                	jmp    0xef5
     ea0:	41 89 d4             	mov    r12d,edx
     ea3:	ba 01 00 00 00       	mov    edx,0x1
     ea8:	48 89 f5             	mov    rbp,rsi
     eab:	48 c1 e2 27          	shl    rdx,0x27
     eaf:	48 0f ba f5 27       	btr    rbp,0x27
     eb4:	0f 20 d8             	mov    rax,cr3
     eb7:	48 09 d0             	or     rax,rdx
     eba:	4c 8d 34 c8          	lea    r14,[rax+rcx*8]
     ebe:	49 8b 1e             	mov    rbx,QWORD PTR [r14]
     ec1:	f6 c3 01             	test   bl,0x1
     ec4:	75 23                	jne    0xee9
     ec6:	be 00 10 00 00       	mov    esi,0x1000
     ecb:	bf 00 10 00 00       	mov    edi,0x1000
     ed0:	e8 7c fb ff ff       	call   0xa51
     ed5:	48 89 c7             	mov    rdi,rax
     ed8:	48 89 c3             	mov    rbx,rax
     edb:	e8 f8 fd ff ff       	call   0xcd8
     ee0:	48 83 c8 07          	or     rax,0x7
     ee4:	49 89 06             	mov    QWORD PTR [r14],rax
     ee7:	eb 21                	jmp    0xf0a
     ee9:	f6 c3 04             	test   bl,0x4
     eec:	75 0c                	jne    0xefa
     eee:	48 8d 3d c8 0e 00 00 	lea    rdi,[rip+0xec8]        # 0x1dbd
     ef5:	e8 fa 02 00 00       	call   0x11f4
     efa:	48 b8 00 f0 ff ff 7f 	movabs rax,0xffffff7ffffff000
     f01:	ff ff ff 
     f04:	48 21 c3             	and    rbx,rax
     f07:	48 09 d3             	or     rbx,rdx
     f0a:	4c 89 e8             	mov    rax,r13
     f0d:	48 c1 e8 1b          	shr    rax,0x1b
     f11:	25 f8 0f 00 00       	and    eax,0xff8
     f16:	4c 8d 34 03          	lea    r14,[rbx+rax*1]
     f1a:	49 8b 1e             	mov    rbx,QWORD PTR [r14]
     f1d:	f6 c3 01             	test   bl,0x1
     f20:	75 23                	jne    0xf45
     f22:	be 00 10 00 00       	mov    esi,0x1000
     f27:	bf 00 10 00 00       	mov    edi,0x1000
     f2c:	e8 20 fb ff ff       	call   0xa51
     f31:	48 89 c7             	mov    rdi,rax
     f34:	48 89 c3             	mov    rbx,rax
     f37:	e8 9c fd ff ff       	call   0xcd8
     f3c:	48 83 c8 07          	or     rax,0x7
     f40:	49 89 06             	mov    QWORD PTR [r14],rax
     f43:	eb 17                	jmp    0xf5c
     f45:	f6 c3 04             	test   bl,0x4
     f48:	74 a4                	je     0xeee
     f4a:	48 b8 00 f0 ff ff 7f 	movabs rax,0xffffff7ffffff000
     f51:	ff ff ff 
     f54:	48 21 c3             	and    rbx,rax
     f57:	48 0f ba eb 27       	bts    rbx,0x27
     f5c:	4c 89 e8             	mov    rax,r13
     f5f:	48 c1 e8 12          	shr    rax,0x12
     f63:	25 f8 0f 00 00       	and    eax,0xff8
     f68:	4c 8d 34 03          	lea    r14,[rbx+rax*1]
     f6c:	49 8b 1e             	mov    rbx,QWORD PTR [r14]
     f6f:	f6 c3 01             	test   bl,0x1
     f72:	75 23                	jne    0xf97
     f74:	be 00 10 00 00       	mov    esi,0x1000
     f79:	bf 00 10 00 00       	mov    edi,0x1000
     f7e:	e8 ce fa ff ff       	call   0xa51
     f83:	48 89 c7             	mov    rdi,rax
     f86:	48 89 c3             	mov    rbx,rax
     f89:	e8 4a fd ff ff       	call   0xcd8
     f8e:	48 83 c8 07          	or     rax,0x7
     f92:	49 89 06             	mov    QWORD PTR [r14],rax
     f95:	eb 1b                	jmp    0xfb2
     f97:	f6 c3 04             	test   bl,0x4
     f9a:	0f 84 4e ff ff ff    	je     0xeee
     fa0:	48 b8 00 f0 ff ff 7f 	movabs rax,0xffffff7ffffff000
     fa7:	ff ff ff 
     faa:	48 21 c3             	and    rbx,rax
     fad:	48 0f ba eb 27       	bts    rbx,0x27
     fb2:	49 c1 ed 09          	shr    r13,0x9
     fb6:	48 89 e8             	mov    rax,rbp
     fb9:	41 81 e5 f8 0f 00 00 	and    r13d,0xff8
     fc0:	48 83 c8 05          	or     rax,0x5
     fc4:	4c 01 eb             	add    rbx,r13
     fc7:	41 f7 c4 01 00 00 00 	test   r12d,0x1
     fce:	75 07                	jne    0xfd7
     fd0:	48 89 e8             	mov    rax,rbp
     fd3:	48 83 c8 01          	or     rax,0x1
     fd7:	41 83 e4 02          	and    r12d,0x2
     fdb:	48 89 03             	mov    QWORD PTR [rbx],rax
     fde:	74 04                	je     0xfe4
     fe0:	48 83 0b 02          	or     QWORD PTR [rbx],0x2
     fe4:	5b                   	pop    rbx
     fe5:	5d                   	pop    rbp
     fe6:	41 5c                	pop    r12
     fe8:	41 5d                	pop    r13
     fea:	41 5e                	pop    r14
     fec:	c3                   	ret
     fed:	f3 0f 1e fa          	endbr64
     ff1:	89 f8                	mov    eax,edi
     ff3:	c1 e8 02             	shr    eax,0x2
     ff6:	83 e0 01             	and    eax,0x1
     ff9:	f7 c7 02 00 00 00    	test   edi,0x2
     fff:	74 03                	je     0x1004
    1001:	83 c8 02             	or     eax,0x2
    1004:	83 e7 01             	and    edi,0x1
    1007:	ba 03 00 00 00       	mov    edx,0x3
    100c:	0f 45 c2             	cmovne eax,edx
    100f:	c3                   	ret
    1010:	f3 0f 1e fa          	endbr64
    1014:	48 89 fa             	mov    rdx,rdi
    1017:	bf 01 00 00 00       	mov    edi,0x1
    101c:	48 89 d1             	mov    rcx,rdx
    101f:	48 c1 e7 27          	shl    rdi,0x27
    1023:	48 c1 e9 27          	shr    rcx,0x27
    1027:	81 e1 ff 01 00 00    	and    ecx,0x1ff
    102d:	0f 20 d8             	mov    rax,cr3
    1030:	48 09 f8             	or     rax,rdi
    1033:	48 8b 04 c8          	mov    rax,QWORD PTR [rax+rcx*8]
    1037:	83 c9 ff             	or     ecx,0xffffffff
    103a:	a8 01                	test   al,0x1
    103c:	0f 84 82 00 00 00    	je     0x10c4
    1042:	49 b8 00 f0 ff ff 7f 	movabs r8,0xffffff7ffffff000
    1049:	ff ff ff 
    104c:	48 89 d1             	mov    rcx,rdx
    104f:	4c 21 c0             	and    rax,r8
    1052:	48 c1 e9 1e          	shr    rcx,0x1e
    1056:	81 e1 ff 01 00 00    	and    ecx,0x1ff
    105c:	48 09 f8             	or     rax,rdi
    105f:	48 8b 04 c8          	mov    rax,QWORD PTR [rax+rcx*8]
    1063:	83 c9 ff             	or     ecx,0xffffffff
    1066:	a8 01                	test   al,0x1
    1068:	74 5a                	je     0x10c4
    106a:	48 89 d1             	mov    rcx,rdx
    106d:	4c 21 c0             	and    rax,r8
    1070:	48 c1 e9 15          	shr    rcx,0x15
    1074:	48 09 f8             	or     rax,rdi
    1077:	81 e1 ff 01 00 00    	and    ecx,0x1ff
    107d:	48 8b 04 c8          	mov    rax,QWORD PTR [rax+rcx*8]
    1081:	83 c9 ff             	or     ecx,0xffffffff
    1084:	a8 01                	test   al,0x1
    1086:	74 3c                	je     0x10c4
    1088:	4c 21 c0             	and    rax,r8
    108b:	48 c1 ea 09          	shr    rdx,0x9
    108f:	48 09 f8             	or     rax,rdi
    1092:	81 e2 f8 0f 00 00    	and    edx,0xff8
    1098:	48 01 d0             	add    rax,rdx
    109b:	48 8b 38             	mov    rdi,QWORD PTR [rax]
    109e:	f7 c7 01 00 00 00    	test   edi,0x1
    10a4:	74 1e                	je     0x10c4
    10a6:	89 f2                	mov    edx,esi
    10a8:	48 83 e7 f9          	and    rdi,0xfffffffffffffff9
    10ac:	83 e2 01             	and    edx,0x1
    10af:	48 c1 e2 02          	shl    rdx,0x2
    10b3:	48 09 fa             	or     rdx,rdi
    10b6:	83 e6 02             	and    esi,0x2
    10b9:	48 89 10             	mov    QWORD PTR [rax],rdx
    10bc:	74 04                	je     0x10c2
    10be:	48 83 08 02          	or     QWORD PTR [rax],0x2
    10c2:	31 c9                	xor    ecx,ecx
    10c4:	89 c8                	mov    eax,ecx
    10c6:	c3                   	ret
    10c7:	f3 0f 1e fa          	endbr64
    10cb:	48 81 fe ff ff 1f 00 	cmp    rsi,0x1fffff
    10d2:	0f 86 95 00 00 00    	jbe    0x116d
    10d8:	48 89 f0             	mov    rax,rsi
    10db:	48 c1 e8 30          	shr    rax,0x30
    10df:	0f 85 88 00 00 00    	jne    0x116d
    10e5:	48 89 f0             	mov    rax,rsi
    10e8:	48 c1 e8 27          	shr    rax,0x27
    10ec:	48 ff c8             	dec    rax
    10ef:	74 7c                	je     0x116d
    10f1:	48 01 f2             	add    rdx,rsi
    10f4:	48 8d 42 ff          	lea    rax,[rdx-0x1]
    10f8:	48 3d ff ff 1f 00    	cmp    rax,0x1fffff
    10fe:	76 6d                	jbe    0x116d
    1100:	48 89 c1             	mov    rcx,rax
    1103:	48 c1 e9 30          	shr    rcx,0x30
    1107:	75 64                	jne    0x116d
    1109:	48 c1 e8 27          	shr    rax,0x27
    110d:	48 ff c8             	dec    rax
    1110:	74 5b                	je     0x116d
    1112:	41 54                	push   r12
    1114:	49 89 d4             	mov    r12,rdx
    1117:	55                   	push   rbp
    1118:	49 81 e4 00 f0 ff ff 	and    r12,0xfffffffffffff000
    111f:	89 fd                	mov    ebp,edi
    1121:	53                   	push   rbx
    1122:	48 89 f3             	mov    rbx,rsi
    1125:	49 81 c4 00 10 00 00 	add    r12,0x1000
    112c:	48 81 e3 00 f0 ff ff 	and    rbx,0xfffffffffffff000
    1133:	f7 c2 ff 0f 00 00    	test   edx,0xfff
    1139:	4c 0f 44 e2          	cmove  r12,rdx
    113d:	4c 39 e3             	cmp    rbx,r12
    1140:	73 21                	jae    0x1163
    1142:	89 ea                	mov    edx,ebp
    1144:	be 01 00 00 00       	mov    esi,0x1
    1149:	48 89 df             	mov    rdi,rbx
    114c:	e8 a8 fb ff ff       	call   0xcf9
    1151:	48 ff c0             	inc    rax
    1154:	75 04                	jne    0x115a
    1156:	31 c0                	xor    eax,eax
    1158:	eb 0e                	jmp    0x1168
    115a:	48 81 c3 00 10 00 00 	add    rbx,0x1000
    1161:	eb da                	jmp    0x113d
    1163:	b8 01 00 00 00       	mov    eax,0x1
    1168:	5b                   	pop    rbx
    1169:	5d                   	pop    rbp
    116a:	41 5c                	pop    r12
    116c:	c3                   	ret
    116d:	31 c0                	xor    eax,eax
    116f:	c3                   	ret
    1170:	f3 0f 1e fa          	endbr64
    1174:	41 54                	push   r12
    1176:	41 bc 00 10 00 00    	mov    r12d,0x1000
    117c:	55                   	push   rbp
    117d:	53                   	push   rbx
    117e:	48 89 fb             	mov    rbx,rdi
    1181:	31 ff                	xor    edi,edi
    1183:	ba 01 00 00 00       	mov    edx,0x1
    1188:	48 89 de             	mov    rsi,rbx
    118b:	e8 37 ff ff ff       	call   0x10c7
    1190:	85 c0                	test   eax,eax
    1192:	74 28                	je     0x11bc
    1194:	48 89 d8             	mov    rax,rbx
    1197:	4c 89 e5             	mov    rbp,r12
    119a:	48 89 df             	mov    rdi,rbx
    119d:	25 ff 0f 00 00       	and    eax,0xfff
    11a2:	48 29 c5             	sub    rbp,rax
    11a5:	48 89 ee             	mov    rsi,rbp
    11a8:	e8 a1 00 00 00       	call   0x124e
    11ad:	48 39 c5             	cmp    rbp,rax
    11b0:	75 05                	jne    0x11b7
    11b2:	48 01 eb             	add    rbx,rbp
    11b5:	eb ca                	jmp    0x1181
    11b7:	b8 01 00 00 00       	mov    eax,0x1
    11bc:	5b                   	pop    rbx
    11bd:	5d                   	pop    rbp
    11be:	41 5c                	pop    r12
    11c0:	c3                   	ret
    11c1:	f3 0f 1e fa          	endbr64
    11c5:	55                   	push   rbp
    11c6:	48 89 fd             	mov    rbp,rdi
    11c9:	53                   	push   rbx
    11ca:	51                   	push   rcx
    11cb:	e8 95 00 00 00       	call   0x1265
    11d0:	31 f6                	xor    esi,esi
    11d2:	8d 58 01             	lea    ebx,[rax+0x1]
    11d5:	48 63 db             	movsxd rbx,ebx
    11d8:	48 89 df             	mov    rdi,rbx
    11db:	e8 71 f8 ff ff       	call   0xa51
    11e0:	48 85 c0             	test   rax,rax
    11e3:	74 0b                	je     0x11f0
    11e5:	48 89 c7             	mov    rdi,rax
    11e8:	48 89 ee             	mov    rsi,rbp
    11eb:	48 89 d9             	mov    rcx,rbx
    11ee:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
    11f0:	5a                   	pop    rdx
    11f1:	5b                   	pop    rbx
    11f2:	5d                   	pop    rbp
    11f3:	c3                   	ret
    11f4:	89 f8                	mov    eax,edi
    11f6:	66 ba ff ff          	mov    dx,0xffff
    11fa:	ef                   	out    dx,eax
    11fb:	e9 0e ee ff ff       	jmp    0xe
    1200:	f3 0f 1e fa          	endbr64
    1204:	48 89 f8             	mov    rax,rdi
    1207:	31 c9                	xor    ecx,ecx
    1209:	48 39 ca             	cmp    rdx,rcx
    120c:	74 09                	je     0x1217
    120e:	40 88 34 08          	mov    BYTE PTR [rax+rcx*1],sil
    1212:	48 ff c1             	inc    rcx
    1215:	eb f2                	jmp    0x1209
    1217:	c3                   	ret
    1218:	f3 0f 1e fa          	endbr64
    121c:	48 89 d1             	mov    rcx,rdx
    121f:	f3 a4                	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
    1221:	48 89 f8             	mov    rax,rdi
    1224:	c3                   	ret
    1225:	f3 0f 1e fa          	endbr64
    1229:	31 c9                	xor    ecx,ecx
    122b:	48 39 ca             	cmp    rdx,rcx
    122e:	74 1b                	je     0x124b
    1230:	8a 04 0f             	mov    al,BYTE PTR [rdi+rcx*1]
    1233:	48 ff c1             	inc    rcx
    1236:	44 8a 44 0e ff       	mov    r8b,BYTE PTR [rsi+rcx*1-0x1]
    123b:	44 38 c0             	cmp    al,r8b
    123e:	74 eb                	je     0x122b
    1240:	45 0f b6 c0          	movzx  r8d,r8b
    1244:	0f b6 c0             	movzx  eax,al
    1247:	44 29 c0             	sub    eax,r8d
    124a:	c3                   	ret
    124b:	31 c0                	xor    eax,eax
    124d:	c3                   	ret
    124e:	f3 0f 1e fa          	endbr64
    1252:	31 c0                	xor    eax,eax
    1254:	48 39 f0             	cmp    rax,rsi
    1257:	74 0b                	je     0x1264
    1259:	80 3c 07 00          	cmp    BYTE PTR [rdi+rax*1],0x0
    125d:	74 05                	je     0x1264
    125f:	48 ff c0             	inc    rax
    1262:	eb f0                	jmp    0x1254
    1264:	c3                   	ret
    1265:	f3 0f 1e fa          	endbr64
    1269:	48 be ff ff ff ff ff 	movabs rsi,0x7fffffffffffffff
    1270:	ff ff 7f 
    1273:	eb d9                	jmp    0x124e
    1275:	00 00                	add    BYTE PTR [rax],al
    1277:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    127a:	00 00                	add    BYTE PTR [rax],al
    127c:	10 00                	adc    BYTE PTR [rax],al
    127e:	00 00                	add    BYTE PTR [rax],al
    1280:	05 00 00 00 47       	add    eax,0x47000000
    1285:	4e 55                	rex.WRX push rbp
    1287:	00 02                	add    BYTE PTR [rdx],al
    1289:	00 00                	add    BYTE PTR [rax],al
    128b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    128f:	00 03                	add    BYTE PTR [rbx],al
    1291:	00 00                	add    BYTE PTR [rax],al
    1293:	00 00                	add    BYTE PTR [rax],al
    1295:	00 00                	add    BYTE PTR [rax],al
    1297:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    129a:	00 00                	add    BYTE PTR [rax],al
    129c:	10 00                	adc    BYTE PTR [rax],al
    129e:	00 00                	add    BYTE PTR [rax],al
    12a0:	05 00 00 00 47       	add    eax,0x47000000
    12a5:	4e 55                	rex.WRX push rbp
    12a7:	00 02                	add    BYTE PTR [rdx],al
    12a9:	00 00                	add    BYTE PTR [rax],al
    12ab:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    12af:	00 03                	add    BYTE PTR [rbx],al
    12b1:	00 00                	add    BYTE PTR [rax],al
    12b3:	00 00                	add    BYTE PTR [rax],al
    12b5:	00 00                	add    BYTE PTR [rax],al
    12b7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    12ba:	00 00                	add    BYTE PTR [rax],al
    12bc:	10 00                	adc    BYTE PTR [rax],al
    12be:	00 00                	add    BYTE PTR [rax],al
    12c0:	05 00 00 00 47       	add    eax,0x47000000
    12c5:	4e 55                	rex.WRX push rbp
    12c7:	00 02                	add    BYTE PTR [rdx],al
    12c9:	00 00                	add    BYTE PTR [rax],al
    12cb:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    12cf:	00 03                	add    BYTE PTR [rbx],al
    12d1:	00 00                	add    BYTE PTR [rax],al
    12d3:	00 00                	add    BYTE PTR [rax],al
    12d5:	00 00                	add    BYTE PTR [rax],al
    12d7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    12da:	00 00                	add    BYTE PTR [rax],al
    12dc:	10 00                	adc    BYTE PTR [rax],al
    12de:	00 00                	add    BYTE PTR [rax],al
    12e0:	05 00 00 00 47       	add    eax,0x47000000
    12e5:	4e 55                	rex.WRX push rbp
    12e7:	00 02                	add    BYTE PTR [rdx],al
    12e9:	00 00                	add    BYTE PTR [rax],al
    12eb:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    12ef:	00 03                	add    BYTE PTR [rbx],al
    12f1:	00 00                	add    BYTE PTR [rax],al
    12f3:	00 00                	add    BYTE PTR [rax],al
    12f5:	00 00                	add    BYTE PTR [rax],al
    12f7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    12fa:	00 00                	add    BYTE PTR [rax],al
    12fc:	10 00                	adc    BYTE PTR [rax],al
    12fe:	00 00                	add    BYTE PTR [rax],al
    1300:	05 00 00 00 47       	add    eax,0x47000000
    1305:	4e 55                	rex.WRX push rbp
    1307:	00 02                	add    BYTE PTR [rdx],al
    1309:	00 00                	add    BYTE PTR [rax],al
    130b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    130f:	00 03                	add    BYTE PTR [rbx],al
    1311:	00 00                	add    BYTE PTR [rax],al
    1313:	00 00                	add    BYTE PTR [rax],al
    1315:	00 00                	add    BYTE PTR [rax],al
    1317:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    131a:	00 00                	add    BYTE PTR [rax],al
    131c:	10 00                	adc    BYTE PTR [rax],al
    131e:	00 00                	add    BYTE PTR [rax],al
    1320:	05 00 00 00 47       	add    eax,0x47000000
    1325:	4e 55                	rex.WRX push rbp
    1327:	00 02                	add    BYTE PTR [rdx],al
    1329:	00 00                	add    BYTE PTR [rax],al
    132b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    132f:	00 03                	add    BYTE PTR [rbx],al
    1331:	00 00                	add    BYTE PTR [rax],al
    1333:	00 00                	add    BYTE PTR [rax],al
    1335:	00 00                	add    BYTE PTR [rax],al
    1337:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    133a:	00 00                	add    BYTE PTR [rax],al
    133c:	10 00                	adc    BYTE PTR [rax],al
    133e:	00 00                	add    BYTE PTR [rax],al
    1340:	05 00 00 00 47       	add    eax,0x47000000
    1345:	4e 55                	rex.WRX push rbp
    1347:	00 02                	add    BYTE PTR [rdx],al
    1349:	00 00                	add    BYTE PTR [rax],al
    134b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    134f:	00 03                	add    BYTE PTR [rbx],al
    1351:	00 00                	add    BYTE PTR [rax],al
    1353:	00 00                	add    BYTE PTR [rax],al
    1355:	00 00                	add    BYTE PTR [rax],al
    1357:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    135a:	00 00                	add    BYTE PTR [rax],al
    135c:	10 00                	adc    BYTE PTR [rax],al
    135e:	00 00                	add    BYTE PTR [rax],al
    1360:	05 00 00 00 47       	add    eax,0x47000000
    1365:	4e 55                	rex.WRX push rbp
    1367:	00 02                	add    BYTE PTR [rdx],al
    1369:	00 00                	add    BYTE PTR [rax],al
    136b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    136f:	00 03                	add    BYTE PTR [rbx],al
    1371:	00 00                	add    BYTE PTR [rax],al
    1373:	00 00                	add    BYTE PTR [rax],al
    1375:	00 00                	add    BYTE PTR [rax],al
    1377:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    137a:	00 00                	add    BYTE PTR [rax],al
    137c:	10 00                	adc    BYTE PTR [rax],al
    137e:	00 00                	add    BYTE PTR [rax],al
    1380:	05 00 00 00 47       	add    eax,0x47000000
    1385:	4e 55                	rex.WRX push rbp
    1387:	00 02                	add    BYTE PTR [rdx],al
    1389:	00 00                	add    BYTE PTR [rax],al
    138b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    138f:	00 03                	add    BYTE PTR [rbx],al
    1391:	00 00                	add    BYTE PTR [rax],al
    1393:	00 00                	add    BYTE PTR [rax],al
    1395:	00 00                	add    BYTE PTR [rax],al
    1397:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    139a:	00 00                	add    BYTE PTR [rax],al
    139c:	10 00                	adc    BYTE PTR [rax],al
    139e:	00 00                	add    BYTE PTR [rax],al
    13a0:	05 00 00 00 47       	add    eax,0x47000000
    13a5:	4e 55                	rex.WRX push rbp
    13a7:	00 02                	add    BYTE PTR [rdx],al
    13a9:	00 00                	add    BYTE PTR [rax],al
    13ab:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    13af:	00 03                	add    BYTE PTR [rbx],al
    13b1:	00 00                	add    BYTE PTR [rax],al
    13b3:	00 00                	add    BYTE PTR [rax],al
    13b5:	00 00                	add    BYTE PTR [rax],al
    13b7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    13ba:	00 00                	add    BYTE PTR [rax],al
    13bc:	10 00                	adc    BYTE PTR [rax],al
    13be:	00 00                	add    BYTE PTR [rax],al
    13c0:	05 00 00 00 47       	add    eax,0x47000000
    13c5:	4e 55                	rex.WRX push rbp
    13c7:	00 02                	add    BYTE PTR [rdx],al
    13c9:	00 00                	add    BYTE PTR [rax],al
    13cb:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    13cf:	00 03                	add    BYTE PTR [rbx],al
    13d1:	00 00                	add    BYTE PTR [rax],al
    13d3:	00 00                	add    BYTE PTR [rax],al
    13d5:	00 00                	add    BYTE PTR [rax],al
    13d7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    13da:	00 00                	add    BYTE PTR [rax],al
    13dc:	10 00                	adc    BYTE PTR [rax],al
    13de:	00 00                	add    BYTE PTR [rax],al
    13e0:	05 00 00 00 47       	add    eax,0x47000000
    13e5:	4e 55                	rex.WRX push rbp
    13e7:	00 02                	add    BYTE PTR [rdx],al
    13e9:	00 00                	add    BYTE PTR [rax],al
    13eb:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    13ef:	00 03                	add    BYTE PTR [rbx],al
    13f1:	00 00                	add    BYTE PTR [rax],al
    13f3:	00 00                	add    BYTE PTR [rax],al
    13f5:	00 00                	add    BYTE PTR [rax],al
    13f7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    13fa:	00 00                	add    BYTE PTR [rax],al
    13fc:	10 00                	adc    BYTE PTR [rax],al
    13fe:	00 00                	add    BYTE PTR [rax],al
    1400:	05 00 00 00 47       	add    eax,0x47000000
    1405:	4e 55                	rex.WRX push rbp
    1407:	00 02                	add    BYTE PTR [rdx],al
    1409:	00 00                	add    BYTE PTR [rax],al
    140b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    140f:	00 03                	add    BYTE PTR [rbx],al
    1411:	00 00                	add    BYTE PTR [rax],al
    1413:	00 00                	add    BYTE PTR [rax],al
    1415:	00 00                	add    BYTE PTR [rax],al
    1417:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    141a:	00 00                	add    BYTE PTR [rax],al
    141c:	10 00                	adc    BYTE PTR [rax],al
    141e:	00 00                	add    BYTE PTR [rax],al
    1420:	05 00 00 00 47       	add    eax,0x47000000
    1425:	4e 55                	rex.WRX push rbp
    1427:	00 02                	add    BYTE PTR [rdx],al
    1429:	00 00                	add    BYTE PTR [rax],al
    142b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    142f:	00 03                	add    BYTE PTR [rbx],al
    1431:	00 00                	add    BYTE PTR [rax],al
    1433:	00 00                	add    BYTE PTR [rax],al
    1435:	00 00                	add    BYTE PTR [rax],al
    1437:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    143a:	00 00                	add    BYTE PTR [rax],al
    143c:	10 00                	adc    BYTE PTR [rax],al
    143e:	00 00                	add    BYTE PTR [rax],al
    1440:	05 00 00 00 47       	add    eax,0x47000000
    1445:	4e 55                	rex.WRX push rbp
    1447:	00 02                	add    BYTE PTR [rdx],al
    1449:	00 00                	add    BYTE PTR [rax],al
    144b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    144f:	00 03                	add    BYTE PTR [rbx],al
    1451:	00 00                	add    BYTE PTR [rax],al
    1453:	00 00                	add    BYTE PTR [rax],al
    1455:	00 00                	add    BYTE PTR [rax],al
    1457:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    145a:	00 00                	add    BYTE PTR [rax],al
    145c:	10 00                	adc    BYTE PTR [rax],al
    145e:	00 00                	add    BYTE PTR [rax],al
    1460:	05 00 00 00 47       	add    eax,0x47000000
    1465:	4e 55                	rex.WRX push rbp
    1467:	00 02                	add    BYTE PTR [rdx],al
    1469:	00 00                	add    BYTE PTR [rax],al
    146b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    146f:	00 03                	add    BYTE PTR [rbx],al
    1471:	00 00                	add    BYTE PTR [rax],al
    1473:	00 00                	add    BYTE PTR [rax],al
    1475:	00 00                	add    BYTE PTR [rax],al
    1477:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    147a:	00 00                	add    BYTE PTR [rax],al
    147c:	10 00                	adc    BYTE PTR [rax],al
    147e:	00 00                	add    BYTE PTR [rax],al
    1480:	05 00 00 00 47       	add    eax,0x47000000
    1485:	4e 55                	rex.WRX push rbp
    1487:	00 02                	add    BYTE PTR [rdx],al
    1489:	00 00                	add    BYTE PTR [rax],al
    148b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    148f:	00 03                	add    BYTE PTR [rbx],al
    1491:	00 00                	add    BYTE PTR [rax],al
    1493:	00 00                	add    BYTE PTR [rax],al
    1495:	00 00                	add    BYTE PTR [rax],al
    1497:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    149a:	00 00                	add    BYTE PTR [rax],al
    149c:	10 00                	adc    BYTE PTR [rax],al
    149e:	00 00                	add    BYTE PTR [rax],al
    14a0:	05 00 00 00 47       	add    eax,0x47000000
    14a5:	4e 55                	rex.WRX push rbp
    14a7:	00 02                	add    BYTE PTR [rdx],al
    14a9:	00 00                	add    BYTE PTR [rax],al
    14ab:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    14af:	00 03                	add    BYTE PTR [rbx],al
    14b1:	00 00                	add    BYTE PTR [rax],al
    14b3:	00 00                	add    BYTE PTR [rax],al
    14b5:	00 00                	add    BYTE PTR [rax],al
    14b7:	00 04 00             	add    BYTE PTR [rax+rax*1],al
    14ba:	00 00                	add    BYTE PTR [rax],al
    14bc:	10 00                	adc    BYTE PTR [rax],al
    14be:	00 00                	add    BYTE PTR [rax],al
    14c0:	05 00 00 00 47       	add    eax,0x47000000
    14c5:	4e 55                	rex.WRX push rbp
    14c7:	00 02                	add    BYTE PTR [rdx],al
    14c9:	00 00                	add    BYTE PTR [rax],al
    14cb:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
    14cf:	00 03                	add    BYTE PTR [rbx],al
    14d1:	00 00                	add    BYTE PTR [rax],al
    14d3:	00 00                	add    BYTE PTR [rax],al
    14d5:	00 00                	add    BYTE PTR [rax],al
    14d7:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    14da:	00 00                	add    BYTE PTR [rax],al
    14dc:	00 00                	add    BYTE PTR [rax],al
    14de:	00 00                	add    BYTE PTR [rax],al
    14e0:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    14e3:	00 01                	add    BYTE PTR [rcx],al
    14e5:	78 10                	js     0x14f7
    14e7:	01 1b                	add    DWORD PTR [rbx],ebx
    14e9:	0c 07                	or     al,0x7
    14eb:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
    14f1:	00 00                	add    BYTE PTR [rax],al
    14f3:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    14f6:	00 00                	add    BYTE PTR [rax],al
    14f8:	19 eb                	sbb    ebx,ebp
    14fa:	ff                   	(bad)
    14fb:	ff                   	(bad)
    14fc:	3a 00                	cmp    al,BYTE PTR [rax]
    14fe:	00 00                	add    BYTE PTR [rax],al
    1500:	00 00                	add    BYTE PTR [rax],al
    1502:	00 00                	add    BYTE PTR [rax],al
    1504:	44 00 00             	add    BYTE PTR [rax],r8b
    1507:	00 30                	add    BYTE PTR [rax],dh
    1509:	00 00                	add    BYTE PTR [rax],al
    150b:	00 3f                	add    BYTE PTR [rdi],bh
    150d:	eb ff                	jmp    0x150e
    150f:	ff a2 00 00 00 00    	jmp    QWORD PTR [rdx+0x0]
    1515:	46 0e                	rex.RX (bad)
    1517:	10 8f 02 45 0e 18    	adc    BYTE PTR [rdi+0x180e4502],cl
    151d:	8e 03                	mov    es,WORD PTR [rbx]
    151f:	42 0e                	rex.X (bad)
    1521:	20 8d 04 4a 0e 28    	and    BYTE PTR [rbp+0x280e4a04],cl
    1527:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # 0xffffffff8630236e
    152d:	06                   	(bad)
    152e:	41 0e                	rex.B (bad)
    1530:	38 83 07 44 0e 40    	cmp    BYTE PTR [rbx+0x400e4407],al
    1536:	02 73 0e             	add    dh,BYTE PTR [rbx+0xe]
    1539:	38 44 0e 30          	cmp    BYTE PTR [rsi+rcx*1+0x30],al
    153d:	41 0e                	rex.B (bad)
    153f:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
    1542:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
    1545:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    1548:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    154b:	08 30                	or     BYTE PTR [rax],dh
    154d:	00 00                	add    BYTE PTR [rax],al
    154f:	00 78 00             	add    BYTE PTR [rax+0x0],bh
    1552:	00 00                	add    BYTE PTR [rax],al
    1554:	99                   	cdq
    1555:	eb ff                	jmp    0x1556
    1557:	ff 61 00             	jmp    QWORD PTR [rcx+0x0]
    155a:	00 00                	add    BYTE PTR [rax],al
    155c:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    155f:	10 8c 02 46 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1ba],cl
    1566:	03 44 0e 20          	add    eax,DWORD PTR [rsi+rcx*1+0x20]
    156a:	83 04 4c 0e          	add    DWORD PTR [rsp+rcx*2],0xe
    156e:	30 02                	xor    BYTE PTR [rdx],al
    1570:	40 0e                	rex (bad)
    1572:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
    1575:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
    1578:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    157b:	08 00                	or     BYTE PTR [rax],al
    157d:	00 00                	add    BYTE PTR [rax],al
    157f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1582:	00 00                	add    BYTE PTR [rax],al
    1584:	00 00                	add    BYTE PTR [rax],al
    1586:	00 00                	add    BYTE PTR [rax],al
    1588:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    158b:	00 01                	add    BYTE PTR [rcx],al
    158d:	78 10                	js     0x159f
    158f:	01 1b                	add    DWORD PTR [rbx],ebx
    1591:	0c 07                	or     al,0x7
    1593:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    1599:	00 00                	add    BYTE PTR [rax],al
    159b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    159e:	00 00                	add    BYTE PTR [rax],al
    15a0:	f7 eb                	imul   ebx
    15a2:	ff                   	(bad)
    15a3:	ff 2c 00             	jmp    FWORD PTR [rax+rax*1]
	...
    15ae:	00 00                	add    BYTE PTR [rax],al
    15b0:	14 00                	adc    al,0x0
    15b2:	00 00                	add    BYTE PTR [rax],al
    15b4:	00 00                	add    BYTE PTR [rax],al
    15b6:	00 00                	add    BYTE PTR [rax],al
    15b8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    15bb:	00 01                	add    BYTE PTR [rcx],al
    15bd:	78 10                	js     0x15cf
    15bf:	01 1b                	add    DWORD PTR [rbx],ebx
    15c1:	0c 07                	or     al,0x7
    15c3:	08 90 01 00 00 24    	or     BYTE PTR [rax+0x24000001],dl
    15c9:	00 00                	add    BYTE PTR [rax],al
    15cb:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    15ce:	00 00                	add    BYTE PTR [rax],al
    15d0:	f3 eb ff             	repz jmp 0x15d2
    15d3:	ff 52 00             	call   QWORD PTR [rdx+0x0]
    15d6:	00 00                	add    BYTE PTR [rax],al
    15d8:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
    15db:	10 86 02 4b 0e 18    	adc    BYTE PTR [rsi+0x180e4b02],al
    15e1:	83 03 46             	add    DWORD PTR [rbx],0x46
    15e4:	0e                   	(bad)
    15e5:	20 7d 0e             	and    BYTE PTR [rbp+0xe],bh
    15e8:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
    15eb:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
    15ee:	08 00                	or     BYTE PTR [rax],al
    15f0:	4c 00 00             	rex.WR add BYTE PTR [rax],r8b
    15f3:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
    15f7:	00 1d ec ff ff 8a    	add    BYTE PTR [rip+0xffffffff8affffec],bl        # 0xffffffff8b0015e9
    15fd:	03 00                	add    eax,DWORD PTR [rax]
    15ff:	00 00                	add    BYTE PTR [rax],al
    1601:	46 0e                	rex.RX (bad)
    1603:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
    1609:	8e 03                	mov    es,WORD PTR [rbx]
    160b:	42 0e                	rex.X (bad)
    160d:	20 8d 04 45 0e 28    	and    BYTE PTR [rbp+0x280e4504],cl
    1613:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # 0xffffffff8630245a
    1619:	06                   	(bad)
    161a:	41 0e                	rex.B (bad)
    161c:	38 83 07 44 0e 70    	cmp    BYTE PTR [rbx+0x700e4407],al
    1622:	03 68 03             	add    ebp,DWORD PTR [rax+0x3]
    1625:	0e                   	(bad)
    1626:	38 43 0e             	cmp    BYTE PTR [rbx+0xe],al
    1629:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
    162c:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
    162f:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
    1632:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    1635:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1638:	08 00                	or     BYTE PTR [rax],al
    163a:	00 00                	add    BYTE PTR [rax],al
    163c:	00 00                	add    BYTE PTR [rax],al
    163e:	00 00                	add    BYTE PTR [rax],al
    1640:	14 00                	adc    al,0x0
    1642:	00 00                	add    BYTE PTR [rax],al
    1644:	00 00                	add    BYTE PTR [rax],al
    1646:	00 00                	add    BYTE PTR [rax],al
    1648:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    164b:	00 01                	add    BYTE PTR [rcx],al
    164d:	78 10                	js     0x165f
    164f:	01 1b                	add    DWORD PTR [rbx],ebx
    1651:	0c 07                	or     al,0x7
    1653:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    1659:	00 00                	add    BYTE PTR [rax],al
    165b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    165e:	00 00                	add    BYTE PTR [rax],al
    1660:	3f                   	(bad)
    1661:	ef                   	out    dx,eax
    1662:	ff                   	(bad)
    1663:	ff 10                	call   QWORD PTR [rax]
	...
    166d:	00 00                	add    BYTE PTR [rax],al
    166f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1672:	00 00                	add    BYTE PTR [rax],al
    1674:	00 00                	add    BYTE PTR [rax],al
    1676:	00 00                	add    BYTE PTR [rax],al
    1678:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    167b:	00 01                	add    BYTE PTR [rcx],al
    167d:	78 10                	js     0x168f
    167f:	01 1b                	add    DWORD PTR [rbx],ebx
    1681:	0c 07                	or     al,0x7
    1683:	08 90 01 00 00 44    	or     BYTE PTR [rax+0x44000001],dl
    1689:	00 00                	add    BYTE PTR [rax],al
    168b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    168e:	00 00                	add    BYTE PTR [rax],al
    1690:	1f                   	(bad)
    1691:	ef                   	out    dx,eax
    1692:	ff                   	(bad)
    1693:	ff 08                	dec    DWORD PTR [rax]
    1695:	01 00                	add    DWORD PTR [rax],eax
    1697:	00 00                	add    BYTE PTR [rax],al
    1699:	46 0e                	rex.RX (bad)
    169b:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
    16a1:	8e 03                	mov    es,WORD PTR [rbx]
    16a3:	42 0e                	rex.X (bad)
    16a5:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
    16ab:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # 0xffffffff863024f2
    16b1:	06                   	(bad)
    16b2:	41 0e                	rex.B (bad)
    16b4:	38 83 07 42 0e 40    	cmp    BYTE PTR [rbx+0x400e4207],al
    16ba:	02 ea                	add    ch,dl
    16bc:	0e                   	(bad)
    16bd:	38 44 0e 30          	cmp    BYTE PTR [rsi+rcx*1+0x30],al
    16c1:	41 0e                	rex.B (bad)
    16c3:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
    16c6:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
    16c9:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    16cc:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    16cf:	08 14 00             	or     BYTE PTR [rax+rax*1],dl
    16d2:	00 00                	add    BYTE PTR [rax],al
    16d4:	00 00                	add    BYTE PTR [rax],al
    16d6:	00 00                	add    BYTE PTR [rax],al
    16d8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    16db:	00 01                	add    BYTE PTR [rcx],al
    16dd:	78 10                	js     0x16ef
    16df:	01 1b                	add    DWORD PTR [rbx],ebx
    16e1:	0c 07                	or     al,0x7
    16e3:	08 90 01 00 00 24    	or     BYTE PTR [rax+0x24000001],dl
    16e9:	00 00                	add    BYTE PTR [rax],al
    16eb:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    16ee:	00 00                	add    BYTE PTR [rax],al
    16f0:	c7                   	(bad)
    16f1:	ef                   	out    dx,eax
    16f2:	ff                   	(bad)
    16f3:	ff 57 00             	call   QWORD PTR [rdi+0x0]
    16f6:	00 00                	add    BYTE PTR [rax],al
    16f8:	00 45 0e             	add    BYTE PTR [rbp+0xe],al
    16fb:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
    1701:	83 03 49             	add    DWORD PTR [rbx],0x49
    1704:	0e                   	(bad)
    1705:	30 02                	xor    BYTE PTR [rdx],al
    1707:	43 0e                	rex.XB (bad)
    1709:	18 43 0e             	sbb    BYTE PTR [rbx+0xe],al
    170c:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
    170f:	08 14 00             	or     BYTE PTR [rax+rax*1],dl
    1712:	00 00                	add    BYTE PTR [rax],al
    1714:	00 00                	add    BYTE PTR [rax],al
    1716:	00 00                	add    BYTE PTR [rax],al
    1718:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    171b:	00 01                	add    BYTE PTR [rcx],al
    171d:	78 10                	js     0x172f
    171f:	01 1b                	add    DWORD PTR [rbx],ebx
    1721:	0c 07                	or     al,0x7
    1723:	08 90 01 00 00 3c    	or     BYTE PTR [rax+0x3c000001],dl
    1729:	00 00                	add    BYTE PTR [rax],al
    172b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    172e:	00 00                	add    BYTE PTR [rax],al
    1730:	de ef                	fsubp  st(7),st
    1732:	ff                   	(bad)
    1733:	ff                   	(bad)
    1734:	7e 00                	jle    0x1736
    1736:	00 00                	add    BYTE PTR [rax],al
    1738:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    173b:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
    1741:	8d 03                	lea    eax,[rbx]
    1743:	49 0e                	rex.WB (bad)
    1745:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
    174c:	05 41 0e 30 83       	add    eax,0x83300e41
    1751:	06                   	(bad)
    1752:	02 60 0e             	add    ah,BYTE PTR [rax+0xe]
    1755:	28 44 0e 20          	sub    BYTE PTR [rsi+rcx*1+0x20],al
    1759:	42 0e                	rex.X (bad)
    175b:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    175e:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1761:	08 00                	or     BYTE PTR [rax],al
    1763:	00 00                	add    BYTE PTR [rax],al
    1765:	00 00                	add    BYTE PTR [rax],al
    1767:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    176a:	00 00                	add    BYTE PTR [rax],al
    176c:	00 00                	add    BYTE PTR [rax],al
    176e:	00 00                	add    BYTE PTR [rax],al
    1770:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    1773:	00 01                	add    BYTE PTR [rcx],al
    1775:	78 10                	js     0x1787
    1777:	01 1b                	add    DWORD PTR [rbx],ebx
    1779:	0c 07                	or     al,0x7
    177b:	08 90 01 00 00 3c    	or     BYTE PTR [rax+0x3c000001],dl
    1781:	00 00                	add    BYTE PTR [rax],al
    1783:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    1786:	00 00                	add    BYTE PTR [rax],al
    1788:	04 f0                	add    al,0xf0
    178a:	ff                   	(bad)
    178b:	ff 77 00             	push   QWORD PTR [rdi+0x0]
    178e:	00 00                	add    BYTE PTR [rax],al
    1790:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    1793:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
    1799:	8d 03                	lea    eax,[rbx]
    179b:	49 0e                	rex.WB (bad)
    179d:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
    17a4:	05 41 0e 30 83       	add    eax,0x83300e41
    17a9:	06                   	(bad)
    17aa:	02 59 0e             	add    bl,BYTE PTR [rcx+0xe]
    17ad:	28 44 0e 20          	sub    BYTE PTR [rsi+rcx*1+0x20],al
    17b1:	42 0e                	rex.X (bad)
    17b3:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    17b6:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    17b9:	08 00                	or     BYTE PTR [rax],al
    17bb:	00 00                	add    BYTE PTR [rax],al
    17bd:	00 00                	add    BYTE PTR [rax],al
    17bf:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    17c2:	00 00                	add    BYTE PTR [rax],al
    17c4:	00 00                	add    BYTE PTR [rax],al
    17c6:	00 00                	add    BYTE PTR [rax],al
    17c8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    17cb:	00 01                	add    BYTE PTR [rcx],al
    17cd:	78 10                	js     0x17df
    17cf:	01 1b                	add    DWORD PTR [rbx],ebx
    17d1:	0c 07                	or     al,0x7
    17d3:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    17d9:	00 00                	add    BYTE PTR [rax],al
    17db:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    17de:	00 00                	add    BYTE PTR [rax],al
    17e0:	23 f0                	and    esi,eax
    17e2:	ff                   	(bad)
    17e3:	ff 10                	call   QWORD PTR [rax]
	...
    17ed:	00 00                	add    BYTE PTR [rax],al
    17ef:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    17f2:	00 00                	add    BYTE PTR [rax],al
    17f4:	00 00                	add    BYTE PTR [rax],al
    17f6:	00 00                	add    BYTE PTR [rax],al
    17f8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    17fb:	00 01                	add    BYTE PTR [rcx],al
    17fd:	78 10                	js     0x180f
    17ff:	01 1b                	add    DWORD PTR [rbx],ebx
    1801:	0c 07                	or     al,0x7
    1803:	08 90 01 00 00 34    	or     BYTE PTR [rax+0x34000001],dl
    1809:	00 00                	add    BYTE PTR [rax],al
    180b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    180e:	00 00                	add    BYTE PTR [rax],al
    1810:	03 f0                	add    esi,eax
    1812:	ff                   	(bad)
    1813:	ff 5e 00             	call   FWORD PTR [rsi+0x0]
    1816:	00 00                	add    BYTE PTR [rax],al
    1818:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    181b:	10 8d 02 4a 0e 18    	adc    BYTE PTR [rbp+0x180e4a02],cl
    1821:	8c 03                	mov    WORD PTR [rbx],es
    1823:	46 0e                	rex.RX (bad)
    1825:	20 86 04 43 0e 28    	and    BYTE PTR [rsi+0x280e4304],al
    182b:	83 05 44 0e 40 7a 0e 	add    DWORD PTR [rip+0x7a400e44],0xe        # 0x7a402676
    1832:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
    1835:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
    1838:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    183b:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    183e:	08 00                	or     BYTE PTR [rax],al
    1840:	14 00                	adc    al,0x0
    1842:	00 00                	add    BYTE PTR [rax],al
    1844:	00 00                	add    BYTE PTR [rax],al
    1846:	00 00                	add    BYTE PTR [rax],al
    1848:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    184b:	00 01                	add    BYTE PTR [rcx],al
    184d:	78 10                	js     0x185f
    184f:	01 1b                	add    DWORD PTR [rbx],ebx
    1851:	0c 07                	or     al,0x7
    1853:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    1859:	00 00                	add    BYTE PTR [rax],al
    185b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    185e:	00 00                	add    BYTE PTR [rax],al
    1860:	11 f0                	adc    eax,esi
    1862:	ff                   	(bad)
    1863:	ff 10                	call   QWORD PTR [rax]
	...
    186d:	00 00                	add    BYTE PTR [rax],al
    186f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1872:	00 00                	add    BYTE PTR [rax],al
    1874:	00 00                	add    BYTE PTR [rax],al
    1876:	00 00                	add    BYTE PTR [rax],al
    1878:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    187b:	00 01                	add    BYTE PTR [rcx],al
    187d:	78 10                	js     0x188f
    187f:	01 1b                	add    DWORD PTR [rbx],ebx
    1881:	0c 07                	or     al,0x7
    1883:	08 90 01 00 00 34    	or     BYTE PTR [rax+0x34000001],dl
    1889:	00 00                	add    BYTE PTR [rax],al
    188b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    188e:	00 00                	add    BYTE PTR [rax],al
    1890:	f1                   	int1
    1891:	ef                   	out    dx,eax
    1892:	ff                   	(bad)
    1893:	ff 60 00             	jmp    QWORD PTR [rax+0x0]
    1896:	00 00                	add    BYTE PTR [rax],al
    1898:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    189b:	10 8d 02 47 0e 18    	adc    BYTE PTR [rbp+0x180e4702],cl
    18a1:	8c 03                	mov    WORD PTR [rbx],es
    18a3:	44 0e                	rex.R (bad)
    18a5:	20 86 04 49 0e 28    	and    BYTE PTR [rsi+0x280e4904],al
    18ab:	83 05 44 0e 40 7b 0e 	add    DWORD PTR [rip+0x7b400e44],0xe        # 0x7b4026f6
    18b2:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
    18b5:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
    18b8:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    18bb:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    18be:	08 00                	or     BYTE PTR [rax],al
    18c0:	14 00                	adc    al,0x0
    18c2:	00 00                	add    BYTE PTR [rax],al
    18c4:	00 00                	add    BYTE PTR [rax],al
    18c6:	00 00                	add    BYTE PTR [rax],al
    18c8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    18cb:	00 01                	add    BYTE PTR [rcx],al
    18cd:	78 10                	js     0x18df
    18cf:	01 1b                	add    DWORD PTR [rbx],ebx
    18d1:	0c 07                	or     al,0x7
    18d3:	08 90 01 00 00 34    	or     BYTE PTR [rax+0x34000001],dl
    18d9:	00 00                	add    BYTE PTR [rax],al
    18db:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    18de:	00 00                	add    BYTE PTR [rax],al
    18e0:	01 f0                	add    eax,esi
    18e2:	ff                   	(bad)
    18e3:	ff 60 00             	jmp    QWORD PTR [rax+0x0]
    18e6:	00 00                	add    BYTE PTR [rax],al
    18e8:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    18eb:	10 8d 02 47 0e 18    	adc    BYTE PTR [rbp+0x180e4702],cl
    18f1:	8c 03                	mov    WORD PTR [rbx],es
    18f3:	44 0e                	rex.R (bad)
    18f5:	20 86 04 49 0e 28    	and    BYTE PTR [rsi+0x280e4904],al
    18fb:	83 05 44 0e 40 7b 0e 	add    DWORD PTR [rip+0x7b400e44],0xe        # 0x7b402746
    1902:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
    1905:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
    1908:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    190b:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    190e:	08 00                	or     BYTE PTR [rax],al
    1910:	14 00                	adc    al,0x0
    1912:	00 00                	add    BYTE PTR [rax],al
    1914:	00 00                	add    BYTE PTR [rax],al
    1916:	00 00                	add    BYTE PTR [rax],al
    1918:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    191b:	00 01                	add    BYTE PTR [rcx],al
    191d:	78 10                	js     0x192f
    191f:	01 1b                	add    DWORD PTR [rbx],ebx
    1921:	0c 07                	or     al,0x7
    1923:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    1929:	00 00                	add    BYTE PTR [rax],al
    192b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    192e:	00 00                	add    BYTE PTR [rax],al
    1930:	11 f0                	adc    eax,esi
    1932:	ff                   	(bad)
    1933:	ff 10                	call   QWORD PTR [rax]
	...
    193d:	00 00                	add    BYTE PTR [rax],al
    193f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1942:	00 00                	add    BYTE PTR [rax],al
    1944:	00 00                	add    BYTE PTR [rax],al
    1946:	00 00                	add    BYTE PTR [rax],al
    1948:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    194b:	00 01                	add    BYTE PTR [rcx],al
    194d:	78 10                	js     0x195f
    194f:	01 1b                	add    DWORD PTR [rbx],ebx
    1951:	0c 07                	or     al,0x7
    1953:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
    1959:	00 00                	add    BYTE PTR [rax],al
    195b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    195e:	00 00                	add    BYTE PTR [rax],al
    1960:	f1                   	int1
    1961:	ef                   	out    dx,eax
    1962:	ff                   	(bad)
    1963:	ff 2d 00 00 00 00    	jmp    FWORD PTR [rip+0x0]        # 0x1969
    1969:	00 00                	add    BYTE PTR [rax],al
    196b:	00 10                	add    BYTE PTR [rax],dl
    196d:	00 00                	add    BYTE PTR [rax],al
    196f:	00 30                	add    BYTE PTR [rax],dh
    1971:	00 00                	add    BYTE PTR [rax],al
    1973:	00 0a                	add    BYTE PTR [rdx],cl
    1975:	f0 ff                	lock (bad)
    1977:	ff 31                	push   QWORD PTR [rcx]
    1979:	00 00                	add    BYTE PTR [rax],al
    197b:	00 00                	add    BYTE PTR [rax],al
    197d:	00 00                	add    BYTE PTR [rax],al
    197f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1982:	00 00                	add    BYTE PTR [rax],al
    1984:	44 00 00             	add    BYTE PTR [rax],r8b
    1987:	00 27                	add    BYTE PTR [rdi],ah
    1989:	f0 ff                	lock (bad)
    198b:	ff 47 00             	inc    DWORD PTR [rdi+0x0]
    198e:	00 00                	add    BYTE PTR [rax],al
    1990:	00 52 0e             	add    BYTE PTR [rdx+0xe],dl
    1993:	10 4c 0e 08          	adc    BYTE PTR [rsi+rcx*1+0x8],cl
    1997:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    199a:	00 00                	add    BYTE PTR [rax],al
    199c:	5c                   	pop    rsp
    199d:	00 00                	add    BYTE PTR [rax],al
    199f:	00 56 f0             	add    BYTE PTR [rsi-0x10],dl
    19a2:	ff                   	(bad)
    19a3:	ff 5b 00             	call   FWORD PTR [rbx+0x0]
    19a6:	00 00                	add    BYTE PTR [rax],al
    19a8:	00 02                	add    BYTE PTR [rdx],al
    19aa:	46 0e                	rex.RX (bad)
    19ac:	10 4c 0e 08          	adc    BYTE PTR [rsi+rcx*1+0x8],cl
    19b0:	2c 00                	sub    al,0x0
    19b2:	00 00                	add    BYTE PTR [rax],al
    19b4:	74 00                	je     0x19b6
    19b6:	00 00                	add    BYTE PTR [rax],al
    19b8:	99                   	cdq
    19b9:	f0 ff                	lock (bad)
    19bb:	ff 22                	jmp    QWORD PTR [rdx]
    19bd:	01 00                	add    DWORD PTR [rax],eax
    19bf:	00 00                	add    BYTE PTR [rax],al
    19c1:	57                   	push   rdi
    19c2:	0e                   	(bad)
    19c3:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
    19c9:	83 03 44             	add    DWORD PTR [rbx],0x44
    19cc:	0e                   	(bad)
    19cd:	20 03                	and    BYTE PTR [rbx],al
    19cf:	00 01                	add    BYTE PTR [rcx],al
    19d1:	0e                   	(bad)
    19d2:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
    19d5:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
    19d8:	08 41 c3             	or     BYTE PTR [rcx-0x3d],al
    19db:	c6 00 00             	mov    BYTE PTR [rax],0x0
    19de:	00 00                	add    BYTE PTR [rax],al
    19e0:	14 00                	adc    al,0x0
    19e2:	00 00                	add    BYTE PTR [rax],al
    19e4:	00 00                	add    BYTE PTR [rax],al
    19e6:	00 00                	add    BYTE PTR [rax],al
    19e8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    19eb:	00 01                	add    BYTE PTR [rcx],al
    19ed:	78 10                	js     0x19ff
    19ef:	01 1b                	add    DWORD PTR [rbx],ebx
    19f1:	0c 07                	or     al,0x7
    19f3:	08 90 01 00 00 38    	or     BYTE PTR [rax+0x38000001],dl
    19f9:	00 00                	add    BYTE PTR [rax],al
    19fb:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    19fe:	00 00                	add    BYTE PTR [rax],al
    1a00:	73 f1                	jae    0x19f3
    1a02:	ff                   	(bad)
    1a03:	ff a5 00 00 00 00    	jmp    QWORD PTR [rbp+0x0]
    1a09:	46 0e                	rex.RX (bad)
    1a0b:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
    1a11:	8d 03                	lea    eax,[rbx]
    1a13:	42 0e                	rex.X (bad)
    1a15:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
    1a1c:	05 41 0e 30 83       	add    eax,0x83300e41
    1a21:	06                   	(bad)
    1a22:	02 91 0e 28 41 0e    	add    dl,BYTE PTR [rcx+0xe41280e]
    1a28:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
    1a2b:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    1a2e:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1a31:	08 00                	or     BYTE PTR [rax],al
    1a33:	00 40 00             	add    BYTE PTR [rax+0x0],al
    1a36:	00 00                	add    BYTE PTR [rax],al
    1a38:	58                   	pop    rax
    1a39:	00 00                	add    BYTE PTR [rax],al
    1a3b:	00 dc                	add    ah,bl
    1a3d:	f1                   	int1
    1a3e:	ff                   	(bad)
    1a3f:	ff 77 00             	push   QWORD PTR [rdi+0x0]
    1a42:	00 00                	add    BYTE PTR [rax],al
    1a44:	00 53 0e             	add    BYTE PTR [rbx+0xe],dl
    1a47:	10 8d 02 45 0e 18    	adc    BYTE PTR [rbp+0x180e4502],cl
    1a4d:	8c 03                	mov    WORD PTR [rbx],es
    1a4f:	44 0e                	rex.R (bad)
    1a51:	20 86 04 44 0e 28    	and    BYTE PTR [rsi+0x280e4404],al
    1a57:	83 05 44 0e 30 02 4b 	add    DWORD PTR [rip+0x2300e44],0x4b        # 0x23028a2
    1a5e:	0e                   	(bad)
    1a5f:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
    1a62:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
    1a65:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    1a68:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1a6b:	08 41 c3             	or     BYTE PTR [rcx-0x3d],al
    1a6e:	c6                   	(bad)
    1a6f:	cc                   	int3
    1a70:	cd 00                	int    0x0
    1a72:	00 00                	add    BYTE PTR [rax],al
    1a74:	00 00                	add    BYTE PTR [rax],al
    1a76:	00 00                	add    BYTE PTR [rax],al
    1a78:	14 00                	adc    al,0x0
    1a7a:	00 00                	add    BYTE PTR [rax],al
    1a7c:	00 00                	add    BYTE PTR [rax],al
    1a7e:	00 00                	add    BYTE PTR [rax],al
    1a80:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    1a83:	00 01                	add    BYTE PTR [rcx],al
    1a85:	78 10                	js     0x1a97
    1a87:	01 1b                	add    DWORD PTR [rbx],ebx
    1a89:	0c 07                	or     al,0x7
    1a8b:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
    1a91:	00 00                	add    BYTE PTR [rax],al
    1a93:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    1a96:	00 00                	add    BYTE PTR [rax],al
    1a98:	f7 f1                	div    ecx
    1a9a:	ff                   	(bad)
    1a9b:	ff 49 00             	dec    DWORD PTR [rcx+0x0]
    1a9e:	00 00                	add    BYTE PTR [rax],al
    1aa0:	00 00                	add    BYTE PTR [rax],al
    1aa2:	00 00                	add    BYTE PTR [rax],al
    1aa4:	14 00                	adc    al,0x0
    1aa6:	00 00                	add    BYTE PTR [rax],al
    1aa8:	30 00                	xor    BYTE PTR [rax],al
    1aaa:	00 00                	add    BYTE PTR [rax],al
    1aac:	2c f2                	sub    al,0xf2
    1aae:	ff                   	(bad)
    1aaf:	ff 21                	jmp    QWORD PTR [rcx]
    1ab1:	00 00                	add    BYTE PTR [rax],al
    1ab3:	00 00                	add    BYTE PTR [rax],al
    1ab5:	4c 0e                	rex.WR (bad)
    1ab7:	10 4c 0e 08          	adc    BYTE PTR [rsi+rcx*1+0x8],cl
    1abb:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    1abe:	00 00                	add    BYTE PTR [rax],al
    1ac0:	48 00 00             	rex.W add BYTE PTR [rax],al
    1ac3:	00 35 f2 ff ff 70    	add    BYTE PTR [rip+0x70fffff2],dh        # 0x71001abb
    1ac9:	01 00                	add    DWORD PTR [rax],eax
    1acb:	00 00                	add    BYTE PTR [rax],al
    1acd:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1ace:	0e                   	(bad)
    1acf:	10 83 02 03 40 01    	adc    BYTE PTR [rbx+0x1400302],al
    1ad5:	0e                   	(bad)
    1ad6:	08 41 c3             	or     BYTE PTR [rcx-0x3d],al
    1ad9:	00 00                	add    BYTE PTR [rax],al
    1adb:	00 38                	add    BYTE PTR [rax],bh
    1add:	00 00                	add    BYTE PTR [rax],al
    1adf:	00 68 00             	add    BYTE PTR [rax+0x0],ch
    1ae2:	00 00                	add    BYTE PTR [rax],al
    1ae4:	85 f3                	test   ebx,esi
    1ae6:	ff                   	(bad)
    1ae7:	ff 84 01 00 00 00 46 	inc    DWORD PTR [rcx+rax*1+0x46000000]
    1aee:	0e                   	(bad)
    1aef:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
    1af5:	8d 03                	lea    eax,[rbx]
    1af7:	42 0e                	rex.X (bad)
    1af9:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
    1b00:	05 41 0e 30 83       	add    eax,0x83300e41
    1b05:	06                   	(bad)
    1b06:	03 70 01             	add    esi,DWORD PTR [rax+0x1]
    1b09:	0e                   	(bad)
    1b0a:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
    1b0d:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
    1b10:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
    1b13:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1b16:	08 00                	or     BYTE PTR [rax],al
    1b18:	10 00                	adc    BYTE PTR [rax],al
    1b1a:	00 00                	add    BYTE PTR [rax],al
    1b1c:	a4                   	movs   BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
    1b1d:	00 00                	add    BYTE PTR [rax],al
    1b1f:	00 cd                	add    ch,cl
    1b21:	f4                   	hlt
    1b22:	ff                   	(bad)
    1b23:	ff 23                	jmp    QWORD PTR [rbx]
    1b25:	00 00                	add    BYTE PTR [rax],al
    1b27:	00 00                	add    BYTE PTR [rax],al
    1b29:	00 00                	add    BYTE PTR [rax],al
    1b2b:	00 10                	add    BYTE PTR [rax],dl
    1b2d:	00 00                	add    BYTE PTR [rax],al
    1b2f:	00 b8 00 00 00 dc    	add    BYTE PTR [rax-0x24000000],bh
    1b35:	f4                   	hlt
    1b36:	ff                   	(bad)
    1b37:	ff b7 00 00 00 00    	push   QWORD PTR [rdi+0x0]
    1b3d:	00 00                	add    BYTE PTR [rax],al
    1b3f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1b42:	00 00                	add    BYTE PTR [rax],al
    1b44:	00 00                	add    BYTE PTR [rax],al
    1b46:	00 00                	add    BYTE PTR [rax],al
    1b48:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    1b4b:	00 01                	add    BYTE PTR [rcx],al
    1b4d:	78 10                	js     0x1b5f
    1b4f:	01 1b                	add    DWORD PTR [rbx],ebx
    1b51:	0c 07                	or     al,0x7
    1b53:	08 90 01 00 00 2c    	or     BYTE PTR [rax+0x2c000001],dl
    1b59:	00 00                	add    BYTE PTR [rax],al
    1b5b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    1b5e:	00 00                	add    BYTE PTR [rax],al
    1b60:	67 f5                	addr32 cmc
    1b62:	ff                   	(bad)
    1b63:	ff a9 00 00 00 00    	jmp    FWORD PTR [rcx+0x0]
    1b69:	02 4d 0e             	add    cl,BYTE PTR [rbp+0xe]
    1b6c:	10 8c 02 44 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bc],cl
    1b73:	03 4a 0e             	add    ecx,DWORD PTR [rdx+0xe]
    1b76:	20 83 04 02 47 0e    	and    BYTE PTR [rbx+0xe470204],al
    1b7c:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
    1b7f:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1b82:	08 41 c3             	or     BYTE PTR [rcx-0x3d],al
    1b85:	c6                   	(bad)
    1b86:	cc                   	int3
    1b87:	00 28                	add    BYTE PTR [rax],ch
    1b89:	00 00                	add    BYTE PTR [rax],al
    1b8b:	00 4c 00 00          	add    BYTE PTR [rax+rax*1+0x0],cl
    1b8f:	00 e0                	add    al,ah
    1b91:	f5                   	cmc
    1b92:	ff                   	(bad)
    1b93:	ff 51 00             	call   QWORD PTR [rcx+0x0]
    1b96:	00 00                	add    BYTE PTR [rax],al
    1b98:	00 46 0e             	add    BYTE PTR [rsi+0xe],al
    1b9b:	10 8c 02 47 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1b9],cl
    1ba2:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
    1ba5:	20 83 04 7f 0e 18    	and    BYTE PTR [rbx+0x180e7f04],al
    1bab:	41 0e                	rex.B (bad)
    1bad:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
    1bb0:	08 00                	or     BYTE PTR [rax],al
    1bb2:	00 00                	add    BYTE PTR [rax],al
    1bb4:	28 00                	sub    BYTE PTR [rax],al
    1bb6:	00 00                	add    BYTE PTR [rax],al
    1bb8:	78 00                	js     0x1bba
    1bba:	00 00                	add    BYTE PTR [rax],al
    1bbc:	05 f6 ff ff 33       	add    eax,0x33fffff6
    1bc1:	00 00                	add    BYTE PTR [rax],al
    1bc3:	00 00                	add    BYTE PTR [rax],al
    1bc5:	45 0e                	rex.RB (bad)
    1bc7:	10 86 02 44 0e 18    	adc    BYTE PTR [rsi+0x180e4402],al
    1bcd:	83 03 41             	add    DWORD PTR [rbx],0x41
    1bd0:	0e                   	(bad)
    1bd1:	20 66 0e             	and    BYTE PTR [rsi+0xe],ah
    1bd4:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
    1bd7:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
    1bda:	08 00                	or     BYTE PTR [rax],al
    1bdc:	00 00                	add    BYTE PTR [rax],al
    1bde:	00 00                	add    BYTE PTR [rax],al
    1be0:	14 00                	adc    al,0x0
    1be2:	00 00                	add    BYTE PTR [rax],al
    1be4:	00 00                	add    BYTE PTR [rax],al
    1be6:	00 00                	add    BYTE PTR [rax],al
    1be8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    1beb:	00 01                	add    BYTE PTR [rcx],al
    1bed:	78 10                	js     0x1bff
    1bef:	01 1b                	add    DWORD PTR [rbx],ebx
    1bf1:	0c 07                	or     al,0x7
    1bf3:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
    1bf9:	00 00                	add    BYTE PTR [rax],al
    1bfb:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    1bfe:	00 00                	add    BYTE PTR [rax],al
    1c00:	00 f6                	add    dh,dh
    1c02:	ff                   	(bad)
    1c03:	ff 18                	call   FWORD PTR [rax]
    1c05:	00 00                	add    BYTE PTR [rax],al
    1c07:	00 00                	add    BYTE PTR [rax],al
    1c09:	00 00                	add    BYTE PTR [rax],al
    1c0b:	00 10                	add    BYTE PTR [rax],dl
    1c0d:	00 00                	add    BYTE PTR [rax],al
    1c0f:	00 30                	add    BYTE PTR [rax],dh
    1c11:	00 00                	add    BYTE PTR [rax],al
    1c13:	00 04 f6             	add    BYTE PTR [rsi+rsi*8],al
    1c16:	ff                   	(bad)
    1c17:	ff 0d 00 00 00 00    	dec    DWORD PTR [rip+0x0]        # 0x1c1d
    1c1d:	00 00                	add    BYTE PTR [rax],al
    1c1f:	00 10                	add    BYTE PTR [rax],dl
    1c21:	00 00                	add    BYTE PTR [rax],al
    1c23:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
    1c27:	00 fd                	add    ch,bh
    1c29:	f5                   	cmc
    1c2a:	ff                   	(bad)
    1c2b:	ff 29                	jmp    FWORD PTR [rcx]
    1c2d:	00 00                	add    BYTE PTR [rax],al
    1c2f:	00 00                	add    BYTE PTR [rax],al
    1c31:	00 00                	add    BYTE PTR [rax],al
    1c33:	00 10                	add    BYTE PTR [rax],dl
    1c35:	00 00                	add    BYTE PTR [rax],al
    1c37:	00 58 00             	add    BYTE PTR [rax+0x0],bl
    1c3a:	00 00                	add    BYTE PTR [rax],al
    1c3c:	12 f6                	adc    dh,dh
    1c3e:	ff                   	(bad)
    1c3f:	ff 17                	call   QWORD PTR [rdi]
    1c41:	00 00                	add    BYTE PTR [rax],al
    1c43:	00 00                	add    BYTE PTR [rax],al
    1c45:	00 00                	add    BYTE PTR [rax],al
    1c47:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    1c4a:	00 00                	add    BYTE PTR [rax],al
    1c4c:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c4d:	00 00                	add    BYTE PTR [rax],al
    1c4f:	00 15 f6 ff ff 10    	add    BYTE PTR [rip+0x10fffff6],dl        # 0x11001c4b
	...
    1c5d:	00 00                	add    BYTE PTR [rax],al
    1c5f:	00 7f 45             	add    BYTE PTR [rdi+0x45],bh
    1c62:	4c                   	rex.WR
    1c63:	46 02 01             	rex.RX add r8b,BYTE PTR [rcx]
    1c66:	01 00                	add    DWORD PTR [rax],eax
	...
    1c70:	00 6b 6d             	add    BYTE PTR [rbx+0x6d],ch
    1c73:	61                   	(bad)
    1c74:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c75:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c76:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1c77:	63 2e                	movsxd ebp,DWORD PTR [rsi]
    1c79:	63 23                	movsxd esp,DWORD PTR [rbx]
    1c7b:	69 6e 69 74 5f 61 6c 	imul   ebp,DWORD PTR [rsi+0x69],0x6c615f74
    1c82:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c83:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1c84:	63 61 74             	movsxd esp,DWORD PTR [rcx+0x74]
    1c87:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1c88:	72 3a                	jb     0x1cc4
    1c8a:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
    1c8d:	76 61                	jbe    0x1cf0
    1c8f:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c90:	69 64 20 6c 65 6e 67 	imul   esp,DWORD PTR [rax+riz*1+0x6c],0x74676e65
    1c97:	74 
    1c98:	68 00 6b 6d 61       	push   0x616d6b00
    1c9d:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c9e:	6c                   	ins    BYTE PTR es:[rdi],dx
    1c9f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1ca0:	63 2e                	movsxd ebp,DWORD PTR [rsi]
    1ca2:	63 23                	movsxd esp,DWORD PTR [rbx]
    1ca4:	6b 66 72 65          	imul   esp,DWORD PTR [rsi+0x72],0x65
    1ca8:	65 3a 20             	cmp    ah,BYTE PTR gs:[rax]
    1cab:	69 6e 76 61 6c 69 64 	imul   ebp,DWORD PTR [rsi+0x76],0x64696c61
    1cb2:	20 73 69             	and    BYTE PTR [rbx+0x69],dh
    1cb5:	7a 65                	jp     0x1d1c
    1cb7:	00 6b 6d             	add    BYTE PTR [rbx+0x6d],ch
    1cba:	61                   	(bad)
    1cbb:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cbc:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cbd:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1cbe:	63 2e                	movsxd ebp,DWORD PTR [rsi]
    1cc0:	63 23                	movsxd esp,DWORD PTR [rbx]
    1cc2:	6b 6d 61 6c          	imul   ebp,DWORD PTR [rbp+0x61],0x6c
    1cc6:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cc7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1cc8:	63 3a                	movsxd edi,DWORD PTR [rdx]
    1cca:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
    1ccd:	76 61                	jbe    0x1d30
    1ccf:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cd0:	69 64 20 73 69 7a 65 	imul   esp,DWORD PTR [rax+riz*1+0x73],0x20657a69
    1cd7:	20 
    1cd8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1cd9:	66 20 73 6f          	data16 and BYTE PTR [rbx+0x6f],dh
    1cdd:	72 74                	jb     0x1d53
    1cdf:	65 64 20 62 69       	gs and BYTE PTR fs:[rdx+0x69],ah
    1ce4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1ce5:	00 6b 6d             	add    BYTE PTR [rbx+0x6d],ch
    1ce8:	61                   	(bad)
    1ce9:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cea:	6c                   	ins    BYTE PTR es:[rdi],dx
    1ceb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1cec:	63 2e                	movsxd ebp,DWORD PTR [rsi]
    1cee:	63 23                	movsxd esp,DWORD PTR [rbx]
    1cf0:	6b 6d 61 6c          	imul   ebp,DWORD PTR [rbp+0x61],0x6c
    1cf4:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cf5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1cf6:	63 3a                	movsxd edi,DWORD PTR [rdx]
    1cf8:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
    1cfb:	76 61                	jbe    0x1d5e
    1cfd:	6c                   	ins    BYTE PTR es:[rdi],dx
    1cfe:	69 64 20 61 6c 69 67 	imul   esp,DWORD PTR [rax+riz*1+0x61],0x6e67696c
    1d05:	6e 
    1d06:	6d                   	ins    DWORD PTR es:[rdi],dx
    1d07:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
    1d09:	74 00                	je     0x1d0b
    1d0b:	6b 6d 61 6c          	imul   ebp,DWORD PTR [rbp+0x61],0x6c
    1d0f:	6c                   	ins    BYTE PTR es:[rdi],dx
    1d10:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1d11:	63 2e                	movsxd ebp,DWORD PTR [rsi]
    1d13:	63 23                	movsxd esp,DWORD PTR [rbx]
    1d15:	6b 6d 61 6c          	imul   ebp,DWORD PTR [rbp+0x61],0x6c
    1d19:	6c                   	ins    BYTE PTR es:[rdi],dx
    1d1a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1d1b:	63 3a                	movsxd edi,DWORD PTR [rdx]
    1d1d:	20 61 6c             	and    BYTE PTR [rcx+0x6c],ah
    1d20:	69 67 6e 6d 65 6e 74 	imul   esp,DWORD PTR [rdi+0x6e],0x746e656d
    1d27:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
    1d2a:	71 75                	jno    0x1da1
    1d2c:	65 73 74             	gs jae 0x1da3
    1d2f:	20 66 61             	and    BYTE PTR [rsi+0x61],ah
    1d32:	69 6c 65 64 00 6d 6d 	imul   ebp,DWORD PTR [rbp+riz*2+0x64],0x616d6d00
    1d39:	61 
    1d3a:	70 2e                	jo     0x1d6a
    1d3c:	63 3a                	movsxd edi,DWORD PTR [rdx]
    1d3e:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
    1d41:	76 61                	jbe    0x1da4
    1d43:	6c                   	ins    BYTE PTR es:[rdi],dx
    1d44:	69 64 20 6c 65 6e 67 	imul   esp,DWORD PTR [rax+riz*1+0x6c],0x74676e65
    1d4b:	74 
    1d4c:	68 00 74 72 61       	push   0x61727400
    1d51:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1d52:	73 61                	jae    0x1db5
    1d54:	6c                   	ins    BYTE PTR es:[rdi],dx
    1d55:	74 65                	je     0x1dbc
    1d57:	2e 63 23             	cs movsxd esp,DWORD PTR [rbx]
    1d5a:	70 68                	jo     0x1dc4
    1d5c:	79 73                	jns    0x1dd1
    1d5e:	69 63 61 6c 3a 20 64 	imul   esp,DWORD PTR [rbx+0x61],0x64203a6c
    1d65:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1d66:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1d67:	27                   	(bad)
    1d68:	74 20                	je     0x1d8a
    1d6a:	70 61                	jo     0x1dcd
    1d6c:	73 73                	jae    0x1de1
    1d6e:	20 6e 6f             	and    BYTE PTR [rsi+0x6f],ch
    1d71:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1d72:	2d 6b 65 72 6e       	sub    eax,0x6e72656b
    1d77:	65 6c                	gs ins BYTE PTR es:[rdi],dx
    1d79:	20 62 61             	and    BYTE PTR [rdx+0x61],ah
    1d7c:	73 65                	jae    0x1de3
    1d7e:	64 20 61 64          	and    BYTE PTR fs:[rcx+0x64],ah
    1d82:	64 72 65             	fs jb  0x1dea
    1d85:	73 73                	jae    0x1dfa
    1d87:	00 74 72 61          	add    BYTE PTR [rdx+rsi*2+0x61],dh
    1d8b:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1d8c:	73 6c                	jae    0x1dfa
    1d8e:	61                   	(bad)
    1d8f:	74 65                	je     0x1df6
    1d91:	2e 63 23             	cs movsxd esp,DWORD PTR [rbx]
    1d94:	61                   	(bad)
    1d95:	64 64 5f             	fs fs pop rdi
    1d98:	74 72                	je     0x1e0c
    1d9a:	61                   	(bad)
    1d9b:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1d9c:	73 5f                	jae    0x1dfd
    1d9e:	75 73                	jne    0x1e13
    1da0:	65 72 3a             	gs jb  0x1ddd
    1da3:	20 6e 6f             	and    BYTE PTR [rsi+0x6f],ch
    1da6:	74 20                	je     0x1dc8
    1da8:	61                   	(bad)
    1da9:	6c                   	ins    BYTE PTR es:[rdi],dx
    1daa:	6c                   	ins    BYTE PTR es:[rdi],dx
    1dab:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1dac:	77 65                	ja     0x1e13
    1dae:	64 20 6d 65          	and    BYTE PTR fs:[rbp+0x65],ch
    1db2:	6d                   	ins    DWORD PTR es:[rdi],dx
    1db3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    1db4:	72 79                	jb     0x1e2f
    1db6:	20 72 61             	and    BYTE PTR [rdx+0x61],dh
    1db9:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1dba:	67 65 00 74 72 61    	add    BYTE PTR gs:[edx+esi*2+0x61],dh
    1dc0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1dc1:	73 6c                	jae    0x1e2f
    1dc3:	61                   	(bad)
    1dc4:	74 65                	je     0x1e2b
    1dc6:	2e 63 23             	cs movsxd esp,DWORD PTR [rbx]
    1dc9:	61                   	(bad)
    1dca:	64 64 5f             	fs fs pop rdi
    1dcd:	74 72                	je     0x1e41
    1dcf:	61                   	(bad)
    1dd0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
    1dd1:	73 5f                	jae    0x1e32
    1dd3:	75 73                	jne    0x1e48
    1dd5:	65 72 3a             	gs jb  0x1e12
    1dd8:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
    1ddb:	76 61                	jbe    0x1e3e
    1ddd:	6c                   	ins    BYTE PTR es:[rdi],dx
    1dde:	69 64 20 61 64 64 72 	imul   esp,DWORD PTR [rax+riz*1+0x61],0x65726464
    1de5:	65 
    1de6:	73 73                	jae    0x1e5b
	...
    3000:	ff                   	(bad)
    3001:	ff                   	(bad)
    3002:	ff                   	(bad)
    3003:	ff                   	(bad)
    3004:	ff                   	(bad)
    3005:	ff                   	(bad)
    3006:	ff                   	(bad)
    3007:	ff 00                	inc    DWORD PTR [rax]
	...
    301d:	00 00                	add    BYTE PTR [rax],al
    301f:	00 0e                	add    BYTE PTR [rsi],cl
    3021:	07                   	(bad)
    3022:	00 00                	add    BYTE PTR [rax],al
    3024:	00 00                	add    BYTE PTR [rax],al
    3026:	00 00                	add    BYTE PTR [rax],al
    3028:	8c 07                	mov    WORD PTR [rdi],es
    302a:	00 00                	add    BYTE PTR [rax],al
    302c:	00 00                	add    BYTE PTR [rax],al
    302e:	00 00                	add    BYTE PTR [rax],al
    3030:	b7 06                	mov    bh,0x6
    3032:	00 00                	add    BYTE PTR [rax],al
    3034:	00 00                	add    BYTE PTR [rax],al
    3036:	00 00                	add    BYTE PTR [rax],al
    3038:	03 08                	add    ecx,DWORD PTR [rax]
	...
    31fe:	00 00                	add    BYTE PTR [rax],al
    3200:	9f                   	lahf
    3201:	05 00 00 00 00       	add    eax,0x0
	...
