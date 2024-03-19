#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ ! -z $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number = $1;")
  else
    RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING (type_id) WHERE symbol = '$1' OR name = '$1';")
  fi
  
  if [[ ! -z $RESULT ]]
  then
    read atomic_number BAR name BAR symbol BAR type BAR atomic_mass BAR melting_point_celsius BAR boiling_point_celsius <<< $(echo "$RESULT")
    echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
  else
    echo "I could not find that element in the database."
  fi
else
  echo "Please provide an element as an argument."
fi