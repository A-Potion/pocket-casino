extends Node2D

signal player_entered_interact_slot
signal player_left_interact_slot
signal slot_activate_within



func _on_interact_area_body_exited(body: Node2D) -> void:
	player_left_interact_slot.emit()
	pass # Replace with function body.


func _on_interact_area_body_entered(body: Node2D) -> void:
	player_entered_interact_slot.emit()
	pass # Replace with function body.


func _on_main_slot_activate() -> void:
	slot_activate_within.emit()
	pass # Replace with function body.
