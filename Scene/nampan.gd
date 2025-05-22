extends StaticBody3D

# dragon these
var dragon = false
#kalau waktunya bisa di-drag
var on_play= false
var camera1 = null
enum {KARBO, PROTEIN, SAYUR, BUAH}
var array_makanan=[0,0,0,0]

func buat_makan(makanan:String):
	match makanan:
		"Ayam":
			array_makanan[PROTEIN] = 1
			$"TATANAN NAMPAN/AYAM_007".show()
			$"TATANAN NAMPAN/TEMPE".hide()
		"Tempe":
			array_makanan[PROTEIN] = 2
			$"TATANAN NAMPAN/TEMPE".show()
			$"TATANAN NAMPAN/AYAM_007".hide()
		"Wortel":
			array_makanan[SAYUR] = 1
			$"TATANAN NAMPAN/WORTEL_004".show()
			$"TATANAN NAMPAN/SAYUR BROKOLI_010".hide()
		"Brokoli":
			array_makanan[SAYUR] = 2
			$"TATANAN NAMPAN/SAYUR BROKOLI_010".show()
			$"TATANAN NAMPAN/WORTEL_004".hide()
		"Nasi":
			array_makanan[KARBO] = 1
			$"TATANAN NAMPAN/NASI_002".show()
			$"TATANAN NAMPAN/KARBO KENTAN9_007".hide()
		"Kentang":
			array_makanan[KARBO] = 2
			$"TATANAN NAMPAN/KARBO KENTAN9_007".show()
			$"TATANAN NAMPAN/NASI_002".hide()
		"Semangka":
			array_makanan[BUAH] = 1
			$"TATANAN NAMPAN/SEMAN9KA_002".show()
	

func _process(delta: float) -> void:
	if(dragon):
		var mousepos = get_viewport().get_mouse_position()
		var origin = camera1.project_ray_origin(mousepos)
		var end = camera1.project_ray_normal(mousepos)
		var depth = origin.distance_to(self.global_position)
		var final_pos = origin + end * depth
		self.global_position=final_pos

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if(event.is_action_pressed("MouseClick") and on_play):
		print("AAA")
		dragon = true
		camera1=camera
		
	if(event.is_action_released("MouseClick")):
		dragon=false
		print("lepas")
