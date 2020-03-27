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
	if [ "${gameboard[0]}"==$letter && "${gameboard[1]}"==$letter && "${gameboard[2]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[3]}"==$letter && "${gameboard[4]}"==$letter && "${gameboard[5]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[6]}"==$letter && "${gameboard[7]}"==$letter && "${gameboard[8]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[0]}"==$letter && "${gameboard[3]}"==$letter && "${gameboard[6]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[1]}"==$letter && "${gameboard[4]}"==$letter && "${gameboard[7]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[2]}"==$letter && "${gameboard[5]}"==$letter && "${gameboard[8]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[0]}"==$letter && "${gameboard[4]}"==$letter && "${gameboard[8]}"==$letter ]
	then
		result="wins"
	elif [ "${gameboard[2]}"==$letter && "${gameboard[4]}"==$letter && "${gameboard[6]}"==$letter ]
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
function checkwinningmove()
{
	local letter=$1
	index=0
	while(($index<8))
	do
		if [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+1))]} == $letter && ${gameboard[$((index+2))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+2))]=$letter
			compPlay=1
			return
		elif [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+2))]} == $letter && ${gameboard[$((index+1))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+1))]=$letter
			compPlay=1
			return
		elif [[ ${gameboard[$((index+2))]} == $letter && ${gameboard[$((index+1))]} == $letter && ${gameboard[$index]} == $IS_EMPTY ]]
		then
			gameBoard[$index]=$letter
			compPlay=1
			return
		elif [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+3))]} == $letter && ${gameboard[$((index+6))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+6))]=$letter
			compPlay=1
			return
		elif [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+6))]} == $letter && ${gameboard[$((index+3))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+3))]=$letter
			compPlay=1
			return
		elif [[ ${gameboard[$((index+3))]} == $letter && ${gameboard[$((index+6))]} == $letter && ${gameboard[$index]} == $IS_EMPTY ]]
		then
			gameboard[$index]=$letter
			compPlay=1
			return
		fi
		index=$((index+3))
	done
	if [[ ${gameboard[0]} == $letter && ${gameboard[4]} == $letter && ${gameboard[8]} == $IS_EMPTY ]]
	then
		gameboard[8]=$letter
		compPlay=1
		return
	elif [[ ${gameboard[0]} == $letter && ${gameboard[8]} == $letter && ${gameboard[4]} == $IS_EMPTY ]]
	then
		gameboard[4]=$letter
		compPlay=1
		return
	elif [[ ${gameboard[8]} == $letter && ${gameboard[4]} == $letter && ${gameboard[0]} == $IS_EMPTY ]]
	then
		gameboard[0]=$letter
		compPlay=1
		return
	fi
	if [[ ${gameboard[2]} == $letter && ${gameboard[4]} == $letter && ${gameboard[6]} == $IS_EMPTY ]]
	then
		gameboard[6]=$letter
		compPlay=1
		return
	elif [[ ${gameboard[2]} == $letter && ${gameboard[6]} == $letter && ${gameboard[4]} == $IS_EMPTY ]]
	then
		gameboard[4]=$letter
		compPlay=1
		return
	elif [[ ${gameboard[6]} == $letter && ${gameboard[4]} == $letter && ${gameboard[2]} == $IS_EMPTY ]]
	then
		gameboard[2]=$letter
		compPlay=1
		return
	fi
}
function blockplayerwin()
{
	compPlay=0
	letter=$1
	computerletter=$2
	index=0
	while(($index<8))
	do
		if [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+1))]} == $letter && ${gameboard[$((index+2))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+2))]=$computerletter
			compPlay=1
			return
		elif [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+2))]} == $letter && ${gameboard[$((index+1))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+1))]=$computerletter
			compPlay=1
			return
		elif [[ ${gameboard[$((index+2))]} == $letter && ${gameboard[$((index+1))]} == $letter && ${gameboard[$index]} == $IS_EMPTY ]]
		then
			gameboard[$index]=$computerletter
			compPlay=1
			return
		elif [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+3))]} == $letter && ${gameboard[$((index+6))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+6))]=$computerletter
			compPlay=1
			return
		elif [[ ${gameboard[$index]} == $letter && ${gameboard[$((index+6))]} == $letter && ${gameboard[$((index+3))]} == $IS_EMPTY ]]
		then
			gameboard[$((index+3))]=$computerletter
			compPlay=1
			return
		elif [[ ${gameboard[$((index+3))]} == $letter && ${gameboard[$((index+6))]} == $letter && ${gameboard[$index]} == $IS_EMPTY ]]
		then
			gameboard[$index]=$computerletter
			compPlay=1
			return
		fi
		index=$((index+3))
	done
	if [[ ${gameboard[0]} == $letter && ${gameboard[4]} == $letter && ${gameboard[8]} == $IS_EMPTY ]]
	then
		gameboard[8]=$computerletter
		compPlay=1
		return
	elif [[ ${gameboard[0]} == $letter && ${gameboard[8]} == $letter && ${gameboard[4]} == $IS_EMPTY ]]
	then
		gameboard[4]=$computerletter
		compPlay=1
		return
	elif [[ ${gameboard[8]} == $letter && ${gameboard[4]} == $letter && ${gameboard[0]} == $IS_EMPTY ]]
	then
		gameboard[0]=$computerletter
		compPlay=1
		return
	fi
	if [[ ${gameboard[2]} == $letter && ${gameboard[4]} == $letter && ${gameBboard[6]} == $IS_EMPTY ]]
	then
		gameboard[6]=$computerletter
		compPlay=1
		return
	elif [[ ${gameboard[2]} == $letter && ${gameboard[6]} == $letter && ${gameboard[4]} == $IS_EMPTY ]]
	then
		gameboard[4]=$computerletter
		compPlay=1
		return
	elif [[ ${gameboard[6]} == $letter && ${gameboard[4]} == $letter && ${gameboard[2]} == $IS_EMPTY ]]
	then
		gameboard[2]=$computerletter
		compPlay=1
		return
	fi
}
function computerturn()
{
	computerletter=$1
	playerletter=$2
	compPlay=0
	checkwiningmove $computerletter
	if(($compPlay==0))
	then
		blockplayerwin $playerletter $computerletter
	fi
	if(($compPlay==0))
	then
		read response
	#response=$((RANDOM%9))

		if [[ "${gameboard[$response]}"!=X && "${gameboard[$response]}"!=O ]]
		then
			echo "Computer turn"
			gameboard[$response]="$computerletter"
			displayboard
		else
			computerturn $computerletter
		fi
	fi
}
function alternateplay()
{
	chance="$(firstchance)"
	flag=0
	if [[ "$chance"=="computerchance" ]]
	then
   	flag=1
	fi
	while((0==0))
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
function firstchance()
{
	chancecheck=$((RANDOM%2))
	case $chancecheck in
		$User)
			 echo "playerchance"
				;;
		$Computer)
			 echo "computerchance"
				;;
	esac
}
displayboard
assignletter
alternateplay
