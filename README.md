## Description

The installation allows to remember information (name and description of the scripts), which can be viewed through `commands_list` and `aliases_list` commands.

## Install

:warning: Before installation script remove `~/.bash_aliases` file. 

```
git clone https://github.com/rostegg/useful-scripts.git useful-scripts
cd useful-scripts
./install.sh
```
Use `commands_list` and `aliases_list` commands.

## Add scrips and aliases

### Scripts

Create in script folder file like `script_name.sh`

First line must be [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))

There should be a short description (> 1 line) of the script that you would like to see in `commands_list` output, for example:
```
#   This script work good
#   And another line
#   Usage: script-name args, etc
```

### Aliases

Add alias into `aliases.sh` file between `#<->` and `#>-<` markers.

Alias must look like:
```
#   Description, and bla-bla
#   Usage: alias_name args ....
echo "alias_name() { alias_body }" >> ~/.bash_aliases
```
#### OR
```
#   Description, and bla-bla
#   Usage: alias_name args ....
echo "alias alias_name='alias_body'" >> ~/.bash_aliases 
```

Description must be > 1 line
