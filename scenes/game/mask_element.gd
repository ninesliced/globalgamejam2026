class_name MaskElement
extends Node2D

@export var base_texture : Texture2D

@onready var _sprite_2D : Sprite2D = $Sprite2D


var left_click_just_pressed : bool
enum MaskElementState {
	Following, Placed, Icon
}

@export var state : MaskElementState = MaskElementState.Icon

var size : float = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_sprite_2D.texture = base_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale = Vector2(size, size)
	
	match state:
		MaskElementState.Following :
			var vector = get_viewport().get_mouse_position()
			position = vector
			if left_click_just_pressed : 
				
				state = MaskElementState.Placed
			
			
func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		left_click_just_pressed = event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT
		
