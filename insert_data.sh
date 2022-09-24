#! /bin/bash


if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
  echo "$($PSQL "TRUNCATE TABLE games, teams")"

  cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do 
  if [[ $YEAR != year ]]
  then
    #Get team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #If not found
    if [[ -z $WINNER_ID ]]
    then
    #Insert winner
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
      then
        echo Insert into teams: $WINNER
      fi
    #Get new winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    if [[ -z $OPPONENT_ID ]]
    then
    #Insert opponent
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == 'INSERT 0 1' ]]
      then
        echo Insert into teams: $OPPONENT
      fi
    #Get new opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

   #Get game id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE round='$ROUND' AND winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID'")
    #If not found
    if [[ -z $GAME_ID ]]
    then
      #Insert game
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
      then
        echo "Inserted into games: '$YEAR' '$ROUND'"
      fi
    fi
    
   

  fi
  
  
  
  done
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

  echo "$($PSQL "TRUNCATE TABLE games, teams")"

  cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do 
  if [[ $YEAR != year ]]
  then
    #Get team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #If not found
    if [[ -z $WINNER_ID ]]
    then
    #Insert winner
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == 'INSERT 0 1' ]]
      then
        echo Insert into teams: $WINNER
      fi
    #Get new winner id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    if [[ -z $OPPONENT_ID ]]
    then
    #Insert opponent
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == 'INSERT 0 1' ]]
      then
        echo Insert into teams: $OPPONENT
      fi
    #Get new opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

   #Get game id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE round='$ROUND' AND winner_id = '$WINNER_ID' AND opponent_id = '$OPPONENT_ID'")
    #If not found
    if [[ -z $GAME_ID ]]
    then
      #Insert game
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
      then
        echo "Inserted into games: '$YEAR' '$ROUND'"
      fi
    fi
    
   

  fi

  done

fi

# Do not change code above this line. Use the PSQL variable above to query your database.
