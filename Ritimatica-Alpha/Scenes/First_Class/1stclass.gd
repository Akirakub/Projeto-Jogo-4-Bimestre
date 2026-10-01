extends AudioStreamPlayer

var bpm:float
var secPerBeat:float
var lastBeat:float = 0
var nextBeatPosition:float
var song_position:float
var song_position_in_beats:float

signal tempo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempo.emit()
	play()
	stream.set_bpm(100)
	bpm = stream.get_bpm()
	secPerBeat = 60 / bpm
	nextBeatPosition = secPerBeat
	print(playing)
	while playing:
		await get_tree().create_timer(secPerBeat*4).timeout
		tempo.emit()

func _process(_delta) -> void:
	song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
	song_position -= AudioServer.get_output_latency()
	song_position_in_beats = int(floor(song_position/secPerBeat))
