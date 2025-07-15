#!/usr/bin/env bash

mapfile -t a < <(cliphist list); 
printf "%s\n" "${a[@]}" | jq -R . | jq -s .
