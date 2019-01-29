#importing libraries
library(spotifyr)
library(tidyr)
library(dplyr)
library(ggplot2)

#getting access to Spotify's API. YOUR_CLIENT-ID_HERE and YOUR_CLIENT_SECRET_HERE need to be individually obtained - see .README
Sys.setenv(SPOTIFY_CLIENT_ID = 'YOUR_CLIENT-ID_HERE')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'YOUR_CLIENT_SECRET_HERE')
access_token <- get_spotify_access_token(client_id =
                                           Sys.getenv('SPOTIFY_CLIENT_ID'), client_secret = Sys.getenv('SPOTIFY_CLIENT_SECRET'))

#get your playlists - enter your Spotify username at YOUR_SPOTIFY_USERNAME_HERE
my_playlists <- get_user_playlists("YOUR_SPOTIFY_USERNAME_HERE")

#getting tracks from your playlists
playlist_tracks <- get_playlist_tracks(my_playlists)

#subsetting relevant information from tracks
allplaylists <- playlist_tracks %>% select(track_name, track_uri, playlist_name, artist_name)
ftrs <- get_track_audio_features(allplaylists)
popu <- get_track_popularity(allplaylists)
ftrspopu <- left_join(ftrs, popu, by = "track_uri")
complete <- left_join(allplaylists, ftrspopu, by = "track_uri")

#playlists mood comparison
ggplot(complete, aes(x = energy, y = valence)) + geom_point() + facet_wrap(~ playlist_name)
