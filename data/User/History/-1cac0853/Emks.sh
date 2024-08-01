#! /bin/bash

#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

# Query to count games in the year 2018
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE year = 2018;")"

# Query to sum all goals in all games
echo "$($PSQL "SELECT SUM(winner_goals) + SUM(opponent_goals) FROM games;")"

# Query to average winner goals with two decimal places
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games;")"

# Query to average total goals (winner_goals + opponent_goals) with two decimal places
echo "$($PSQL "SELECT ROUND(AVG(winner_goals + opponent_goals), 2) FROM games;")"

# Query to find the team with the highest sum of winner goals
echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id = games.winner_id GROUP BY name ORDER BY SUM(winner_goals) DESC LIMIT 1;")"
