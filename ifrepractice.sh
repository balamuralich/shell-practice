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

VALIDATE(){
            if [ $? -eq 0 ]; then
                echo -e "$2 already installed hence $Y SKIPPING $N"
                exit 1
            else
                echo -e "$G $2 $N installed successfully"
            fi
}

dnf list installed mysql &>>install.log
VALIDATE $? "Mysql Packages"

dnf list installed nginx &>>install.log
VALIDATE $? "Nginx Packages"

dnf list installed mongodb &>>install.log
Validation $? "Mongodb Packages"

dnf install mysql -y &>>install.log
Validation $? "Mysql"

dnf install nginx -y &>>install.log
Validation $? "Nginx"