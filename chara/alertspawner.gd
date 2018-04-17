extends Area2D


var minion
onready var timer = get_node("Timer")

func _ready():
	timer.connect("timeout", self, "spawnEnemy")

func spawnEnemy():
	
	var spawnee = minion.instance()
	get_parent().add_child(spawnee)
	spawnee.global_position = self.global_position
	self.visible = bool(0)