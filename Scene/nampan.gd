extends Node3D

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


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if(Input.is_action_pressed("MouseClick")):
		print("AAA")
