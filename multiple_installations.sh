#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run with root previlege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing MySQL is failure"
    exit 1
else
    echo "MySQL installation successfully completed"
fi

dnf install mangodb -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing Mangodb is failure"
    exit 1
else
    echo "Mangodb installation successfully completed"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing nginx is failure"
    exit 1
else
    echo "nginx installation successfully completed"
fi


