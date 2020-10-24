#!/bin/bash

if [ $(stat -c "%a" "src/storage") != "777" ] #todo fix this shit
then
    sudo chmod -R 777 src/storage
fi

