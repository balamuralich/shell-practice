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
    if [ $1 -ne 0 ]; then
        echo -e "$R$B ERROR $N1$N - $Y $2 $N installation failed"
        exit 1
    else
        echo -e "$G$B SUCCESS $N1$N"
    fi
}
    dnf list installed mysql
    VALIDATE $? "mysql"
    
    dnf install mysql
    VALIDATE $? "mysql"

    dnf install nginx -y
    VALIDATE $? "nginx"

    dnf install mongodb-org -y
    VALIDATE $? "mongodb"
