#!/bin/bash

mainprgm() {
    local pw="$1"

    if [[ "${#pw}" -lt 8 ]]; then
        echo "Password is too short. It must be longer than 8 characters - please try again"
        return 1
    elif [[ ! "$pw" =~ [A-Z] ]]; then
        echo "Password must contain 1 capital letter"
        return 1

    elif [[ ! "$pw" =~ [a-z] ]]; then
        echo "Password must contain 1 lowercase letter"
        return 1

    elif [[ ! "$pw" =~ [0-9] ]]; then
        echo "Password must contain 1 number"
        return 1

    elif [[ ! "$pw" =~ [^A-Za-z0-9] ]]; then
        echo "Password must contain 1 symbol"
        return 1
    else
        cracklib-check <<< $pw
        return 0
    fi
}

while true; do
    read -r -s -p "Please enter a new password: " pw
    echo

    if mainprgm "$pw"; then

        echo "Password Accepted"
        break
    fi
done
  