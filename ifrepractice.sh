#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[1m" #Bold
N1="\e[22m" #No Bold

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "$R $B ERROR $N1 $N - Please run with root privileges"
    exit 1
fi

REMOVE(){
            if [ $1 -eq 0 ]; then
                dnf remove $i
            fi
}

VALIDATE(){
            if [ $1 -ne 0 ]; then
                echo -e "$G $2 $N $3 installing"
                dnf install $i
            else
                echo -e "$2 already installed hence $Y SKIPPING $N"
            fi
}

# if we need to take i value from a list we need to create a list and re-place @ with that list name.

for i in $@
do
dnf list installed $i &>>install.log
REMOVE $? $i
VALIDATE $? "$i" "Packages"
done

# dnf list installed nginx &>>install.log
# VALIDATE $? "Nginx Packages"

# dnf list installed mongodb &>>install.log
# VALIDATE $? "Mongodb Packages"

# dnf install mysql -y &>>install.log
# VALIDATE $? "Mysql"

# dnf install nginx -y &>>install.log
# VALIDATE $? "Nginx"

# dnf install mongodb -y &>>install.log
# VALIDATE $? "Mongodb"