# musicmoods
Using Spotify data to visualize trends in listening according to moods

## Comparing a user's Spotify playlists based on mood
Spotify provides several variables about each track on its API (key, tempo, danceability, etc.). In order to measure the "mood" of a track, I plotted two variables against each other on a scatterplot: energy (x axis) and valence (y axis). Energy is a measure of exactly what it sounds like for a track. Valence is a measure of the overall positivity of the song. 

Using the ggplot2, dplyr, and spotifyr R packages, I was able to compare the different moods of my Spotify playlists. The primary use of this feature is to eliminate any songs that are outliers in the playlist, thus honing in on the particular "mood" of a playlist. Some explanations behind my playlist names/genres: 
* **good vibes project**: happy songs
* **vault.** : sad songs
* **enter the kingdom**: rap and hip hop
* **good morning everyone**: chill R&B/ pop
* **intense study**: movie soundtracks
* **volcano soup**: workout playlist (most tracks have a fairly high energy)
* **echo chamber**: EDM study 
* **candle city**: acoustic guitar 
* **afterglow**: rock/alternative rock


![alt text](https://github.com/koll-mer/musicmoods/blob/master/playlist%20mood%20comparison.png)

In addition, I directly compared my happy and sad playlists to see how much overlap there was.
![alt text](https://github.com/koll-mer/musicmoods/blob/master/happysad.png)

Let's say I wanted to remove some outliers that didn't seem to fit the mood of the overall playlist, like those in that have too high of a valence in **vault.** Using dplyr, I can arrange the songs in **vault.** to see which I should take out. 
```
# A tibble: 188 x 4
   valence energy track_name                        artist_name  
     <dbl>  <dbl> <chr>                             <chr>        
 1   0.796 0.0514 Ether                             Puma Blue    
 2   0.735 0.17   Baby Please                       Black Pool   
 3   0.707 0.437  all the kids are depressed        Jeremy Zucker
 4   0.603 0.473  When You're Ready                 Shawn Mendes 
 5   0.578 0.469  Our House by the Waterfall        Rook1e       
 6   0.575 0.376  Erase                             Omar Apollo  
 7   0.546 0.109  im closing my eyes (feat. shiloh) potsu        
 8   0.544 0.267  Show Me How                       Men I Trust  
 9   0.538 0.43   Idk Love                          Jeremy Zucker
10   0.538 0.505  SAN MARCOS                        BROCKHAMPTON 
# ... with 178 more rows
```
Looks like Ether by Puma Blue is the point in the upper-left-most corner in the plot, so I'll probably take that song out of **vault.**

## General use
This code can be used to compare the moods of Spotify playlists for any user. Users of this code will need to obtain a Spotify Client ID and Secret ID from https://developer.spotify.com/dashboard/ that then can be manually input into the code. The username will also need to be adjusted when running the code for yourself.


