#Tic-tac-toe
ttt()
{
	clear
	play()
	{
		echo -e "\n\t\t\033[1;34m\033[1m---------------*** Tic-tac-toe ***---------------\033[0m\n\n"
		echo -e "Choose a cell number from 1 to 9 as given below and play:\n\n"
		echo -e "\t\t\t 1 | 2 | 3 "
		echo -e "\t\t\t-----------"
		echo -e "\t\t\t 4 | 5 | 6 "
		echo -e "\t\t\t-----------"
		echo -e "\t\t\t 7 | 8 | 9 "
		echo -e "\t-\t-\t-\t-\t-\t-\t-\t-\n\n"
		
		#c1=" "; c2=" "; c3=" "; c4=" "; c5=" "; c6=" "; c7=" "; c8=" "; c9=" ";
		declare -a c
		for  ((i=1; i<=9; i++))
		{
			c[$i]=" "
		}
		
		
		winner()
		{
			echo -e  "\n\e[46m\n"
			echo -e  "\e[0m\n\e[34m\e[1m\n\tCongratulations\e[31m $turn...\e[34m\e[1m You win the game ";
			echo -e  "\e[32m\e[1m\n\nwant to play again..??(y/n)"
			read p
			if [ $p == "y" ] || [ $p == "Y" ];then
				ttt
			else
				exit
			fi
		}
		
		
		showboard()
		{
			echo -e "\t\t\t\e[31m\e[1m ${c[1]} \e[0m|\e[31m\e[1m ${c[2]} \e[0m|\e[31m\e[1m ${c[3]} \e[0m"
			echo -e "\t\t\t-----------"
			echo -e "\t\t\t\e[31m\e[1m ${c[4]} \e[0m|\e[31m\e[1m ${c[5]} \e[0m|\e[31m\e[1m ${c[6]} \e[0m"
			echo -e "\t\t\t-----------"
			echo -e "\t\t\t\e[31m\e[1m ${c[7]} \e[0m|\e[31m\e[1m ${c[8]} \e[0m|\e[31m\e[1m ${c[9]} \e[0m"
		}
		
		count=0
				
		begin()
		{
			showboard
			if [ $turn == $player1 ]
			then
				insert="X"
			else
				insert="O"
			fi
			
			getagain()
			{
				getCell()
				{
					echo -e "\n\t\e[34m\e[1m$turn \e[0menter respetive cell number to insert $insert:\e[1m";
					echo -ne "\t" 
					read cell
				}
				
				getCell
				
				if [[ $cell -lt 1 ]] || [[ $cell -gt 9 ]] 
				then 
					echo -e "\e[31m Cell number can't be other than 1 to 9:\e[0m"
					getagain
					
				elif [ "${c[cell]}" != " " ]
				then
					echo -e "\n\e[31m\e[1mPosition is already filled!!... Please enter valid position.\e[0m\n\n"
					getagain
					
				elif [ "${c[cell]}" == " " ];
				then
					c[cell]=$insert
					count=$((count + 1))
					
					
					if [[ "${c[1]}" == "$insert" ]] && [[ "${c[2]}" == "$insert" ]] && [[ "${c[3]}" == "$insert" ]];
					then
						showboard
						winner
					elif [[ "${c[4]}" == "$insert" ]] && [[ "${c[5]}" == "$insert" ]] && [[ "${c[6]}" == "$insert" ]];then
						showboard
						winner
					elif [[ "${c[7]}" == "$insert" ]] && [[ "${c[8]}" == "$insert" ]] && [[ "${c[9]}" == "$insert" ]];then
						showboard
						winner
					elif [[ "${c[1]}" == "$insert" ]] && [[ "${c[4]}" == "$insert" ]] && [[ "${c[7]}" == "$insert" ]];then
						showboard
						winner
					elif [[ "${c[2]}" == "$insert" ]] && [[ "${c[5]}" == "$insert" ]] && [[ "${c[8]}" == "$insert" ]];then
						showboard
						winner
					elif [[ "${c[3]}" == "$insert" ]] && [[ "${c[6]}" == "$insert" ]] && [[ "${c[9]}" == "$insert" ]] ;then
						showboard
						winner
					elif [[ "${c[1]}" == "$insert" ]] && [[ "${c[5]}" == "$insert" ]] && [[ "${c[9]}" == "$insert" ]];then
						showboard
						winner
					elif [[ "${c[3]}" == "$insert" ]] && [[ "${c[5]}" == "$insert" ]] && [[ "${c[7]}" == "$insert" ]];
					then
						showboard
						winner
					else
						echo
					fi
					if [ $count  -eq 9 ]
					then
						echo -e "\n\n\e[31m\e[1mIt's a draw!!\e[0m"
						echo -e  "\n\e[32m\e[1m\n\nwant to play again..??(y/n)"
						read p
						if [ $p == "y" ] || [ $p == "Y" ];then
							ttt
						else
							exit
						fi
					fi
				
					if [ "$turn" == "$player1" ]
					then
						turn=$player2
					else
						turn=$player1
					fi
					
					begin
				
				else
					echo 
				fi
			
			}
			getagain
			
		}
		begin
	}
	
	echo -e "\n\t\t\033[1;34m\033[1m---------------*** welcome ***------------\033[0m\n\n"
	
	echo -ne "Enter name  of Player-1:\033[1m"
	read player1
	echo -ne "\n\033[0mEnter name of Player-2:\033[1m"
	read player2
	
	toss=$(($RANDOM % 100))
		
			if [ $toss -lt 50 ];then
				echo -e "\n\n\e[1m\e[47m\tCongratulations $player1 \n\e[0m\e[1m\e[31m you win the toss"
				turn=$player1
			else
				echo -e "\n\n\e[1m\e[47m\tCongratulations $player2 \n\e[0m\e[1m\e[31m you win the toss"
				turn=$player2
			fi
	
	play
	
}

ttt
