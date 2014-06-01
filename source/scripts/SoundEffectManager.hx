package scripts;

//-- Flixel Imports
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;

//-- Flash Imports
import flixel.text.FlxText;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.Font;
import flash.text.AntiAliasType;
import flash.text.TextFormatAlign;
import flash.filters.DropShadowFilter;
import openfl.Assets;

import database.DatabaseAnimationNPC;
import scripts.ScriptConversationsSpecialEvents;
import scripts.ScriptConversations;

import sprites.UpperGUI;
import sprites.LowerGUI;

class SoundEffectManager
{
	public function new() 
	{
		
	}
	
	public static function sound_manager_main():Void
	{
		if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-damage1")
		{
			UpperGUI.sfx_damage1.stop();
			UpperGUI.sfx_damage1.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-damage2")
		{
			UpperGUI.sfx_damage2.stop();
			UpperGUI.sfx_damage2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-dink")
		{
			UpperGUI.sfx_dink.stop();
			UpperGUI.sfx_dink.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-dramapound")
		{
			UpperGUI.sfx_dramapound.stop();
			UpperGUI.sfx_dramapound.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-lightbulb")
		{
			UpperGUI.sfx_lightbulb.stop();
			UpperGUI.sfx_lightbulb.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-objection")
		{
			//-- Saved for later use.
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-realization")
		{
			UpperGUI.sfx_realization.stop();
			UpperGUI.sfx_realization.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-shock1")
		{
			UpperGUI.sfx_shock1.stop();
			UpperGUI.sfx_shock1.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-shock2")
		{
			UpperGUI.sfx_shock2.stop();
			UpperGUI.sfx_shock2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-smack")
		{
			UpperGUI.sfx_smack.stop();
			UpperGUI.sfx_smack.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-stab1")
		{
			UpperGUI.sfx_stab1.stop();
			UpperGUI.sfx_stab1.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-stab2")
		{
			UpperGUI.sfx_stab2.stop();
			UpperGUI.sfx_stab2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-thud2")
		{
			UpperGUI.sfx_thud2.stop();
			UpperGUI.sfx_thud2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[1] == "sfx-whack")
		{
			UpperGUI.sfx_whack.stop();
			UpperGUI.sfx_whack.play();
		}
	}
	
	public static function sound_manager_effects():Void
	{
		if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-damage1")
		{
			UpperGUI.sfx_damage1.stop();
			UpperGUI.sfx_damage1.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-damage2")
		{
			UpperGUI.sfx_damage2.stop();
			UpperGUI.sfx_damage2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-dink")
		{
			UpperGUI.sfx_dink.stop();
			UpperGUI.sfx_dink.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-dramapound")
		{
			UpperGUI.sfx_dramapound.stop();
			UpperGUI.sfx_dramapound.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-lightbulb")
		{
			UpperGUI.sfx_lightbulb.stop();
			UpperGUI.sfx_lightbulb.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-objection")
		{
			//-- Saved for later use.
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-realization")
		{
			UpperGUI.sfx_realization.stop();
			UpperGUI.sfx_realization.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-shock1")
		{
			UpperGUI.sfx_shock1.stop();
			UpperGUI.sfx_shock1.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-shock2")
		{
			UpperGUI.sfx_shock2.stop();
			UpperGUI.sfx_shock2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-smack")
		{
			UpperGUI.sfx_smack.stop();
			UpperGUI.sfx_smack.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-stab1")
		{
			UpperGUI.sfx_stab1.stop();
			UpperGUI.sfx_stab1.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-stab2")
		{
			UpperGUI.sfx_stab2.stop();
			UpperGUI.sfx_stab2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-thud2")
		{
			UpperGUI.sfx_thud2.stop();
			UpperGUI.sfx_thud2.play();
		}
		else if (ScriptConversationsSpecialEvents.special_parameters[3] == "sfx-whack")
		{
			UpperGUI.sfx_whack.stop();
			UpperGUI.sfx_whack.play();
		}
	}
}