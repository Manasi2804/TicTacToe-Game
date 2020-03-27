#!/bin/bash -x

declare -a gameboard
gameboard=(" " " " " " " " " " " " " " " " " ")

echo "Welcome to tic tac toe game"

echo "${gameboard[0]}  | ${gameboard[1]} | ${gameboard[2]}"
echo "-----------"
echo "${gameboard[3]}  | ${gameboard[4]} | ${gameboard[5]}"
echo "-----------"
echo "${gameboard[6]}  | ${gameboard[7]} | ${gameboard[8]}"
