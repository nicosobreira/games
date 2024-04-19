#!/usr/bin/env bash

GAMES="$HOME/Games/games"
# Update github files
echo "Updating local with remote"
cd $GAMES
git pull origin

# Verify is retroarch is installed via apt or flatpak
if command -v retroarch >/dev/null; then
	execu=$(which retroarch)
	exist=true
elif command -v flatpak run org.libretro.RetroArch >/dev/null; then
	execu=flatpak run org.libretro.RetroArch
	exist=true
else
	exist=false
fi
# If don't exist exit
[[ $exist == "false" ]] && echo "retroarch isn't install" && exit 0
# Else
echo "Running \"$execu\""
$execu

# After run retroarch
echo "Push alterations"
git push origin
