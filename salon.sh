#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

DISPLAY_LIST() {
	if [[ $1 ]]
	then
		echo -e "\n$1"
	fi
	
	AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
	echo "$AVAILABLE_SERVICES" | while read service_id BAR name
    do
      echo "$service_id) $name"
    done
	
	read SERVICE_ID_SELECTED
	SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
	
	if [[ -z $SERVICE_NAME_SELECTED ]]
	then
		DISPLAY_LIST "I could not find that service. What would you like today?"
	else
		echo -e "\nWhat's your phone number?"
		read CUSTOMER_PHONE
		CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
		if [[ -z $CUSTOMER_NAME ]]
		then
			echo -e "\nI don't have a record for that phone number, what's your name?"
			read CUSTOMER_NAME
			INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
		fi
		
		SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME_SELECTED | sed 's/ //')
		CUSTOMER_NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed 's/ //')
		echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $CUSTOMER_NAME_FORMATTED?"
		read SERVICE_TIME
		CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
		INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
		
		echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME_FORMATTED."
	fi
}

DISPLAY_LIST "Welcome to My Salon, how can I help you?\n"
