package scripts;

import  flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

import sprites.LowerGUI;
import sprites.UpperGUI;
import database.DatabaseVariablesScript;
import scripts.ScriptConversations;

class StartingPoint
{
	public static var starting_script:String = "a1";
	
	public function new() 
	{
		
	}
	
	//-- The Starting point is the first executable that the game will run in order to set up the stage to a certain starting scene or a certain starting point of the game.
	
	public static function start_now():Void
	{
		//--  This is a temporary start
		UpperGUI.upper_gui_background_01.alive = true;
		UpperGUI.upper_gui_background_01.exists = true;
		
		LowerGUI.border_normal_upper.alive = true;
		LowerGUI.border_normal_upper.exists = true;
		
		LowerGUI.border_normal_lower.alive = true;
		LowerGUI.border_normal_lower.exists = true;
		
		LowerGUI.lower_gui_background.alive = true;
		LowerGUI.lower_gui_background.exists = true;
		
		LowerGUI.button_main_conversation.alive = true;
		LowerGUI.button_main_conversation.exists = true;
		
		var start_script_counter:Int = 0;
		
		while (ScriptConversations.current_chapter_script_index[start_script_counter] != null)
		{
			if (ScriptConversations.current_chapter_script_index[start_script_counter] == starting_script)
			{
				ScriptConversations.conversation_timer_start(ScriptConversations.current_chapter_script_nametag[start_script_counter], ScriptConversations.current_chapter_gender[start_script_counter], ScriptConversations.current_chapter_words[start_script_counter], ScriptConversations.current_chapter_text_speed[start_script_counter], ScriptConversations.current_chapter_npc_transition[start_script_counter], ScriptConversations.current_chapter_inventory_update[start_script_counter]);
				ScriptConversations.current_next_script = ScriptConversations.current_chapter_next_script[start_script_counter];
			}
			
			start_script_counter++;
		}
	}
	
}