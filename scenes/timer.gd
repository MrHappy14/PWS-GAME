extends Panel

var time: float = 0.0
var minutes: int = 0
var second: int = 0
var msec: int = 0


func _process(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	second = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minute.text = "%02d:" %minutes
	$Second.text = "%02d." %second
	$msec.text = "%03d" %msec
	
func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "N02d:02d.03d" % [minutes, second, msec]
