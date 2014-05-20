package scripts;


import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.tweens.FlxTween.CompleteCallback;
import flixel.input.mouse.FlxMouse;
import flixel.input.mouse.FlxMouseButton;
import flixel.plugin.MouseEventManager;
import openfl.Assets;

//-- Sprites
import sprites.LowerGUI;
import sprites.UpperGUI;
import scripts.StartingPoint;

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

class ScriptMouseChecks extends FlxState
{
	public static var court_record_nametag_protection_check:Int = 0;
	
	//-- Halt Mouse Checks
	public static var halt_mouse_trigger:Int = 0;
	
	public static function main_button(sprite:FlxSprite):Void
	{
		if (LowerGUI.arrow_main_conversation.alive == true && LowerGUI.button_main_conversation.animation.finished == true && halt_mouse_trigger != 1)
		{
			LowerGUI.button_main_conversation.animation.play("pressed");
			
			var start_script_counter:Int = 0;
			
			while (ScriptConversations.current_chapter_script_index[start_script_counter] != null)
			{
				if (ScriptConversations.current_chapter_script_index[start_script_counter] == ScriptConversations.current_next_script)
				{
					ScriptConversations.conversation_timer_start(ScriptConversations.current_chapter_script_nametag[start_script_counter], ScriptConversations.current_chapter_gender[start_script_counter], ScriptConversations.current_chapter_words[start_script_counter], ScriptConversations.current_chapter_text_speed[start_script_counter],ScriptConversations.current_chapter_npc_transition[start_script_counter],ScriptConversations.current_chapter_inventory_update[start_script_counter]);
					ScriptConversations.current_next_script = ScriptConversations.current_chapter_next_script[start_script_counter];
					break;
				}
				
				start_script_counter++;
			}
		}
	}
	
	public static function inventory_update_resume():Void
	{	
		var start_script_counter:Int = 0;
		
		while (ScriptConversations.current_chapter_script_index[start_script_counter] != null)
		{
			if (ScriptConversations.current_chapter_script_index[start_script_counter] == ScriptConversations.current_next_script)
			{
				ScriptConversations.conversation_timer_start(ScriptConversations.current_chapter_script_nametag[start_script_counter], ScriptConversations.current_chapter_gender[start_script_counter], ScriptConversations.current_chapter_words[start_script_counter], ScriptConversations.current_chapter_text_speed[start_script_counter],ScriptConversations.current_chapter_npc_transition[start_script_counter],ScriptConversations.current_chapter_inventory_update[start_script_counter]);
				ScriptConversations.current_next_script = ScriptConversations.current_chapter_next_script[start_script_counter];
				break;
			}
			
			start_script_counter++;
		}
	}
	
	public static function court_record_button(sprite:FlxSprite):Void
	{
		if (LowerGUI.button_court_record.y == ScriptCourtRecords.upper_buttons_active_y && LowerGUI.arrow_main_conversation.alive == true && halt_mouse_trigger != 1)
		{
			halt_mouse_trigger = 1;
			
			LowerGUI.button_court_record.animation.play("pressed");
			LowerGUI.arrow_main_conversation.alive = false;
			LowerGUI.arrow_main_conversation.exists = false;
			LowerGUI.button_profiles.alive = true;
			LowerGUI.button_profiles.exists = true;
			LowerGUI.button_main_conversation.animation.play("disappear");
			FlxTween.linearMotion(LowerGUI.button_court_record, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true, { complete:court_record_button_ascend  } );
		}
	}
	
