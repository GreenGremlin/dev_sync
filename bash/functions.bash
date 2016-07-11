#!/bin/bash

listening () {
    if [ -z "$1" ]
    then
        lsof -n -i4TCP:8080 | grep LISTEN
    else
        lsof -n -i4TCP:$1 | grep LISTEN
    fi
}
