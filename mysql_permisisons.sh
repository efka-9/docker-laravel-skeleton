#!/bin/bash

if [ $(stat -c "%a" "mysql") != "777" ] #todo fix this shit
then
    sudo chmod -R 777 mysql
fi

