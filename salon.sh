#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#echo "$($PSQL "TRUNCATE TABLE customers, appointments")"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU() {
  #get all services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME 
    do
      if [[ $SERVICE_ID =~ ^[0-9] ]]
      then
        echo "$SERVICE_ID) $NAME"
      fi
    done
  read SERVICE_ID_SELECTED  

  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
  SELECTED_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  fi

  if [[ (! $SERVICE_ID_SELECTED =~ ^[0-9]+$) || -z $SELECTED_SERVICE ]]
  then
    MAIN_MENU "\nI could not find that service. What would you like today?"
  else

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    PHONE=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $PHONE ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

    if [[ $INSERT_APPOINTMENT_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
    fi
  fi
}

MAIN_MENU


