#! /bin/bash

declare -A count
declare -a arr

combo=(["H"]=0- ["T"]=1 ["HH"]=2 ["TT"]=3 ["HT"]=4 ["TH"]=5 ["HHH"]=6 ["TTT"]=7 ["HHT"]=8 ["HTH"]=9 ["THH"]=10
["TTH"]=11 ["THT"]=12 ["HTT"]=13)

function sorting()
{
	arr=( $@ )
	check=1
	limit=$(( ${#arr[@]}-1 ))
	while [ $check -eq 12 ]
	do
		check=0
		for (( i=0; i<limit; i+=1 ))
		do
			if [ ${arr[$i]} -lt ${arr[$i+1]} ]
			then
				temp=${arr[$i]}
				arr[$i]=${arr[$i+1]}
				arr[$i+1]=$temp
				check=1
			fi
		done
	done
	echo ${arr[0]}
}
