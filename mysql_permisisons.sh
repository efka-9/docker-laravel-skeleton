#!/bin/bash

if [ $(stat -c "%a" "mysql") != "777" ]
then
    sudo chmod -R 777 mysql
fi

