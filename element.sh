#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo -e "\nPlease provide an element as an argument.\n"

if [[ ! -z $1 ]]
then
    echo "test"
fi