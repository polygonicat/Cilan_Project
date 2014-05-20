package sprites;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flash.text.Font;
import flixel.tweens.FlxTween;
import flash.filters.BitmapFilter;
import flash.text.AntiAliasType;
import openfl.Assets;

import database.DatabaseVariablesEvidence;
import database.DatabaseVariablesProfiles;

import database.DatabaseAnimationCourtRecords;
import database.DatabaseEvidenceChapterOne;

import scripts.ScriptCourtRecords;
import scripts.ScriptMouseChecks;
import scripts.ScriptConversations;

import sprites.LowerGUI;

class LowerGUI extends FlxState
{
	//-- Lower GUI Elements START
	public static var lower_bunch_group:FlxGroup;
	
	public static var court_record_main_menu:FlxGroup;
	public static var court_record_background_group:FlxGroup;
	public static var court_record_border_group:FlxGroup;
	public static var court_record_grid_pic_group:FlxGroup;
	public static var court_record_container_group:FlxGroup;
	public static var court_record_more_detail_group:FlxGroup;
	
	public static var investigation_buttons_group:FlxGroup;
	public static var investigation_buttons_options_group:FlxGroup;
	
	//-- Backgrounds
	public static var lower_gui_background:FlxSprite;
	public static var lower_scanlines:FlxSprite;
	
	//-- Borders
	public static var border_normal_upper:FlxSprite;
	public static var border_normal_lower:FlxSprite;
	public static var border_advance_upper:FlxSprite;
	public static var border_tag_evidence:FlxSprite;
	public static var border_tag_profiles:FlxSprite;
	public static var border_default_advance_upper:FlxSprite;
	public static var border_default_advance_lower:FlxSprite;
	
	//-- Buttons
	public static var button_back:FlxSprite;
	public static var button_court_record:FlxSprite;
	public static var button_present_record:FlxSprite;
	public static var button_main_conversation:FlxSprite;
	public static var button_evidence:FlxSprite;
	public static var button_profiles:FlxSprite;
	public static var button_big_left_scroll:FlxSprite;
	public static var button_big_right_scroll:FlxSprite;
	
	//-- Investigations Buttons Options
	public static var button_investigation_option_01:FlxSprite;
	public static var button_investigation_option_02:FlxSprite;
	public static var button_investigation_option_03:FlxSprite;
	public static var button_investigation_option_04:FlxSprite;
	
	//-- Investigations Text Options
	public static var button_investigation_text_01:FlxText;
	public static var button_investigation_text_02:FlxText;
	public static var button_investigation_text_03:FlxText;
	public static var button_investigation_text_04:FlxText;
	
	//-- Content
	public static var container_court_record_01:FlxSprite;
	public static var container_court_record_02:FlxSprite;
	public static var container_name_tag:FlxSprite;
	public static var container_more_detail_01:FlxSprite;
	public static var container_more_detail_02:FlxSprite;
	public static var container_more_detail_border_01:FlxSprite;
	public static var container_more_detail_border_02:FlxSprite;
	public static var container_more_detail_box:FlxSprite;
	public static var container_image_show_01:FlxSprite;
	public static var container_image_show_02:FlxSprite;
	public static var button_container_left:FlxSprite;
	public static var button_container_right:FlxSprite;
	
	//-- Arrows
	public static var arrow_head_left:FlxSprite;
	public static var arrow_head_right:FlxSprite;
	public static var arrow_main_conversation:FlxSprite;
	
	//-- Image More Details
	public static var more_detail_potrait_evidence_01:FlxSprite;
	public static var more_detail_potrait_evidence_02:FlxSprite;
	
	public static var more_detail_potrait_profile_01:FlxSprite;
	public static var more_detail_potrait_profile_02:FlxSprite;
	
	//-- Court Record Potraits
	//-- Evidence Potraits
	public static var court_record_evidence_potrait_01_a:FlxSprite;
	public static var court_record_evidence_potrait_02_a:FlxSprite;
	public static var court_record_evidence_potrait_03_a:FlxSprite;
	public static var court_record_evidence_potrait_04_a:FlxSprite;
	public static var court_record_evidence_potrait_05_a:FlxSprite;
	public static var court_record_evidence_potrait_06_a:FlxSprite;
	public static var court_record_evidence_potrait_07_a:FlxSprite;
	public static var court_record_evidence_potrait_08_a:FlxSprite;
	
	public static var court_record_evidence_potrait_01_b:FlxSprite;
	public static var court_record_evidence_potrait_02_b:FlxSprite;
	public static var court_record_evidence_potrait_03_b:FlxSprite;
	public static var court_record_evidence_potrait_04_b:FlxSprite;
	public static var court_record_evidence_potrait_05_b:FlxSprite;
	public static var court_record_evidence_potrait_06_b:FlxSprite;
	public static var court_record_evidence_potrait_07_b:FlxSprite;
	public static var court_record_evidence_potrait_08_b:FlxSprite;
	
	
	//-- Profile Potraits
	public static var court_record_profile_potrait_01_a:FlxSprite;
	public static var court_record_profile_potrait_02_a:FlxSprite;
	public static var court_record_profile_potrait_03_a:FlxSprite;
	public static var court_record_profile_potrait_04_a:FlxSprite;
	public static var court_record_profile_potrait_05_a:FlxSprite;
	public static var court_record_profile_potrait_06_a:FlxSprite;
	public static var court_record_profile_potrait_07_a:FlxSprite;
	public static var court_record_profile_potrait_08_a:FlxSprite;
	
	public static var court_record_profile_potrait_01_b:FlxSprite;
	public static var court_record_profile_potrait_02_b:FlxSprite;
	public static var court_record_profile_potrait_03_b:FlxSprite;
	public static var court_record_profile_potrait_04_b:FlxSprite;
	public static var court_record_profile_potrait_05_b:FlxSprite;
	public static var court_record_profile_potrait_06_b:FlxSprite;
	public static var court_record_profile_potrait_07_b:FlxSprite;
	public static var court_record_profile_potrait_08_b:FlxSprite;
	
	//-- Mouse Overs
	public static var court_record_over_potrait_01:FlxSprite;
	public static var court_record_over_potrait_02:FlxSprite;
	public static var court_record_over_potrait_03:FlxSprite;
	public static var court_record_over_potrait_04:FlxSprite;
	public static var court_record_over_potrait_05:FlxSprite;
	public static var court_record_over_potrait_06:FlxSprite;
	public static var court_record_over_potrait_07:FlxSprite;
	public static var court_record_over_potrait_08:FlxSprite;
	
