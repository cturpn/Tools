#!/bin/bash
# /usr/local/bin/OwlTasker 

# Initialize Help Function
helpFunction()
{
   echo "Usage: OwlTasker command [command options]" 
   echo -e "\t-t 		List all tasks"
   echo -e "\t-c 		Create a new task"
   echo -e "\t-d [ <nr> | all ] Delete all or a specified task"
   echo -e "\t-h 	 	Print this message and exit"
   exit 1 # Exit script after printing help
}
if [ -z $1  ]
then echo -e "Usage: OwlTasker command [command options] \n \nTry -h for more help"
fi

while getopts "tcd:h" opt
do
   case "$opt" in
      t )
    	cat $HOME/Documents/Tasklists/tasks.md 
    	;;
      c )
	tdate=$(date -I)
    	if [ -e $HOME/Documents/Tasklists/tasks.md ]
    	then
    	tnumber=$(( $(grep -c '^###' $HOME/Documents/Tasklists/tasks.md ) + 1 ))
    	echo "Tasklist exists, adding Task"
    	read -p "|  Task Title: " ttitle || exit 1
	[[ -z "$ttitle" ]] && echo "Empty input" && exit 1
    	read -p "|  Task Description: " tdesc
	tdesc=${tdesc:-none}
    	read -p "|  Task Deadline: " tline
	tline=${tline:-Today}
    	echo -e "### Task ${tnumber}: $ttitle \n | Date: $tdate \n | Deadline: $tline \n | Description: $tdesc" >> $HOME/Documents/Tasklists/tasks.md
    	else
    	echo "nok, file gone."
    	fi
    	;;
      d ) parameterD="$OPTARG" 
	if [[ $parameterD -eq "all" ]]; then
		> $HOME/Documents/Tasklists/tasks.md
	elif [[ "$parameterD" =~ ^[0-9]+$ ]]; then
		echo "Deleting Task Nr $parameterD"
    		sed -i "/^### Task $parameterD/,+3d" $HOME/Documents/Tasklists/tasks.md
    		awk -v del="$parameterD" '
      		/^### Task [0-9]+:/ {
    		split($3,num,":");        # split 3rd field at colon
    		if (num[1] > del) num[1]--; 
    		$3 = num[1] ":"            # reconstruct with single colon
  		}
  		{print}    	
  		' $HOME/Documents/Tasklists/tasks.md > $HOME/Documents/Tasklists/tasks.md.tmp && mv $HOME/Documents/Tasklists/tasks.md.tmp $HOME/Documents/Tasklists/tasks.md
	else
		echo "Exiting, wrong parameters. Enter Task Nr or All"
		exit 1
	fi
    	;;
      h ) helpFunction ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done


