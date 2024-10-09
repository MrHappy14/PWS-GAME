extends TabBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$RichTextLabel/control.position.x = -$RichTextLabel/HScrollBar.value
