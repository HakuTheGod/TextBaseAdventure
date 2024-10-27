extends Node

class_name Inv

@export var items: Array[String]

func add(item: String) -> void:
	items.push_back(item)
	print(items)

func remove(item: String) -> void:
	for i in items.size():
		if items[i] == str(item):
			items.pop_at(i)
			break

func display():
	var text: String = ""
	for i in items.size():
		if i == items.size() - 1:
			text += items[i] + "\n"
		else:
			text += items[i] + ",\n"
	return text
