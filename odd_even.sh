#!/bin/bash

echo "Please enter your number: "

read NUMBER

if [$(($NUMBER %2)) -eq 0]; then
   echo "Given number is EVEN"
else
   echo "Given number is ODD"
fi