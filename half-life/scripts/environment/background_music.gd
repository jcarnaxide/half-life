extends AudioStreamPlayer

const song_list = [
	preload("res://assets/sfx/background-music/Sketchbook 2024-10-13.ogg"),
	preload("res://assets/sfx/background-music/Sketchbook 2024-10-14.ogg"),
	preload("res://assets/sfx/background-music/Sketchbook 2024-10-16.ogg"),
	preload("res://assets/sfx/background-music/Sketchbook 2024-12-04.ogg"),
]


func _play_random_song():
	stream = song_list[randi() % len(song_list)]
	play()


func _ready():
	_play_random_song()


func _on_finished():
	_play_random_song()
