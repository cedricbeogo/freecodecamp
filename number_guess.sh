#!/bin/bash
echo -e "\nEnter your username:"
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER=$(($RANDOM % 1000 + 1))

read USERNAME
NAME=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -z $NAME ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 0, 0)")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read SECRET_NUMBER
NUMBER_OF_GUESS=1

while [[ ! $SECRET_NUMBER =~ ^[0-9]+ ]]
do
  echo -e "\nThat is not an integer, guess again:"
  read SECRET_NUMBER
  NUMBER_OF_GUESS=$(( NUMBER_OF_GUESS + 1 ))
done


while [[ $SECRET_NUMBER != $NUMBER ]]
do
  if [[ $SECRET_NUMBER > $NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read SECRET_NUMBER
    NUMBER_OF_GUESS=$(( NUMBER_OF_GUESS + 1 ))
  else 
    echo -e "\nIt's higher than that, guess again:"
    read SECRET_NUMBER
    NUMBER_OF_GUESS=$(( NUMBER_OF_GUESS + 1 ))
  fi
done

echo -e "\nYou guessed it in $NUMBER_OF_GUESS tries. The secret number was $NUMBER. Nice job!"

if [[ $NUMBER_OF_GUESS < $BEST_GAME || $BEST_GAME == 0 ]]
then
  BEST_GAME=$NUMBER_OF_GUESS
fi

INSERT_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = $(( GAMES_PLAYED + 1 )) WHERE username = '$USERNAME'")
INSERT_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $BEST_GAME WHERE username = '$USERNAME'")
