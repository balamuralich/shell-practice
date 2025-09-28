#!/bin/bash

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R ERROR $N Please run with root previlege"
    exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
    echo -e " $R ERROR $N Installing $2 is failure"
    # if -e given echo command will take it as first letter as command, above $R is starting of color Green and $N is for end of color.
    exit 1
else
    echo -e " $G $2 installation successfully completed $N "
    # if -e given echo command will take it as first letter as command, above $G is starting of color Green and $N is for end of color.
fi

}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "Mongosh"