	private static function court_record_button_ascend(tween:FlxTween):Void
	{
		LowerGUI.container_court_record_01.alive = true;
		LowerGUI.container_court_record_01.exists = true;
		
		LowerGUI.button_big_left_scroll.alive = true;
		LowerGUI.button_big_left_scroll.exists = true;
		
		LowerGUI.button_big_right_scroll.alive = true;
		LowerGUI.button_big_right_scroll.exists = true;
		
		LowerGUI.button_back.alive = true;
		LowerGUI.button_back.exists = true;
		
		LowerGUI.border_normal_upper.alive = false;
		LowerGUI.border_normal_upper.exists = false;
		
		LowerGUI.border_normal_lower.alive = false;
		LowerGUI.border_normal_lower.exists = false;
		
		LowerGUI.border_advance_upper.alive = true;
		LowerGUI.border_advance_upper.exists = true;
		
		LowerGUI.border_default_advance_upper.alive = false;
		LowerGUI.border_default_advance_upper.exists = false;
		
		LowerGUI.border_default_advance_lower.alive = true;
		LowerGUI.border_default_advance_lower.exists = true;
		
		LowerGUI.border_tag_evidence.alive = true;
		LowerGUI.border_tag_evidence.exists = true;
		
		LowerGUI.container_name_tag.alive = true;
		LowerGUI.container_name_tag.exists = true;
		
		LowerGUI.container_court_record_01.animation.play("appear");
		
		FlxTween.linearMotion(LowerGUI.button_big_left_scroll, ScriptCourtRecords.button_big_left_inactive_x, ScriptCourtRecords.button_big_left_inactive_y, ScriptCourtRecords.button_big_left_active_x, ScriptCourtRecords.button_big_left_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_big_right_scroll, ScriptCourtRecords.button_big_right_inactive_x, ScriptCourtRecords.button_big_right_inactive_y, ScriptCourtRecords.button_big_right_active_x, ScriptCourtRecords.button_big_right_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_back, ScriptCourtRecords.button_back_inactive_x, ScriptCourtRecords.button_back_inactive_y, ScriptCourtRecords.button_back_active_x, ScriptCourtRecords.button_back_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.container_name_tag, ScriptCourtRecords.container_name_tag_inactive_x, ScriptCourtRecords.container_name_tag_inactive_y, ScriptCourtRecords.container_name_tag_active_x, ScriptCourtRecords.container_name_tag_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.border_tag_evidence, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_profiles, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true);
		
		var tentative_evidence_count:Int = 0;
		ScriptCourtRecords.evidence_max_page = 0;
		
		if (ScriptCourtRecords.evidence_inventory.length > 0 && ScriptCourtRecords.evidence_inventory.length <= 8)
		{
			ScriptCourtRecords.evidence_max_page++;
			ScriptCourtRecords.evidence_current_page = 1;
		}
		else if(ScriptCourtRecords.evidence_inventory.length > 8)
		{
			while (ScriptCourtRecords.evidence_inventory.length > tentative_evidence_count)
			{
				ScriptCourtRecords.evidence_max_page++;
				tentative_evidence_count += 8;
			}
			
			ScriptCourtRecords.evidence_current_page = 1;
		}
		else
		{
			//-- 0 will automatically show nothing
			ScriptCourtRecords.evidence_current_page = 0;
		}
	}
	
