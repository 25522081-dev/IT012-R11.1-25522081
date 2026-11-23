# Nguyen Huynh Vu - 25522081
# Ma nguon 7 – dien nang tung thang
.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
reading: .word 1020, 1131, 1272, 1438, 1644, 1885, 2141
         .word 2372, 2558, 2709, 2830, 2931, 3027
usage:   .space 48

# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
  addi $s4, $zero, 0    # Tong dien nang cac thang 
  addi $s5, $zero, 0	# Dien nang lon nhat
  addi $s6, $zero, 0	# Thang co: "Dien nang lon nhat"
Loop:
  # >>> thoat neu i == n
  beq $s2, $s3, Done
  # >>> tinh dia chi reading[i]
  sll $t1, $s2, 2
  add $t1, $s0, $t1
  # >>> $t3 = reading[i], $t4 = reading[i+1]
  lw $t3, 0($t1)
  lw $t4, 4($t1)
  # >>> $t5 = $t4 - $t3 (dien nang thang i+1)
  sub $t5, $t4, $t3
  # >>> tinh dia chi usage[i], luu $t5 vao usage[i]
  sll $t1, $s2, 2
  add $t6, $t1, $s1
  sw $t5, 0($t6) 
  # >>> cong don dien nang tung thang
  add $s4, $t5, $s4
  # >>> Dien nang lon nhat va thang tuong ung
  slt $t7, $s5, $t5
  beq $t7, $zero, Skip
  addi $s5, $t5, 0
  addi $s6, $s2, 0
  Skip:
  # >>> in “Thang “, i+1, “: ", $t5, xuong dong
  #in "Thang"
  li $v0, 4
  la $a0, m1
  syscall 
  #in i+1
  li $v0, 1
  addi $a0, $s2, 1
  syscall
  #: 
  li $v0, 4
  la $a0, m2
  syscall 
  #$t5
  li $v0, 1
  add $a0, $t5, $zero
  syscall
  #\n
  li $v0, 4
  la $a0, nl
  syscall 
  # >>> i = i + 1, quay lai Loop
  addi $s2, $s2, 1
  j Loop
Done:
  #Tong: $s4
  li $v0, 4
  la $a0, mt
  syscall 
  
  li $v0, 1
  addi $a0, $s4, 0
  syscall
  #\n  
  li $v0, 4
  la $a0, nl
  syscall 
  #Thang cao nhat: $s6 ($s5)
  li $v0, 4
  la $a0, mm
  syscall 
  # $s6
  li $v0, 1
  addi $a0, $s6, 1
  syscall
  # (
  li $v0, 4
  la $a0, lp
  syscall 
  
  # $s5
  li $v0, 1
  addi $a0, $s5, 0
  syscall
  
  # )
  li $v0, 4
  la $a0, rp
  syscall 
  
  li   $v0, 10
  syscall