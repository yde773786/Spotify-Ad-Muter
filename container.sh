#!bin/bash

echo Enter Client ID
read -r cli_id
export SPOTIPY_CLIENT_ID="$cli_id"

echo Enter Client Secret
read -r cli_sc
export SPOTIPY_CLIENT_SECRET="$cli_sc"

export SPOTIPY_REDIRECT_URI="http://localhost:8888/callback"

echo Enter Username
read -r username
python3 main.py "$username"