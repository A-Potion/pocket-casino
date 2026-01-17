extends Node

signal slot_activate

var player_can_slot = false
	

func _on_slot_machine_player_entered_interact_slot() -> void:
	player_can_slot = true
	print("Player can gamble!!")


func _on_player_player_wanna_slot() -> void:
	if player_can_slot == true:
		print("You can gamble!")
		slot_activate.emit()
	else:
		print("You cannot gamble!")
	pass # Replace with function body.
	
	


func _on_slot_machine_player_left_interact_slot() -> void:
	player_can_slot = false
	print("Player cannot gamble!!")
	pass # Replace with function body.
