# musicmoods
Using Spotify data to visualize trends in listening according to moods

## Comparing a user's Spotify playlists based on mood
Spotify provides several variables about each track on its API (key, tempo, danceability, etc.). In order to measure the "mood" of a track, I plotted two variables against each other on a scatterplot: energy (x axis) and valence (y axis). Energy is a measure of exactly what it sounds like for a track. Valence is a measure of the overall positivity of the song. 

Using the ggplot2, dplyr, and spotifyr R packages, I was able to compare the different moods of my Spotify playlists. The primary use of this feature is to eliminate any songs that are outliers in the playlist, thus honing in on the particular "mood" of a playlist. In addition, I directly compared my "happy" and "sad" playlists to see how much overlap there was.

## General use
This code can be used to compare the moods of Spotify playlists for any user. Users of this code will need to obtain a Spotify Client ID and Secret ID from https://developer.spotify.com/dashboard/ that then can be manually input into the code. The username will also need to be adjusted when running the code for yourself.
