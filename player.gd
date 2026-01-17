extends Area2D

signal player_wanna_slot

func _on_character_body_2d_want_to_play_slot() -> void:
	player_wanna_slot.emit()
	pass
