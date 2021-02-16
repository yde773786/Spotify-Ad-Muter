# Spotify Ad Muter
A set of scripts aiming to mute Spotify whenever an advertisement
plays, and unmute it when the advertisement is over automatically.

The scripts make use of the `Spotipy` library to perform web-API calls
and obtain current playing track information. `Pulseaudio` is used to
mute sound ouput from `pid: Spotify`, making it functional against 
Spotify ads from the Desktop Application on any system that uses
`Pulseaudio` as a sound-server.

The script needs to be manually started (An alias to `spotify`
with `spotify; /path/to/script/container.sh` could work).
It will run as long as the Spotify desktop application
is running.

## Requirements
* `python3` + `Spotipy`
* `Pulseaudio`
* `bash`
* Spotify Client ID, Client Secret and Username.

## Execution
Directory path does not affect functionality. Make main
script executable with:

```
chmod +x container.sh
```

Execute script with:

```
./container.sh
```

The requirement of Spotify Client ID and Secret would 
require the user to register for spotify developers and 'create an
app'. Thus, the user would be the end user as well as the client for the 
OAuth2.0 authentiation. This is mildly inconvinient but negates the latency of
having a server in the middle.

Additionally, the scripts do not stop spotify from playing its advertisements,
but simply automates the muting of the ads, which can be done
manually as well. Thus, it should abide by Spotify's terms and conditions.
