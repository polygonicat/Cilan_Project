package database;

import flixel.FlxState;
import flixel.FlxG;

class DatabaseVariablesProfiles
{
	//-- NPC Identification System
	//-- This system like the conversation is also chapter dependent and it's needed to be separated from each other to avoid confusion.
	//-- npc_id represents the ID itself of the NPC eventhough an NPC might be used on another case you still need to assign a unique ID to it to avoid confusion
	//-- npc_name well...duh!
	//-- npc_gender this variable determines what sound the conversation box will make and it is needed for the sake of having this gender thing in the info
	//-- npc_age well...another duh!
	//-- npc_description this is also related to the court record info aside gender and age
	//-- npc_assets this is where you assign the name of the spritesheet wihch will be used to swap images at
	//-- npc_assets_dimensions is for the preparaion of the dynamic image function of the casemaker but can be useful in some point in here. Formula =  width x height (e.g. 1024x768)
	
	public static var npc_chapter:Array<Dynamic> = new Array();
	public static var npc_id:Array<String> = new Array();
	public static var npc_name:Array<Dynamic> = new Array();
	public static var npc_gender:Array<Dynamic> = new Array();
	public static var npc_age:Array<Dynamic> = new Array();
	public static var npc_description:Array<Dynamic> = new Array();
	public static var npc_assets:Array<String> = new Array();
	public static var npc_potrait_index:Array<Int> = new Array();
	public static var npc_assets_dimensions:Array<Dynamic> = new Array();
	
	public static var npc_index:Int = 0;
	public static var profiles_chapter_index:Int = 0;
}