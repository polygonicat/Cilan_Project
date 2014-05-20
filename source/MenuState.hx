package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxState;
import flash.text.Font;
import flixel.text.FlxText;
import flixel.util.FlxMath;
import flixel.tweens.FlxTween;
import flixel.plugin.MouseEventManager;
import openfl.Assets;

//-- Sprites
import sprites.LowerGUI;
import sprites.UpperGUI;
import scripts.StartingPoint;
import scripts.ScriptCourtRecords;
import scripts.ScriptMouseChecks;

//-- Database Initiations
import database.DatabaseAnimationNPC;
import database.DatabaseAnimationCourtRecords;
import database.DatabaseEvidenceChapterOne;
import database.DatabaseProfilesChapterOne;
import database.DatabaseScriptChapterOne;

//-- Database Variables
import database.DatabaseVariablesScript;
import database.DatabaseVariablesProfiles;
import database.DatabaseVariablesEvidence;

//-- Scripts
import scripts.ScriptConversations;
import scripts.ScriptConversationsSpecialEvents;

@:font("assets/fonts/Ace-Attorney.ttf") class AAFont extends Font { }

class MenuState extends FlxState
{
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xffffffff;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		//FlxG.mouse.show()
		#end
		
		//-- Add The Functionalities
		ScriptConversations.conversation_timer_add();
		
		//-- Add The Visual Elements
		Variables.elements_lower_gui = new LowerGUI();
		add(Variables.elements_lower_gui);
		
		Variables.elements_upper_gui = new UpperGUI();
		add(Variables.elements_upper_gui);
		
		//-- Parsing Databases
		DatabaseEvidenceChapterOne.evidence();
		DatabaseAnimationCourtRecords.animation_evidence();
		
		DatabaseProfilesChapterOne.profiles();
		DatabaseAnimationCourtRecords.animation_profile();
		
		DatabaseScriptChapterOne.conversations();
		ScriptConversations.update_database_inventory();
		
		//-- Clickers!
		MouseEventManager.add(LowerGUI.button_main_conversation, null, ScriptMouseChecks.main_button, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_court_record, null, ScriptMouseChecks.court_record_button, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_evidence, null, ScriptMouseChecks.button_evidence, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_profiles, null, ScriptMouseChecks.button_profiles, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_back, null, ScriptMouseChecks.button_back, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_big_left_scroll, null, ScriptMouseChecks.button_big_left, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_big_right_scroll, null, ScriptMouseChecks.button_big_right, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_container_left, null, ScriptMouseChecks.button_small_left, null, null, false, true, true);
		MouseEventManager.add(LowerGUI.button_container_right, null, ScriptMouseChecks.button_small_right, null, null, false, true, true);
		
		super.create();
		
		//-- This is the fire starter!
		StartingPoint.start_now();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
	override public function update():Void
	{
		super.update();
		
		//-- Mouse Coordinates Check: Essential for a lot of things.
		Variables.mouse_x = FlxG.mouse.x;
		Variables.mouse_y = FlxG.mouse.y;
		
		//-- Emergency Mouse Clickers (Mouse Event Manager is a dick)
		if (ScriptMouseChecks.halt_mouse_trigger == 2 && UpperGUI.main_conversation_evidence_obtain.x == 0 && ScriptConversations.conversation_timer.running == false)
		{
			if (FlxG.mouse.justPressed)
			{
				UpperGUI.main_conversation_box.animation.play("invisible");
				UpperGUI.main_conversation_text.text = "";
				UpperGUI.main_conversation_text.htmlText = "";
				FlxTween.tween(UpperGUI.main_conversation_evidence_obtain, { x: -445 }, 0.2 );
				FlxTween.tween(UpperGUI.conversation_evidence_show_nametag, { x: -292 }, 0.2 );
				FlxTween.tween(UpperGUI.conversation_evidence_show_info, { x: -290 }, 0.2 );
				FlxTween.linearMotion(LowerGUI.container_name_tag, ScriptCourtRecords.container_name_tag_active_x, ScriptCourtRecords.container_name_tag_active_y, ScriptCourtRecords.container_name_tag_inactive_x, ScriptCourtRecords.container_name_tag_inactive_y, 0.2, true);
				
				LowerGUI.court_record_evidence_potrait_01_a.alive = false;
				LowerGUI.court_record_evidence_potrait_02_a.alive = false;
				LowerGUI.court_record_evidence_potrait_03_a.alive = false;
				LowerGUI.court_record_evidence_potrait_04_a.alive = false;
				LowerGUI.court_record_evidence_potrait_05_a.alive = false;
				LowerGUI.court_record_evidence_potrait_06_a.alive = false;
				LowerGUI.court_record_evidence_potrait_07_a.alive = false;
				LowerGUI.court_record_evidence_potrait_08_a.alive = false;
				
				LowerGUI.court_record_evidence_potrait_01_a.exists = false;
				LowerGUI.court_record_evidence_potrait_02_a.exists = false;
				LowerGUI.court_record_evidence_potrait_03_a.exists = false;
				LowerGUI.court_record_evidence_potrait_04_a.exists = false;
				LowerGUI.court_record_evidence_potrait_05_a.exists = false;
				LowerGUI.court_record_evidence_potrait_06_a.exists = false;
				LowerGUI.court_record_evidence_potrait_07_a.exists = false;
				LowerGUI.court_record_evidence_potrait_08_a.exists = false;
				
				LowerGUI.court_record_over_potrait_01.alive = false;
				LowerGUI.court_record_over_potrait_02.alive = false;
				LowerGUI.court_record_over_potrait_03.alive = false;
				LowerGUI.court_record_over_potrait_04.alive = false;
				LowerGUI.court_record_over_potrait_05.alive = false;
				LowerGUI.court_record_over_potrait_06.alive = false;
				LowerGUI.court_record_over_potrait_07.alive = false;
				LowerGUI.court_record_over_potrait_08.alive = false;
				
				LowerGUI.court_record_over_potrait_01.exists = false;
				LowerGUI.court_record_over_potrait_02.exists = false;
				LowerGUI.court_record_over_potrait_03.exists = false;
				LowerGUI.court_record_over_potrait_04.exists = false;
				LowerGUI.court_record_over_potrait_05.exists = false;
				LowerGUI.court_record_over_potrait_06.exists = false;
				LowerGUI.court_record_over_potrait_07.exists = false;
				LowerGUI.court_record_over_potrait_08.exists = false;
				
				LowerGUI.container_court_record_01.animation.play("disappear");
			}
		}
		else if (LowerGUI.container_court_record_01.alive == true && LowerGUI.container_more_detail_box.alive == false)
		{
			ScriptMouseChecks.potrait_over_01();
			ScriptMouseChecks.potrait_over_02();
			ScriptMouseChecks.potrait_over_03();
			ScriptMouseChecks.potrait_over_04();
			ScriptMouseChecks.potrait_over_05();
			ScriptMouseChecks.potrait_over_06();
			ScriptMouseChecks.potrait_over_07();
			ScriptMouseChecks.potrait_over_08();
			
			ScriptMouseChecks.court_record_nametag_protection_check = 0;
		}
		
		
		
		if (FlxG.keys.justPressed.A)
		{
			FlxG.log.add(ScriptCourtRecords.evidence_inventory);
		}
	}
}