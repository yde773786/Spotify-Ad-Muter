import sys
import spotipy
from spotipy.oauth2 import SpotifyOAuth


def main() -> None:
    username = sys.argv[1]
    scope = "user-read-currently-playing"

    auth_manager = SpotifyOAuth(scope=scope, username=username)
    sp = spotipy.Spotify(auth_manager=auth_manager)

    try:
        print(sp.currently_playing()['currently_playing_type'])
    except TypeError:
        pass


if __name__ == '__main__':
    main()
