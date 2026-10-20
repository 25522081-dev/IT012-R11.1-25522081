#Nguyen Huynh Vu - 25522081 
# Ma nguon 1 - nhung buoc dau voi thanh ghi
.text
.globl main
main:
    addi $t0, $zero, 12      # $t0 = $zero + 12
    addi $t1, $zero, 30      # $t1 = $zero + 30
    add  $t2, $t0, $t1       # $t2 = $t0 + $t1
    addi $zero, $zero, 5     # thu dua $zero + 5 vao $zero
    add  $t3, $zero, $t2     # $t3 = $zero + $t2
    li   $v0, 10             # ket thuc chuong trinh (xem Thi nghiem 3)
    syscall