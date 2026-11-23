# Nguyen Huynh Vu - 25522081
# Tinh dien nang 12 thang, tong, thang cao nhat va dem so thang theo tung bac gia

.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
mb:      .asciiz "Bac "
nl:      .asciiz "\n"
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48
cnt:     .word 0, 0, 0, 0

.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # $s2 = i = 0
  addi $s3, $zero, 12   # $s3 = n = 12 thang
  addi $s4, $zero, 0    # $s4 = tong dien nang = 0
  addi $s5, $zero, -1   # $s5 = max dien nang
  addi $s6, $zero, 0    # $s6 = thang cao nhat

LoopCalc:
  beq  $s2, $s3, EndCalc
  sll  $t1, $s2, 2
  add  $t2, $s0, $t1
  lw   $t3, 0($t2)
  lw   $t4, 4($t2)
  sub  $t5, $t4, $t3

  add  $t6, $s1, $t1
  sw   $t5, 0($t6)
  add  $s4, $s4, $t5

  slt  $t7, $s5, $t5
  beq  $t7, $zero, SkipMax
  add  $s5, $t5, $zero
  addi $s6, $s2, 1
SkipMax:
  addi $s2, $s2, 1
  j    LoopCalc

EndCalc:
  # uyet lai mang usage de dem so thang theo bac gia vao mang cnt
  la   $s7, cnt         # $s7 dia chi nen mang cnt
  addi $s2, $zero, 0    # reset i = 0

LoopCount:
  beq  $s2, $s3, PrintStats
  sll  $t1, $s2, 2
  add  $t2, $s1, $t1    # dia chi usage[i]
  lw   $t3, 0($t2)      # $t3: usage[i]

  # cnt (0..3) tuong ung bac (1..4) vao $t4
  slti $t0, $t3, 101
  bne  $t0, $zero, Idx0

  slti $t0, $t3, 151
  bne  $t0, $zero, Idx1

  slti $t0, $t3, 201
  bne  $t0, $zero, Idx2

  addi $t4, $zero, 3    # Bac 4-cnt[3]
  j    IncCnt
Idx0:
  addi $t4, $zero, 0    # Bac 1-cnt[0]
  j    IncCnt
Idx1:
  addi $t4, $zero, 1    # Bac 2-cnt[1]
  j    IncCnt
Idx2:
  addi $t4, $zero, 2    # Bac 3 -cnt[2]
IncCnt:
  sll  $t4, $t4, 2      # offset = 4 * chi so bac
  add  $t4, $s7, $t4    # dia chi cnt[bac - 1]
  lw   $t5, 0($t4)      # nap gia tri hien tai
  addi $t5, $t5, 1      # tang len 1
  sw   $t5, 0($t4)      # luu lai vao bo nho

  addi $s2, $s2, 1
  j    LoopCount

PrintStats:
  # In Tong va Thang cao nhat
  li   $v0, 4
  la   $a0, mt
  syscall
  li   $v0, 1
  add  $a0, $s4, $zero
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall

  li   $v0, 4
  la   $a0, mm
  syscall
  li   $v0, 1
  add  $a0, $s6, $zero
  syscall
  li   $v0, 4
  la   $a0, lp
  syscall
  li   $v0, 1
  add  $a0, $s5, $zero
  syscall
  li   $v0, 4
  la   $a0, rp
  syscall
  li   $v0, 4
  la   $a0, nl
  syscall

  # in Bac <k>: <so thang>
  addi $s2, $zero, 0    
  addi $s3, $zero, 4
PrintTier:
  beq  $s2, $s3, Done
  li   $v0, 4
  la   $a0, mb
  syscall

  li   $v0, 1
  addi $a0, $s2, 1
  syscall

  li   $v0, 4
  la   $a0, m2
  syscall

  sll  $t1, $s2, 2
  add  $t2, $s7, $t1
  lw   $a0, 0($t2)
  li   $v0, 1
  syscall

  li   $v0, 4
  la   $a0, nl
  syscall

  addi $s2, $s2, 1
  j    PrintTier

Done:
  li   $v0, 10
  syscall