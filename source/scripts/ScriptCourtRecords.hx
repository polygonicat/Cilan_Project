package scripts;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.CompleteCallback;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.util.FlxPoint;

import sprites.UpperGUI;
import sprites.LowerGUI;
import database.DatabaseVariablesEvidence;
import database.DatabaseVariablesProfiles;

import flash.events.Event;
import flash.utils.Timer;
import flash.events.TimerEvent;

class ScriptCourtRecords
{
	public static var upper_buttons_active_x = 309;
	public static var upper_buttons_active_y = 334;
	public static var upper_buttons_inactive_x = 309;
	public static var upper_buttons_inactive_y = 278;
	
	public static var button_back_active_x = 0;
	public static var button_back_active_y = 609;
	public static var button_back_inactive_x = 0;
	public static var button_back_inactive_y = 724;
	
	public static var button_big_left_active_x = 2;
	public static var button_big_left_active_y = 426;
	public static var button_big_left_inactive_x = -27;
	public static var button_big_left_inactive_y = 426;
	
	public static var button_big_right_active_x = 416;
	public static var button_big_right_active_y = 426;
	public static var button_big_right_inactive_x = 472;
	public static var button_big_right_inactive_y = 426;
	
	public static var border_tag_active_x = 0;
	public static var border_tag_active_y = 334;
	public static var border_tag_inactive_x = 0;
	public static var border_tag_inactive_y = 275;
	
	public static var container_name_tag_active_x = 43;
	public static var container_name_tag_active_y = 399;
	public static var container_name_tag_inactive_x = 43;
	public static var container_name_tag_inactive_y = 308;
	
	public static var evidence_inventory:Array<Dynamic> = [0];
	public static var profile_inventory:Array<Dynamic> = [0, 1, 2];
	public static var evidence_current_page:Int = 0;
	public static var profile_current_page:Int = 0;
	public static var evidence_max_page:Int = 0;
	public static var profile_max_page:Int = 0;
	public static var inventory_current_evidence_index:Int = 0;
	public static var inventory_current_profile_index:Int = 0;
	
	//-- Original
	public static var grid_original_x:Int = 0;
	public static var more_details_original_x:Int = 0;
	public static var more_details_border_original_x:Int = 0;
	public static var more_details_name_original_x:Int = 155;
	public static var more_details_info_original_x:Int = 160;
	public static var more_details_potrait_original_x:Int = 36;
	public static var more_details_showframe_original_x:Int = 28;
	public static var potrait_original_x_01:Int = 64;
	public static var potrait_original_x_02:Int = 148;
	public static var potrait_original_x_03:Int = 231;
	public static var potrait_original_x_04:Int = 315;
	public static var potrait_original_x_05:Int = 64;
	public static var potrait_original_x_06:Int = 148;
	public static var potrait_original_x_07:Int = 231;
	public static var potrait_original_x_08:Int = 315;

	//-- Left
	public static var grid_left_x:Int = -445;
	public static var more_details_left_x:Int = -445;
	public static var more_details_border_left_x:Int = -445;
	public static var more_details_name_left_x:Int = -290;
	public static var more_details_info_left_x:Int = -285;
	public static var more_details_potrait_left_x:Int = -417;
	public static var more_details_showframe_left_x:Int = -409;
	public static var potrait_left_x_01:Int = -381;
	public static var potrait_left_x_02:Int = -297;
	public static var potrait_left_x_03:Int = -214;
	public static var potrait_left_x_04:Int = -130;
	public static var potrait_left_x_05:Int = -381;
	public static var potrait_left_x_06:Int = -297;
	public static var potrait_left_x_07:Int = -214;
	public static var potrait_left_x_08:Int = -130;

	//-- Right
	public static var grid_right_x:Int = 445;
	public static var more_details_right_x:Int = 445;
	public static var more_details_border_right_x:Int = 445;
	public static var more_details_name_right_x:Int = 600;
	public static var more_details_info_right_x:Int = 605;
	public static var more_details_potrait_right_x:Int = 489;
	public static var more_details_showframe_right_x:Int = 481;
	public static var potrait_right_x_01:Int = 509;
	public static var potrait_right_x_02:Int = 593;
	public static var potrait_right_x_03:Int = 676;
	public static var potrait_right_x_04:Int = 760;
	public static var potrait_right_x_05:Int = 509;
	public static var potrait_right_x_06:Int = 593;
	public static var potrait_right_x_07:Int = 676;
	public static var potrait_right_x_08:Int = 760;
	
	public static var current_picked_evidence:String = "evidence_pokeball";
	public static var current_picked_profiles:String = "Normal_Cilan";
	
	public static function show_more_content_part_01():Void 
	{
		if (LowerGUI.container_more_detail_01.exists == false)
		{
			UpperGUI.sfx_shooop.play();
			
			LowerGUI.container_more_detail_01.alive = true;
			LowerGUI.container_image_show_01.alive = true;
			LowerGUI.container_more_detail_border_01.alive = true;
			LowerGUI.container_more_detail_box.alive = true;
			
			LowerGUI.container_more_detail_01.exists = true;
			LowerGUI.container_image_show_01.exists = true;
			LowerGUI.container_more_detail_border_01.exists = true;
			LowerGUI.container_more_detail_box.exists = true;
			
			LowerGUI.container_image_show_01.animation.play("invisible");
			
			FlxTween.linearMotion(LowerGUI.container_more_detail_01, more_details_right_x, LowerGUI.container_more_detail_01.y, more_details_original_x, LowerGUI.container_more_detail_01.y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.container_more_detail_border_01, more_details_border_right_x, LowerGUI.container_more_detail_border_01.y, more_details_border_original_x, LowerGUI.container_more_detail_border_01.y, 0.1, true);
			FlxTween.linearMotion(LowerGUI.container_image_show_01, more_details_potrait_right_x, LowerGUI.container_image_show_01.y, more_details_showframe_original_x, LowerGUI.container_image_show_01.y, 0.1, true);
			FlxTween.tween(LowerGUI.container_more_detail_box, {x:10}, 0.1,{complete:show_more_content_part_02});
		}
	}
	
	public static function show_more_content_part_02(tween:FlxTween):Void
	{
		LowerGUI.button_container_left.alive = true;
		LowerGUI.button_container_left.exists = true;
		
		LowerGUI.button_container_right.alive = true;
		LowerGUI.button_container_right.exists = true;
		
		LowerGUI.container_image_show_01.animation.play("appear");
		FlxTween.tween(LowerGUI.container_more_detail_box, {y:550}, 0.1);
		
		LowerGUI.court_record_grid_pic_group.setAll("alive", false);
		LowerGUI.court_record_grid_pic_group.setAll("exists", false);
		
		LowerGUI.court_record_container_group.setAll("alive", false);
		LowerGUI.court_record_container_group.setAll("exists", false);
	}
	
	public static function retract_more_content_part_01():Void
	{
		LowerGUI.button_container_left.alive = false;
		LowerGUI.button_container_left.exists = false;
		
		LowerGUI.button_container_right.alive = false;
		LowerGUI.button_container_right.exists = false;
		
		LowerGUI.more_detail_potrait_evidence_01.alive = false;
		LowerGUI.more_detail_potrait_evidence_01.exists = false;
		
		LowerGUI.more_detail_potrait_profile_01.alive = false;
		LowerGUI.more_detail_potrait_profile_01.exists = false;
		
		LowerGUI.text_more_detail_desc.alive = false;
		LowerGUI.text_more_detail_desc.exists = false;
		
		LowerGUI.text_more_detail_desc.text = "";
		
		LowerGUI.container_image_show_01.animation.play("disappear");
		FlxTween.tween(LowerGUI.container_more_detail_box, {y:492}, 0.1,{complete:retract_more_content_part_02});
	}
	
