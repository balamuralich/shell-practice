#!/bin/bash

# Color codes
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[1m"   # Bold
N1="\e[22m" # No Bold (use \e[22m instead of \e[0m to disable bold only)

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${R}${B}ERROR${N1}${N} - Please run with root privileges"
    exit 1
fi

# Validation function
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "${R}${B}ERROR${N1}${N} - Command failed"
        exit 1
    else
        echo -e "${G}${B}SUCCESS${N1}${N}"
    fi
}

# Check if MySQL is installed
dnf list installed mysql
if [ $? -ne 0 ]; then
    echo -e "${Y}${B}Installing MySQL...${N1}${N}"
    dnf install mysql -y
    VALIDATE $?
else
    echo -e "MySQL already installed..... ${Y}${B}SKIPPING${N1}${N}"
fi

# Check if Nginx is installed
dnf list installed Nginx
if [ $? -ne 0 ]; then
    echo -e "${Y}${B}Installing Nginx...${N1}${N}"
    dnf install Nginx -y
    VALIDATE $?
else
    echo -e "Nginx already installed..... ${Y}${B}SKIPPING${N1}${N}"
fi
