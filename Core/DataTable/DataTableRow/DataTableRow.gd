@tool
class_name DataTableRow extends Resource

@export var data_table: DataTable:
	set(value):
		data_table = value
		if data_table:
			data = data_table.data.values()[0]
			row = data_table.data.keys()[0]
		else:
			row = ""
		
		notify_property_list_changed()

var row: String

var data: Variant:
	get:
		if data_table:
			return data_table.data[row]
		return null

func _get_property_list() -> Array[Dictionary]:
	var properties: Array[Dictionary]
	var hint_string: String = ""
	
	if data_table:
		hint_string = ",".join(data_table.data.keys())
	
	properties.append(
		{
			"name": "row",
			"type": TYPE_STRING,
			"usage": PROPERTY_USAGE_DEFAULT,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": hint_string
		}
	)
	
	return properties
