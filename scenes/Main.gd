extends Node2D

# Tank Fighter - Main Game Scene
# This is the entry point for the game

const MAX_PLAYERS := 4
var players = []

func _ready() -> void:
	print("Tank Fighter Game Starting...")
	print("Godot Version: ", Engine.get_version_info().string)
	
	# Initialize game systems
	_initialize_networking()
	_initialize_physics()
	_initialize_input()
	
	# Start in lobby state
	change_state("LOBBY")

func _process(delta: float) -> void:
	# Main game loop
	match current_state:
		"LOBBY":
			_update_lobby(delta)
		"TURN_TRANSITION":
			_update_turn_transition(delta)
		"PLAYER_INPUT":
			_update_player_input(delta)
		"ACTION_RESOLUTION":
			_update_action_resolution(delta)
		"GAME_OVER":
			_update_game_over(delta)

# State machine
var current_state := ""
const STATES := ["LOBBY", "TURN_TRANSITION", "PLAYER_INPUT", "ACTION_RESOLUTION", "GAME_OVER"]

func change_state(new_state: String) -> void:
	if new_state not in STATES:
		push_error("Invalid state: %s" % [new_state])
		return
		
	current_state = new_state
	print("State changed to: %s" % [current_state])
	
	# Call state enter function
	call("_enter_%s" % [current_state])

func _enter_LOBBY() -> void:
	print("Entering LOBBY state")
	# Show lobby UI, wait for players to join

func _enter_TURN_TRANSITION() -> void:
	print("Entering TURN_TRANSITION state")
	# Prepare for next player's turn

func _enter_PLAYER_INPUT() -> void:
	print("Entering PLAYER_INPUT state")
	# Enable input for current player

func _enter_ACTION_RESOLUTION() -> void:
	print("Entering ACTION_RESOLUTION state")
	# Resolve actions, apply physics

func _enter_GAME_OVER() -> void:
	print("Entering GAME_OVER state")
	# Show game over screen

# Networking (placeholder)
func _initialize_networking() -> void:
	print("Initializing networking...")
	# In Godot 4.x, we would use ENetMultiplayerPeer or WebRTCPeerConnection
	# For LAN, we'd use ENetMultiplayerPeer for UDP

# Physics (placeholder)
func _initialize_physics() -> void:
	print("Initializing physics...")
	# Godot has built-in 2D physics

# Input (placeholder)
func _initialize_input() -> void:
	print("Initializing input...")
	# Set up input mappings for touch controls

# State update functions (placeholders)
func _update_lobby(delta: float) -> void:
	pass

func _update_turn_transition(delta: float) -> void:
	pass

func _update_player_input(delta: float) -> void:
	pass

func _update_action_resolution(delta: float) -> void:
	pass

func _update_game_over(delta: float) -> void:
	pass