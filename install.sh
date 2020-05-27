#!/bin/bash
SCRIPT_FOLDER="${PWD}/scripts"
printf "Moving scripts to \e[32m/usr/bin\e[0m folder...\n"

sudo cp --verbose "${SCRIPT_FOLDER}"/* /usr/bin

. list.sh