	public static function button_evidence(sprite:FlxSprite):Void 
	{
		if (LowerGUI.button_evidence.y ==  ScriptCourtRecords.upper_buttons_active_y && LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.container_image_show_01.alive == true && halt_mouse_trigger != 1)
		{
			LowerGUI.text_more_detail_name_01.text = "";
			LowerGUI.text_more_detail_info_01.text = "";
			LowerGUI.text_more_detail_desc.text = "";
			
			LowerGUI.container_image_show_01.alive = false;
			LowerGUI.container_image_show_01.exists = false;
			
			LowerGUI.button_profiles.animation.play("pressed");
			LowerGUI.more_detail_potrait_evidence_01.animation.play("invisible");
			LowerGUI.more_detail_potrait_profile_01.animation.play("invisible");
			LowerGUI.container_more_detail_01.animation.play("disappear");
			
			FlxTween.linearMotion(LowerGUI.border_tag_profiles, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.button_evidence, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true, { complete:more_details_button_profile_descend  } );
		}
		else if (LowerGUI.button_evidence.y ==  ScriptCourtRecords.upper_buttons_active_y && LowerGUI.container_court_record_01.animation.finished == true && halt_mouse_trigger != 1)
		{
			halt_mouse_trigger = 1;
			
			LowerGUI.arrow_head_left.alive = false;
			LowerGUI.arrow_head_left.exists = false;
			
			LowerGUI.arrow_head_right.alive = false;
			LowerGUI.arrow_head_right.exists = false;
			
			LowerGUI.button_evidence.animation.play("pressed");
			LowerGUI.container_court_record_01.animation.play("disappear");
			
			FlxTween.linearMotion(LowerGUI.border_tag_profiles, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.button_evidence, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true, { complete:profiles_button_descend  } );
			
			LowerGUI.court_record_profile_potrait_01_a.alive = false;
			LowerGUI.court_record_profile_potrait_02_a.alive = false;
			LowerGUI.court_record_profile_potrait_03_a.alive = false;
			LowerGUI.court_record_profile_potrait_04_a.alive = false;
			LowerGUI.court_record_profile_potrait_05_a.alive = false;
			LowerGUI.court_record_profile_potrait_06_a.alive = false;
			LowerGUI.court_record_profile_potrait_07_a.alive = false;
			LowerGUI.court_record_profile_potrait_08_a.alive = false;
			
			LowerGUI.court_record_profile_potrait_01_a.exists = false;
			LowerGUI.court_record_profile_potrait_02_a.exists = false;
			LowerGUI.court_record_profile_potrait_03_a.exists = false;
			LowerGUI.court_record_profile_potrait_04_a.exists = false;
			LowerGUI.court_record_profile_potrait_05_a.exists = false;
			LowerGUI.court_record_profile_potrait_06_a.exists = false;
			LowerGUI.court_record_profile_potrait_07_a.exists = false;
			LowerGUI.court_record_profile_potrait_08_a.exists = false;
			
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
			
			LowerGUI.text_court_record_nametag.alive = false;
			LowerGUI.text_court_record_nametag.exists = false;
		}
	}
	
	public static function button_profiles(sprite:FlxSprite):Void 
	{
		if (LowerGUI.button_profiles.y ==  ScriptCourtRecords.upper_buttons_active_y && LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.container_image_show_01.alive == true && halt_mouse_trigger != 1)
		{
			halt_mouse_trigger = 1;
			
			LowerGUI.text_more_detail_name_01.text = "";
			LowerGUI.text_more_detail_info_01.text = "";
			LowerGUI.text_more_detail_desc.text = "";
			
			LowerGUI.container_image_show_01.alive = false;
			LowerGUI.container_image_show_01.exists = false;
			
			LowerGUI.button_profiles.animation.play("pressed");
			LowerGUI.more_detail_potrait_evidence_01.animation.play("invisible");
			LowerGUI.more_detail_potrait_profile_01.animation.play("invisible");
			LowerGUI.container_more_detail_01.animation.play("disappear");
			
			FlxTween.linearMotion(LowerGUI.border_tag_evidence, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.button_profiles, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true, { complete:more_details_button_evidence_descend } );
		}
		else if (LowerGUI.button_profiles.y ==  ScriptCourtRecords.upper_buttons_active_y && LowerGUI.container_court_record_01.animation.finished == true && halt_mouse_trigger != 1)
		{
			halt_mouse_trigger = 1;
			
			LowerGUI.arrow_head_left.alive = false;
			LowerGUI.arrow_head_left.exists = false;
			
			LowerGUI.arrow_head_right.alive = false;
			LowerGUI.arrow_head_right.exists = false;
			
			LowerGUI.button_profiles.animation.play("pressed");
			LowerGUI.container_court_record_01.animation.play("disappear");
			
			FlxTween.linearMotion(LowerGUI.border_tag_evidence, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.button_profiles, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true, { complete:evidence_button_descend  } );
			
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
			
			LowerGUI.text_court_record_nametag.alive = false;
			LowerGUI.text_court_record_nametag.exists = false;
		}
	}
	
