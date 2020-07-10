#!/bin/bash
rm ~/.bash_aliases
touch ~/.bash_aliases
#<->
#   Restart WiFi service
echo "alias rewifi='nmcli radio wifi off && nmcli radio wifi on'" >> ~/.bash_aliases
#   Random commit and auto-push
echo "alias cmall='rnd-commit-all && auto-push'" >> ~/.bash_aliases
#   Debug info for gnome webextensions
echo "alias ext-debug='journalctl /usr/bin/gnome-shell -f'" >> ~/.bash_aliases
#   Package info
#   Usage: pkgex <package_name>
echo "pkgex() { ldconfig -p | grep \"\$1\" ; }" >> ~/.bash_aliases
#   cd ..
echo "alias ..='cd ..'" >> ~/.bash_aliases
#   cd ../..
echo "alias ...='cd ../..'" >> ~/.bash_aliases
#   cd ../../..
echo "alias ....='cd ../../..'" >> ~/.bash_aliases
#>-<
. ~/.bash_aliases