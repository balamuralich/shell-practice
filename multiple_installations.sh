#!/bin/bash

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run with root previlege"
    exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
    echo -e " $R ERROR $N Installing $2 is failure"
    exit 1
else
    echo -e " $G $2 installation successfully completed $N "
fi

}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "Mongosh"
