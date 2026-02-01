class_name MaskElement
extends Node2D

@export var base_texture : Texture2D:
	set(value):
		base_texture = value
		$Sprite2D.texture = value

enum ElementColor {
	RED,
	YELLOW,
	BLUE,
	PINK,
}
@export var color: ElementColor 

enum ElementType {
	EYE,
	MOUTH, 
	HORN, 
	ACCESSORY, 
	HAIR, 
	NOSE,
}
@export var element_types: Array[ElementType] = []



@onready var _sprite_2D : Sprite2D = $Sprite2D

#var left_click_just_pressed : bool
enum MaskElementState {
	Following, Placed, Icon
}

@export var state : MaskElementState = MaskElementState.Following

var size : float = 1
var squash: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	pouic()

func init_element(_param: MaskElementParam):
	base_texture = _param.base_texture
	color = _param.color
	element_types = _param.element_types

func pouic():
	squash = 1.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.scale.x = 1/squash
	$Sprite2D.scale.y = squash
	squash = move_toward(squash, 1.0, delta*10)
	
	match state:
		MaskElementState.Following :
			var old_pos = Vector2(position)
			var vector = lerp(position,get_viewport().get_mouse_position(), 0.5)
			position = vector
			
			if GlobalMaskElement.left_click_just_pressed and GlobalMaskElement.is_in_area(position) and MaskManager.has_mask : 
				pouic()
				GlobalMaskElement.place_element()
				state = MaskElementState.Placed

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		squash = 2.0

func destroy_self() :
	queue_free()

func rotate_sprite(_angle : float):
	_sprite_2D.rotation_degrees += _angle
