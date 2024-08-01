#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

echo "$($PSQL "SELECT COUNT(*) FROM games WHERE year = 2018;")"

echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games;")"

echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

echo "$($PSQL "SELECT ROUND(AVG(winner_goals + opponent_goals), 2) FROM games;")"

echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id = games.winner_id GROUP BY name ORDER BY SUM(winner_goals) DESC LIMIT 1;")"
