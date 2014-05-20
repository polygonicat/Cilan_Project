package database;

import flixel.FlxState;
import flixel.FlxG;

class DatabaseVariablesEvidence
{
	//-- Item ID: is one safe way to identify an evidence without bothering about the name it helps more on keeping it more constant in a way without updating the conversation databas if mispelling occurs.
	//-- Item Name: Well uhhh what can I say more?
	//-- Item Description: Another Duh!!!!
	//-- Item From : Phoenix Wright have this quite small info about where the certain came from this value indicates it.
	//-- Item Frame Name: Another thing that is essential aside the ID this is purposely the way to name the animation thing in the spritesheet. Like I said on ID this is the one thing that will prevent on making confusions and mistakes once the name got corrected or changed.
	
	public static var item_chapter:Array<Dynamic> = new Array();
	public static var item_id:Array<Dynamic> = new Array();
	public static var item_name:Array<Dynamic> = new Array();
	public static var item_description:Array<Dynamic> = new Array();
	public static var item_type:Array<Dynamic> = new Array();
	public static var item_from:Array<Dynamic> = new Array();
	public static var item_animation_name:Array<String> = new Array();
	public static var item_animation_array:Array<Int> = new Array();
	
	public static var item_index:Int = 0;
	public static var evidence_chapter_index:Int = 0;
	
	public function new() 
	{
		
	}
}