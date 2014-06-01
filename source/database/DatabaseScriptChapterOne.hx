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
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "May 31, 9:00 AM#Striaton Restaurant#Main Hall";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a2";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a2";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "Looks like everything seems fine, it smells like a job well done in the Striaton Restaurant!";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a3";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a3";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Chili";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{flash,1,200,sfx-lightbulb}{animations,chili_normal_talk,false}Yeah I guess it is pretty much the same as usual in the Striaton Gy...{sound,sfx-lightbulb,1,100}{#FF9900,I MEAN} Striaton Restaurant!{animations,chili_normal_laugh,false} Hehehe!{animations,chili_normal_idle,false}";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "effectnext,Normal_Chili";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a4";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a4";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "Erm, Chili I kinda noticed that by now...";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a5";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a5";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cress";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{sound,sfx-lightbulb,1,100}{animations,cress_normal_talk,false}Cilan.{animations,cress_normal_idle,false}";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "effectboth,Normal_Cress";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a6";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a6";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "Oh hey Cress! What's wrong?";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a7";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a7";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cress";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{animations,cress_normal_relief_talk,false}You seem to forgot one important thing that you should have with you.{animations,cress_normal_relief,false}";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a8";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a8";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "Forgot one thing? Hmm...I don't seem to forgot anything, I have done all of the chores around the restaurant and...";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a9";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a9";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{flash,1,200,sfx-lightbulb}...!";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a10";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a10";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cress";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{leftevidence,evidence,1}{animations,cress_normal_relief_talk,false}You forgot your connoisseur badge in your room.You really need to remember to always pin it up on your uniform before leaving your room.{animations,cress_normal_relief,false}";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a11";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a11";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{removescreenevidence}Thank you Cress! I won't forget about it next time so don't worry.";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a12";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a12";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "A Class Badge added to the Court Records!";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "add,1";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a13";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a13";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cilan";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "So yeah..! Back to the subject! Cress why are you looking for me again?";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "a14";
		
		DatabaseVariablesScript.conversation_index++;
		
		DatabaseVariablesScript.script_chapter[DatabaseVariablesScript.conversation_index] = DatabaseVariablesScript.conversation_chapter_index;
		DatabaseVariablesScript.script_index[DatabaseVariablesScript.conversation_index] = "a14";
		DatabaseVariablesScript.script_nametag[DatabaseVariablesScript.conversation_index] = "Cress";
		DatabaseVariablesScript.words[DatabaseVariablesScript.conversation_index] = "{sound,sfx-lightbulb,1,100}{animations,cress_normal_sad,false}{delay,600}{delay,20}{animations,cress_normal_sad_talk,false}Um....I was wondering, are you still thinking about that {#FF9900,career}?{animations,cress_normal_sad,false}";
		DatabaseVariablesScript.gender[DatabaseVariablesScript.conversation_index] = "M";
		DatabaseVariablesScript.text_speed[DatabaseVariablesScript.conversation_index] = 20;
		DatabaseVariablesScript.npc_transition[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.inventory_update[DatabaseVariablesScript.conversation_index] = "";
		DatabaseVariablesScript.next_script[DatabaseVariablesScript.conversation_index] = "stop";
		
		DatabaseVariablesScript.conversation_index++;
	}
}
