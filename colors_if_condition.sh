#!/bin/bash

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R ERROR $N Please run with root previlege"
    # if -e given echo command will take it as first letter as command, above $R is starting of color Green and $N is for end of color.
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

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already installed.... $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already installed.... $Y SKIPPING $N"
fi

dnf list installed mongodb-mongosh -y
if [ $? -ne 0 ]; then
    dnf install mongodb-mongosh -y
    VALIDATE $? "mongodb-mongosh"
else
    echo -e "mongodb-mongosh already installed.... $Y SKIPPING $N"
fi
