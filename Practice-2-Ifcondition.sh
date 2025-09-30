#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[1m" #Bold
N1="\e[0m" #No Bold

USERID=(id -u)

if [ $USERID -ne 0 ]; then
    echo -e "$R $B ERROR $N1 $N - Please run from root previlege"
    exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
    echo -e "$R$B ERROR $N1$N - Please run from root previlege"
    exit 1
else
    echo -e "$G$B SUCCESS $N1$N"
fi

}

dnf list installed mysql

if [ $? -eq 0 ]; then
    dnf install mysql -y
    VALIDATE $?
else
    echo -e "MySQL already installed..... $Y$B SKIPPING $N1$N"
fi