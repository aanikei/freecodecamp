#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t -c"

RANDOM_NUMBER=$(($RANDOM % 1001)) 

echo "Enter your username:"
read NAME

RESULT=$($PSQL "SELECT name, games_played, best_game FROM gamers WHERE name = '$NAME'")

if [[ ! -z $RESULT ]]
then
  read gamer_name BAR games_played BAR best_game <<< $(echo "$RESULT")
  echo "Welcome back, $gamer_name! You have played $games_played games, and your best game took $best_game guesses."
else
  echo "Welcome, $NAME! It looks like this is your first time here."
fi

TRIES=0

GET_NUMBER() {
  echo -e "\n$1"
  read INPUT

  ((TRIES++))

  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    GET_NUMBER "That is not an integer, guess again:"
  else
    if [ $INPUT -gt $RANDOM_NUMBER ]
    then
      GET_NUMBER "It's lower than that, guess again:"
    elif [ $INPUT -lt $RANDOM_NUMBER ]
    then
      GET_NUMBER "It's higher than that, guess again:"
    else
      echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      if [[ -z $RESULT ]]
      then
        RESULT=$($PSQL "INSERT INTO gamers (name, games_played, best_game) VALUES ('$NAME', 1, $TRIES)")
      else
        ((games_played++))
        if [[ $TRIES -lt $best_game ]]
        then
          RESULT=$($PSQL "UPDATE gamers SET games_played = $games_played, best_game = $TRIES WHERE name = '$gamer_name'")
        else
          RESULT=$($PSQL "UPDATE gamers SET games_played = $games_played WHERE name = '$gamer_name'")
        fi
      fi      
    fi
  fi
}

GET_NUMBER "Guess the secret number between 1 and 1000:"
