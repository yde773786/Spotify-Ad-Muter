#!/bin/bash

exists=$(grep -c SPOTIPY ~/.bashrc)
if [[ $exists -eq 0 ]]
then
  echo Enter Client ID
  read -r cli_id
  export SPOTIPY_CLIENT_ID="$cli_id"
  echo export SPOTIPY_CLIENT_ID=\"$cli_id\" >> ~/.bashrc

  echo Enter Client Secret
  read -r cli_sc
  export SPOTIPY_CLIENT_SECRET="$cli_sc"
  echo export SPOTIPY_CLIENT_SECRET=\"$cli_sc\" >> ~/.bashrc

  echo Enter Username
  read -r usrnm
  export SPOTIPY_USERNAME="$usrnm"
  echo export SPOTIPY_USERNAME=\"$usrnm\" >> ~/.bashrc

  localhst="http://localhost:8888/callback"
  export SPOTIPY_REDIRECT_URI="$localhst"
  echo export SPOTIPY_REDIRECT_URI=\"$localhst\" >> ~/.bashrc
fi

python3 main.py "$SPOTIPY_USERNAME"