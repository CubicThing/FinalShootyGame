extends Area2D

var walker = preload("res://chara/badguy.tscn")
var shooter = preload("res://chara/BadShootyGuy.tscn")
var splitshooter = preload("res://chara/BadSplitShootyGuy.tscn")
var exploder = preload("res://chara/BadExplodeyGuy.tscn")
var spawnalerter = preload("res://chara/alertSpawner.tscn")
onready var timer = get_node("SpawnTimer")
onready var DiffTimer = get_node("Difficulty")
var difficulty = 10

func _ready():
	timer.connect("timeout", self, "on_timeout_complete")
	DiffTimer.connect("timeout", self, "RaiseDiffuclty")
	
func on_timeout_complete():
	
	var spawnPointX = rand_range(64,1728)
	var spawnPointY = rand_range(64,1728)
	
	var whatToSpawn = rand_range(0,difficulty)
	
	
	var spawnee = spawnalerter.instance()
	get_parent().add_child(spawnee)
	spawnee.global_position = Vector2(spawnPointX,spawnPointY)
	
	if whatToSpawn <= 17:
		spawnee.minion = walker
	if (whatToSpawn > 17 and whatToSpawn <= 30):
		spawnee.minion = shooter
	if (whatToSpawn > 30 and whatToSpawn <= 40):
		spawnee.minion = splitshooter
	if (whatToSpawn > 40 and whatToSpawn <= 50):
		spawnee.minion = exploder
	


func RaiseDiffuclty():
	if difficulty <= 50:
		difficulty = difficulty + 1