#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: Please run with root previlege"
fi

dnf install Mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR :: Installing MySQL is failure"
else
    echo "SUCCESS :: Installing MySQL is completed"
fi
