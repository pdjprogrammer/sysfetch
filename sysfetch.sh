#!/bin/bash

# set src directory
src=$(dirname "$(readlink -f "$0")")

# pull in functions and code based on system
source "$src/assets/functions.sh"
sys=$(uname)
if is $sys "Darwin" ; then
	source "$src/darwin.sh"
elif is $sys "Linux" ; then
	source "$src/linux.sh"
elif is $sys "BSD" ; then
	source "$src/bsd.sh"
elif is $sys "WSL" ; then
	source "$src/wsl.sh"
fi

# colors
nc='\033[0m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
purple='\033[1;35m'
cyan='\033[1;36m'

# write value
write ${purple}"$user"${nc}@${yellow}"$hostname"${nc}
write ${blue}uptime${nc} "$uptime"
write ${cyan}kernel${nc} "$kernel"
write ${yellow}distro${nc} "$distro" ${red}arch${nc} "$arch"
write ${green}term${nc} "$term" ${green}shell${nc} "$shell"
write ${red}de/wm${nc} "$de_wm" ${blue}theme${nc} "$theme"
write ${purple}pkgs${nc} "$pkgs" "$pkgs2"
write ${blue}cpu${nc} "$cpu ${red}$max_cpu${nc}${yellow}@${nc}${green}$cur_cpu${nc} GHz"
write ${cyan}gpu${nc} "$gpu"
write ${green}mobo${nc} "$mobo"
write ${yellow}disk${nc} "${green}$cur_dis${nc}${yellow}/${nc}${red}$max_dis${nc} MiB ${green}$dis_per${nc}%"
write ${red}ram${nc} "${green}$cur_ram${nc}${yellow}/${nc}${red}$max_ram${nc} MiB" ${purple}swap${nc} "${green}$cur_swap${nc}${yellow}/${nc}${red}$max_swap${nc} MiB"

# ascii
source "$src/assets/ascii.sh"