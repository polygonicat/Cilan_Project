package sprites;

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
import database.DatabaseVariablesProfiles;
import database.DatabaseAnimationCourtRecords;
import database.DatabaseVariablesEvidence;
import scripts.ScriptConversationsSpecialEvents;
import scripts.ScriptConversations;


@:font("assets/fonts/Ace-Attorney.ttf") class AAFont extends Font { }

class UpperGUI extends FlxState
{
	//-- Group
	public static var upper_background:FlxGroup;
	public static var upper_evidence_main_show_frame:FlxGroup;
	public static var upper_conversation_parts:FlxGroup;
	
	//-- Images
	public static var upper_gui_background_01:FlxSprite;
	public static var main_conversation_box:FlxSprite;
	public static var main_conversation_court_record_show_frame:FlxSprite;
	public static var main_conversation_court_record_show_evidence:FlxSprite;
	public static var main_conversation_court_record_show_profile:FlxSprite;
	public static var main_conversation_evidence_obtain:FlxSprite;
	
	//-- Text
	public static var text_conversation_nametag:FlxText;
	public static var main_conversation_text:TextField;
	public static var stamp_record_file01:TextField;
	public static var stamp_record_file02:TextField;
	public static var stamp_record_file03:TextField;
	
	public static var stamp_sample_file01:TextField;
	public static var stamp_sample_file02:TextField;
	public static var stamp_sample_file03:TextField;
	
	public static var conversation_evidence_show_nametag:FlxText;
	public static var conversation_evidence_show_info:FlxText;
	
	//-- Test Objects
	public static var objection_smack:FlxSprite;
	public static var flashing_screen:FlxSprite;
	
	//-- NPC
	public static var investigation_universal_NPC:FlxSprite;
	
	//-- Sounds
	public static var sfx_blipmale:FlxSound;
	public static var sfx_blipfemale:FlxSound;
	public static var sfx_typewriter:FlxSound;
	public static var sfx_bleep:FlxSound;
	public static var sfx_blink:FlxSound;
	public static var sfx_cancel:FlxSound;
	public static var sfx_damage1:FlxSound;
	public static var sfx_damage2:FlxSound;
	public static var sfx_dink:FlxSound;
	public static var sfx_dramapound:FlxSound;
	public static var sfx_lightbulb:FlxSound;
	public static var sfx_pichoop:FlxSound;
	public static var sfx_realization:FlxSound;
	public static var sfx_scroll:FlxSound;
	public static var sfx_selectblip1:FlxSound;
	public static var sfx_selectblip2:FlxSound;
	public static var sfx_shock1:FlxSound;
	public static var sfx_shock2:FlxSound;
	public static var sfx_shooop:FlxSound;
	public static var sfx_smack:FlxSound;
	public static var sfx_stab1:FlxSound;
	public static var sfx_stab2:FlxSound;
	public static var sfx_thud2:FlxSound;
	public static var sfx_whack:FlxSound;
	public static var sfx_getitem:FlxSound;
	
	//-- Special Var
	public static var finished_npc:Int = 0;
	
	//-- Item Temporary Index Container
	public static var item_temporary_container:Int = 0;
	
