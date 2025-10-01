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

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo -e "Mysql packages already installed hence $Y SKIPPING $N"
    exit 1
else
    echo -e "$G Mysql $N packages installed successfully"
fi