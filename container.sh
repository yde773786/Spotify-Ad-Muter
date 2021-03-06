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

while [ -n "$(pidof spotify)"  ]
do
  current=$(python3 track_type.py "$SPOTIPY_USERNAME")

  pacmd list-sink-inputs > temp
  pid=$(python3 spotify_pid.py)

  if [[ "$current" = "ad" ]]
  then
    pacmd set-sink-input-mute $pid true
  else
    pacmd set-sink-input-mute $pid false
  fi

  sleep 1
done