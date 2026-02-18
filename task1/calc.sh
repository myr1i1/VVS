#!/usr/bin/env bash

if [ $# -ne 2 ]; then
	echo "Error:2 arguments are needed."
	exit 1
	fi


	sum=$(($1+$2))
	echo "Sum $1 and $2 = $sum"
