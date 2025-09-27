#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run with root previlege"
    exit 1
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
    echo "ERROR :: Installing $2 is failure"
    exit 1
else
    echo "$2 installation successfully completed"
fi

}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install mongodb-org -y
VALIDATE $? "Mongodb"


dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"

