extends Node

class_name  pc

@export var player: Array[String]

var playerCharacter = {
	str = 10,
	spd = 10,
	lck = 20,
	intel = 10,
	fth = 10,
	hp = 50,
	mp = 20
}

func getStr():
	return playerCharacter.str

func setStr(str: int) -> void:
	playerCharacter.str = str

func getSpd():
	return playerCharacter.spd

func setSpd(spd: int) -> void:
	playerCharacter.spd = spd
	
func getInt():
	return playerCharacter.intel

func setInt(intel: int) -> void:
	playerCharacter.intel = intel
	
func getLck():
	return playerCharacter.lck

func setLck(lck: int) -> void:
	playerCharacter.lck = lck
	
func getFth():
	return playerCharacter.fth

func setFth(fth: int) -> void:
	playerCharacter.fth = fth

func getHp():
	return playerCharacter.hp

func setHp(hp: int) -> void:
	playerCharacter.hp = hp

func getMp():
	return playerCharacter.mp

func setMp(mp: int) -> void:
	playerCharacter.mp = mp
