#!/bin/bash

# Create commands list
printf "Creating \e[32mcommads_list\e[0m...\n"
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

# Create aliases list
printf "Creating \e[32maliases_list\e[0m...\n"
echo -e "" > aliases_list

ALIASES_FILE="${PWD}/aliases.sh"

MARKER_START="#<->"
MARKER_START_LINE=$(awk "/${MARKER_START}/{ print NR; exit }" $ALIASES_FILE)

MARKER_STOP="#>-<"
MARKER_STOP_LINE=$(awk "/${MARKER_STOP}/{ print NR; exit }" $ALIASES_FILE)

LINE_COUNTER=1

CURR_ALIAS=""
CURR_DESCRIPTION=""

ECHO_ALIAS_REGEX="s/echo \"alias \(.*\)=.*/\1/"
ECHO_FUNC_REGEX="s/echo \"\(.*\)(.*/\1/"

sed 1d $ALIASES_FILE | while read LINE
do
    LINE_COUNTER=$(($LINE_COUNTER+1))
    # get only text between markers
    if [ "$LINE_COUNTER" -ge $(("$MARKER_STOP_LINE")) ]; then
        break
    fi
    if [ "$LINE_COUNTER" -le $(("$MARKER_START_LINE")) ]; then
        continue
    fi

    if [[ "$LINE" =~ ^# ]] ;
    then
        CURR_DESCRIPTION+="  $LINE\n"
    else
        CURR_ALIAS=$(echo $LINE | sed "$ECHO_ALIAS_REGEX")
        # check for func alias
        if [[ $LINE = $CURR_ALIAS ]]; then
            CURR_ALIAS=$(echo $LINE | sed "$ECHO_FUNC_REGEX")
        fi
        echo -e "\e[32m$CURR_ALIAS\e[0m\n" >> aliases_list
        echo -e "$CURR_DESCRIPTION" >> aliases_list
        CURR_DESCRIPTION=""
        CURR_ALIAS=""
    fi
done

sudo mv -f aliases_list /etc/aliases_list

echo -e "cat /etc/aliases_list" > aliases_list
sudo chmod +x aliases_list
sudo mv -f aliases_list /usr/bin/aliases_list
