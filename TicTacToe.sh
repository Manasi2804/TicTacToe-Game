#!/bin/bash -x
X="X"
O="O"
declare -a gameboard
gameboard=(" " " " " " " " " " " " " " " " " ")

echo "Welcome to tic tac toe game"

echo "${gameboard[0]}  | ${gameboard[1]} | ${gameboard[2]}"
echo "-----------"
echo "${gameboard[3]}  | ${gameboard[4]} | ${gameboard[5]}"
echo "-----------"
echo "${gameboard[6]}  | ${gameboard[7]} | ${gameboard[8]}"

lettercheck=$((RANDOM%2))
case $lettercheck in
	1) echo "You have assigned : "$O
		;;
	2) echo "You have assigned : "$X
		;;
esac
firstTurn=$((RANDOM%2))
case $firstTurn in
	1) echo "User plays first"
		;;
	2) echo "Computer plays first"
		;;
esac

