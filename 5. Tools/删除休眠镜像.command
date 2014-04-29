#!/bin/sh
#set -x


if [ -f "/private/var/vm/sleepimage" ]
    then
        printf "Preventive removal sleepimage file ..."
        sudo rm -rf "/private/var/vm/sleepimage"
        printf "Done.\n"
		echo
fi