	public static function evidence_button_descend(tween:FlxTween):Void
	{
		LowerGUI.button_profiles.alive = false;
		LowerGUI.button_profiles.exists = false;
		
		LowerGUI.border_tag_profiles.alive = true;
		LowerGUI.border_tag_profiles.exists = true;
		
		LowerGUI.button_evidence.alive = true;
		LowerGUI.button_evidence.exists = true;
		
		LowerGUI.border_tag_evidence.alive = false;
		LowerGUI.border_tag_evidence.exists = false;
		
		LowerGUI.container_court_record_01.animation.play("appear");
		
		FlxTween.linearMotion(LowerGUI.border_tag_profiles , ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_evidence, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true);
		
		var tentative_profiles_count:Int = 0;
		ScriptCourtRecords.profile_max_page = 0;
		
		if (ScriptCourtRecords.profile_inventory.length > 0 && ScriptCourtRecords.profile_inventory.length <= 8)
		{
			ScriptCourtRecords.profile_max_page++;
			ScriptCourtRecords.profile_current_page = 1;
		}
		else if(ScriptCourtRecords.profile_inventory.length > 8)
		{
			while (ScriptCourtRecords.profile_inventory.length > tentative_profiles_count)
			{
				ScriptCourtRecords.profile_max_page++;
				tentative_profiles_count += 8;
			}
			
			ScriptCourtRecords.profile_current_page = 1;
		}
		else
		{
			//-- 0 will automatically show nothing
			ScriptCourtRecords.profile_current_page = 0;
		}
	}
	
	public static function profiles_button_descend(tween:FlxTween):Void
	{
		LowerGUI.button_profiles.alive = true;
		LowerGUI.button_profiles.exists = true;
		
		LowerGUI.border_tag_profiles.alive = false;
		LowerGUI.border_tag_profiles.exists = false;
		
		LowerGUI.button_evidence.alive = false;
		LowerGUI.button_evidence.exists = false;
		
		LowerGUI.border_tag_evidence.alive = true;
		LowerGUI.border_tag_evidence.exists = true;
		
		LowerGUI.container_court_record_01.animation.play("appear");
		
		FlxTween.linearMotion(LowerGUI.border_tag_evidence, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_profiles, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true);
		
		var tentative_evidence_count:Int = 0;
		ScriptCourtRecords.evidence_max_page = 0;
		
		if (ScriptCourtRecords.evidence_inventory.length > 0 && ScriptCourtRecords.evidence_inventory.length <= 8)
		{
			ScriptCourtRecords.evidence_max_page++;
			ScriptCourtRecords.evidence_current_page = 1;
		}
		else if(ScriptCourtRecords.evidence_inventory.length > 8)
		{
			while (ScriptCourtRecords.evidence_inventory.length > tentative_evidence_count)
			{
				ScriptCourtRecords.evidence_max_page++;
				tentative_evidence_count += 8;
			}
			
			ScriptCourtRecords.evidence_current_page = 1;
		}
		else
		{
			//-- 0 will automatically show nothing
			ScriptCourtRecords.evidence_current_page = 0;
		}
	}
	
