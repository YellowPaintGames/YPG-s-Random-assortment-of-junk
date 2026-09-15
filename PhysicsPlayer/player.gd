extends RigidBody2D

@export var MoveForce := 5000.0
@export var AirMoveForce := 2500.0

@onready var FootLeft: RigidBody2D = $FootLeft
@onready var FootRight: RigidBody2D = $FootRight
@onready var GroundCheckLeft: Area2D = $FootLeft/GroundCheck
@onready var GroundCheckRight: Area2D = $FootRight/GroundCheck

@export var UprightStrength := 20.0   # how hard it corrects (spring)
@export var UprightDamping := 4.0     # how much it resists oscillation (damper)
@export var MaxUprightTorque := 4000.0
@export var LimbStrength := 6.0      # keep noticeably weaker than torso
@export var LimbDamping := 1.5
@export var LimbMaxTorque := 400.0

@export var Jumpforce:= 500

var CurrentFoot: RigidBody2D

@onready var Limbs: Array[RigidBody2D] = [$Head,FootLeft,FootRight,$HandLeft,$HandRight]
var LimbRestOffsets := {}

func _ready() -> void:
	CurrentFoot = FootLeft
	for limb in Limbs:
		LimbRestOffsets[limb] = wrapf(limb.rotation - rotation, -PI, PI)


func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis(
		"PlayerMoveLeft",
		"PlayerMoveRight"
	)

	if direction != 0:
		if is_grounded():
			CurrentFoot.apply_central_force(
				Vector2(direction * MoveForce, 100)
			)
		else:
			CurrentFoot.apply_central_force(
				Vector2(direction * AirMoveForce, 0)
			)
	if Input.is_action_just_pressed("ui_accept") and is_grounded():
		apply_central_impulse(Vector2(0, -Jumpforce))
		gravity_scale=0.1
		await get_tree().create_timer(0.5).timeout
		gravity_scale=0.5
	if is_grounded():
		apply_stand_up_torque()
		for limb in Limbs:
			apply_limb_self_right(limb)
	$Head.rotation_degrees=clamp($Head.rotation_degrees,-90,90)

func apply_stand_up_torque() -> void:
	# angle_diff: how far rotation is from 0 (upright), wrapped to -PI..PI
	var angle_diff := wrapf(-rotation, -PI, PI)
	var torque := (angle_diff * UprightStrength) - (angular_velocity * UprightDamping)
	torque = clamp(torque, -MaxUprightTorque, MaxUprightTorque)
	apply_torque(torque)


func _on_foot_left_body_entered(_body: Node) -> void:
	CurrentFoot = FootLeft

func _on_foot_right_body_entered(_body: Node) -> void:
	CurrentFoot = FootRight

func is_grounded() -> bool:
	return not GroundCheckLeft.get_overlapping_bodies().is_empty() \
		or not GroundCheckRight.get_overlapping_bodies().is_empty()

func apply_limb_self_right(limb: RigidBody2D) -> void:
	var target = rotation + LimbRestOffsets[limb]
	var diff := wrapf(target - limb.rotation, -PI, PI)
	var torque := (diff * LimbStrength) - (limb.angular_velocity * LimbDamping)
	torque = clamp(torque, -LimbMaxTorque, LimbMaxTorque)
	limb.apply_torque(torque)
