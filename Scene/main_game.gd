extends Node3D

@export var scene_makanan: PackedScene
@export var camera_1: Camera3D
@export var camera_2: Camera3D
var makanan

var is_cooking = false

func swapcam():
	CameraTransition.transition_camera3D(camera_1, camera_2)
	var temp = camera_1
	camera_1 = camera_2
	camera_2 = temp
	
func instatiate_makan():
	makanan = scene_makanan.instantiate()
	makanan.position = $NampanSpawn.position
	
	add_child(makanan)
	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(makanan, "position", $Marker3D.position, 1.0)

	# Wait for the tween to complete
	await tween.finished

func menu_input(event: InputEvent, menu: String):
	if(event.is_action_pressed("MouseClick")):
		if(is_cooking):
			makanan.buat_makan(menu)
		elif(!is_cooking):
			is_cooking = true
			instatiate_makan()
			swapcam()
	pass;
	
func _on_ayam_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Ayam")


func _on_brokoli_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Brokoli")


func _on_tempe_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Tempe")


func _on_wortel_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Wortel")


func _on_nasi_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Nasi")


func _on_kentang_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Kentang")


func _on_semangka_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	menu_input(event, "Semangka")