	public static function button_back(sprite:FlxSprite):Void 
	{
		if (LowerGUI.container_more_detail_01.alive == true && halt_mouse_trigger != 1)
		{
			LowerGUI.button_back.animation.play("pressed");
			
			LowerGUI.container_court_record_01.alive = true;
			LowerGUI.container_court_record_01.exists = true;
			
			LowerGUI.container_court_record_01.animation.play("idle");
			
			LowerGUI.container_name_tag.alive = true;
			LowerGUI.container_name_tag.exists = true;
			
			LowerGUI.text_court_record_nametag.alive = true;
			LowerGUI.text_court_record_nametag.exists = true;
			
			LowerGUI.court_record_over_potrait_01.alive = true;
			LowerGUI.court_record_over_potrait_02.alive = true;
			LowerGUI.court_record_over_potrait_03.alive = true;
			LowerGUI.court_record_over_potrait_04.alive = true;
			LowerGUI.court_record_over_potrait_05.alive = true;
			LowerGUI.court_record_over_potrait_06.alive = true;
			LowerGUI.court_record_over_potrait_07.alive = true;
			LowerGUI.court_record_over_potrait_08.alive = true;
			
			LowerGUI.court_record_over_potrait_01.exists = true;
			LowerGUI.court_record_over_potrait_02.exists = true;
			LowerGUI.court_record_over_potrait_03.exists = true;
			LowerGUI.court_record_over_potrait_04.exists = true;
			LowerGUI.court_record_over_potrait_05.exists = true;
			LowerGUI.court_record_over_potrait_06.exists = true;
			LowerGUI.court_record_over_potrait_07.exists = true;
			LowerGUI.court_record_over_potrait_08.exists = true;
			
			LowerGUI.arrow_head_left.alive = false;
			LowerGUI.arrow_head_left.exists = false;
			
			LowerGUI.arrow_head_right.alive = false;
			LowerGUI.arrow_head_right.exists = false;
			
			LowerGUI.arrow_head_left.y = 499;
			LowerGUI.arrow_head_right.y = 499;
			
			ScriptCourtRecords.retract_more_content_part_01();
		}
		else if (ScriptConversations.current_next_script != "investigation" && halt_mouse_trigger != 1)
		{
			LowerGUI.button_back.animation.play("pressed");
			
			if (LowerGUI.button_evidence.y ==  ScriptCourtRecords.upper_buttons_active_y && LowerGUI.container_court_record_01.animation.finished == true)
			{
				FlxTween.linearMotion(LowerGUI.border_tag_profiles, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, 0.1, true);
				FlxTween.linearMotion(LowerGUI.button_evidence, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true);
			}
			else if (LowerGUI.button_profiles.y ==  ScriptCourtRecords.upper_buttons_active_y && LowerGUI.container_court_record_01.animation.finished == true)
			{
				FlxTween.linearMotion(LowerGUI.border_tag_evidence, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, 0.1, true);
				FlxTween.linearMotion(LowerGUI.button_profiles, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, 0.1, true);
			}
			
			LowerGUI.container_court_record_01.animation.play("disappear");
			FlxTween.linearMotion(LowerGUI.button_big_left_scroll, ScriptCourtRecords.button_big_left_active_x, ScriptCourtRecords.button_big_left_active_y, ScriptCourtRecords.button_big_left_inactive_x, ScriptCourtRecords.button_big_left_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.button_big_right_scroll, ScriptCourtRecords.button_big_right_active_x, ScriptCourtRecords.button_big_right_active_y, ScriptCourtRecords.button_big_right_inactive_x, ScriptCourtRecords.button_big_right_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.button_back, ScriptCourtRecords.button_back_active_x, ScriptCourtRecords.button_back_active_y, ScriptCourtRecords.button_back_inactive_x, ScriptCourtRecords.button_back_inactive_y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.container_name_tag, ScriptCourtRecords.container_name_tag_active_x, ScriptCourtRecords.container_name_tag_active_y, ScriptCourtRecords.container_name_tag_inactive_x, ScriptCourtRecords.container_name_tag_inactive_y, 0.1, true, { complete:back_to_main_convo } );
			
			LowerGUI.arrow_head_left.alive = false;
			LowerGUI.arrow_head_left.exists = false;
			
			LowerGUI.arrow_head_right.alive = false;
			LowerGUI.arrow_head_right.exists = false;
			
			LowerGUI.court_record_profile_potrait_01_a.alive = false;
			LowerGUI.court_record_profile_potrait_02_a.alive = false;
			LowerGUI.court_record_profile_potrait_03_a.alive = false;
			LowerGUI.court_record_profile_potrait_04_a.alive = false;
			LowerGUI.court_record_profile_potrait_05_a.alive = false;
			LowerGUI.court_record_profile_potrait_06_a.alive = false;
			LowerGUI.court_record_profile_potrait_07_a.alive = false;
			LowerGUI.court_record_profile_potrait_08_a.alive = false;
			
			LowerGUI.court_record_profile_potrait_01_a.exists = false;
			LowerGUI.court_record_profile_potrait_02_a.exists = false;
			LowerGUI.court_record_profile_potrait_03_a.exists = false;
			LowerGUI.court_record_profile_potrait_04_a.exists = false;
			LowerGUI.court_record_profile_potrait_05_a.exists = false;
			LowerGUI.court_record_profile_potrait_06_a.exists = false;
			LowerGUI.court_record_profile_potrait_07_a.exists = false;
			LowerGUI.court_record_profile_potrait_08_a.exists = false;
			
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
			
			LowerGUI.text_court_record_nametag.alive = false;
			LowerGUI.text_court_record_nametag.exists = false;
		}
	}
	
