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
	
	//-- Special Var
	public static var finished_npc:Int = 0;
	
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
		main_conversation_court_record_show_frame.animation.add("appear", [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 100, false);
		main_conversation_court_record_show_frame.animation.add("disappear", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 200, false);
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
		main_conversation_court_record_show_evidence.x = 8;
		//main_conversation_court_record_show_evidence.x = 336;
		main_conversation_court_record_show_evidence.y = 8;
		upper_evidence_main_show_frame.add(main_conversation_court_record_show_evidence);
		
		main_conversation_court_record_show_profile = new FlxSprite(0, 0);
		main_conversation_court_record_show_profile.loadGraphic("assets/images/GUI/profile/large/profile_grid_spritesheet.png", true, 102, 102, false);
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
		if (anim_name == "appear" && main_conversation_court_record_show_evidence.alive == false && frame_index == 1)
		{
			main_conversation_court_record_show_evidence.alive = true;
			main_conversation_court_record_show_evidence.exists = true;
		}
		else if (anim_name == "appear" && main_conversation_court_record_show_profile.alive == false && frame_index == 1)
		{
			main_conversation_court_record_show_profile.alive = true;
			main_conversation_court_record_show_profile.exists = true;
		}
	}	
	
	
	
}