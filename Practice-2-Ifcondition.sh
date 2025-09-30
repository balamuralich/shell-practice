#!/bin/bash

R="\e[0;31m" #Red color
G="\e[0;32m" #Green color
Y="\e[0;33m" #Yellow color
N="\e[0m" #No color
B="\e[1m" #Bold
N1="\e[0m" #No Bold

USERID=($id -u)

if [ $USERID -ne 0 ]; then
    echo "$R $B ERROR $N1 $N - Please run from root previlege"
    exit1
else
    echo "$G$B SUCCESS $N1$N"
fi

VALIDATE(){

    if [ $USERID -ne 0 ]; then
    echo "$R$ BERROR $N1$N - Please run from root previlege"
    exit1
else
    echo "$G$BSUCCESS$N1$N"
fi

}

dnf installed mysql -y

if [ $? -eq 0]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL already installed..... $Y$B SKIPPING $N1$N
fi