	public static function back_to_main_convo(tween:FlxTween):Void 
	{
		LowerGUI.button_main_conversation.animation.play("appear");
		
		LowerGUI.container_court_record_01.alive = false;
		LowerGUI.container_court_record_01.exists = false;
		
		LowerGUI.button_big_left_scroll.alive = false;
		LowerGUI.button_big_left_scroll.exists = false;
		
		LowerGUI.button_big_right_scroll.alive = false;
		LowerGUI.button_big_right_scroll.exists = false;
		
		LowerGUI.button_back.alive = false;
		LowerGUI.button_back.exists = false;
		
		LowerGUI.border_normal_upper.alive = false;
		LowerGUI.border_normal_upper.exists = false;
		
		LowerGUI.border_normal_lower.alive = false;
		LowerGUI.border_normal_lower.exists = false;
		
		LowerGUI.border_advance_upper.alive = false;
		LowerGUI.border_advance_upper.exists = false;
		
		LowerGUI.border_default_advance_upper.alive = true;
		LowerGUI.border_default_advance_upper.exists = true;
		
		LowerGUI.border_default_advance_lower.alive = false;
		LowerGUI.border_default_advance_lower.exists = false;
		
		LowerGUI.border_tag_evidence.alive = false;
		LowerGUI.border_tag_evidence.exists = false;
		
		LowerGUI.container_name_tag.alive = false;
		LowerGUI.container_name_tag.exists = false;
		
		FlxTween.linearMotion(LowerGUI.button_court_record, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true );
		
		ScriptCourtRecords.evidence_current_page = 1;
		ScriptCourtRecords.profile_current_page = 1;
	}
	
