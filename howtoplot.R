playlist90 <- get_playlist("37i9dQZF1DX186v583rmzp")
tracks90 <- get_playlist_tracks("37i9dQZF1DX186v583rmzp")
features90 <- get_track_audio_features(tracks90$track.id)

tracks10 <- get_playlist_tracks("37i9dQZF1DWSMW5YBCZisa")
features10 <- get_track_audio_features(tracks10$track.id)

tracks15 <- get_playlist_tracks("37i9dQZF1DXcqWbpeXswkc")
features15 <- get_track_audio_features(tracks15$track.id)

features10$Year <- 2010
features90$Year <- 1990
features15$Year <- 2015

features <- rbind(features90, features10)

ggplot(NULL, aes(x = danceability, y = duration_ms, size = acousticness)) + 
  geom_point(data=features90, aes(color = "'90s")) +
  geom_point(data=features10, aes(color = "'10s")) + theme_gray()

ggplot(features, aes(y = speechiness, x = Year, group = Year)) + 
  geom_boxplot() + theme_gray()

ggplot(NULL, aes(x = tempo)) + 
  geom_histogram(data=features90, aes(color = "'90s"), binwidth=10) +
  geom_histogram(data=features10, aes(color = "'10s"), binwidth=10) + theme_gray()