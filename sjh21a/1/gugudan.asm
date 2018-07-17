section .data
msg1:	db "Outputs all 1 to 19 stages  : 1", 10,
	db "Output only the input stage : 2", 10,
	db "Others input is program exit ", 10,
	db  "input : ", 0
msg2: 	db "Please input the output stage : ", 0
msgE: 	db "Bye!!!", 10, 0
num:	dq 0
lim:	dq 9
max:	dq 19
fmtP:	db "%d * %d = %d", 10, 0
fmtS:	db "%d", 0
ent:	db "", 10, 0

section .text
extern	scanf
extern	printf
extern 	exit
global 	main, _start

prn:
	push	rbp
	mov 	rbp, rsp
	xor	ebx, ebx
	
_L9:	
	; gugudan printf; printf("%d * %d = %d\n",dan,i,dan*i);
	inc 	ebx
	mov	rsi, [num]
	mov	ecx, esi
	imul	ecx, ebx
	mov	edx, ebx
	mov	rdi, fmtP
	xor	rax, rax
	call	printf
	; for statement	; for(i=1; i<=9; i++)
	cmp	ebx, [lim]
	jl	_L9

	; ent printf	; printf("\n");
	mov	rdi, ent
	xor	rax, rax
	call 	printf
	pop	rbp
	ret

main:
_start:
	; msg1 printf	; printf("input : ");
	mov	rdi, msg1
	xor	rax, rax
	call 	printf

	; scanf 	; scanf("%d", &rbx);
	mov	rsi, num
	mov	rdi, fmtS
	inc	eax
	call	scanf

	; control statement
	mov	rax, [num]
	cmp	rax, 1
	je	_L1
	cmp	rax, 2
	je	_L2
	; msgE printf	; printf("bye");
_exit:	mov	rdi, msgE
	xor	rax, rax
	call 	printf
	call	exit

_L1:
	xor	rcx, rcx
_L1_1:
	; for statment	; for(i=1; i<=19; i++) prn();
	inc	rcx
	push	rcx
	mov	[num], rcx
	call	prn
	pop	rcx
	cmp	rcx, [max]
	jl	_L1_1
	jmp	_start

_L2:
	; msg2 printf	; printf("dan : ");
	mov	rdi, msg2
	xor	rax, rax
	call 	printf
	; scanf 	; scanf("%d", &dan);
	mov	rsi, num
	mov	rdi, fmtS
	inc	eax
	call	scanf

	; if statment	; if(dan<1 || dan>19) exit();	
	mov	ebx, [num]
	cmp	ebx, 1
	jl	_exit
	cmp	ebx, [max]
	jg	_exit

	call	prn
	jmp	_start

