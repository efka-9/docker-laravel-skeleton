#!/bin/bash

if [ $(stat -c "%a" "mysql") != "777" ]
then
    udo chmod -R 777 mysql
fi

