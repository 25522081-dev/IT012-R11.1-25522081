# Nguyen Huynh Vu - 25522081
# Ma nguon 4 – gia lenh nhanh
.text
.globl main
main:
  addi $t0, $zero, 90
  addi $t1, $zero, 100
  blt  $t0, $t1, Nho
  addi $t2, $zero, 1
Nho:
  li   $v0, 10
  syscall