	public function new() 
	{
		super();
		
		Font.registerFont(AAFont);
		
		//-- Sounds
		
		sfx_blipmale = new FlxSound();
		sfx_blipmale.loadEmbedded("sfx_blipmale", false, false);
		add(sfx_blipmale);
		
		sfx_blipfemale = new FlxSound();
		sfx_blipfemale.loadEmbedded("sfx_blipfemale", false, false);
		add(sfx_blipfemale);
		
		sfx_typewriter = new FlxSound();
		sfx_typewriter.loadEmbedded("sfx_typewriter", false, false);
		add(sfx_typewriter);
		
		sfx_bleep = new FlxSound();
		sfx_bleep.loadEmbedded("sfx_bleep", false, false);
		add(sfx_bleep);
		
		sfx_blink = new FlxSound();
		sfx_blink.loadEmbedded("sfx_blink", false, false);
		add(sfx_blink);
		
		sfx_cancel = new FlxSound();
		sfx_cancel.loadEmbedded("sfx_cancel", false, false);
		add(sfx_cancel);
		
		sfx_damage1 = new FlxSound();
		sfx_damage1.loadEmbedded("sfx_damage1", false, false);
		add(sfx_damage1);
		
		sfx_damage2 = new FlxSound();
		sfx_damage2.loadEmbedded("sfx_damage2", false, false);
		add(sfx_damage2);
		
		sfx_dink = new FlxSound();
		sfx_dink.loadEmbedded("sfx_dink", false, false);
		add(sfx_dink);
		
		sfx_dramapound = new FlxSound();
		sfx_dramapound.loadEmbedded("sfx_dramapound", false, false);
		add(sfx_dramapound);
		
		sfx_lightbulb = new FlxSound();
		sfx_lightbulb.loadEmbedded("sfx_lightbulb", false, false);
		add(sfx_lightbulb);
		
		sfx_pichoop = new FlxSound();
		sfx_pichoop.loadEmbedded("sfx_pichoop", false, false);
		add(sfx_pichoop);
		
		sfx_realization = new FlxSound();
		sfx_realization.loadEmbedded("sfx_realization", false, false);
		add(sfx_realization);
		
		sfx_scroll = new FlxSound();
		sfx_scroll.loadEmbedded("sfx_scroll", false, false);
		add(sfx_scroll);
		
		sfx_selectblip1 = new FlxSound();
		sfx_selectblip1.loadEmbedded("sfx_selectblip1", false, false);
		add(sfx_selectblip1);
		
		sfx_selectblip2 = new FlxSound();
		sfx_selectblip2.loadEmbedded("sfx_selectblip2", false, false);
		add(sfx_selectblip2);
		
		sfx_shock1 = new FlxSound();
		sfx_shock1.loadEmbedded("sfx_shock1", false, false);
		add(sfx_shock1);
		
		sfx_shock2 = new FlxSound();
		sfx_shock2.loadEmbedded("sfx_shock2", false, false);
		add(sfx_shock2);
		
		sfx_shooop = new FlxSound();
		sfx_shooop.loadEmbedded("sfx_shooop", false, false);
		add(sfx_shooop);
		
		sfx_smack = new FlxSound();
		sfx_smack.loadEmbedded("sfx_smack", false, false);
		add(sfx_smack);
		
		sfx_stab1 = new FlxSound();
		sfx_stab1.loadEmbedded("sfx_stab1", false, false);
		add(sfx_stab1);
		
		sfx_stab2 = new FlxSound();
		sfx_stab2.loadEmbedded("sfx_stab2", false, false);
		add(sfx_stab2);
		
		sfx_thud2 = new FlxSound();
		sfx_thud2.loadEmbedded("sfx_thud2", false, false);
		add(sfx_thud2);
		
		sfx_whack = new FlxSound();
		sfx_whack.loadEmbedded("sfx_whack", false, false);
		add(sfx_whack);
		
		sfx_getitem = new FlxSound();
		sfx_getitem.loadEmbedded("sfx_getitem", false, false);
		add(sfx_getitem);
		
		//-- Graphics
		
		upper_background = new FlxGroup();
		add(upper_background);
		
		upper_gui_background_01 = new FlxSprite(0, 0);
		upper_gui_background_01.loadGraphic("assets/images/GUI/background/upper_background_striaton_restaurant.jpg", false, 445, 334, false);
		upper_gui_background_01.x = 0;
		upper_gui_background_01.y = 0;
		upper_background.add(upper_gui_background_01);
		
		//-- NPC Insertion here!
		investigation_universal_NPC = new FlxSprite(0, 0);
		investigation_universal_NPC.loadGraphic("assets/images/GUI/character/NPC/sprite_trucy_magician.png", true, 251, 334, false);
		investigation_universal_NPC.x = (445 / 2) - (investigation_universal_NPC.width / 2);
		//investigation_universal_NPC.animation.callback = NPC_animation_process;
		//-- NPC Animations here!
		DatabaseAnimationNPC.animation_listing();
		add(investigation_universal_NPC);
		
		
		//-- Text and other stuff related to talking
		upper_conversation_parts = new FlxGroup();
		add(upper_conversation_parts);
		
		main_conversation_box = new FlxSprite(0, 0);
		main_conversation_box.loadGraphic("assets/images/GUI/containers/conversation_boxes.png", true, 427, 115, false);
		main_conversation_box.animation.add("invisible", [2], 0, false);
		main_conversation_box.animation.add("empty", [1], 0, false);
		main_conversation_box.animation.add("nametag", [0], 0, false);
		main_conversation_box.x = 9;
		main_conversation_box.y = 218;
		upper_conversation_parts.add(main_conversation_box);
		
		//-- 13 pixel of width per each letter, so approximately width = size per letter * length.
		//-- Tag Place Type Writer.
		
		stamp_sample_file01 = new TextField();
		stamp_sample_file01.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20, 0x00FF00);
		stamp_sample_file01.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		stamp_sample_file01.selectable = false;
		stamp_sample_file01.autoSize = TextFieldAutoSize.LEFT;
		stamp_sample_file01.antiAliasType = AntiAliasType.NORMAL;
		stamp_sample_file01.x = 0;
		stamp_sample_file01.y = -30;
		stamp_sample_file01.width = 0;
		stamp_sample_file01.embedFonts = true;
		stamp_sample_file01.htmlText = "";
		FlxG.stage.addChildAt(stamp_sample_file01, 1);
		
