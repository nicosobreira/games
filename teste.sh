#!/usr/bin/env bash

if [[ $(flatpak list | grep -i gzdoom) != "" ]]; then
	echo "flatpak app install"
fi
