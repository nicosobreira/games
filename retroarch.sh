#!/usr/bin/env bash

# Update github files
echo "Updating local"
cd ~/Games/games/
git pull origin

# Verify is retroarch is installed via apt or flatpak
if [[ -f /usr/bin/retroarch ]]; then
	execu=$(which retroarch)
	exist=true
elif [[ $(flatpak list | grep -i retroarch) != "" ]]; then
	execu="flatpak run org.libretro.RetroArch"
	exist=true
else
	exist=false
fi
# If don't exist exit
[[ $exist == false ]] && echo "retroarch isn't install" && exit 0
# Else
echo "Running \"$execu\""
$execu

# After run retroarch
echo "Push alterations"
git add .

current_time=$(date +'%d/%m/%y %H:%m:%S')
git commit -m $current_time
git push origin