		stamp_sample_file02 = new TextField();
		stamp_sample_file02.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20, 0x00FF00);
		stamp_sample_file02.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		stamp_sample_file02.selectable = false;
		stamp_sample_file02.autoSize = TextFieldAutoSize.LEFT;
		stamp_sample_file02.antiAliasType = AntiAliasType.NORMAL;
		stamp_sample_file02.x = 0;
		stamp_sample_file02.y = -30;
		stamp_sample_file02.width = 0;
		stamp_sample_file02.embedFonts = true;
		stamp_sample_file02.htmlText = "";
		FlxG.stage.addChildAt(stamp_sample_file02, 1);
		
		stamp_sample_file03 = new TextField();
		stamp_sample_file03.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20, 0x00FF00);
		stamp_sample_file03.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		stamp_sample_file03.selectable = false;
		stamp_sample_file03.autoSize = TextFieldAutoSize.LEFT;
		stamp_sample_file03.antiAliasType = AntiAliasType.NORMAL;
		stamp_sample_file03.x = 0;
		stamp_sample_file03.y = -30;
		stamp_sample_file03.width = 0;
		stamp_sample_file03.embedFonts = true;
		stamp_sample_file03.htmlText = "";
		FlxG.stage.addChildAt(stamp_sample_file03, 1);
		
		
		//-- Original textfield
		stamp_record_file01 = new TextField();
		stamp_record_file01.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20, 0x00FF00);
		stamp_record_file01.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		stamp_record_file01.selectable = false;
		stamp_record_file01.autoSize = TextFieldAutoSize.LEFT;
		stamp_record_file01.antiAliasType = AntiAliasType.NORMAL;
		stamp_record_file01.x = 0;
		stamp_record_file01.y = 241;
		stamp_record_file01.width = 0;
		stamp_record_file01.embedFonts = true;
		stamp_record_file01.htmlText = "";
		FlxG.stage.addChildAt(stamp_record_file01, 1);
		
		stamp_record_file02 = new TextField();
		stamp_record_file02.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20, 0x00FF00);
		stamp_record_file02.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		stamp_record_file02.selectable = false;
		stamp_record_file02.autoSize = TextFieldAutoSize.LEFT;
		stamp_record_file02.antiAliasType = AntiAliasType.NORMAL;
		stamp_record_file02.x = 0;
		stamp_record_file02.y = 0;
		stamp_record_file02.width = 0;
		stamp_record_file02.embedFonts = true;
		stamp_record_file02.htmlText = "";
		FlxG.stage.addChildAt(stamp_record_file02, 1);
		
		stamp_record_file02.y = stamp_record_file01.y + 22.75;
		
		stamp_record_file03 = new TextField();
		stamp_record_file03.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20, 0x00FF00);
		stamp_record_file03.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		stamp_record_file03.selectable = false;
		stamp_record_file03.autoSize = TextFieldAutoSize.LEFT;
		stamp_record_file03.antiAliasType = AntiAliasType.NORMAL;
		stamp_record_file03.x = 0;
		stamp_record_file03.y = 0;
		stamp_record_file03.width = 0;
		stamp_record_file03.embedFonts = true;
		stamp_record_file03.htmlText = "";
		FlxG.stage.addChildAt(stamp_record_file03, 1);
		
		
		stamp_record_file03.y = stamp_record_file02.y + 22.75;
		
		main_conversation_text = new TextField();
		main_conversation_text.defaultTextFormat = new TextFormat("Ace Attorney Regular", 20);
		main_conversation_text.filters = [new DropShadowFilter(1, 45, 0x404040, 1, 0, 0, 1)];
		main_conversation_text.selectable = false;
		main_conversation_text.antiAliasType = AntiAliasType.NORMAL;
		main_conversation_text.wordWrap = true;
		main_conversation_text.x = 17;
		main_conversation_text.y = 241;
		main_conversation_text.width = 385;
		main_conversation_text.embedFonts = true;
		main_conversation_text.htmlText = "";
		FlxG.stage.addChildAt(main_conversation_text, 1);
		
		main_conversation_text.x = (445 / 2) - (main_conversation_text.width / 2);
		
		text_conversation_nametag = new FlxText(12, 218, 81, "");
		text_conversation_nametag.setFormat("assets/fonts/Ace-Attorney.ttf", 12, 0xffffff, "center");
		upper_conversation_parts.add(text_conversation_nametag);
		
		//-- Some assets on the upper GUI that needs to be shown on some special events
		
		upper_evidence_main_show_frame = new FlxGroup();
		add(upper_evidence_main_show_frame);
		
		main_conversation_court_record_show_frame = new FlxSprite(0, 0);
		main_conversation_court_record_show_frame.loadGraphic("assets/images/GUI/containers/conversation_show_court_record.png", true, 115, 115, false);
		main_conversation_court_record_show_frame.animation.add("appear", [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 90, false);
		main_conversation_court_record_show_frame.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 90, false);
		main_conversation_court_record_show_frame.animation.add("invisible", [15], 0, false);
		main_conversation_court_record_show_frame.animation.add("idle", [0], 0, false);
		//main_conversation_court_record_show_frame.x = 329;
		main_conversation_court_record_show_frame.animation.callback = evidence_frame;
		main_conversation_court_record_show_frame.x = 1;
		main_conversation_court_record_show_frame.y = 1;
		upper_evidence_main_show_frame.add(main_conversation_court_record_show_frame);
		
		main_conversation_evidence_obtain = new FlxSprite(0, 0);
		main_conversation_evidence_obtain.loadGraphic("assets/images/GUI/containers/container_acquire_evidence.png", false, 445, 151, false);
		main_conversation_evidence_obtain.x = 445;
		//main_conversation_evidence_obtain.x = 0;
		main_conversation_evidence_obtain.y = 33;
		upper_evidence_main_show_frame.add(main_conversation_evidence_obtain);
		
		conversation_evidence_show_nametag = new FlxText(153, 57, 258, "YEAH YEAH");
		conversation_evidence_show_nametag.setFormat("assets/fonts/Ace-Attorney.ttf", 20, 0xe9b732, "center", 0x8f7327);
		upper_evidence_main_show_frame.add(conversation_evidence_show_nametag);
		
		conversation_evidence_show_info = new FlxText(155, 87, 254, "WHAT WHAT");
		conversation_evidence_show_info.setFormat("assets/fonts/Ace-Attorney.ttf", 18, 0x353434, "left", 0x393939);
		upper_evidence_main_show_frame.add(conversation_evidence_show_info);
		
		main_conversation_court_record_show_evidence = new FlxSprite(0, 0);
		main_conversation_court_record_show_evidence.loadGraphic("assets/images/GUI/evidence/large/evidence_grid_spritesheet.png", true, 102, 102, false);
		main_conversation_court_record_show_evidence.animation.add("empty", [0], 0, false);
		main_conversation_court_record_show_evidence.x = 8;
		//main_conversation_court_record_show_evidence.x = 336;
		main_conversation_court_record_show_evidence.y = 8;
		upper_evidence_main_show_frame.add(main_conversation_court_record_show_evidence);
		
		main_conversation_court_record_show_profile = new FlxSprite(0, 0);
		main_conversation_court_record_show_profile.loadGraphic("assets/images/GUI/profile/large/profile_grid_spritesheet.png", true, 102, 102, false);
		main_conversation_court_record_show_profile.animation.add("empty", [0], 0, false);
		main_conversation_court_record_show_profile.x = 8;
		//main_conversation_court_record_show_profile.x = 336;
		main_conversation_court_record_show_profile.y = 8;
		upper_evidence_main_show_frame.add(main_conversation_court_record_show_profile);
		
		
		//-- Setting stuff to default states
		upper_background.setAll("alive", false);
		upper_background.setAll("exists", false);
		
		investigation_universal_NPC.alive = false;
		investigation_universal_NPC.exists = false;
		
		main_conversation_court_record_show_frame.animation.play("invisible");
		
		//FlxG.stage.removeChild(main_conversation_text);
		
		upper_conversation_parts.setAll("alive", false);
		upper_conversation_parts.setAll("exists", false);
		
		main_conversation_box.animation.play("empty");
		
		upper_evidence_main_show_frame.setAll("alive", false);
		upper_evidence_main_show_frame.setAll("exists", false);
	}
	
	override public function update():Void
	{
		super.update();
		
		//-- Cause animation.finished is being a bitch.
		if (investigation_universal_NPC.animation.finished == true && finished_npc == 1)
		{
			finished_npc = 0;
			ScriptConversationsSpecialEvents.special_parameters[0] = "None";
			ScriptConversations.conversation_timer.start();
		}
	}
	
	private static function evidence_frame(anim_name:String, frame_number:Int, frame_index:Int):Void 
	{
		if (anim_name == "appear" && main_conversation_court_record_show_evidence.alive == true && frame_index == 1)
		{
			DatabaseAnimationCourtRecords.animation_evidence();
			UpperGUI.main_conversation_court_record_show_evidence.animation.play(DatabaseVariablesEvidence.item_animation_name[item_temporary_container]);
		}
		else if (anim_name == "appear" && main_conversation_court_record_show_profile.alive == true && frame_index == 1)
		{
			DatabaseAnimationCourtRecords.animation_profile();
			UpperGUI.main_conversation_court_record_show_profile.animation.play(DatabaseVariablesProfiles.npc_id[item_temporary_container]);
		}
		else if(anim_name == "disappear" && frame_index == 15)
		{
			main_conversation_court_record_show_frame.alive = false;
			main_conversation_court_record_show_frame.exists = false;
		}
	}	
	
	
	
}