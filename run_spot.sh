Help(){
    echo -e "\n\t GUIDELINES\t\n"
    echo -e "--how to use-- \t\n"
    echo -e "spot --<flag> <file/directory name> \n"
    echo -e "--flag-- \n"
    echo -e "-d will search ONLY directories"
    echo -e "-f will search ONLY files \n"
    echo -e "--informations-- \n"
    echo -e "type spot -i in order to show informations"
}

Info() {
    echo -e "\n\t INFORMATIONS \t\n"
    echo -e "this script/alias will help you to search all the files/directory on your file system."
    echo -e "Every file that has been found will be listed with a number on the left, if you type that number, you will  directly go to that file's directory"
}

while getopts ":h:d:f:i" option; do
   case $option in
    i)
        Info
        exit;;
    h) # display Help
        Help
        exit;;
    \?)
        echo "invalid option, check the guidelines"
        Help
        exit;;
    d)
        arg=$2
        . /home/alessandro/scripts/SpotterCommand_bashAlias/SpotterDirectoryScript.sh ${arg}
        ;;
    f)
        arg=$2
        . /home/alessandro/scripts/SpotterCommand_bashAlias/SpotterCommandScript.sh ${arg}
        ;;
   esac
done

