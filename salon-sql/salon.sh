#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~ Salon De Jan ~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")

  if [[ -z $AVAILABLE_SERVICES ]]
  then
    echo -e "There are no available services yet."
  else
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

    echo -e "\nTo schedule an appointment select a service:"

    read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "This service does not exist"
    else
      SERVICE_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      if [[ -z $SERVICE_SELECTED ]]
      then
        MAIN_MENU "This service does not exist"
      else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        if [[ -z $CUSTOMER_NAME ]]
        then
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi

        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        echo -e "\nEnter a time for the appointment:"
        read SERVICE_TIME

        INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_SELECTED, '$SERVICE_TIME')")

        APPOINTMENT_SERVICE_NAME=$($PSQL "SELECT name FROM appointments INNER JOIN services USING(service_id) WHERE service_id=$SERVICE_SELECTED")

        echo -e "\nI have put you down for a $APPOINTMENT_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

      fi
    fi
  fi
}

MAIN_MENU "Welcome to My Salon, how can I help you?"
