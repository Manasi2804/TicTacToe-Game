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
	if [[ "${gameboard[$response]}"!=X || "${gameboard[$response]}"!=O ]]
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
function checkwin()
{
	letter=$1
	if [ "${gameboard[0]}${gameboard[1]}${gameboard[2]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[3]}${gameboard[4]}${gameboard[5]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[6]}${gameboard[7]}${gameboard[8]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[0]}${gameboard[3]}${gameboard[6]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[1]}${gameboard[4]}${gameboard[7]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[2]}${gameboard[5]}${gameboard[8]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[0]}${gameboard[4]}${gameboard[8]}"=="$letter$letter$letter" ]
	then
		result="wins"
	elif [ "${gameboard[2]}${gameboard[4]}${gameboard[6]}"=="$letter$letter$letter" ]
	then
		result="wins"
	else
		flag=0
		for((index=0;index<${#gameboard[@]};index++))
		do
			if [[ "${gameboard[$response]}"!=X || "${gameboard[$response]}"!=O ]]
			then
				flag=1
			fi
		done
		if [ $flag==0 ]
		then
			result="draw"
		else
			result="change"
		fi
	fi
	echo $result
}

function computerturn()
{
	computerletter=$1
	response=$((RANDOM%9))
	if [[ "${gameboard[$response]}"!=X && "${gameboard[$response]}"!=O ]]
	then
		echo "Computer turn"
		gameboard[$response]="$computerletter"
		displayboard
	else
		computerturn $computerletter
	fi
}

function assignletter(){
	lettercheck=$((RANDOM%2))
	case $lettercheck in
		$Dot)
			playerletter=$O
			computerletter=$X
			;;
		$Cross)
			playerletter=$X
			computerletter=$O
			;;
	esac
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
displayboard
assignletter
chance="$(getturn)"

flag=0
if [[ "$chance"=="Computer plays first" ]]
then
	flag=1
fi
while((1))
do
	if [[ $flag%2==0 ]]
	then
		computerturn $computerletter
		result="$(checkwin $computerletter)"
		if [[ $result=="wins" || $result=="draw" ]]
		then
			printf "Computer $result\n"
			break
		fi
	else
		playerturn $playerletter
		result="$(checkwin $playerletter)"
		if [[$result=="wins" || $result=="draw" ]]
		then
			printf "Player $result \n"
			break
		fi
	fi
	flag=$((flag+1))
done