	public static function retract_more_content_part_02(tween:FlxTween):Void
	{
		LowerGUI.button_big_left_scroll.alive = true;
		LowerGUI.button_big_left_scroll.exists = true;
		
		LowerGUI.button_big_right_scroll.alive = true;
		LowerGUI.button_big_right_scroll.exists = true;
		
		LowerGUI.text_more_detail_info_01.alive = false;
		LowerGUI.text_more_detail_info_01.exists = false;
		
		LowerGUI.text_more_detail_info_02.alive = false;
		LowerGUI.text_more_detail_info_02.exists = false;
		
		LowerGUI.text_more_detail_name_01.alive = false;
		LowerGUI.text_more_detail_name_01.exists = false;
		
		LowerGUI.text_more_detail_name_02.alive = false;
		LowerGUI.text_more_detail_name_02.exists = false;
		
		LowerGUI.text_more_detail_info_01.text = "";
		LowerGUI.text_more_detail_info_02.text = "";
		LowerGUI.text_more_detail_name_01.text = "";
		LowerGUI.text_more_detail_name_02.text = "";
		
		FlxTween.linearMotion(LowerGUI.container_more_detail_01, more_details_original_x, LowerGUI.container_more_detail_01.y, more_details_right_x, LowerGUI.container_more_detail_01.y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.container_more_detail_border_01, more_details_border_original_x, LowerGUI.container_more_detail_border_01.y, more_details_border_right_x, LowerGUI.container_more_detail_border_01.y, 0.1, true);
		FlxTween.linearMotion(LowerGUI.container_image_show_01, more_details_potrait_original_x, LowerGUI.container_image_show_01.y, more_details_potrait_right_x, LowerGUI.container_image_show_01.y, 0.1, true);
		FlxTween.tween(LowerGUI.container_more_detail_box, {x:455}, 0.1, { complete:retract_more_content_part_03 } );
	}
	
