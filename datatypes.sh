#!/bin/bash

NUMBER1=200
NUMBER2=300
NAME=$1

SUM=$(($NUMBER1+$NUMBER2))

echo "The total is $SUM"
echo "This number belongs to $1"

HERO_NAMES=("Pawan" "Mahesh" "Nani" "Ramcharan")

echo "Tollywood Heroes ${HERO_NAMES[@]}"