extends Control
  
signal start
signal stop

var time = 0
var timer_on : bool

func _process(delta):
	if timer_on:
		time += delta
	
	var secs = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60
	
	var time_passed = "%02d : %02d" % [mins, secs]
	
	$time.text = time_passed

func _on_start():
	timer_on = true

func _on_stop():
	timer_on = false
