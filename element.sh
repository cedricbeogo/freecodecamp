#! /bin/bash

if [[ ! $1 ]]
then
echo "Please provide an element as an argument."
else
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


  #get elements
  if [[ $1 =~ (^[0-9]+) ]]
  then
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$1'")
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$1'")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$1'")
  else
  NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$1' OR name = '$1'")
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1' OR name = '$1'")
  fi
  
  #get properties
  if [[ -z $NAME ]]
  then
    echo "I could not find that element in the database."
  else
  TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
  MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$ATOMIC_NUMBER'")
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER'")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$ATOMIC_NUMBER'")

  echo "The element with atomic number $(echo "$ATOMIC_NUMBER" | sed -r 's/^ *| *$//g') is $(echo "$NAME"  | sed -r 's/^ *| *$//g') ($(echo "$SYMBOL" | sed -r 's/^ *| *$//g')). It's a $(echo "$TYPE" | sed -r 's/^ *| *$//g'), with a mass of $(echo "$MASS" | sed -r 's/^ *| *$//g') amu. $(echo "$NAME" | sed -r 's/^ *| *$//g') has a melting point of $(echo "$MELTING_POINT" | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo "$BOILING_POINT" | sed -r 's/^ *| *$//g') celsius."
  fi

fi
