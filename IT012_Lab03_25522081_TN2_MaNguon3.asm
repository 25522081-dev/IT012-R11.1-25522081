#Nguyen Huynh Vu 25522081 
# Ma nguon 3 - dien nang tieu thu cua mot ho gia dinh (so lieu gia lap, kWh)
# Bien       Thanh ghi
# reading0   $s0   dau thang 1
# reading1   $s1   dau thang 2
# reading2   $s2   dau thang 3
# reading3   $s3   cuoi thang 3
# usage1     $t0   dien nang thang 1
# usage2     $t1   dien nang thang 2
# usage3     $t2   dien nang thang 3
# total      $t3   usage1 + usage2 + usage3
.text
.globl main
main:
    addi $s0, $zero, 1200
    addi $s1, $zero, 1350
    addi $s2, $zero, 1475
    addi $s3, $zero, 1640
 
    # >>> usage1 = reading1 - reading0
    sub $t0, $s1, $s0
    # >>> usage2 = reading2 - reading1
    sub $t1, $s2, $s1 
    # >>> usage3 = reading3 - reading2
    sub $t2, $s3, $s2 
    # >>> total = usage1 + usage2 + usage3   (hai lenh add)
    add $t3, $t0, $t1
    add $t3, $t3, $t2  
 
 
    li   $v0, 10
    syscall
