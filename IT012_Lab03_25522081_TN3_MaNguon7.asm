#Nguyen Huynh Vu - 25522081 
# Ma nguon 7 - Tong hop dien nang tieu thu 3 thang
.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"
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
  
 
    # Doc chi so (reading 0 toi reading 3)
    # reading 0
    li   $v0, 4
    la   $a0, prompt
    syscall
    li $v0, 5 
    syscall 
    add $s0, $zero, $v0
    # reading 1
     li   $v0, 4
    la   $a0, prompt
    syscall
    li $v0, 5 
    syscall 
    add $s1, $zero, $v0
    # reading 2
     li   $v0, 4
    la   $a0, prompt
    syscall
    li $v0, 5 
    syscall 
    add $s2, $zero, $v0
    # reading 3
     li   $v0, 4
    la   $a0, prompt
    syscall
    li $v0, 5 
    syscall 
    add $s3, $zero, $v0
 
    # >>> usage1 = reading1 - reading0
    sub $t0, $s1, $s0
    # >>> usage2 = reading2 - reading1
    sub $t1, $s2, $s1 
    # >>> usage3 = reading3 - reading2
    sub $t2, $s3, $s2 
    # >>> total = usage1 + usage2 + usage3   (hai lenh add)
    add $t3, $t0, $t1
    add $t3, $t3, $t2  
 
    
   # Dien nang tieu thu tung thang va tong
   # Thang 1
    li $v0, 4 
    la $a0, m1
    syscall
    li $v0, 1
    add $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    #Thang 2
    li $v0, 4 
    la $a0, m2
    syscall
    li $v0, 1
    add $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    
    #Thang 3
    li $v0, 4 
    la $a0, m3
    syscall
    li $v0, 1
    add $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    
    #Thang 4
     li $v0, 4 
    la $a0, tot
    syscall
     li $v0, 1
    add $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    
    
    
    
    li   $v0, 10
    syscall
