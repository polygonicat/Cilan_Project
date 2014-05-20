package database;

import flixel.FlxState;

class DatabaseScriptChapterOne  extends FlxState
{	
	public function new() 
	{
		super();
	}
	
	public static function conversations():Void
	{
		//-- Different parts and effects:
		//-- Name Tag: could be any name, empty for the nameless textbox and put in Timestamp.
		//-- Divide the elements by #. (e.g. March 23, 3:00PM#District Court#Courtroom No. 2) this can only have three max.
		//-- Words: can be naturally inputted unless you are dealing with timestamps (see above).
		//-- Text Speed: This is duh. Speed is in milliseconds though.
		//-- NPC Transition: This variable determines what NPC will appear or if there would be a need of removing it.
		//-- Transitions and usage of each:
		//--     - effectprev = Former NPC will be fading from 100 - 0
		//--     - effectnone = Standard shift no transition just immediate swap
		//--     - effectnext = Next NPC will be fading from 0 - 100 alpha
		//--     - effectboth = Previous NPC will fade out and next NPC will fade in
		//--     - notransition = There will be no change at all, whatever NPC is there or if ever the NPC spot is empty it will still remain like that.
		//--     - emptyeffect = Will fade to nothing.
		//--     - emptynoeffect = Will swap to nothing.
		//-- Inventory Update: This variable determines whatever you need to do in order to give, remove, update any evidence.
		//-- Updates and usage of each: (NOTE: It is mandatory to add what kind of item you are going to give)
		//--     - give = give, profile/evidence,COURT RECORD ITEM ID (Gives an item in the inventory)
		//--     - update = update, profile/evidence, OLD COURT RECORD ITEM ID, NEW COURT RECORD ITEM ID (Update an item in the inventory with the old court record itme with the new one then rearrange inventory)
		//--     - remove = remove, profile/evidence, COURT RECORD ITEM ID (This will scan the inventory for the said item and will automatically rearrange the inventory)
		//--  Note for Inventory Updates: NEEDS TO MAKE THE INVENTORY SYSTEM WORK FIRST BEFORE IMPLEMENTING THIS.
		//-- IMPORTANT VARIABLE:
		//-- Script Index: Script index is a variable mainly needed for the complexity of this game. Why? Well at the end of every conversation a certain trogger will activate called next script. It will help the game know where it will go next provided that it got into a certain dialogue or instance in the game. 
		//-- Next Script: There are a lot of functions on next script that will be used in here:
		//--   - Designated Script Index
		//--   - Investigation (Will be done soonish)
		//--   - Options (Will be done soonish)
		//--   - End Game (Will be done soonish)
		
		DatabaseVariablesScript.conversation_chapter_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a1";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Timestamp";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "February 18, 9:00 AM#Striaton Restaurant#Main Hall";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 50;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a2";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a2";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Chili";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{animations,cress_normal_taunt,false}{#ffff00,Welcome to our very first update about the game!}";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 50;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "effectnext,Normal_Cress";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a3";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a3";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "Added another Pokeball in Court Records";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 50;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "add,1";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "stop";
	}
}
