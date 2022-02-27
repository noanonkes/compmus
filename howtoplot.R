tracks90 <- get_playlist_tracks("37i9dQZF1DX186v583rmzp")
features90 <- get_track_audio_features(tracks90$track.id)

tracks10 <- get_playlist_tracks("37i9dQZF1DWSMW5YBCZisa")
features10 <- get_track_audio_features(tracks10$track.id)

tracks15 <- get_playlist_tracks("37i9dQZF1DXcqWbpeXswkc")
features15 <- get_track_audio_features(tracks15$track.id)

features10$year <- 2010
features15$year <- 2010
features90$year <- 1990

tracks10 <- tracks10 %>% mutate(artists.name = map_chr(track.album.artists, function(x) x$name[1]))
tracks15 <- tracks15 %>% mutate(artists.name = map_chr(track.album.artists, function(x) x$name[1]))
tracks90 <- tracks90 %>% mutate(artists.name = map_chr(track.album.artists, function(x) x$name[1]))

features10$artists.name <- tracks10$artists.name
features90$artists.name <- tracks90$artists.name
features15$artists.name <- tracks15$artists.name

features10$track.name <- tracks10$track.name
features90$track.name <- tracks90$track.name
features15$track.name <- tracks15$track.name

features <- rbind(rbind(features90, features10), features15)

ggplot(NULL, aes(x = danceability, y = duration_ms, size = acousticness)) + 
  geom_point(data=features90, aes(color = "'90s")) +
  geom_point(data=features10, aes(color = "'10s")) + theme_gray()

ggplot(features, aes(y = speechiness, x = Year, group = Year)) + 
  geom_boxplot() + theme_gray()

ggplot(NULL, aes(x = tempo)) + 
  geom_histogram(data=features90, aes(color = "'90s"), binwidth=10) +
  geom_histogram(data=features10, aes(color = "'10s"), binwidth=10) + theme_gray()