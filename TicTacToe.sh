#!/bin/bash -x
X="X"
O="O"
Dot=0
Cross=1
User=0
computer=1
declare -a gameboard
gameboard=(" " " " " " " " " " " " " " " " " ")

function displayboard(){

echo "Welcome to tic tac toe game"
echo "${gameboard[0]}  | ${gameboard[1]} | ${gameboard[2]}"
echo "-----------"
echo "${gameboard[3]}  | ${gameboard[4]} | ${gameboard[5]}"
echo "-----------"
echo "${gameboard[6]}  | ${gameboard[7]} | ${gameboard[8]}"
}
function playturn(){
playerletter=$1
printf"Enter any number bet 0-8:"
read response
if [[ $response>=0 && $response<=8 ]]
then
	if [[ "${gameboard[$response]}"!=X || "${gameboard[$response]}"!=o ]]
	then
		gameboard[$response]="$playerletter"
	else
		playerturn $playerletter
	fi
else
	printf "Invalid input"
fi
displayboard
}

function getletter(){
	lettercheck=$((RANDOM%2))
	case $lettercheck in
		$Dot)
			playerletter=$o
			;;
		$Cross)
			playerletter=$x
			;;
	esac
	echo $playerletter
}
function getturn(){

	firstTurn=$((RANDOM%2))
	case $firstTurn in
	$User)
		 echo "User plays first"
			;;
	$Computer)
		 echo "Computer plays first"
			;;
	esac
}
letter="$(getletter)"
getturn
playerturn $letter
