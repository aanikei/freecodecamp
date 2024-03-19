#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo -e "\nPlease provide an element as an argument.\n"

if [[ ! -z $1 ]]
then
  RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number = $1 OR symbol = '$1' OR name = '$1';")
  read atomic_number BAR name BAR symbol BAR type BAR atomic_mass BAR melting_point_celsius BAR boiling_point_celsius <<< $(echo "$RESULT")
  echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
fi