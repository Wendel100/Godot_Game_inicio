extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$controls/Start.grab_focus()
	

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Assets/maps/mundo_01.tscn")


func _on_sair_pressed():
	get_tree().quit()