	//-- Text Assets
	public static var text_court_record_nametag:FlxText;
	public static var text_more_detail_name_01:FlxText;
	public static var text_more_detail_name_02:FlxText;
	public static var text_more_detail_info_01:FlxText;
	public static var text_more_detail_info_02:FlxText;
	public static var text_more_detail_desc:FlxText;
	
	//-- Investigations Variables
	public static var investigation_button_01:FlxSprite;
	public static var investigation_button_02:FlxSprite;
	public static var investigation_button_03:FlxSprite;
	public static var investigation_button_04:FlxSprite;
	
	//-- Lower GUI Elements END
	
	//-- Inventory Update
	public static var temp_investigation_page:Int = 0;
	

	public function new() 
	{
		super();
		
		court_record_background_group = new FlxGroup();
		add(court_record_background_group);
		
		//-- Background
		lower_gui_background = new FlxSprite();
		lower_gui_background.loadGraphic("assets/images/GUI/background/background_lower_menu.png", false, 445, 334, false);
		lower_gui_background.x = 0;
		lower_gui_background.y = 334;
		court_record_background_group.add(lower_gui_background);
		
		investigation_buttons_options_group = new FlxGroup();
		add(investigation_buttons_options_group);
		
		//-- Investigations GUI
		button_investigation_option_01 = new FlxSprite(0, 0);
		button_investigation_option_01.loadGraphic("assets/images/GUI/buttons/button_investigation_options.png", true, 226, 173, false);
		button_investigation_option_01.animation.add("idle", [0], 0, false);
		button_investigation_option_01.animation.add("invisible", [34], 0, false);
		button_investigation_option_01.animation.add("appear", [34, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 50, false);
		button_investigation_option_01.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 34], 50, false);
		button_investigation_option_01.animation.add("hover", [29], 0, false);
		button_investigation_option_01.animation.add("clicked", [29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30], 60, false);
		button_investigation_option_01.x = 0;
		button_investigation_option_01.y = 0;
		investigation_buttons_options_group.add(button_investigation_option_01);
		
		button_investigation_text_01 = new FlxText(0, 0, 211, "Text 1");
		button_investigation_text_01.setFormat(null, 18, 0x7b2900, "center");
		investigation_buttons_options_group.add(button_investigation_text_01);
		
