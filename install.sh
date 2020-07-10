#!/bin/bash
SCRIPT_FOLDER="${PWD}/scripts"

for file in $SCRIPT_FOLDER/*; do sudo chmod +x $file; done

printf "Moving scripts to \e[32m/usr/bin\e[0m folder...\n"

sudo cp --verbose "${SCRIPT_FOLDER}"/* /usr/bin

. aliases.sh
. list.sh