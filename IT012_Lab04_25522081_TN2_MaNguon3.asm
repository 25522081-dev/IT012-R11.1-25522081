# Nguyen Huynh Vu - 25522081
# Ma nguon 3 – if / else
.text
.globl main
main:
  addi $s0, $zero, 4    # i = 4
  addi $s1, $zero, 4    # j = 4
  addi $s2, $zero, 10   # g = 10
  addi $s3, $zero, 3    # h = 3
  bne  $s0, $s1, Else   # neu i != j thi nhay den Else
  add  $s4, $s2, $s3    # f = g + h
  j    Exit
Else:
  sub  $s4, $s2, $s3    # f = g – h
Exit:
  li   $v0, 10
  syscall