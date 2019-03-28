#!/bin/bash

## a script for a phone book that contains a list of your contacts names and numbers with the following features :

## 1) Inserting new contact with option " -i "
## 2) view all  contacts with option " -v "
## 3) Search by contact name with option " -s "
## 4) Erease all contacts " -e "
## 5) Delete one contact name " -d "


function create_book(){
	declare -A matrix
}


function Add(){
         
         echo "Enter Name"
	 read name
         echo "Enter Number"
	 read number
	 i=${#matrix[@]}
	 matrix[$i]=$name
	 matrix[$((i+1))]=$number	
	 echo "Name :$name  Number :$number is added"
	 printf '%b\n' "${matrix[@]}" >> log	
}


function book_size()
{
   elements="${#matrix[@]}"
}


function view_all()
{	
	cat log
}


function Clear_all()
{

 > log
}


function Clear_contact()
{

 IFS=$'\n' read -d '' -r -a lines < log
 echo ${#lines[@]}


 echo "Enter Contact name"
 read  name 
 local length=${#lines[@]}

 for ((i=0;i<length;i++))
 do      
 
 	if [[ "${lines[$i]}" == "$name" ]]
	then 
               
		echo  Name : ${lines[$i]} is removed 
		unset lines[$i] 
		unset lines[$((i+1))]		
	fi
 done

 echo ${lines[@]} 
  > log
  printf '%b\n' "${lines[@]}" >> log

}


function Search ()
{
 
 IFS=$'\n' read -d '' -r -a lines < log
 echo ${#lines[@]}

 echo "Enter Contact name"
 read  name 
 local length=${#lines[@]}

 for ((i=0;i<=length;i++))
 do

 	if [[ "$name" == "${lines[$i]}" ]]
	then    
                echo $i
		echo  "Number : "${lines[$((i+1))]}" "
	fi
 done
}


input=$1

function start()
{


case $input in 
	"-v" )
	view_all ;;
	"-i" )
	Add ;;
	"-s" )
	Search ;;
	"-e" )
	Clear_all;;
	"-d" )
	Clear_contact ;;
	"?"  )
	echo "Please seclect an option" ;;
	
esac

}

start




