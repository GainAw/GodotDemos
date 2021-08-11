extends Node
tool

var intBase = 0
var intRange = 0
var floatBase = 0
var floatRange = 0
var resourceBase = null
enum testEnum {Thing1, Thing2, Thing3}
var enumVar = 0
var dictionaryBase = {}
var nodePathArray = []

func _get_property_list():
	var properties = []
	#This is the Category displayed in the Editor, a category will "consume" every entry after up until another category is found
	properties.append(
		#name, type, usage are nessasary for the editor to "see" this as a property
		{
			"name" : "Test Category",
			"type" : TYPE_NIL,
			"usage" : PROPERTY_USAGE_CATEGORY
		}
		)
	properties.append(
		{
			"name" : "intBase",
			"type" : TYPE_INT,
			"usage" : PROPERTY_USAGE_SCRIPT_VARIABLE | PROPERTY_USAGE_EDITOR
		}
		)
	properties.append(
		{
			"name" : "intRange",
			"type" : TYPE_INT,
			"usage" : PROPERTY_USAGE_SCRIPT_VARIABLE | PROPERTY_USAGE_EDITOR,
			#This needs both the hint and hint_string to define how the editor will display and use this property
			"hint" : PROPERTY_HINT_RANGE,
			"hint_string" : "20, 40"
		}
		)
	properties.append(
		#Sub Categories are called Groups by Godot and work simularly to categories but are contained in the parent category
		{
			"name" : "Test Group",
			"type" : TYPE_NIL,
			"usage" : PROPERTY_USAGE_GROUP
		}
		)
	properties.append(
		{
			"name" : "resourceBase",
			#For Things that Inherit from Object type can't be set to NIL
			"type" : TYPE_OBJECT,
			"usage" : PROPERTY_USAGE_SCRIPT_VARIABLE | PROPERTY_USAGE_EDITOR,
			#hint is used to specify what kind of object loosely
			"hint" : PROPERTY_HINT_RESOURCE_TYPE,
			#hint_string is used to specify the specific object (but can be left blank for any resource)
			"hint_string" : "ImageTexture"
		}
		)
		#enums are rather tricky as the keys need to be strings
	properties.append(
		{
			"name" : "enumVar",
			#type Needs to be set to int as it is setting the index of the dictionary as if it was an array
			"type" : TYPE_INT,
			#This is the only property up untill this point that will save when the scene is saved
			"usage" : PROPERTY_USAGE_SCRIPT_VARIABLE | PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_STORAGE,
			"hint" : PROPERTY_HINT_ENUM,
			#hint_string needs to be the keys of the base enum in a string separated by commas
			"hint_string" : "Thing1, Thing2, Thing3"
		}
	)
	properties.append(
		#Sub Categories are called Groups by Godot and work simularly to categories but are contained in the parent category
		{
			"name" : "Another Group",
			"type" : TYPE_NIL,
			"usage" : PROPERTY_USAGE_GROUP
		}
	)
	properties.append(
		{
			"name" : "dictionaryBase",
			"type" : TYPE_DICTIONARY,
			#Usage default also saves on scene save and is a shory hand of putting all 3 usage flags (see line 69)
			"usage" : PROPERTY_USAGE_DEFAULT
		}
	)
	"""
	For things like arrays of NodePaths is where this system is very bad and falls apart,
		as it is rather unintuitive on how they work at times.
		For a look up on what you need for these cases you can look at your current version's github page
		and find the variant.h file and the object.h file
		example for 3.3 can be found at the links
		https://github.com/godotengine/godot/blob/3.3/core/variant.h
		https://github.com/godotengine/godot/blob/3.3/core/object.h
	"""
	properties.append(
		{
			"name" : "nodePathArray",
			"type" : TYPE_ARRAY,
			"usage" : PROPERTY_USAGE_DEFAULT,
			"hint_string" : "15/25:NodePath"
		}
	)
		
		#Second category to show how what I mean by line 14
	properties.append(
		{
			"name" : "Floats only",
			"type" : TYPE_NIL,
			"usage" : PROPERTY_USAGE_CATEGORY
		}
	)
	properties.append(
		{
			"name" : "floatBase",
			"type" : TYPE_REAL,
			"usage" : PROPERTY_USAGE_SCRIPT_VARIABLE | PROPERTY_USAGE_EDITOR
		}
		)
	properties.append(
		{
			"name" : "floatRange",
			"type" : TYPE_REAL,
			"usage" : PROPERTY_USAGE_SCRIPT_VARIABLE | PROPERTY_USAGE_EDITOR,
			#This needs both the hint and hint_string to define how the editor will display and use this property
			"hint" : PROPERTY_HINT_RANGE,
			"hint_string" : "20, 40"
		}
		)
	return properties