	public static function retract_more_content_part_03(tween:FlxTween):Void 
	{
		LowerGUI.container_more_detail_01.alive = false;
		LowerGUI.container_image_show_01.alive = false;
		LowerGUI.container_more_detail_border_01.alive = false;
		LowerGUI.container_more_detail_box.alive = false;
		
		LowerGUI.container_more_detail_01.exists = false;
		LowerGUI.container_image_show_01.exists = false;
		LowerGUI.container_more_detail_border_01.exists = false;
		LowerGUI.container_more_detail_box.exists = false;
		
		LowerGUI.more_detail_potrait_evidence_01.alive = false;
		LowerGUI.more_detail_potrait_evidence_01.exists = false;
		
		LowerGUI.more_detail_potrait_profile_01.alive = false;
		LowerGUI.more_detail_potrait_profile_01.exists = false;
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			if (ScriptCourtRecords.evidence_max_page > 1)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 499;
				LowerGUI.arrow_head_right.y = 499;
			}
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			if (ScriptCourtRecords.profile_max_page > 1)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 499;
				LowerGUI.arrow_head_right.y = 499;
			}
		}
		
		next_page_detection_01();
	}
	
	public static function court_record_hit_left_evidence():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 1;
		
		LowerGUI.container_court_record_02.alive = true;
		LowerGUI.court_record_evidence_potrait_01_b.alive = true;
		LowerGUI.court_record_evidence_potrait_02_b.alive = true;
		LowerGUI.court_record_evidence_potrait_03_b.alive = true;
		LowerGUI.court_record_evidence_potrait_04_b.alive = true;
		LowerGUI.court_record_evidence_potrait_05_b.alive = true;
		LowerGUI.court_record_evidence_potrait_06_b.alive = true;
		LowerGUI.court_record_evidence_potrait_07_b.alive = true;
		LowerGUI.court_record_evidence_potrait_08_b.alive = true;
		
		LowerGUI.container_court_record_02.exists = true;
		LowerGUI.court_record_evidence_potrait_01_b.exists = true;
		LowerGUI.court_record_evidence_potrait_02_b.exists = true;
		LowerGUI.court_record_evidence_potrait_03_b.exists = true;
		LowerGUI.court_record_evidence_potrait_04_b.exists = true;
		LowerGUI.court_record_evidence_potrait_05_b.exists = true;
		LowerGUI.court_record_evidence_potrait_06_b.exists = true;
		LowerGUI.court_record_evidence_potrait_07_b.exists = true;
		LowerGUI.court_record_evidence_potrait_08_b.exists = true;
		
		LowerGUI.container_court_record_02.x = ScriptCourtRecords.grid_left_x;
		LowerGUI.court_record_evidence_potrait_01_b.x = ScriptCourtRecords.potrait_left_x_01;
		LowerGUI.court_record_evidence_potrait_02_b.x = ScriptCourtRecords.potrait_left_x_02;
		LowerGUI.court_record_evidence_potrait_03_b.x = ScriptCourtRecords.potrait_left_x_03;
		LowerGUI.court_record_evidence_potrait_04_b.x = ScriptCourtRecords.potrait_left_x_04;
		LowerGUI.court_record_evidence_potrait_05_b.x = ScriptCourtRecords.potrait_left_x_05;
		LowerGUI.court_record_evidence_potrait_06_b.x = ScriptCourtRecords.potrait_left_x_06;
		LowerGUI.court_record_evidence_potrait_07_b.x = ScriptCourtRecords.potrait_left_x_07;
		LowerGUI.court_record_evidence_potrait_08_b.x = ScriptCourtRecords.potrait_left_x_08;
		
		next_page_detection_02();
		
		FlxTween.tween(LowerGUI.container_court_record_01, {x:ScriptCourtRecords.grid_right_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_01_a, {x:ScriptCourtRecords.potrait_right_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_02_a, {x:ScriptCourtRecords.potrait_right_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_03_a, {x:ScriptCourtRecords.potrait_right_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_04_a, {x:ScriptCourtRecords.potrait_right_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_05_a, {x:ScriptCourtRecords.potrait_right_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_06_a, {x:ScriptCourtRecords.potrait_right_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_07_a, {x:ScriptCourtRecords.potrait_right_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_08_a, {x:ScriptCourtRecords.potrait_right_x_08}, 0.25);
		
		FlxTween.tween(LowerGUI.container_court_record_02, {x:ScriptCourtRecords.grid_original_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_01_b, {x:ScriptCourtRecords.potrait_original_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_02_b, {x:ScriptCourtRecords.potrait_original_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_03_b, {x:ScriptCourtRecords.potrait_original_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_04_b, {x:ScriptCourtRecords.potrait_original_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_05_b, {x:ScriptCourtRecords.potrait_original_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_06_b, {x:ScriptCourtRecords.potrait_original_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_07_b, {x:ScriptCourtRecords.potrait_original_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_08_b, {x:ScriptCourtRecords.potrait_original_x_08}, 0.25,{complete:button_big_universal_reset_evidence});
	}
	
	public static function court_record_hit_right_evidence():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 1;
		
		LowerGUI.container_court_record_02.alive = true;
		LowerGUI.court_record_evidence_potrait_01_b.alive = true;
		LowerGUI.court_record_evidence_potrait_02_b.alive = true;
		LowerGUI.court_record_evidence_potrait_03_b.alive = true;
		LowerGUI.court_record_evidence_potrait_04_b.alive = true;
		LowerGUI.court_record_evidence_potrait_05_b.alive = true;
		LowerGUI.court_record_evidence_potrait_06_b.alive = true;
		LowerGUI.court_record_evidence_potrait_07_b.alive = true;
		LowerGUI.court_record_evidence_potrait_08_b.alive = true;
		
		LowerGUI.container_court_record_02.exists = true;
		LowerGUI.court_record_evidence_potrait_01_b.exists = true;
		LowerGUI.court_record_evidence_potrait_02_b.exists = true;
		LowerGUI.court_record_evidence_potrait_03_b.exists = true;
		LowerGUI.court_record_evidence_potrait_04_b.exists = true;
		LowerGUI.court_record_evidence_potrait_05_b.exists = true;
		LowerGUI.court_record_evidence_potrait_06_b.exists = true;
		LowerGUI.court_record_evidence_potrait_07_b.exists = true;
		LowerGUI.court_record_evidence_potrait_08_b.exists = true;
		
		LowerGUI.container_court_record_02.x = ScriptCourtRecords.grid_right_x;
		LowerGUI.court_record_evidence_potrait_01_b.x = ScriptCourtRecords.potrait_right_x_01;
		LowerGUI.court_record_evidence_potrait_02_b.x = ScriptCourtRecords.potrait_right_x_02;
		LowerGUI.court_record_evidence_potrait_03_b.x = ScriptCourtRecords.potrait_right_x_03;
		LowerGUI.court_record_evidence_potrait_04_b.x = ScriptCourtRecords.potrait_right_x_04;
		LowerGUI.court_record_evidence_potrait_05_b.x = ScriptCourtRecords.potrait_right_x_05;
		LowerGUI.court_record_evidence_potrait_06_b.x = ScriptCourtRecords.potrait_right_x_06;
		LowerGUI.court_record_evidence_potrait_07_b.x = ScriptCourtRecords.potrait_right_x_07;
		LowerGUI.court_record_evidence_potrait_08_b.x = ScriptCourtRecords.potrait_right_x_08;
		
		next_page_detection_02();
		
		FlxTween.tween(LowerGUI.container_court_record_01, {x:ScriptCourtRecords.grid_left_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_01_a, {x:ScriptCourtRecords.potrait_left_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_02_a, {x:ScriptCourtRecords.potrait_left_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_03_a, {x:ScriptCourtRecords.potrait_left_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_04_a, {x:ScriptCourtRecords.potrait_left_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_05_a, {x:ScriptCourtRecords.potrait_left_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_06_a, {x:ScriptCourtRecords.potrait_left_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_07_a, {x:ScriptCourtRecords.potrait_left_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_08_a, {x:ScriptCourtRecords.potrait_left_x_08}, 0.25);
		
		FlxTween.tween(LowerGUI.container_court_record_02, {x:ScriptCourtRecords.grid_original_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_01_b, {x:ScriptCourtRecords.potrait_original_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_02_b, {x:ScriptCourtRecords.potrait_original_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_03_b, {x:ScriptCourtRecords.potrait_original_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_04_b, {x:ScriptCourtRecords.potrait_original_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_05_b, {x:ScriptCourtRecords.potrait_original_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_06_b, {x:ScriptCourtRecords.potrait_original_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_07_b, {x:ScriptCourtRecords.potrait_original_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_evidence_potrait_08_b, {x:ScriptCourtRecords.potrait_original_x_08}, 0.25,{complete:button_big_universal_reset_evidence});
	}
	
	public static function button_big_universal_reset_evidence(tween:FlxTween):Void
	{
		LowerGUI.container_court_record_02.alive = false;
		LowerGUI.court_record_evidence_potrait_01_b.alive = false;
		LowerGUI.court_record_evidence_potrait_02_b.alive = false;
		LowerGUI.court_record_evidence_potrait_03_b.alive = false;
		LowerGUI.court_record_evidence_potrait_04_b.alive = false;
		LowerGUI.court_record_evidence_potrait_05_b.alive = false;
		LowerGUI.court_record_evidence_potrait_06_b.alive = false;
		LowerGUI.court_record_evidence_potrait_07_b.alive = false;
		LowerGUI.court_record_evidence_potrait_08_b.alive = false;
		
		LowerGUI.container_court_record_02.exists = false;
		LowerGUI.court_record_evidence_potrait_01_b.exists = false;
		LowerGUI.court_record_evidence_potrait_02_b.exists = false;
		LowerGUI.court_record_evidence_potrait_03_b.exists = false;
		LowerGUI.court_record_evidence_potrait_04_b.exists = false;
		LowerGUI.court_record_evidence_potrait_05_b.exists = false;
		LowerGUI.court_record_evidence_potrait_06_b.exists = false;
		LowerGUI.court_record_evidence_potrait_07_b.exists = false;
		LowerGUI.court_record_evidence_potrait_08_b.exists = false;
		
		LowerGUI.container_court_record_01.x = ScriptCourtRecords.grid_original_x;
		LowerGUI.court_record_evidence_potrait_01_a.x = ScriptCourtRecords.potrait_original_x_01;
		LowerGUI.court_record_evidence_potrait_02_a.x = ScriptCourtRecords.potrait_original_x_02;
		LowerGUI.court_record_evidence_potrait_03_a.x = ScriptCourtRecords.potrait_original_x_03;
		LowerGUI.court_record_evidence_potrait_04_a.x = ScriptCourtRecords.potrait_original_x_04;
		LowerGUI.court_record_evidence_potrait_05_a.x = ScriptCourtRecords.potrait_original_x_05;
		LowerGUI.court_record_evidence_potrait_06_a.x = ScriptCourtRecords.potrait_original_x_06;
		LowerGUI.court_record_evidence_potrait_07_a.x = ScriptCourtRecords.potrait_original_x_07;
		LowerGUI.court_record_evidence_potrait_08_a.x = ScriptCourtRecords.potrait_original_x_08;
		
		ScriptMouseChecks.halt_mouse_trigger = 0;
		next_page_detection_01();
	}
	
	//--- TEMP DIVISION
	
	public static function court_record_hit_left_profile():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 1;
		
		LowerGUI.container_court_record_02.alive = true;
		LowerGUI.court_record_profile_potrait_01_b.alive = true;
		LowerGUI.court_record_profile_potrait_02_b.alive = true;
		LowerGUI.court_record_profile_potrait_03_b.alive = true;
		LowerGUI.court_record_profile_potrait_04_b.alive = true;
		LowerGUI.court_record_profile_potrait_05_b.alive = true;
		LowerGUI.court_record_profile_potrait_06_b.alive = true;
		LowerGUI.court_record_profile_potrait_07_b.alive = true;
		LowerGUI.court_record_profile_potrait_08_b.alive = true;
		
		LowerGUI.container_court_record_02.exists = true;
		LowerGUI.court_record_profile_potrait_01_b.exists = true;
		LowerGUI.court_record_profile_potrait_02_b.exists = true;
		LowerGUI.court_record_profile_potrait_03_b.exists = true;
		LowerGUI.court_record_profile_potrait_04_b.exists = true;
		LowerGUI.court_record_profile_potrait_05_b.exists = true;
		LowerGUI.court_record_profile_potrait_06_b.exists = true;
		LowerGUI.court_record_profile_potrait_07_b.exists = true;
		LowerGUI.court_record_profile_potrait_08_b.exists = true;
		
		LowerGUI.container_court_record_02.x = ScriptCourtRecords.grid_left_x;
		LowerGUI.court_record_profile_potrait_01_b.x = ScriptCourtRecords.potrait_left_x_01;
		LowerGUI.court_record_profile_potrait_02_b.x = ScriptCourtRecords.potrait_left_x_02;
		LowerGUI.court_record_profile_potrait_03_b.x = ScriptCourtRecords.potrait_left_x_03;
		LowerGUI.court_record_profile_potrait_04_b.x = ScriptCourtRecords.potrait_left_x_04;
		LowerGUI.court_record_profile_potrait_05_b.x = ScriptCourtRecords.potrait_left_x_05;
		LowerGUI.court_record_profile_potrait_06_b.x = ScriptCourtRecords.potrait_left_x_06;
		LowerGUI.court_record_profile_potrait_07_b.x = ScriptCourtRecords.potrait_left_x_07;
		LowerGUI.court_record_profile_potrait_08_b.x = ScriptCourtRecords.potrait_left_x_08;
		
		next_page_detection_02();
		
		FlxTween.tween(LowerGUI.container_court_record_01, {x:ScriptCourtRecords.grid_right_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_01_a, {x:ScriptCourtRecords.potrait_right_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_02_a, {x:ScriptCourtRecords.potrait_right_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_03_a, {x:ScriptCourtRecords.potrait_right_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_04_a, {x:ScriptCourtRecords.potrait_right_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_05_a, {x:ScriptCourtRecords.potrait_right_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_06_a, {x:ScriptCourtRecords.potrait_right_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_07_a, {x:ScriptCourtRecords.potrait_right_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_08_a, {x:ScriptCourtRecords.potrait_right_x_08}, 0.25);
		
		FlxTween.tween(LowerGUI.container_court_record_02, {x:ScriptCourtRecords.grid_original_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_01_b, {x:ScriptCourtRecords.potrait_original_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_02_b, {x:ScriptCourtRecords.potrait_original_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_03_b, {x:ScriptCourtRecords.potrait_original_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_04_b, {x:ScriptCourtRecords.potrait_original_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_05_b, {x:ScriptCourtRecords.potrait_original_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_06_b, {x:ScriptCourtRecords.potrait_original_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_07_b, {x:ScriptCourtRecords.potrait_original_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_08_b, {x:ScriptCourtRecords.potrait_original_x_08}, 0.25,{complete:button_big_universal_reset_profile});
	}
	
	public static function court_record_hit_right_profile():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 1;
		
		LowerGUI.container_court_record_02.alive = true;
		LowerGUI.court_record_profile_potrait_01_b.alive = true;
		LowerGUI.court_record_profile_potrait_02_b.alive = true;
		LowerGUI.court_record_profile_potrait_03_b.alive = true;
		LowerGUI.court_record_profile_potrait_04_b.alive = true;
		LowerGUI.court_record_profile_potrait_05_b.alive = true;
		LowerGUI.court_record_profile_potrait_06_b.alive = true;
		LowerGUI.court_record_profile_potrait_07_b.alive = true;
		LowerGUI.court_record_profile_potrait_08_b.alive = true;
		
		LowerGUI.container_court_record_02.exists = true;
		LowerGUI.court_record_profile_potrait_01_b.exists = true;
		LowerGUI.court_record_profile_potrait_02_b.exists = true;
		LowerGUI.court_record_profile_potrait_03_b.exists = true;
		LowerGUI.court_record_profile_potrait_04_b.exists = true;
		LowerGUI.court_record_profile_potrait_05_b.exists = true;
		LowerGUI.court_record_profile_potrait_06_b.exists = true;
		LowerGUI.court_record_profile_potrait_07_b.exists = true;
		LowerGUI.court_record_profile_potrait_08_b.exists = true;
		
		LowerGUI.container_court_record_02.x = ScriptCourtRecords.grid_right_x;
		LowerGUI.court_record_profile_potrait_01_b.x = ScriptCourtRecords.potrait_right_x_01;
		LowerGUI.court_record_profile_potrait_02_b.x = ScriptCourtRecords.potrait_right_x_02;
		LowerGUI.court_record_profile_potrait_03_b.x = ScriptCourtRecords.potrait_right_x_03;
		LowerGUI.court_record_profile_potrait_04_b.x = ScriptCourtRecords.potrait_right_x_04;
		LowerGUI.court_record_profile_potrait_05_b.x = ScriptCourtRecords.potrait_right_x_05;
		LowerGUI.court_record_profile_potrait_06_b.x = ScriptCourtRecords.potrait_right_x_06;
		LowerGUI.court_record_profile_potrait_07_b.x = ScriptCourtRecords.potrait_right_x_07;
		LowerGUI.court_record_profile_potrait_08_b.x = ScriptCourtRecords.potrait_right_x_08;
		
		next_page_detection_02();
		
		FlxTween.tween(LowerGUI.container_court_record_01, {x:ScriptCourtRecords.grid_left_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_01_a, {x:ScriptCourtRecords.potrait_left_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_02_a, {x:ScriptCourtRecords.potrait_left_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_03_a, {x:ScriptCourtRecords.potrait_left_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_04_a, {x:ScriptCourtRecords.potrait_left_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_05_a, {x:ScriptCourtRecords.potrait_left_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_06_a, {x:ScriptCourtRecords.potrait_left_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_07_a, {x:ScriptCourtRecords.potrait_left_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_08_a, {x:ScriptCourtRecords.potrait_left_x_08}, 0.25);
		
		FlxTween.tween(LowerGUI.container_court_record_02, {x:ScriptCourtRecords.grid_original_x}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_01_b, {x:ScriptCourtRecords.potrait_original_x_01}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_02_b, {x:ScriptCourtRecords.potrait_original_x_02}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_03_b, {x:ScriptCourtRecords.potrait_original_x_03}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_04_b, {x:ScriptCourtRecords.potrait_original_x_04}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_05_b, {x:ScriptCourtRecords.potrait_original_x_05}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_06_b, {x:ScriptCourtRecords.potrait_original_x_06}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_07_b, {x:ScriptCourtRecords.potrait_original_x_07}, 0.25);
		FlxTween.tween(LowerGUI.court_record_profile_potrait_08_b, {x:ScriptCourtRecords.potrait_original_x_08}, 0.25,{complete:button_big_universal_reset_profile});
	}
	
	public static function button_big_universal_reset_profile(tween:FlxTween):Void
	{
		LowerGUI.container_court_record_02.alive = false;
		LowerGUI.court_record_profile_potrait_01_b.alive = false;
		LowerGUI.court_record_profile_potrait_02_b.alive = false;
		LowerGUI.court_record_profile_potrait_03_b.alive = false;
		LowerGUI.court_record_profile_potrait_04_b.alive = false;
		LowerGUI.court_record_profile_potrait_05_b.alive = false;
		LowerGUI.court_record_profile_potrait_06_b.alive = false;
		LowerGUI.court_record_profile_potrait_07_b.alive = false;
		LowerGUI.court_record_profile_potrait_08_b.alive = false;
		
		LowerGUI.container_court_record_02.exists = false;
		LowerGUI.court_record_profile_potrait_01_b.exists = false;
		LowerGUI.court_record_profile_potrait_02_b.exists = false;
		LowerGUI.court_record_profile_potrait_03_b.exists = false;
		LowerGUI.court_record_profile_potrait_04_b.exists = false;
		LowerGUI.court_record_profile_potrait_05_b.exists = false;
		LowerGUI.court_record_profile_potrait_06_b.exists = false;
		LowerGUI.court_record_profile_potrait_07_b.exists = false;
		LowerGUI.court_record_profile_potrait_08_b.exists = false;
		
		LowerGUI.container_court_record_01.x = ScriptCourtRecords.grid_original_x;
		LowerGUI.court_record_profile_potrait_01_a.x = ScriptCourtRecords.potrait_original_x_01;
		LowerGUI.court_record_profile_potrait_02_a.x = ScriptCourtRecords.potrait_original_x_02;
		LowerGUI.court_record_profile_potrait_03_a.x = ScriptCourtRecords.potrait_original_x_03;
		LowerGUI.court_record_profile_potrait_04_a.x = ScriptCourtRecords.potrait_original_x_04;
		LowerGUI.court_record_profile_potrait_05_a.x = ScriptCourtRecords.potrait_original_x_05;
		LowerGUI.court_record_profile_potrait_06_a.x = ScriptCourtRecords.potrait_original_x_06;
		LowerGUI.court_record_profile_potrait_07_a.x = ScriptCourtRecords.potrait_original_x_07;
		LowerGUI.court_record_profile_potrait_08_a.x = ScriptCourtRecords.potrait_original_x_08;
		
		ScriptMouseChecks.halt_mouse_trigger = 0;
		next_page_detection_01();
	}
	
	public static function next_page_detection_01():Void 
	{
		if (LowerGUI.border_tag_evidence.exists == true)
		{
			LowerGUI.text_court_record_nametag.text = "Hover your mouse on an Evidence";
			
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 8;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_01_a.exists = true;
				LowerGUI.court_record_evidence_potrait_01_a.exists = true;
				LowerGUI.court_record_evidence_potrait_01_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_01_a.exists = false;
				LowerGUI.court_record_evidence_potrait_01_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 7;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_02_a.exists = true;
				LowerGUI.court_record_evidence_potrait_02_a.exists = true;
				LowerGUI.court_record_evidence_potrait_02_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_02_a.exists = false;
				LowerGUI.court_record_evidence_potrait_02_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 6;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_03_a.exists = true;
				LowerGUI.court_record_evidence_potrait_03_a.exists = true;
				LowerGUI.court_record_evidence_potrait_03_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_03_a.exists = false;
				LowerGUI.court_record_evidence_potrait_03_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 5;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_04_a.exists = true;
				LowerGUI.court_record_evidence_potrait_04_a.exists = true;
				LowerGUI.court_record_evidence_potrait_04_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_04_a.exists = false;
				LowerGUI.court_record_evidence_potrait_04_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 4;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_05_a.exists = true;
				LowerGUI.court_record_evidence_potrait_05_a.exists = true;
				LowerGUI.court_record_evidence_potrait_05_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_05_a.exists = false;
				LowerGUI.court_record_evidence_potrait_05_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 3;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_06_a.exists = true;
				LowerGUI.court_record_evidence_potrait_06_a.exists = true;
				LowerGUI.court_record_evidence_potrait_06_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_06_a.exists = false;
				LowerGUI.court_record_evidence_potrait_06_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 2;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_07_a.exists = true;
				LowerGUI.court_record_evidence_potrait_07_a.exists = true;
				LowerGUI.court_record_evidence_potrait_07_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_07_a.exists = false;
				LowerGUI.court_record_evidence_potrait_07_a.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 1;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_08_a.exists = true;
				LowerGUI.court_record_evidence_potrait_08_a.exists = true;
				LowerGUI.court_record_evidence_potrait_08_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_08_a.exists = false;
				LowerGUI.court_record_evidence_potrait_08_a.exists = false;
			}
			
			if (ScriptCourtRecords.evidence_max_page > 1)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 499;
				LowerGUI.arrow_head_right.y = 499;
			}
		}
		else if (LowerGUI.border_tag_profiles.exists == true)
		{
			LowerGUI.text_court_record_nametag.text = "Hover your mouse on a Profile";
			
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 8;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_01_a.exists = true;
				LowerGUI.court_record_profile_potrait_01_a.exists = true;
				LowerGUI.court_record_profile_potrait_01_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_01_a.exists = false;
				LowerGUI.court_record_profile_potrait_01_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 7;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null )
			{
				LowerGUI.court_record_profile_potrait_02_a.exists = true;
				LowerGUI.court_record_profile_potrait_02_a.exists = true;
				LowerGUI.court_record_profile_potrait_02_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_02_a.exists = false;
				LowerGUI.court_record_profile_potrait_02_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 6;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_03_a.exists = true;
				LowerGUI.court_record_profile_potrait_03_a.exists = true;
				LowerGUI.court_record_profile_potrait_03_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_03_a.exists = false;
				LowerGUI.court_record_profile_potrait_03_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 5;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_04_a.exists = true;
				LowerGUI.court_record_profile_potrait_04_a.exists = true;
				LowerGUI.court_record_profile_potrait_04_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_04_a.exists = false;
				LowerGUI.court_record_profile_potrait_04_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 4;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_05_a.exists = true;
				LowerGUI.court_record_profile_potrait_05_a.exists = true;
				LowerGUI.court_record_profile_potrait_05_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_05_a.exists = false;
				LowerGUI.court_record_profile_potrait_05_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 3;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_06_a.exists = true;
				LowerGUI.court_record_profile_potrait_06_a.exists = true;
				LowerGUI.court_record_profile_potrait_06_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_06_a.exists = false;
				LowerGUI.court_record_profile_potrait_06_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 2;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_07_a.exists = true;
				LowerGUI.court_record_profile_potrait_07_a.exists = true;
				LowerGUI.court_record_profile_potrait_07_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_07_a.exists = false;
				LowerGUI.court_record_profile_potrait_07_a.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 1;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_08_a.exists = true;
				LowerGUI.court_record_profile_potrait_08_a.exists = true;
				LowerGUI.court_record_profile_potrait_08_a.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_08_a.exists = false;
				LowerGUI.court_record_profile_potrait_08_a.exists = false;
			}
			
			if (ScriptCourtRecords.profile_max_page > 1)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 499;
				LowerGUI.arrow_head_right.y = 499;
			}
		}
	}
	
	public static function next_page_detection_02():Void
	{
		if (LowerGUI.border_tag_evidence.exists == true)
		{
			LowerGUI.text_court_record_nametag.text = "Hover your mouse on an Evidence";
			
			var evidence_inventory_counter:Int = ScriptCourtRecords.evidence_current_page * 8;
			var evidence_tentative_content_index:Int  = 0;
			
			evidence_tentative_content_index = evidence_inventory_counter - 8;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_01_b.exists = true;
				LowerGUI.court_record_evidence_potrait_01_b.exists = true;
				LowerGUI.court_record_evidence_potrait_01_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_01_b.exists = false;
				LowerGUI.court_record_evidence_potrait_01_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 7;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_02_b.exists = true;
				LowerGUI.court_record_evidence_potrait_02_b.exists = true;
				LowerGUI.court_record_evidence_potrait_02_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_02_b.exists = false;
				LowerGUI.court_record_evidence_potrait_02_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 6;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_03_b.exists = true;
				LowerGUI.court_record_evidence_potrait_03_b.exists = true;
				LowerGUI.court_record_evidence_potrait_03_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_03_b.exists = false;
				LowerGUI.court_record_evidence_potrait_03_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 5;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_04_b.exists = true;
				LowerGUI.court_record_evidence_potrait_04_b.exists = true;
				LowerGUI.court_record_evidence_potrait_04_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_04_b.exists = false;
				LowerGUI.court_record_evidence_potrait_04_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 4;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_05_b.exists = true;
				LowerGUI.court_record_evidence_potrait_05_b.exists = true;
				LowerGUI.court_record_evidence_potrait_05_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_05_b.exists = false;
				LowerGUI.court_record_evidence_potrait_05_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 3;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_06_b.exists = true;
				LowerGUI.court_record_evidence_potrait_06_b.exists = true;
				LowerGUI.court_record_evidence_potrait_06_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_06_b.exists = false;
				LowerGUI.court_record_evidence_potrait_06_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 2;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_07_b.exists = true;
				LowerGUI.court_record_evidence_potrait_07_b.exists = true;
				LowerGUI.court_record_evidence_potrait_07_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_07_b.exists = false;
				LowerGUI.court_record_evidence_potrait_07_b.exists = false;
			}
			
			evidence_tentative_content_index = evidence_inventory_counter - 1;
			
			if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
			{
				LowerGUI.court_record_evidence_potrait_08_b.exists = true;
				LowerGUI.court_record_evidence_potrait_08_b.exists = true;
				LowerGUI.court_record_evidence_potrait_08_b.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_evidence_potrait_08_b.exists = false;
				LowerGUI.court_record_evidence_potrait_08_b.exists = false;
			}
		}
		else if (LowerGUI.border_tag_profiles.exists == true)
		{
			LowerGUI.text_court_record_nametag.text = "Hover your mouse on a Profile";
			
			var profile_inventory_counter:Int = ScriptCourtRecords.profile_current_page * 8;
			var profile_tentative_content_index:Int  = 0;
			
			profile_tentative_content_index = profile_inventory_counter - 8;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_01_b.exists = true;
				LowerGUI.court_record_profile_potrait_01_b.exists = true;
				LowerGUI.court_record_profile_potrait_01_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_01_b.exists = false;
				LowerGUI.court_record_profile_potrait_01_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 7;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null )
			{
				LowerGUI.court_record_profile_potrait_02_b.exists = true;
				LowerGUI.court_record_profile_potrait_02_b.exists = true;
				LowerGUI.court_record_profile_potrait_02_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_02_b.exists = false;
				LowerGUI.court_record_profile_potrait_02_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 6;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_03_b.exists = true;
				LowerGUI.court_record_profile_potrait_03_b.exists = true;
				LowerGUI.court_record_profile_potrait_03_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_03_b.exists = false;
				LowerGUI.court_record_profile_potrait_03_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 5;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_04_b.exists = true;
				LowerGUI.court_record_profile_potrait_04_b.exists = true;
				LowerGUI.court_record_profile_potrait_04_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_04_b.exists = false;
				LowerGUI.court_record_profile_potrait_04_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 4;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_05_b.exists = true;
				LowerGUI.court_record_profile_potrait_05_b.exists = true;
				LowerGUI.court_record_profile_potrait_05_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_05_b.exists = false;
				LowerGUI.court_record_profile_potrait_05_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 3;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_06_b.exists = true;
				LowerGUI.court_record_profile_potrait_06_b.exists = true;
				LowerGUI.court_record_profile_potrait_06_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_06_b.exists = false;
				LowerGUI.court_record_profile_potrait_06_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 2;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_07_b.exists = true;
				LowerGUI.court_record_profile_potrait_07_b.exists = true;
				LowerGUI.court_record_profile_potrait_07_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_07_b.exists = false;
				LowerGUI.court_record_profile_potrait_07_b.exists = false;
			}
			
			profile_tentative_content_index = profile_inventory_counter - 1;
			
			if (ScriptCourtRecords.profile_inventory[profile_tentative_content_index] != null)
			{
				LowerGUI.court_record_profile_potrait_08_b.exists = true;
				LowerGUI.court_record_profile_potrait_08_b.exists = true;
				LowerGUI.court_record_profile_potrait_08_b.animation.play(DatabaseVariablesProfiles.npc_id[ScriptCourtRecords.profile_inventory[profile_tentative_content_index]]);
			}
			else
			{
				LowerGUI.court_record_profile_potrait_08_b.exists = false;
				LowerGUI.court_record_profile_potrait_08_b.exists = false;
			}
		}
	}
	
	
	public static function next_page_detection_inventory_update():Void 
	{
		var evidence_inventory_counter:Int = LowerGUI.temp_investigation_page * 8;
		var evidence_tentative_content_index:Int = 0;
		var evidence_added_item_indicator:Int = 0;
		
		evidence_tentative_content_index = evidence_inventory_counter - 8;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_01_a.exists = true;
			LowerGUI.court_record_evidence_potrait_01_a.exists = true;
			LowerGUI.court_record_evidence_potrait_01_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_01.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_01_a.exists = false;
			LowerGUI.court_record_evidence_potrait_01_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 7;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_02_a.exists = true;
			LowerGUI.court_record_evidence_potrait_02_a.exists = true;
			LowerGUI.court_record_evidence_potrait_02_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_02.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_02_a.exists = false;
			LowerGUI.court_record_evidence_potrait_02_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 6;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_03_a.exists = true;
			LowerGUI.court_record_evidence_potrait_03_a.exists = true;
			LowerGUI.court_record_evidence_potrait_03_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_03.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_03_a.exists = false;
			LowerGUI.court_record_evidence_potrait_03_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 5;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_04_a.exists = true;
			LowerGUI.court_record_evidence_potrait_04_a.exists = true;
			LowerGUI.court_record_evidence_potrait_04_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_04.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_04_a.exists = false;
			LowerGUI.court_record_evidence_potrait_04_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 4;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_05_a.exists = true;
			LowerGUI.court_record_evidence_potrait_05_a.exists = true;
			LowerGUI.court_record_evidence_potrait_05_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_05.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_05_a.exists = false;
			LowerGUI.court_record_evidence_potrait_05_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 3;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_06_a.exists = true;
			LowerGUI.court_record_evidence_potrait_06_a.exists = true;
			LowerGUI.court_record_evidence_potrait_06_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_06.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_06_a.exists = false;
			LowerGUI.court_record_evidence_potrait_06_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 2;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_07_a.exists = true;
			LowerGUI.court_record_evidence_potrait_07_a.exists = true;
			LowerGUI.court_record_evidence_potrait_07_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_07.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_07_a.exists = false;
			LowerGUI.court_record_evidence_potrait_07_a.exists = false;
		}
		
		evidence_tentative_content_index = evidence_inventory_counter - 1;
		
		if (ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index] != null)
		{
			LowerGUI.court_record_evidence_potrait_08_a.exists = true;
			LowerGUI.court_record_evidence_potrait_08_a.exists = true;
			LowerGUI.court_record_evidence_potrait_08_a.animation.play(DatabaseVariablesEvidence.item_animation_name[ScriptCourtRecords.evidence_inventory[evidence_tentative_content_index]]);
			
			if (evidence_tentative_content_index == ScriptConversations.temp_new_item_index)
			{
				LowerGUI.court_record_over_potrait_08.animation.play("flash");
			}
		}
		else
		{
			LowerGUI.court_record_evidence_potrait_08_a.exists = false;
			LowerGUI.court_record_evidence_potrait_08_a.exists = false;
		}
	}
	
	public static function next_more_detail_right():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 1;
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[evidence_inventory[inventory_current_evidence_index]];
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			current_picked_profiles = DatabaseVariablesProfiles.npc_id[profile_inventory[inventory_current_profile_index]];
		}
		
		LowerGUI.container_more_detail_02.alive = true;
		LowerGUI.container_image_show_02.alive = true;
		LowerGUI.container_more_detail_border_02.alive = true;
		LowerGUI.text_more_detail_info_02.alive = true;
		LowerGUI.text_more_detail_name_02.alive = true;
		
		LowerGUI.container_more_detail_02.exists = true;
		LowerGUI.container_image_show_02.exists = true;
		LowerGUI.container_more_detail_border_02.exists = true;
		LowerGUI.text_more_detail_info_02.exists = true;
		LowerGUI.text_more_detail_name_02.exists = true;
		
		LowerGUI.container_more_detail_02.x = more_details_right_x;
		LowerGUI.container_image_show_02.x = more_details_showframe_right_x;
		LowerGUI.container_more_detail_border_02.x = more_details_border_right_x;
		LowerGUI.text_more_detail_name_02.x = more_details_name_right_x;
		LowerGUI.text_more_detail_info_02.x = more_details_info_right_x;
		
		LowerGUI.container_image_show_02.animation.play("idle");
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			LowerGUI.more_detail_potrait_evidence_02.alive = true;
			LowerGUI.more_detail_potrait_evidence_02.exists = true;
			
			LowerGUI.more_detail_potrait_evidence_02.x = more_details_potrait_right_x;
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			LowerGUI.more_detail_potrait_profile_02.alive = true;
			LowerGUI.more_detail_potrait_profile_02.exists = true;
			
			LowerGUI.more_detail_potrait_profile_02.x = more_details_potrait_right_x;
		}
		
		next_more_detail_detection_02();
		
		FlxTween.tween(LowerGUI.container_more_detail_01, {x:more_details_left_x}, 0.25);
		FlxTween.tween(LowerGUI.container_image_show_01, {x:more_details_potrait_left_x}, 0.25);
		FlxTween.tween(LowerGUI.container_more_detail_border_01, {x:more_details_border_left_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_name_01, {x:more_details_name_left_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_info_01, {x:more_details_info_left_x}, 0.25);
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_evidence_01, {x:more_details_potrait_left_x}, 0.25);
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_profile_01, {x:more_details_potrait_left_x}, 0.25);
		}
		
	FlxTween.tween(LowerGUI.container_more_detail_02, {x:more_details_original_x}, 0.25);
		FlxTween.tween(LowerGUI.container_image_show_02, {x:more_details_showframe_original_x}, 0.25);
		FlxTween.tween(LowerGUI.container_more_detail_border_02, {x:more_details_border_original_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_name_02, {x:more_details_name_original_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_info_02, {x:more_details_info_original_x}, 0.25);
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_evidence_02, {x:more_details_potrait_original_x}, 0.25, {complete:next_more_detail_end});
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_profile_02, {x:more_details_potrait_original_x}, 0.25, {complete:next_more_detail_end});
		}
	}
	
	public static function next_more_detail_left():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 1;
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			current_picked_evidence = DatabaseVariablesEvidence.item_animation_name[evidence_inventory[inventory_current_evidence_index]];
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			current_picked_profiles = DatabaseVariablesProfiles.npc_id[profile_inventory[inventory_current_profile_index]];
		}
		
		LowerGUI.container_more_detail_02.alive = true;
		LowerGUI.container_image_show_02.alive = true;
		LowerGUI.container_more_detail_border_02.alive = true;
		LowerGUI.text_more_detail_info_02.alive = true;
		LowerGUI.text_more_detail_name_02.alive = true;
		
		LowerGUI.container_more_detail_02.exists = true;
		LowerGUI.container_image_show_02.exists = true;
		LowerGUI.container_more_detail_border_02.exists = true;
		LowerGUI.text_more_detail_info_02.exists = true;
		LowerGUI.text_more_detail_name_02.exists = true;
		
		LowerGUI.container_more_detail_02.x = more_details_left_x;
		LowerGUI.container_image_show_02.x = more_details_showframe_left_x;
		LowerGUI.container_more_detail_border_02.x = more_details_border_left_x;
		LowerGUI.text_more_detail_name_02.x = more_details_name_left_x;
		LowerGUI.text_more_detail_info_02.x = more_details_info_left_x;
		
		LowerGUI.container_image_show_02.animation.play("idle");
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			LowerGUI.more_detail_potrait_evidence_02.alive = true;
			LowerGUI.more_detail_potrait_evidence_02.exists = true;
			
			LowerGUI.more_detail_potrait_evidence_02.x = more_details_potrait_left_x;
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			LowerGUI.more_detail_potrait_profile_02.alive = true;
			LowerGUI.more_detail_potrait_profile_02.exists = true;
			
			LowerGUI.more_detail_potrait_profile_02.x = more_details_potrait_left_x;
		}
		
		next_more_detail_detection_02();
		
		FlxTween.tween(LowerGUI.container_more_detail_01, {x:more_details_right_x}, 0.25);
		FlxTween.tween(LowerGUI.container_image_show_01, {x:more_details_showframe_right_x}, 0.25);
		FlxTween.tween(LowerGUI.container_more_detail_border_01, {x:more_details_border_right_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_name_01, {x:more_details_name_right_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_info_01, {x:more_details_info_right_x}, 0.25);
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_evidence_01, {x:more_details_potrait_right_x}, 0.25);
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_profile_01, {x:more_details_potrait_right_x}, 0.25);
		}
		
		FlxTween.tween(LowerGUI.container_more_detail_02, {x:more_details_original_x}, 0.25);
		FlxTween.tween(LowerGUI.container_image_show_02, {x:more_details_showframe_original_x}, 0.25);
		FlxTween.tween(LowerGUI.container_more_detail_border_02, {x:more_details_border_original_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_name_02, {x:more_details_name_original_x}, 0.25);
		FlxTween.tween(LowerGUI.text_more_detail_info_02, {x:more_details_info_original_x}, 0.25);
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_evidence_02, {x:more_details_potrait_original_x}, 0.25, {complete:next_more_detail_end});
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			FlxTween.tween(LowerGUI.more_detail_potrait_profile_02, {x:more_details_potrait_original_x}, 0.25, {complete:next_more_detail_end});
		}
	}
	
	public static function next_more_detail_end(tween:FlxTween):Void
	{
		LowerGUI.container_more_detail_02.x = more_details_left_x;
		LowerGUI.container_image_show_02.x = more_details_showframe_left_x;
		LowerGUI.container_more_detail_border_02.x = more_details_border_left_x;
		LowerGUI.text_more_detail_name_02.x = more_details_name_left_x;
		LowerGUI.text_more_detail_info_02.x = more_details_info_left_x;
		
		LowerGUI.container_more_detail_02.alive = false;
		LowerGUI.container_image_show_02.alive = false;
		LowerGUI.container_more_detail_border_02.alive = false;
		LowerGUI.text_more_detail_info_02.alive = false;
		LowerGUI.text_more_detail_name_02.alive = false;
		
		LowerGUI.container_more_detail_02.exists = false;
		LowerGUI.container_image_show_02.exists = false;
		LowerGUI.container_more_detail_border_02.exists = false;
		LowerGUI.text_more_detail_info_02.exists = false;
		LowerGUI.text_more_detail_name_02.exists = false;
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			LowerGUI.more_detail_potrait_evidence_02.alive = false;
			LowerGUI.more_detail_potrait_evidence_02.exists = false;
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			LowerGUI.more_detail_potrait_profile_02.alive = false;
			LowerGUI.more_detail_potrait_profile_02.exists = false;
		}
		
		LowerGUI.container_more_detail_01.x = more_details_original_x;
		LowerGUI.container_image_show_01.x = more_details_showframe_original_x;
		LowerGUI.container_more_detail_border_01.x = more_details_border_original_x;
		LowerGUI.text_more_detail_name_01.x = more_details_name_original_x;
		LowerGUI.text_more_detail_info_01.x = more_details_info_original_x;
		
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			LowerGUI.more_detail_potrait_evidence_01.x = more_details_potrait_original_x;
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			LowerGUI.more_detail_potrait_profile_01.x = more_details_potrait_original_x;
		}
		
		next_more_detail_detection_01();
		ScriptMouseChecks.halt_mouse_trigger = 0;
	}
	
	public static function next_more_detail_detection_01():Void
	{
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			LowerGUI.more_detail_potrait_evidence_01.alive = true;
			LowerGUI.more_detail_potrait_evidence_01.exists = true;
			LowerGUI.more_detail_potrait_evidence_01.animation.play(ScriptCourtRecords.current_picked_evidence);
			
			var gathering_evidence_info:Int = 0;
			
			while (DatabaseVariablesEvidence.item_id[gathering_evidence_info] != null)
			{
				if (DatabaseVariablesEvidence.item_animation_name[gathering_evidence_info] == ScriptCourtRecords.current_picked_evidence)
				{
					LowerGUI.text_more_detail_name_01.alive = true;
					LowerGUI.text_more_detail_info_01.alive = true;
					LowerGUI.text_more_detail_desc.alive = true;
					
					LowerGUI.text_more_detail_name_01.exists = true;
					LowerGUI.text_more_detail_info_01.exists = true;
					LowerGUI.text_more_detail_desc.exists = true;
					
					LowerGUI.text_more_detail_name_01.text = DatabaseVariablesEvidence.item_name[gathering_evidence_info];
					LowerGUI.text_more_detail_info_01.text = "Type: " + DatabaseVariablesEvidence.item_type[gathering_evidence_info] + "\n" +DatabaseVariablesEvidence.item_from[gathering_evidence_info];
					LowerGUI.text_more_detail_desc.text = DatabaseVariablesEvidence.item_description[gathering_evidence_info];
				}
				
				gathering_evidence_info++;
			}
			
			if (evidence_inventory.length > 0)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 464;
				LowerGUI.arrow_head_right.y = 464;
			}
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			LowerGUI.more_detail_potrait_profile_01.alive = true;
			LowerGUI.more_detail_potrait_profile_01.exists = true;
			LowerGUI.more_detail_potrait_profile_01.animation.play(ScriptCourtRecords.current_picked_profiles);
			
			var gathering_profile_info:Int = 0;
			
			while (DatabaseVariablesProfiles.npc_name[gathering_profile_info] != null)
			{
				if (DatabaseVariablesProfiles.npc_id[gathering_profile_info] == ScriptCourtRecords.current_picked_profiles)
				{
					LowerGUI.text_more_detail_name_01.alive = true;
					LowerGUI.text_more_detail_info_01.alive = true;
					LowerGUI.text_more_detail_desc.alive = true;
					
					LowerGUI.text_more_detail_name_01.exists = true;
					LowerGUI.text_more_detail_info_01.exists = true;
					LowerGUI.text_more_detail_desc.exists = true;
					
					LowerGUI.text_more_detail_name_01.text = DatabaseVariablesProfiles.npc_name[gathering_profile_info];
					LowerGUI.text_more_detail_info_01.text = "Age: " + DatabaseVariablesProfiles.npc_age[gathering_profile_info] + "\n Gender: " + DatabaseVariablesProfiles.npc_gender[gathering_profile_info];
					LowerGUI.text_more_detail_desc.text = DatabaseVariablesProfiles.npc_description[gathering_profile_info];
				}
				
				gathering_profile_info++;
			}
			
			if (profile_inventory.length > 0)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 464;
				LowerGUI.arrow_head_right.y = 464;
			}
		}
	}
	
	
	public static function next_more_detail_detection_02():Void
	{
		if (LowerGUI.border_tag_evidence.alive == true)
		{
			LowerGUI.more_detail_potrait_evidence_02.alive = true;
			LowerGUI.more_detail_potrait_evidence_02.exists = true;
			LowerGUI.more_detail_potrait_evidence_02.animation.play(ScriptCourtRecords.current_picked_evidence);
			
			var gathering_evidence_info:Int = 0;
			
			while (DatabaseVariablesEvidence.item_id[gathering_evidence_info] != null)
			{
				if (DatabaseVariablesEvidence.item_animation_name[gathering_evidence_info] == ScriptCourtRecords.current_picked_evidence)
				{
					LowerGUI.text_more_detail_name_02.alive = true;
					LowerGUI.text_more_detail_info_02.alive = true;
					LowerGUI.text_more_detail_desc.alive = true;
					
					LowerGUI.text_more_detail_name_02.exists = true;
					LowerGUI.text_more_detail_info_02.exists = true;
					LowerGUI.text_more_detail_desc.exists = true;
					
					LowerGUI.text_more_detail_name_02.text = DatabaseVariablesEvidence.item_name[gathering_evidence_info];
					LowerGUI.text_more_detail_info_02.text = "Type: " + DatabaseVariablesEvidence.item_type[gathering_evidence_info] + "\n" +DatabaseVariablesEvidence.item_from[gathering_evidence_info];
					LowerGUI.text_more_detail_desc.text = DatabaseVariablesEvidence.item_description[gathering_evidence_info];
				}
				
				gathering_evidence_info++;
			}
			
			if (evidence_inventory.length > 0)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 464;
				LowerGUI.arrow_head_right.y = 464;
			}
		}
		else if (LowerGUI.border_tag_profiles.alive == true)
		{
			LowerGUI.more_detail_potrait_profile_02.alive = true;
			LowerGUI.more_detail_potrait_profile_02.exists = true;
			LowerGUI.more_detail_potrait_profile_02.animation.play(ScriptCourtRecords.current_picked_profiles);
			
			var gathering_profile_info:Int = 0;
			
			while (DatabaseVariablesProfiles.npc_name[gathering_profile_info] != null)
			{
				if (DatabaseVariablesProfiles.npc_id[gathering_profile_info] == ScriptCourtRecords.current_picked_profiles)
				{
					LowerGUI.text_more_detail_name_02.alive = true;
					LowerGUI.text_more_detail_info_02.alive = true;
					LowerGUI.text_more_detail_desc.alive = true;
					
					LowerGUI.text_more_detail_name_02.exists = true;
					LowerGUI.text_more_detail_info_02.exists = true;
					LowerGUI.text_more_detail_desc.exists = true;
					
					LowerGUI.text_more_detail_name_02.text = DatabaseVariablesProfiles.npc_name[gathering_profile_info];
					LowerGUI.text_more_detail_info_02.text = "Age: " + DatabaseVariablesProfiles.npc_age[gathering_profile_info] + "\n Gender: " + DatabaseVariablesProfiles.npc_gender[gathering_profile_info];
					LowerGUI.text_more_detail_desc.text = DatabaseVariablesProfiles.npc_description[gathering_profile_info];
				}
				
				gathering_profile_info++;
			}
			
			if (profile_inventory.length > 1)
			{
				LowerGUI.arrow_head_left.alive = true;
				LowerGUI.arrow_head_left.exists = true;
				
				LowerGUI.arrow_head_right.alive = true;
				LowerGUI.arrow_head_right.exists = true;
				
				LowerGUI.arrow_head_left.y = 464;
				LowerGUI.arrow_head_right.y = 464;
			}
			else {
				LowerGUI.arrow_head_left.alive = false;
				LowerGUI.arrow_head_left.exists = false;
				
				LowerGUI.arrow_head_right.alive = false;
				LowerGUI.arrow_head_right.exists = false;
			}
		}
	}
	
	//--  INSERT STUFF HERE
}