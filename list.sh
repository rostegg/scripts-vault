echo -e "" > commands_list
for ENTRY in "$PWD/scripts"/*
do
    echo -e "\e[32m$(basename $ENTRY)\e[0m\n" >> commands_list
    sed 1d $ENTRY | while read LINE
    do
        if [[ "$LINE" =~ ^# ]] ;
        then
            COMMAND_DESCRIPTION+="  $LINE\n"
        else
            echo -e "$COMMAND_DESCRIPTION" >> commands_list
            COMMAND_DESCRIPTION=""
            break
        fi
    done
done

sudo mv -f commands_list /etc/commands_list

echo -e "cat /etc/commands_list" > commands_list
sudo chmod +x commands_list
sudo mv -f commands_list /usr/bin/commands_list