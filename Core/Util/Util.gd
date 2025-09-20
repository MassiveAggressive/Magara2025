@tool

extends Node

enum EItemPrimaryType 
{
	WEAPON,
	GENERATOR,
	ARTIFACT
}

var ItemPrimaryTypeData: Dictionary[EItemPrimaryType, String] = {
	EItemPrimaryType.WEAPON: "Weapon",
	EItemPrimaryType.GENERATOR: "Generator",
	EItemPrimaryType.ARTIFACT: "Artifact"
}

enum EItemSecondaryType 
{
	PRIMARYWEAPON,
	SECONDARYWEAPON,
	SHIELDGENERATOR,
	SPEEDGENERATOR,
	ARTIFACT
}

var ItemSecondaryTypeData: Dictionary[EItemSecondaryType, String] = {
	EItemSecondaryType.PRIMARYWEAPON: "Primary Weapon",
	EItemSecondaryType.SECONDARYWEAPON: "Secondary Weapon",
	EItemSecondaryType.SHIELDGENERATOR: "Shield Generator",
	EItemSecondaryType.SPEEDGENERATOR: "Speed Generator",
	EItemSecondaryType.ARTIFACT: "Artifact"
	
}

enum EItemLocation
{
	UNASSIGNED,
	ININVENTORY,
	INEQUIPMENT
}

enum EOperator
{
	ADD,
	MULTIPLY,
	DIVIDE,
	OVERRIDE
}

enum EDurationPolicy
{
	INSTANT,
	DURATION,
	INFINITE
}

enum EInputKey
{
	MOVERIGHT,
	MOVELEFT,
	JUMP,
	DASH
}