		button_investigation_option_02 = new FlxSprite(0, 0);
		button_investigation_option_02.loadGraphic("assets/images/GUI/buttons/button_investigation_options.png", true, 226, 173, false);
		button_investigation_option_02.animation.add("idle", [0], 0, false);
		button_investigation_option_02.animation.add("invisible", [34], 0, false);
		button_investigation_option_02.animation.add("appear", [34, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 50, false);
		button_investigation_option_02.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 34], 50, false);
		button_investigation_option_02.animation.add("hover", [29], 0, false);
		button_investigation_option_02.animation.add("clicked", [29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30], 60, false);
		button_investigation_option_02.x = 0;
		button_investigation_option_02.y = 0;
		investigation_buttons_options_group.add(button_investigation_option_02);
		
		button_investigation_text_02 = new FlxText(0, 0, 211, "Text 2");
		button_investigation_text_02.setFormat(null, 18, 0x7b2900, "center");
		investigation_buttons_options_group.add(button_investigation_text_02);
		
		button_investigation_option_03 = new FlxSprite(0, 0);
		button_investigation_option_03.loadGraphic("assets/images/GUI/buttons/button_investigation_options.png", true, 226, 173, false);
		button_investigation_option_03.animation.add("idle", [0], 0, false);
		button_investigation_option_03.animation.add("invisible", [34], 0, false);
		button_investigation_option_03.animation.add("appear", [34, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 50, false);
		button_investigation_option_03.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 34], 50, false);
		button_investigation_option_03.animation.add("hover", [29], 0, false);
		button_investigation_option_03.animation.add("clicked", [29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30], 60, false);
		button_investigation_option_03.x = 0;
		button_investigation_option_03.y = 0;
		investigation_buttons_options_group.add(button_investigation_option_03);
		
		button_investigation_text_03 = new FlxText(0, 0, 211, "Text 3");
		button_investigation_text_03.setFormat(null, 18, 0x7b2900, "center");
		investigation_buttons_options_group.add(button_investigation_text_03);
		
		button_investigation_option_04 = new FlxSprite(0, 0);
		button_investigation_option_04.loadGraphic("assets/images/GUI/buttons/button_investigation_options.png", true, 226, 173, false);
		button_investigation_option_04.animation.add("idle", [0], 0, false);
		button_investigation_option_04.animation.add("invisible", [34], 0, false);
		button_investigation_option_04.animation.add("appear", [34, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 50, false);
		button_investigation_option_04.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 34], 50, false);
		button_investigation_option_04.animation.add("hover", [29], 0, false);
		button_investigation_option_04.animation.add("clicked", [29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30, 29, 29, 29, 30, 30, 30], 60, false);
		button_investigation_option_04.x = 0;
		button_investigation_option_04.y = 0;
		investigation_buttons_options_group.add(button_investigation_option_04);
		
		button_investigation_text_04 = new FlxText(0, 0, 211, "Text 4");
		button_investigation_text_04.setFormat(null, 18, 0x7b2900, "center");
		investigation_buttons_options_group.add(button_investigation_text_04);
		
		court_record_container_group = new FlxGroup();
		add(court_record_container_group);
		
		//-- Court Records Content
		container_court_record_02 = new FlxSprite(0, 0);
		container_court_record_02.loadGraphic("assets/images/GUI/containers/container_evidence_grid.png", true, 445, 183, false);
		container_court_record_02.animation.add("appear", [27, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false);
		container_court_record_02.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27], 100,false);
		container_court_record_02.animation.add("idle", [0], 0, false);
		container_court_record_02.animation.add("invisible", [27], 0, false);
		container_court_record_02.x = 445;
		container_court_record_02.y = 425;
		court_record_container_group.add(container_court_record_02);
		
		container_court_record_01 = new FlxSprite(0, 0);
		container_court_record_01.loadGraphic("assets/images/GUI/containers/container_evidence_grid.png", true, 445, 183, false);
		container_court_record_01.animation.add("appear", [27, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false);
		container_court_record_01.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27], 100,false);
		container_court_record_01.animation.add("idle", [0], 0, false);
		container_court_record_01.animation.add("invisible", [27], 0, false);
		container_court_record_01.animation.callback = container_court_record;
		container_court_record_01.x = 0;
		container_court_record_01.y = 425;
		court_record_container_group.add(container_court_record_01);			
		
		container_name_tag = new FlxSprite(0, 0);
		container_name_tag.loadGraphic("assets/images/GUI/containers/container_name_tag.png", false, 359, 26, false);
		container_name_tag.x = 43;
		container_name_tag.y = 308;
		//container_name_tag.y = 399;
		court_record_container_group.add(container_name_tag);
		
		text_court_record_nametag = new FlxText(47, 401, 353, "");
		text_court_record_nametag.setFormat("assets/fonts/Ace-Attorney.ttf", 19, 0xe9b732, "center");
		court_record_container_group.add(text_court_record_nametag);
		
		court_record_grid_pic_group = new FlxGroup();
		add(court_record_grid_pic_group);
		
		//-- Evidence Potraits			
		court_record_evidence_potrait_01_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_01_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_01_b.x = 509;
		//court_record_evidence_potrait_01_b.x = 64;
		court_record_evidence_potrait_01_b.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_01_b);
		
		court_record_evidence_potrait_02_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_02_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_02_b.x = 593;
		//court_record_evidence_potrait_02_b.x = 148;
		court_record_evidence_potrait_02_b.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_02_b);
		
		court_record_evidence_potrait_03_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_03_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_03_b.x = 676;
		//court_record_evidence_potrait_03_b.x = 231;
		court_record_evidence_potrait_03_b.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_03_b);
		
		court_record_evidence_potrait_04_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_04_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_04_b.x = 760;
		//court_record_evidence_potrait_04_b.x = 315;
		court_record_evidence_potrait_04_b.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_04_b);
		
		court_record_evidence_potrait_05_b = new FlxSprite(0, 0);			
		court_record_evidence_potrait_05_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_05_b.x = 509;
		//court_record_evidence_potrait_05_b.x = 64;
		court_record_evidence_potrait_05_b.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_05_b);
		
		court_record_evidence_potrait_06_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_06_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_06_b.x = 593;
		//court_record_evidence_potrait_06_b.x = 148;
		court_record_evidence_potrait_06_b.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_06_b);
		
		court_record_evidence_potrait_07_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_07_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_07_b.x = 676;
		//court_record_evidence_potrait_07_b.x = 231;
		court_record_evidence_potrait_07_b.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_07_b);
		
		court_record_evidence_potrait_08_b = new FlxSprite(0, 0);
		court_record_evidence_potrait_08_b.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_08_b.x = 760;
		//court_record_evidence_potrait_08_b.x = 315;
		court_record_evidence_potrait_08_b.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_08_b);
		
		court_record_evidence_potrait_01_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_01_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_01_a.x = 64;
		court_record_evidence_potrait_01_a.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_01_a);
		
		court_record_evidence_potrait_02_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_02_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_02_a.x = 148;
		court_record_evidence_potrait_02_a.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_02_a);
		
		court_record_evidence_potrait_03_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_03_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_03_a.x = 231;
		court_record_evidence_potrait_03_a.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_03_a);
		
		court_record_evidence_potrait_04_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_04_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_04_a.x = 315;
		court_record_evidence_potrait_04_a.y = 443;
		court_record_grid_pic_group.add(court_record_evidence_potrait_04_a);
		
		court_record_evidence_potrait_05_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_05_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_05_a.x = 64;
		court_record_evidence_potrait_05_a.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_05_a);
		
		court_record_evidence_potrait_06_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_06_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_06_a.x = 148;
		court_record_evidence_potrait_06_a.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_06_a);
		
		court_record_evidence_potrait_07_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_07_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_07_a.x = 231;
		court_record_evidence_potrait_07_a.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_07_a);
		
		court_record_evidence_potrait_08_a = new FlxSprite(0, 0);
		court_record_evidence_potrait_08_a.loadGraphic("assets/images/GUI/evidence/small/evidence_grid_spritesheet.png", true, 66, 66, false);
		court_record_evidence_potrait_08_a.x = 315;
		court_record_evidence_potrait_08_a.y = 528;
		court_record_grid_pic_group.add(court_record_evidence_potrait_08_a);
		
		//-- Profile Potraits
		court_record_profile_potrait_01_b = new FlxSprite(0, 0);
		court_record_profile_potrait_01_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_01_b.x = 509;
		//court_record_profile_potrait_01_b.x = 64;
		court_record_profile_potrait_01_b.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_01_b);
		
		court_record_profile_potrait_02_b = new FlxSprite(0, 0);
		court_record_profile_potrait_02_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_02_b.x = 593;
		//court_record_profile_potrait_02_b.x = 148;
		court_record_profile_potrait_02_b.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_02_b);
		
		court_record_profile_potrait_03_b = new FlxSprite(0, 0);
		court_record_profile_potrait_03_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_03_b.x = 676;
		//court_record_profile_potrait_03_b.x = 231;
		court_record_profile_potrait_03_b.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_03_b);
		
		court_record_profile_potrait_04_b = new FlxSprite(0, 0);
		court_record_profile_potrait_04_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_04_b.x = 760;
		//court_record_profile_potrait_04_b.x = 315;
		court_record_profile_potrait_04_b.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_04_b);
		
		court_record_profile_potrait_05_b = new FlxSprite(0, 0);
		court_record_profile_potrait_05_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_05_b.x = 509;
		//court_record_profile_potrait_05_b.x = 64;
		court_record_profile_potrait_05_b.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_05_b);
		
		court_record_profile_potrait_06_b = new FlxSprite(0, 0);
		court_record_profile_potrait_06_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_06_b.x = 593;
		//court_record_profile_potrait_06_b.x = 148;
		court_record_profile_potrait_06_b.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_06_b);
		
		court_record_profile_potrait_07_b = new FlxSprite(0, 0);
		court_record_profile_potrait_07_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_07_b.x = 676;
		//court_record_profile_potrait_07_b.x = 231;
		court_record_profile_potrait_07_b.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_07_b);
		
		court_record_profile_potrait_08_b = new FlxSprite(0, 0);
		court_record_profile_potrait_08_b.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_08_b.x = 760;
		//court_record_profile_potrait_08_b.x = 315;
		court_record_profile_potrait_08_b.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_08_b);
		
		court_record_profile_potrait_01_a = new FlxSprite(0, 0);
		court_record_profile_potrait_01_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_01_a.x = 64;
		court_record_profile_potrait_01_a.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_01_a);
		
		court_record_profile_potrait_02_a = new FlxSprite(0, 0);
		court_record_profile_potrait_02_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_02_a.x = 148;
		court_record_profile_potrait_02_a.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_02_a);
		
		court_record_profile_potrait_03_a = new FlxSprite(0, 0);
		court_record_profile_potrait_03_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_03_a.x = 231;
		court_record_profile_potrait_03_a.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_03_a);
		
		court_record_profile_potrait_04_a = new FlxSprite(0, 0);
		court_record_profile_potrait_04_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_04_a.x = 315;
		court_record_profile_potrait_04_a.y = 443;
		court_record_grid_pic_group.add(court_record_profile_potrait_04_a);
		
		court_record_profile_potrait_05_a = new FlxSprite(0, 0);
		court_record_profile_potrait_05_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_05_a.x = 64;
		court_record_profile_potrait_05_a.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_05_a);
		
		court_record_profile_potrait_06_a = new FlxSprite(0, 0);
		court_record_profile_potrait_06_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_06_a.x = 148;
		court_record_profile_potrait_06_a.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_06_a);
		
		court_record_profile_potrait_07_a = new FlxSprite(0, 0);
		court_record_profile_potrait_07_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_07_a.x = 231;
		court_record_profile_potrait_07_a.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_07_a);
		
		court_record_profile_potrait_08_a = new FlxSprite(0, 0);
		court_record_profile_potrait_08_a.loadGraphic("assets/images/GUI/profile/small/profile_grid_spritesheet.png", true, 66, 66, false);
		court_record_profile_potrait_08_a.x = 315;
		court_record_profile_potrait_08_a.y = 528;
		court_record_grid_pic_group.add(court_record_profile_potrait_08_a);
		
		//-- Mouse Over Court Records Potraits
		
		court_record_over_potrait_01 = new FlxSprite(0, 0);
		court_record_over_potrait_01.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_01.animation.add("over", [1]);
		court_record_over_potrait_01.animation.add("idle", [0]);
		court_record_over_potrait_01.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_01.x = 64;
		court_record_over_potrait_01.y = 443;
		court_record_grid_pic_group.add(court_record_over_potrait_01);
		
		court_record_over_potrait_02 = new FlxSprite(0, 0);
		court_record_over_potrait_02.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_02.animation.add("over", [1]);
		court_record_over_potrait_02.animation.add("idle", [0]);
		court_record_over_potrait_02.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_02.x = 148;
		court_record_over_potrait_02.y = 443;
		court_record_grid_pic_group.add(court_record_over_potrait_02);
		
		court_record_over_potrait_03 = new FlxSprite(0, 0);
		court_record_over_potrait_03.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_03.animation.add("over", [1]);
		court_record_over_potrait_03.animation.add("idle", [0]);
		court_record_over_potrait_03.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_03.x = 231;
		court_record_over_potrait_03.y = 443;
		court_record_grid_pic_group.add(court_record_over_potrait_03);
		
		court_record_over_potrait_04 = new FlxSprite(0, 0);
		court_record_over_potrait_04.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_04.animation.add("over", [1]);
		court_record_over_potrait_04.animation.add("idle", [0]);
		court_record_over_potrait_04.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_04.x = 315;
		court_record_over_potrait_04.y = 443;
		court_record_grid_pic_group.add(court_record_over_potrait_04);

		court_record_over_potrait_05 = new FlxSprite(0, 0);
		court_record_over_potrait_05.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_05.animation.add("over", [1]);
		court_record_over_potrait_05.animation.add("idle", [0]);
		court_record_over_potrait_05.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_05.x = 64;
		court_record_over_potrait_05.y = 528;
		court_record_grid_pic_group.add(court_record_over_potrait_05);
		
		court_record_over_potrait_06 = new FlxSprite(0, 0);
		court_record_over_potrait_06.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_06.animation.add("over", [1]);
		court_record_over_potrait_06.animation.add("idle", [0]);
		court_record_over_potrait_06.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_06.x = 148;
		court_record_over_potrait_06.y = 528;
		court_record_grid_pic_group.add(court_record_over_potrait_06);

		court_record_over_potrait_07 = new FlxSprite(0, 0);
		court_record_over_potrait_07.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_07.animation.add("over", [1]);
		court_record_over_potrait_07.animation.add("idle", [0]);
		court_record_over_potrait_07.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_07.x = 231;
		court_record_over_potrait_07.y = 528;
		court_record_grid_pic_group.add(court_record_over_potrait_07);
		
		court_record_over_potrait_08 = new FlxSprite(0, 0);
		court_record_over_potrait_08.loadGraphic("assets/images/GUI/containers/container_mouse_over.png", true, 66, 66, false);
		court_record_over_potrait_08.animation.add("over", [1]);
		court_record_over_potrait_08.animation.add("idle", [0]);
		court_record_over_potrait_08.animation.add("flash", [0, 1, 0, 1, 0, 1, 0, 1], 10, false);
		court_record_over_potrait_08.x = 315;
		court_record_over_potrait_08.y = 528;
		court_record_grid_pic_group.add(court_record_over_potrait_08);
		
		//-- Court Record Navigations
		button_big_left_scroll = new FlxSprite(0, 0);
		button_big_left_scroll.loadGraphic("assets/images/GUI/buttons/button_evidence_big_scroll_left.png", true, 27, 163, false);
		button_big_left_scroll.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_big_left_scroll.x = -27;
		//button_big_left_scroll.x = 2;
		button_big_left_scroll.y = 426;
		court_record_grid_pic_group.add(button_big_left_scroll);
		
		button_big_right_scroll = new FlxSprite(0, 0);
		button_big_right_scroll.loadGraphic("assets/images/GUI/buttons/button_evidence_big_scroll_right.png", true, 27, 163, false);
		button_big_right_scroll.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_big_right_scroll.x = 472;
		//button_big_right_scroll.x = 416;
		button_big_right_scroll.y = 426;
		court_record_grid_pic_group.add(button_big_right_scroll);
		
		court_record_more_detail_group = new FlxGroup();
		add(court_record_more_detail_group);
		
		container_more_detail_box = new FlxSprite(0, 0);
		container_more_detail_box.makeGraphic(426, 58, 0xFF847441, false);
		container_more_detail_box.x = 455;
		//container_more_detail_box.x = 10;
		container_more_detail_box.y = 492;
		//container_more_detail_box.y = 550;
		court_record_more_detail_group.add(container_more_detail_box);
		
		container_more_detail_02 = new FlxSprite(0, 0);
		container_more_detail_02.loadGraphic("assets/images/GUI/containers/container_evidence_more_detail.png", true, 445, 151, false);
		container_more_detail_02.animation.add("appear", [27, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false );
		container_more_detail_02.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27], 100, false );
		container_more_detail_02.animation.add("invisible", [27], 0, false );
		container_more_detail_02.animation.add("idleappear", [15], 0, false );
		container_more_detail_02.animation.add("idle", [0], 0, false );
		container_more_detail_02.x = 445;
		//container_more_detail_02.x = 0;
		container_more_detail_02.y = 399;
		court_record_more_detail_group.add(container_more_detail_02);
		
		container_image_show_02 = new FlxSprite(0, 0);
		container_image_show_02.loadGraphic("assets/images/GUI/containers/container_image_show.png", true, 117, 118, false);
		container_image_show_02.animation.add("appear", [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false );
		container_image_show_02.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 100, false );
		container_image_show_02.animation.add("invisible", [15], 0, false );
		container_image_show_02.animation.add("idle", [0], 0, false );
		container_image_show_02.width = 562;
		//container_image_show_02.width = 117;
		container_image_show_02.height = 118;
		container_image_show_02.x = 473;
		//container_image_show_02.x = 28;
		container_image_show_02.y = 415;
		court_record_more_detail_group.add(container_image_show_02);
		
		container_more_detail_01 = new FlxSprite(0, 0);
		container_more_detail_01.loadGraphic("assets/images/GUI/containers/container_evidence_more_detail.png", true, 445, 151, false);
		container_more_detail_01.animation.add("appear", [27, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false );
		container_more_detail_01.animation.add("disappear", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27], 100, false );
		container_more_detail_01.animation.add("invisible", [27], 0, false );
		container_more_detail_01.animation.add("idleappear", [15], 0, false );
		container_more_detail_01.animation.add("idle", [0], 0, false );
		container_more_detail_01.animation.callback = more_detail;
		container_more_detail_01.x = 445;
		//container_more_detail_01.x = 0;
		container_more_detail_01.y = 399;
		court_record_more_detail_group.add(container_more_detail_01);
		
		container_image_show_01 = new FlxSprite(0, 0);
		container_image_show_01.loadGraphic("assets/images/GUI/containers/container_image_show.png", true, 117, 118, false);
		container_image_show_01.animation.add("appear", [15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false );
		container_image_show_01.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 100, false );			
		container_image_show_01.animation.add("invisible", [15], 0, false );
		container_image_show_01.animation.add("idle", [0], 0, false );
		container_image_show_01.animation.callback = image_show;
		container_image_show_01.width = 562;
		//container_image_show_01.width = 117;
		container_image_show_01.height = 118;
		container_image_show_01.x = 473;
		//container_image_show_01.x = 28;
		container_image_show_01.y = 416;
		court_record_more_detail_group.add(container_image_show_01);
		
		//-- Potraits on more details
		more_detail_potrait_evidence_01 = new FlxSprite(0, 0);
		more_detail_potrait_evidence_01.loadGraphic("assets/images/GUI/evidence/large/evidence_grid_spritesheet.png", true, 102, 102, false);
		more_detail_potrait_evidence_01.animation.add("invisible", [0], 0, false);
		more_detail_potrait_evidence_01.x = 36;
		more_detail_potrait_evidence_01.y = 429;
		court_record_more_detail_group.add(more_detail_potrait_evidence_01);
		
		
		more_detail_potrait_evidence_02 = new FlxSprite(0, 0);
		more_detail_potrait_evidence_02.loadGraphic("assets/images/GUI/evidence/large/evidence_grid_spritesheet.png", true, 102, 102, false);
		more_detail_potrait_evidence_02.animation.add("invisible", [0], 0, false);
		more_detail_potrait_evidence_02.x = 36;
		more_detail_potrait_evidence_02.y = 429;
		court_record_more_detail_group.add(more_detail_potrait_evidence_02);
		
		more_detail_potrait_profile_01 = new FlxSprite(0, 0);
		more_detail_potrait_profile_01.loadGraphic("assets/images/GUI/profile/large/profile_grid_spritesheet.png", true, 102, 102, false);
		more_detail_potrait_profile_01.animation.add("invisible", [0], 0, false);
		more_detail_potrait_profile_01.x = 36;
		more_detail_potrait_profile_01.y = 429;
		court_record_more_detail_group.add(more_detail_potrait_profile_01);
		
		more_detail_potrait_profile_02 = new FlxSprite(0, 0);
		more_detail_potrait_profile_02.loadGraphic("assets/images/GUI/profile/large/profile_grid_spritesheet.png", true, 102, 102, false);
		more_detail_potrait_profile_02.animation.add("invisible", [0], 0, false);
		more_detail_potrait_profile_02.x = 36;
		more_detail_potrait_profile_02.y = 429;
		court_record_more_detail_group.add(more_detail_potrait_profile_02);
		
		//-- Text more evidence
		text_more_detail_name_01 = new FlxText(155, 421, 256, "");
		text_more_detail_name_01.setFormat("assets/fonts/Ace-Attorney.ttf", 24, 0xe9b732, "center");
		court_record_more_detail_group.add(text_more_detail_name_01);
		
		text_more_detail_info_01 = new FlxText(160, 457, 251, "");
		text_more_detail_info_01.setFormat("assets/fonts/Ace-Attorney.ttf", 20, 0x353434, "left",1, 0x5e5c5c);
		court_record_more_detail_group.add(text_more_detail_info_01);
		
		text_more_detail_name_02 = new FlxText(600, 421, 256, "");
		text_more_detail_name_02.setFormat("assets/fonts/Ace-Attorney.ttf", 24, 0xe9b732, "center");
		court_record_more_detail_group.add(text_more_detail_name_02);
		
		text_more_detail_info_02 = new FlxText(605, 457, 251, "");
		text_more_detail_info_02.setFormat("assets/fonts/Ace-Attorney.ttf", 20, 0x353434, "left", 1,0x5e5c5c);
		court_record_more_detail_group.add(text_more_detail_info_02);
		
		text_more_detail_desc = new FlxText(23, 547, 405, "");
		text_more_detail_desc.setFormat("assets/fonts/Ace-Attorney.ttf", 20, 0xffffff, "left");
		court_record_more_detail_group.add(text_more_detail_desc);
		
		button_container_left = new FlxSprite(0, 0);
		button_container_left.loadGraphic("assets/images/GUI/buttons/button_evidence_small_scroll_left.png", false, 27, 118, false);
		button_container_left.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_container_left.width = 27;
		button_container_left.height = 118;
		button_container_left.x = 0;
		button_container_left.y = 415;
		court_record_more_detail_group.add(button_container_left);
		
		button_container_right = new FlxSprite(0, 0);
		button_container_right.loadGraphic("assets/images/GUI/buttons/button_evidence_small_scroll_right.png", false, 27, 118, false);
		button_container_right.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_container_right.width = 27;
		button_container_right.height = 118;
		button_container_right.x = 418;
		button_container_right.y = 415;
		court_record_more_detail_group.add(button_container_right);
		
		container_more_detail_border_02 = new FlxSprite(0, 0);
		container_more_detail_border_02.loadGraphic("assets/images/GUI/containers/container_evidence_more_detail_border.png", false, 445, 151, false);
		container_more_detail_border_02.x = 445;
		//container_more_detail_border_02.x = 0;
		container_more_detail_border_02.y = 399;
		court_record_more_detail_group.add(container_more_detail_border_02);
		
		container_more_detail_border_01 = new FlxSprite(0, 0);
		container_more_detail_border_01.loadGraphic("assets/images/GUI/containers/container_evidence_more_detail_border.png", false, 445, 151, false);
		container_more_detail_border_01.x = 445;
		//container_more_detail_border_01.x = 0;
		container_more_detail_border_01.y = 399;
		court_record_more_detail_group.add(container_more_detail_border_01);
		
		court_record_main_menu = new FlxGroup();
		add(court_record_main_menu);
		
		arrow_head_right = new FlxSprite(424, 499, "assets/images/GUI/containers/arrow_head_right.png");
		court_record_main_menu.add(arrow_head_right);
		
		arrow_head_left = new FlxSprite(9, 499, "assets/images/GUI/containers/arrow_head_left.png");
		court_record_main_menu.add(arrow_head_left);
		
		//-- Main Conversations
		button_main_conversation = new FlxSprite(0, 0);
		button_main_conversation.loadGraphic("assets/images/GUI/buttons/button_main_conversations_cilan.png", true, 445, 329, false);
		button_main_conversation.animation.add("appear", [38, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false);
		button_main_conversation.animation.add("disappear", [20 , 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38], 100, false);
		button_main_conversation.animation.add("idle", [0], 0, false);
		button_main_conversation.animation.add("invisible", [38], 0, false);
		button_main_conversation.animation.add("pressed", [0, 40, 40, 40, 0], 50, false);
		button_main_conversation.animation.callback = button_main_anim_controller;
		button_main_conversation.x = 0;
		button_main_conversation.y = 332;
		court_record_main_menu.add(button_main_conversation);
		
		arrow_main_conversation = new FlxSprite(0, 0);
		arrow_main_conversation.loadGraphic("assets/images/GUI/containers/arrow_main_conversation.png", false, 48, 57, false);
		arrow_main_conversation.x = 199;
		arrow_main_conversation.y = 469;
		court_record_main_menu.add(arrow_main_conversation);
		
		
		investigation_buttons_group = new FlxGroup();
		add(investigation_buttons_group);
		
		//--- Manfred Von Karma:LA LA LA INVESTIGATION!
		investigation_button_01 = new FlxSprite(0, 0);
		investigation_button_01.loadGraphic("assets/images/GUI/buttons/button_investigations.png", true, 253, 198, false);
		investigation_button_01.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 46], 80, false);
		investigation_button_01.animation.add("appear", [46, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15], 80, false);
		investigation_button_01.animation.add("pressedspin", [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 46], 80, false);
		investigation_button_01.animation.add("invisible", [46], 0, false);
		investigation_button_01.animation.add("pressed", [45], 0, false);
		//investigation_button_01.origin.x = 225;
		investigation_button_01.x = -18;
		investigation_button_01.y = 354;
		investigation_buttons_group.add(investigation_button_01);
		
		investigation_button_02 = new FlxSprite(0, 0);
		investigation_button_02.loadGraphic("assets/images/GUI/buttons/button_investigations.png", true, 253, 198, false);
		investigation_button_02.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 46], 80, false);
		investigation_button_02.animation.add("appear", [46, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15], 80, false);
		investigation_button_02.animation.add("pressedspin", [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 46], 80, false);
		investigation_button_02.animation.add("invisible", [46], 0, false);
		investigation_button_02.animation.add("pressed", [45], 0, false);
		//investigation_button_02.origin.x = 225;
		investigation_button_02.x = -18;
		investigation_button_02.y = 454;
		investigation_buttons_group.add(investigation_button_02);
		
		investigation_button_03 = new FlxSprite(0, 0);
		investigation_button_03.loadGraphic("assets/images/GUI/buttons/button_investigations.png", true, 253, 198, false);
		investigation_button_03.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 46], 80, false);
		investigation_button_03.animation.add("appear", [46, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15], 80, false);
		investigation_button_03.animation.add("pressedspin", [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 46], 80, false);
		investigation_button_03.animation.add("invisible", [46], 0, false);
		investigation_button_03.animation.add("pressed", [45], 0, false);
		investigation_button_03.x = 210;
		investigation_button_03.y = 354;
		add(investigation_button_03);
		
		investigation_button_04 = new FlxSprite(0, 0);
		investigation_button_04.loadGraphic("assets/images/GUI/buttons/button_investigations.png", true, 253, 198, false);
		investigation_button_04.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 46], 80, false);
		investigation_button_04.animation.add("appear", [46, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15], 80, false);
		investigation_button_04.animation.add("pressedspin", [30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 46], 80, false);
		investigation_button_04.animation.add("invisible", [46], 0, false);
		investigation_button_04.animation.add("pressed", [45], 0, false);
		//investigation_button_04.origin.x = 225;
		investigation_button_04.x = 210;
		investigation_button_04.y = 454;
		investigation_buttons_group.add(investigation_button_04);
		
		//-- Scanlines
		//lower_scanlines = new FlxSprite(0, 0);
		//lower_scanlines.loadGraphic("assets/images/GUI/background/scanlines.png", false, false, 446, 335, false);
		//lower_scanlines.x = 0;
		//lower_scanlines.y = 334;
		//add(lower_scanlines);
		
		court_record_border_group = new FlxGroup();		
		add(court_record_border_group);
		
		//-- Borders
		
		border_tag_evidence = new FlxSprite(0, 0);
		border_tag_evidence.loadGraphic("assets/images/GUI/borders/border_tag_evidence.png", false, 445, 59, false);
		border_tag_evidence.x = 0;
		border_tag_evidence.y = 275;
		//border_tag_evidence.y = 334;
		court_record_border_group.add(border_tag_evidence);
		
		border_tag_profiles = new FlxSprite(0, 0);
		border_tag_profiles.loadGraphic("assets/images/GUI/borders/border_tag_profiles.png", false, 445, 59, false);
		border_tag_profiles.x = 0;
		border_tag_profiles.y = 275;
		//border_tag_profiles.y = 334;
		court_record_border_group.add(border_tag_profiles);
		
		border_normal_upper = new FlxSprite(0, 0);
		border_normal_upper.loadGraphic("assets/images/GUI/borders/border_upper.png", false, 445, 59, false);
		border_normal_upper.x = 0;
		border_normal_upper.y = 334;
		court_record_border_group.add(border_normal_upper);
		
		border_normal_lower = new FlxSprite(0, 0);
		border_normal_lower.loadGraphic("assets/images/GUI/borders/border_lower.png", false, 445, 59, false);
		border_normal_lower.x = 0;
		border_normal_lower.y = 609;
		court_record_border_group.add(border_normal_lower);
		
		border_advance_upper = new FlxSprite(0, 0);
		border_advance_upper.loadGraphic("assets/images/GUI/borders/border_advance.png", false, 445, 59, false);
		border_advance_upper.x = 0;
		border_advance_upper.y = 334;
		court_record_border_group.add(border_advance_upper);
		
		border_default_advance_upper = new FlxSprite(0, 0);
		border_default_advance_upper.loadGraphic("assets/images/GUI/borders/border_default_upper_advance.png");
		border_default_advance_upper.x = 0;
		border_default_advance_upper.y = 334;
		court_record_border_group.add(border_default_advance_upper);
		
		border_default_advance_lower = new FlxSprite(0, 0);
		border_default_advance_lower.loadGraphic("assets/images/GUI/borders/border_default_lower_advance.png");
		border_default_advance_lower.x = 0;
		border_default_advance_lower.y = 609;
		court_record_border_group.add(border_default_advance_lower);
		
		//-- Upper Buttons
		button_back = new FlxSprite(0, 0);
		button_back.loadGraphic("assets/images/GUI/buttons/button_back.png", true, 136, 56, false);
		button_back.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_back.x = 0;
		button_back.y = 724;
		//button_back.y = 609;
		court_record_border_group.add(button_back);
		
		button_court_record = new FlxSprite(0, 0);
		button_court_record.loadGraphic("assets/images/GUI/buttons/button_court_record.png", true, 136, 56, false);
		button_court_record.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_court_record.x = 309;
		button_court_record.y = 278;
		court_record_border_group.add(button_court_record);
		
		button_present_record = new FlxSprite(0, 0);
		button_present_record.loadGraphic("assets/images/GUI/buttons/button_present_record.png", true, 140, 58, false);
		button_present_record.animation.add("idle", [0], 0, false);
		button_present_record.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_present_record.animation.add("disabled", [2], 0, false);
		button_present_record.x = 153;
		button_present_record.y = 278;
		court_record_border_group.add(button_present_record);
		
		button_evidence = new FlxSprite(0, 0);
		button_evidence.loadGraphic("assets/images/GUI/buttons/button_evidence.png", true, 136, 56, false);
		button_evidence.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_evidence.x = 309;
		button_evidence.y = 278;
		//button_evidence.y = 334;
		court_record_border_group.add(button_evidence);
		
		button_profiles = new FlxSprite(0, 0);
		button_profiles.loadGraphic("assets/images/GUI/buttons/button_profile.png", true, 136, 56, false);
		button_profiles.animation.add("pressed", [0, 1, 1, 1, 0], 50, false);
		button_profiles.x = 309;
		button_profiles.y = 278;
		//button_profiles.y = 334;
		court_record_border_group.add(button_profiles);
		
		//-- Putting some assets to their original states
		button_investigation_option_01.animation.play("invisible");
		button_investigation_option_02.animation.play("invisible");
		button_investigation_option_03.animation.play("invisible");
		button_investigation_option_04.animation.play("invisible");
		
		container_court_record_02.animation.play("idle");
		container_court_record_01.animation.play("invisible");
		
		container_image_show_02.animation.play("invisible");
		container_image_show_01.animation.play("invisible");
		
		button_main_conversation.animation.play("idle");
		
		investigation_button_01.facing = 1;
		investigation_button_02.facing = 1;
		investigation_button_03.facing = 0;
		investigation_button_04.facing = 0;
		
		investigation_button_01.animation.play("invisible");
		investigation_button_02.animation.play("invisible");
		investigation_button_03.animation.play("invisible");
		investigation_button_04.animation.play("invisible");
		
		//-- Letting all the object disappear to check 
		
		court_record_main_menu.setAll("alive", false);
		court_record_main_menu.setAll("exists", false);
		
		court_record_background_group.setAll("alive", false);
		court_record_background_group.setAll("exists", false);
		
		court_record_border_group.setAll("alive", false);
		court_record_border_group.setAll("exists", false);
		
		court_record_grid_pic_group.setAll("alive", false);
		court_record_grid_pic_group.setAll("exists", false);
		
		court_record_container_group.setAll("alive", false);
		court_record_container_group.setAll("exists", false);
		
		court_record_more_detail_group.setAll("alive", false);
		court_record_more_detail_group.setAll("exists", false);
		
		investigation_buttons_group.setAll("alive", false);
		investigation_buttons_group.setAll("exists", false);
		
		investigation_buttons_options_group.setAll("alive", false);
		investigation_buttons_options_group.setAll("exists", false);
	}
	
	public static function button_main_anim_controller(anim_name:String, frame_number:Int, frame_index:Int):Void
	{
		if (anim_name == "appear" && frame_index == 1 && ScriptConversations.conversation_current_inventory_update == "")
		{
			LowerGUI.arrow_main_conversation.alive = true;
			LowerGUI.arrow_main_conversation.exists = true;
		}
		
		if (anim_name == "disappear" && ScriptConversations.conversation_current_inventory_update != "")
		{
			temp_investigation_page = 0;
			
			if (ScriptCourtRecords.evidence_inventory.length > 0)
			{
				//-- Counting page
				temp_investigation_page = Std.int((ScriptConversations.temp_new_item_index / 8) + 1);
			}
			
			//-- Letting it appear for ultimate shit
			
			if (LowerGUI.container_court_record_01.alive == false)
			{
				LowerGUI.container_court_record_01.alive = true;
				LowerGUI.container_court_record_01.exists = true;
			}
			
			if (LowerGUI.container_name_tag.alive == false)
			{
				LowerGUI.container_name_tag.alive = true;
				LowerGUI.container_name_tag.exists = true;
			}
			
			LowerGUI.container_court_record_01.animation.play("appear");
			FlxTween.linearMotion(LowerGUI.container_name_tag, ScriptCourtRecords.container_name_tag_inactive_x, ScriptCourtRecords.container_name_tag_inactive_y, ScriptCourtRecords.container_name_tag_active_x, ScriptCourtRecords.container_name_tag_active_y, 0.1, true);
		}
	}
	
	public static function container_court_record(anim_name:String, frame_number:Int, frame_index:Int):Void
	{
		if (anim_name == "appear" && frame_index == 1 && ScriptConversations.conversation_current_inventory_update != "")
		{
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
			
			ScriptConversations.conversation_timer.start();
			ScriptCourtRecords.next_page_detection_inventory_update();
		}
		else if (anim_name == "appear" && frame_index == 1)
		{
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
			
			ScriptCourtRecords.next_page_detection_01();
			
			ScriptMouseChecks.halt_mouse_trigger = 0;
		}
		else if (anim_name == "disappear" && ScriptMouseChecks.halt_mouse_trigger == 2 && frame_index == 26)
		{
			
		}
	}
	
	public static function image_show(anim_name:String, frame_number:Int, frame_index:Int):Void
	{
		if (anim_name == "appear" && frame_index == 1)
		{
			if (border_tag_evidence.alive == true)
			{
				more_detail_potrait_evidence_01.alive = true;
				more_detail_potrait_evidence_01.exists = true;
				more_detail_potrait_evidence_01.animation.play(ScriptCourtRecords.current_picked_evidence);
				
				var gathering_evidence_info:Int = 0;
				
				while (DatabaseVariablesEvidence.item_id[gathering_evidence_info] != null)
				{
					if (DatabaseVariablesEvidence.item_animation_name[gathering_evidence_info] == ScriptCourtRecords.current_picked_evidence)
					{
						text_more_detail_name_01.alive = true;
						text_more_detail_info_01.alive = true;
						text_more_detail_desc.alive = true;
						
						text_more_detail_name_01.exists = true;
						text_more_detail_info_01.exists = true;
						text_more_detail_desc.exists = true;
						
						text_more_detail_name_01.text = DatabaseVariablesEvidence.item_name[gathering_evidence_info];
						text_more_detail_info_01.text = "Type: " + DatabaseVariablesEvidence.item_type[gathering_evidence_info] + "\n" +DatabaseVariablesEvidence.item_from[gathering_evidence_info];
						text_more_detail_desc.text = DatabaseVariablesEvidence.item_description[gathering_evidence_info];
					}
					
					gathering_evidence_info++;
				}
				
				if (ScriptCourtRecords.evidence_inventory.length > 0)
				{
					arrow_head_left.alive = true;
					arrow_head_left.exists = true;
					
					arrow_head_right.alive = true;
					arrow_head_right.exists = true;
					
					arrow_head_left.y = 464;
					arrow_head_right.y = 464;
				}
				
				ScriptMouseChecks.halt_mouse_trigger = 0;
			}
			else if (border_tag_profiles.alive == true)
			{
				more_detail_potrait_profile_01.alive = true;
				more_detail_potrait_profile_01.exists = true;
				more_detail_potrait_profile_01.animation.play(ScriptCourtRecords.current_picked_profiles);
				
				var gathering_profile_info:Int = 0;
				
				while (DatabaseVariablesProfiles.npc_name[gathering_profile_info] != null)
				{
					if (DatabaseVariablesProfiles.npc_id[gathering_profile_info] == ScriptCourtRecords.current_picked_profiles)
					{
						text_more_detail_name_01.alive = true;
						text_more_detail_info_01.alive = true;
						text_more_detail_desc.alive = true;
						
						text_more_detail_name_01.exists = true;
						text_more_detail_info_01.exists = true;
						text_more_detail_desc.exists = true;
						
						text_more_detail_name_01.text = DatabaseVariablesProfiles.npc_name[gathering_profile_info];
						text_more_detail_info_01.text = "Age: " + DatabaseVariablesProfiles.npc_age[gathering_profile_info] + "\n Gender: " + DatabaseVariablesProfiles.npc_gender[gathering_profile_info];
						text_more_detail_desc.text = DatabaseVariablesProfiles.npc_description[gathering_profile_info];
					}
					
					gathering_profile_info++;
				}
				
				if (ScriptCourtRecords.profile_inventory.length > 0)
				{
					arrow_head_left.alive = true;
					arrow_head_left.exists = true;
					
					arrow_head_right.alive = true;
					arrow_head_right.exists = true;
					
					arrow_head_left.y = 464;
					arrow_head_right.y = 464;
				}
				
				ScriptMouseChecks.halt_mouse_trigger = 0;
			}
		}
	}
	
	public static function more_detail(anim_name:String, frame_number:Int, frame_index:Int):Void
	{
		if (anim_name == "disappear" && LowerGUI.container_more_detail_01.alive == true && frame_index == 26)
		{
			LowerGUI.container_more_detail_01.animation.play("appear");
		}
		else if (anim_name == "appear" && LowerGUI.container_more_detail_01.alive == true && frame_index == 1)
		{
			LowerGUI.container_image_show_01.alive = true;
			LowerGUI.container_image_show_01.exists = true;
			
			LowerGUI.container_image_show_01.animation.play("idle");
			ScriptCourtRecords.next_more_detail_detection_01();
		}
	}
}