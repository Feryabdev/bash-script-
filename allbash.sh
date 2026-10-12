#!/bin/bash

echo " ======================================== "
echo ""
echo "What do you want ? "
echo ""
echo " 1) Create something "
echo " 2) Search for something "
echo " 3) New user work "
echo " 4) Exit "
echo ""
read -p " Enter a Number Option : " user
echo " ======================================== "

case $user in
1)
  echo " =========================== "
  echo ""
  echo " 1) Create a script file "
  echo " 2) Create a Normal file "
  echo " 3) Create a new directory "
  echo " 4) Back to Main Menu "
  echo ""
  echo " ============================ "
  read -p " Enter the Option Number : " create

  case $create in
  1) read -p " How many files you want ? : " count
     while [ $count -gt 0 ]
     do
       read -p " Enter the Name File : " bash
       touch $bash
       chmod +x $bash
       echo "#!/bin/bash" > $bash
       echo " $bash : the file is done "
       count=$(($count - 1))
     done ;;
 2) read -p " How many files you want ? : " count
     while [ $count -gt 0 ]
     do
       read -p " Enter the Name File : " file
       touch $file
       count=$(($count - 1))
     done ;;
  3) read -p " How many directory you want ? :" count
     while [ $count -gt 0 ]
     do
       read -p " Enter the Name Directory : " dir
       mkdir $dir
       count=$(($count - 1))
     done ;;
  4) exit ;;
  esac
  ;;

2)
  echo " ============================== "
  echo ""
  echo " 1) Search for a file"
  echo " 2) Search for a directory"
  echo " 3) Search for a word"
  echo " 4) Search for a command"
  echo " 5) Back to Main Menu "
  echo ""
  echo " ============================= "
  read -p "Enter the Option Number : " search

  case $search in
  1) read -p " Enter the file name : " files;
     find ~ -iname "$files" ;;
  2) read -p "Enter the directory name : " directory;
     find ~ -iname "$directory" ;;
  3) read -p " Enter the word : " word;
     grep -rn "$word" . ;;
  4) read -p "Enter the command : " order;
     which $order ;;
  5) exit ;;
  esac
  ;;

3)
  echo " ============================= "
  echo ""
  echo " 1) New user work"
  echo " 2) Make a new group"
  echo " 3) User work with home"
  echo ""
  echo " ============================== "
  read -p "Enter the Option Number : " admin

  case $admin in
  1) read -p "Enter Your Username : " username
     useradd $username
     id $username ;;
  2) read -p "Enter the name of the group : " group
     groupadd $group
     grep $group /etc/group ;;
  3) read -p "Enter the name of the group : " groupuser
     groupadd $groupuser
     read -p " Enter Your Username : " usergroup
     useradd -g $groupuser -s /bin/bash -c "$usergroup" -m $usergroup
      ;;
  esac
   ;;
4) echo "Bye" ; exit 1 ;;
*) echo " Invalid option " ; sleep 1 ;;

esac
