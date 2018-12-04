extends Node

var min_db = 60
var max_db = 0

var nextSong
var nextSongName
var song
var currentSongName
var timeToStart
var fadeIn2

var songs = { "Dj0" : "res://Musique/SHMUP Theme Dj=0 (loop).ogg", \
			"Dj1" : "res://Musique/SHMUP Theme Dj=1 (loop).ogg", \
			"Dj2" : "res://Musique/SHMUP Theme Dj=2 (loop).ogg", \
			"Dj3" : "res://Musique/SHMUP Theme Dj=3 (loop).ogg", \
			"MainTheme" : "res://Musique/Main Theme Floor It.ogg", \
			"EventTheme" : "res://Musique/EventTheme.ogg", \
			"GameOverTheme" : "res://Musique/GameOverTheme.ogg" }
			
#########################	
	
func playSong(name, fadeOut=0, fadeIn=0, time=0):
	timeToStart = time
	fadeIn2 = fadeIn
	if currentSongName != name:
		if $MusicStream.stream != null:
			print("Musique ", name, " en queue")
			nextSongName = name
			nextSong = songs[name]
			if fadeOut > 0:
				$TimerOut.wait_time = float(fadeOut) / float(min_db)
			else:
				$TimerOut.wait_time = 0.2
			$TimerOut.start()
				
			
		else:
			currentSongName = name
			song = load(songs[name])
			$MusicStream.stream = song
			$MusicStream.play(timeToStart)
			$MusicStream.volume_db = -min_db
			if fadeIn != 0:
				$TimerIn.wait_time = float(fadeIn) / float(min_db)
				$TimerIn.start()
			else:
				$MusicStream.volume_db = 0

func _on_TimerIn_timeout():
	# Toutes les (fadeIn/min_db) le volume diminue de 1
	$MusicStream.volume_db += 1
	if $MusicStream.volume_db >= max_db:
		$TimerIn.stop()
	
func _on_TimerOut_timeout():
	# Toutes les (fadeOut/min_db) le volume diminue de 1
	$MusicStream.volume_db -= 1
	# Si le volume est assez bas...
	if $MusicStream.volume_db <= -min_db:
		# On coupe le son et le timer
		$TimerOut.stop()
		$MusicStream.stop()
		# On load le nextSong
		song = load(nextSong)
		$MusicStream.stream = song
		currentSongName = nextSongName
		# On lance la musique mais pas fort
		$MusicStream.volume_db = -min_db
		$MusicStream.play(timeToStart)
		# Si on veut que ça fadeIn( fadeIn2 > 0)
		if fadeIn2 != 0:
			# On règle le wait_time et on lance le timer
			$TimerIn.wait_time = float(fadeIn2) / float(min_db)
			$TimerIn.start()
		else:
			# Sinon on met direct la musique au bon niveau sonore
			$MusicStream.volume_db = 0
			
func brutalPlaySong(name):
	$MusicStream.stop()
	currentSongName = name
	song = load(songs[name])
	$MusicStream.stream = song
	$MusicStream.play()

