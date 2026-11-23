# Nguyen Huynh Vu - 25522081
# Ma nguon 5 – phan bac dien nang
.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"
 
.text
.globl main
main:
  li  $v0, 4
  la  $a0, prompt
  syscall
  li  $v0, 5            # doc kWh, ket qua o $v0
  syscall
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)
  # >>> xac dinh bac (1..4) theo Bang 6, dat vao $s1
  slti $t0, $s0, 101
  bne $t0, 1, Bac_2
  addi $s1, $zero, 1
  j Exit
  Bac_2:
  slti $t0, $s0, 151
  bne $t0, 1, Bac_3
  addi $s1, $zero, 2
  j Exit
  Bac_3:
  slti $t0, $s0, 201
  bne $t0, 1, Bac_4
  addi $s1, $zero, 3
  j Exit
  Bac_4:
  addi $s1, $zero, 4
  # >>> in “Bac: “, roi $s1, roi xuong dong
  Exit:
  # in "Bac: "
  li $v0, 4 
  la $a0, msg
  syscall
  # in $s1
  li $v0, 1
  add $a0, $s1, $zero 
  syscall 
   # xuong dong
  li $v0, 4 
  la $a0, nl
  syscall
  
  li  $v0, 10
  syscall
  
