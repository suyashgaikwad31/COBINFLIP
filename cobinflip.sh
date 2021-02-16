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
for (( i=0; i<14; i+=1 ))
do
	count[$i]=0
done

for (( i=1; i<=100; i+=1 ))
do
	random=$(( RANDOM%2 ))
	count[ $random]=$(( ${count[$random]}+1 )) #singlet

	random=$(( RANDOM%4+2 ))
        count[ $random]=$(( ${count[$random]}+1 )) #doublet

	random=$(( RANDOM%8+6 ))
        count[ $random]=$(( ${count[$random]}+1 )) #triplet

done

for key in ${!combo[@]} 
do
	value=${combo[$key]}
	echo $key "=" ${count[$value]} "%"
done
value=$( sorting ${count[@]} )
echo
echo "winning combination is/are:"
for key in ${!combo[@]}
do
        if [ ${count[${combo[$key]}]} == $value ]
        then
                `echo $key "=" ${count[${combo[$key]}]} "%"
	fi
done
