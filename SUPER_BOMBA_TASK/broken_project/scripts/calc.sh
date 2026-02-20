#!/usr/bin/env bash

if [[ -z "$1" || -z "$2" ]]; then
  echo "Need two numbers"
  exit 1
fi

sum=$(($1+$2))

echo "Result: $sum"
