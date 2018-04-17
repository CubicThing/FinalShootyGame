extends KinematicBody2D

var hp = 5
var speed = 700
onready var hitbox = get_node("circle")

func _ready():
	hitbox.connect("body_entered",self,"hitPlayer")
	pass
	
func hit_by_bullet():
	hp = hp - 1
	if hp == 0:
		queue_free()
		
func hitPlayer(body):
	if body.has_method("player_hit"):
		body.call("player_hit")

func _process(delta):
	move_and_slide(((get_parent().playerPos - self.global_position).normalized() + Vector2(0,0)) * speed * (delta*60) ) 