	public static function potrait_over_01():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 64 && Variables.mouse_y >= 443 && Variables.mouse_x <= 130 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 8;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_01.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 64 && Variables.mouse_y >= 443 && Variables.mouse_x <= 130 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 8;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_01.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_01.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_02():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 148 && Variables.mouse_y >= 443 && Variables.mouse_x <= 214 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 7;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_02.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 148 && Variables.mouse_y >= 443 && Variables.mouse_x <= 214 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 7;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_02.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_02.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_03():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 231 && Variables.mouse_y >= 443 && Variables.mouse_x <= 297 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 6;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_03.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 231 && Variables.mouse_y >= 443 && Variables.mouse_x <= 297 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 6;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_03.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_03.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_04():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 315 && Variables.mouse_y >= 443 && Variables.mouse_x <= 381 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 5;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_04.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 315 && Variables.mouse_y >= 443 && Variables.mouse_x <= 381 && Variables.mouse_y <= 509 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 5;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_04.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_04.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_05():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 64 && Variables.mouse_y >= 528 && Variables.mouse_x <= 130 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 4;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_05.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 64 && Variables.mouse_y >= 528 && Variables.mouse_x <= 130 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 4;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_05.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_05.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_06():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 148 && Variables.mouse_y >= 528 && Variables.mouse_x <= 214 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 3;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_06.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 148 && Variables.mouse_y >= 528 && Variables.mouse_x <= 214 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 3;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_06.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_06.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_07():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 231 && Variables.mouse_y >= 528 && Variables.mouse_x <= 297 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 2;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_07.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 231 && Variables.mouse_y >= 528 && Variables.mouse_x <= 297 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 2;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_07.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_07.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
		}
	}
	
	public static function potrait_over_08():Void
	{
		if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_evidence.alive == true && Variables.mouse_x >= 315 && Variables.mouse_y >= 528 && Variables.mouse_x <= 381 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 1;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_08.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesEvidence.item_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]];
					ScriptCourtRecords.inventory_current_evidence_index = evidence_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.container_court_record_01.animation.finished == true && LowerGUI.border_tag_profiles.alive == true && Variables.mouse_x >= 315 && Variables.mouse_y >= 528 && Variables.mouse_x <= 381 && Variables.mouse_y <= 594 && halt_mouse_trigger != 1)
		{
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 1;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				court_record_nametag_protection_check = 1;
				LowerGUI.court_record_over_potrait_08.animation.play("over");
				LowerGUI.text_court_record_nametag.text = DatabaseVariablesProfiles.npc_name[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
				
				if (FlxG.mouse.justPressed)
				{
					ScriptCourtRecords.current_picked_profiles = DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]];
					ScriptCourtRecords.inventory_current_profile_index = profile_tentative_content_index;
					ScriptCourtRecords.show_more_content_part_01();
				}
			}
		}
		else if (LowerGUI.border_advance_upper.alive == true && LowerGUI.container_court_record_01.animation.finished == true)
		{
			LowerGUI.court_record_over_potrait_08.animation.play("idle");
			
			if (court_record_nametag_protection_check == 0)
			{
				LowerGUI.text_court_record_nametag.text = "Select an item";
			}
			
		}
	}
	
	public static function button_big_left(sprite:FlxSprite):Void
	{
		if (LowerGUI.arrow_head_left.alive == true && LowerGUI.button_big_left_scroll.alive == true && halt_mouse_trigger != 1)
		{
			LowerGUI.button_big_left_scroll.animation.play("pressed");
			
			if (LowerGUI.border_tag_evidence.alive == true)
			{
				if (ScriptCourtRecords.evidence_current_page > 1 )
				{
					ScriptCourtRecords.evidence_current_page--;
				}
				else
				{
					ScriptCourtRecords.evidence_current_page = ScriptCourtRecords.evidence_max_page;
				}
				ScriptCourtRecords.court_record_hit_left_evidence();
			}
			else if (LowerGUI.border_tag_profiles.alive == true)
			{
				if (ScriptCourtRecords.profile_current_page > 1 )
				{
					ScriptCourtRecords.profile_current_page--;
				}
				else
				{
					ScriptCourtRecords.profile_current_page = ScriptCourtRecords.profile_max_page;
				}
				
				ScriptCourtRecords.court_record_hit_left_profile();
			}
		}
	}
	
	public static function button_big_right(sprite:FlxSprite):Void
	{
		if (LowerGUI.arrow_head_right.alive == true && LowerGUI.button_big_right_scroll.alive == true && halt_mouse_trigger != 1)
		{
			LowerGUI.button_big_right_scroll.animation.play("pressed");
			
			if (LowerGUI.border_tag_evidence.alive == true)
			{
				if (ScriptCourtRecords.evidence_current_page == ScriptCourtRecords.evidence_max_page )
				{
					ScriptCourtRecords.evidence_current_page = 1;
				}
				else
				{
					ScriptCourtRecords.evidence_current_page++;
				}
				
				ScriptCourtRecords.court_record_hit_right_evidence();
			}
			else if (LowerGUI.border_tag_profiles.alive == true)
			{
				if (ScriptCourtRecords.profile_current_page == ScriptCourtRecords.profile_max_page )
				{
					ScriptCourtRecords.profile_current_page = 1;
				}
				else
				{
					ScriptCourtRecords.profile_current_page++;
				}
				
				ScriptCourtRecords.court_record_hit_right_profile();
			}
		}
	}
	
	public static function button_small_left(sprite:FlxSprite):Void
	{
		if (LowerGUI.arrow_head_left.alive == true && LowerGUI.button_container_left.alive == true && halt_mouse_trigger != 1)
		{
			LowerGUI.button_container_left.animation.play("pressed");
			
			if (LowerGUI.border_tag_evidence.alive == true)
			{
				if(ScriptCourtRecords.inventory_current_evidence_index == 0)
				{
					//-- Determining last value on the evidence inventory array
					var last_item_evidence:Int = ScriptCourtRecords.evidence_inventory.length - 1;
					ScriptCourtRecords.inventory_current_evidence_index = last_item_evidence;
				}
				else
				{
					ScriptCourtRecords.inventory_current_evidence_index--;
				}
			}
			else if (LowerGUI.border_tag_profiles.alive == true)
			{
				if (ScriptCourtRecords.inventory_current_profile_index == 0)
				{
					//-- Determining last value on the evidence inventory array
					var last_item_profile:Int = ScriptCourtRecords.profile_inventory.length - 1;
					ScriptCourtRecords.inventory_current_profile_index = last_item_profile;
				}
				else
				{
					ScriptCourtRecords.inventory_current_profile_index--;
				}
			}
			
			ScriptCourtRecords.next_more_detail_left();
		}
	}
	
	public static function button_small_right(sprite:FlxSprite):Void
	{
		if (LowerGUI.arrow_head_right.alive == true && LowerGUI.button_container_right.alive == true && halt_mouse_trigger != 1)
		{
			LowerGUI.button_container_right.animation.play("pressed");
			
			if (LowerGUI.border_tag_evidence.alive == true)
			{
				var last_item_evidence:Int = ScriptCourtRecords.evidence_inventory.length - 1;
				
				if (ScriptCourtRecords.inventory_current_evidence_index == last_item_evidence)
				{
					ScriptCourtRecords.inventory_current_evidence_index = 0;
				}
				else
				{
					ScriptCourtRecords.inventory_current_evidence_index++;
				}
			}
			else if (LowerGUI.border_tag_profiles.alive == true)
			{
				var last_item_profile:Int = ScriptCourtRecords.profile_inventory.length - 1;
				
				if (ScriptCourtRecords.inventory_current_profile_index == last_item_profile)
				{
					ScriptCourtRecords.inventory_current_profile_index = 0;
				}
				else
				{
					ScriptCourtRecords.inventory_current_profile_index++;
				}
			}
			
			ScriptCourtRecords.next_more_detail_right();
		}
	}
	
	public static function more_details_button_evidence_descend(tween:FlxTween):Void
	{
		LowerGUI.button_profiles.alive = false;
		LowerGUI.button_profiles.exists = false;
		
		LowerGUI.border_tag_profiles.alive = true;
		LowerGUI.border_tag_profiles.exists = true;
		
		LowerGUI.button_evidence.alive = true;
		LowerGUI.button_evidence.exists = true;
		
		LowerGUI.border_tag_evidence.alive = false;
		LowerGUI.border_tag_evidence.exists = false;
		
		FlxTween.linearMotion(LowerGUI.border_tag_profiles , ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_evidence, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true,{complete:just_reset_click});
	}
	
	public static function more_details_button_profile_descend(tween:FlxTween):Void
	{
		LowerGUI.button_profiles.alive = true;
		LowerGUI.button_profiles.exists = true;
		
		LowerGUI.border_tag_profiles.alive = false;
		LowerGUI.border_tag_profiles.exists = false;
		
		LowerGUI.button_evidence.alive = false;
		LowerGUI.button_evidence.exists = false;
		
		LowerGUI.border_tag_evidence.alive = true;
		LowerGUI.border_tag_evidence.exists = true;
		
		FlxTween.linearMotion(LowerGUI.border_tag_evidence, ScriptCourtRecords.border_tag_inactive_x, ScriptCourtRecords.border_tag_inactive_y, ScriptCourtRecords.border_tag_active_x, ScriptCourtRecords.border_tag_active_y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.button_profiles, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true,{complete:just_reset_click});
	}
	
	public static function just_reset_click(tween:FlxTween):Void
	{
	  halt_mouse_trigger = 0;
	}
}