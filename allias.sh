touch ~/.bash_aliases

echo "alias cmall='rnd-commit-all && auto-push'" >> ~/.bash_aliases
echo "alias ext-debug='journalctl /usr/bin/gnome-shell -f'" >> ~/.bash_aliases
echo "pkgex() { ldconfig -p | grep \"\$1\" ; }" >> ~/.bash_aliases
. ~/.bash_aliases
