# Nguyen Huynh Vu - 25522081
# Ma nguon 2 – doc reading, ghi usage
.data
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48

.text
.globl main
main:
  la  $s0, reading      # $s0 = dia chi nen cua reading
  la  $s1, usage        # $s1 = dia chi nen cua usage
  
  lw  $t0, 0($s0)       # $t0 = reading[0]
  lw  $t1, 4($s0)       # $t1 = reading[1]
  sub $t2, $t1, $t0     # $t2 = dien nang thang 1
  sw  $t2, 0($s1)       # usage[0] = $t2
  # >>> dien nang thang 2 -> usage[1]
  lw  $t0, 4($s0)       # $t0 = reading[1]
  lw  $t1, 8($s0)       # $t1 = reading[2]
  sub $t2, $t1, $t0     # $t2 = dien nang thang 2
  sw  $t2, 4($s1)       # usage[0] = $t2
  # >>> dien nang thang 3 -> usage[2]
 
  lw  $t0, 8($s0)       # $t0 = reading[2]
  lw  $t1, 12($s0)       # $t1 = reading[3]
  sub $t2, $t1, $t0     # $t2 = dien nang thang 3
  sw  $t2, 8($s1)       # usage[0] = $t2
  
  li  $v0, 10
  syscall