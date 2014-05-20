package scripts;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenOptions;
import flixel.tweens.FlxTween.CompleteCallback;
import flixel.FlxState;

import sprites.LowerGUI;
import sprites.UpperGUI;
import database.DatabaseVariablesScript;
import database.DatabaseVariablesProfiles;
import database.DatabaseVariablesEvidence;
import database.DatabaseAnimationNPC;
import openfl.Assets;
import flash.events.Event;
import flash.utils.Timer;
import flash.events.TimerEvent;

class ScriptConversations extends FlxState
{
	public static var conversation_timer:Timer;
	public static var conversation_colored_text_timer:Timer;
	public static var timestamp_timer:Timer;
	public static var special_event_timer:Timer;
	public static var detect_transition:Int = 0;
	
	//-- Inventories and Values needed to work on the game
	
	public static var conversation_current_nametag:String;
	public static var conversation_current_gender:String;
	private static var conversation_current_words:String;
	public static var conversation_current_delay:Float;
	public static var conversation_current_transition:String;
	public static var conversation_current_inventory_update:String = "";
	public static var current_next_script:String;
	private static var conversation_letter_counter:Int;
	public static var conversation_text_color:String = "#ffffff";
	private static var conversation_default_color:String = "#ffffff";
	
	public static var current_chapter_script_index:Array<Dynamic> = new Array();
	public static var current_chapter_script_nametag:Array<Dynamic> = new Array();
	public static var current_chapter_words:Array<Dynamic> = new Array();
	public static var current_chapter_gender:Array<Dynamic> = new Array();
	public static var current_chapter_text_speed:Array<Float> = new Array();
	public static var current_chapter_npc_transition:Array<Dynamic> = new Array();
	public static var current_chapter_inventory_update:Array<String> = new Array();
	public static var current_chapter_next_script:Array<Dynamic> = new Array();
	
	public static var conversation_current_chapter:Int = 1;
	
	private static var graphic_location:String = "None";
	private static var graphic_string_size:String = "0x0";
	private static var graphic_size:Array<Dynamic>  = new Array();
	
	public static var temp_inventory_type_checker:Array<Dynamic> = new Array();
	public static var temp_new_item_index:Int = 0;
	
	public function new() 
	{
		super();
	}
	
	public static function update_database_inventory():Void
	{
		var current_chapter_script_counter:Int = 0;
		var current_chapter_script_inventory_counter:Int = 0;
		
		while (DatabaseVariablesScript.script_chapter[current_chapter_script_counter] != null)
		{
			if (DatabaseVariablesScript.script_chapter[current_chapter_script_counter] == conversation_current_chapter)
			{
				//-- Adding stuff
				current_chapter_script_index[current_chapter_script_inventory_counter] = DatabaseVariablesScript.script_index[current_chapter_script_counter];
				current_chapter_script_nametag[current_chapter_script_inventory_counter] =  DatabaseVariablesScript.script_nametag[current_chapter_script_counter];
				current_chapter_gender[current_chapter_script_inventory_counter] = DatabaseVariablesScript.gender[current_chapter_script_counter];
				current_chapter_words[current_chapter_script_inventory_counter] = DatabaseVariablesScript.words[current_chapter_script_counter];
				current_chapter_text_speed[current_chapter_script_inventory_counter] = DatabaseVariablesScript.text_speed[current_chapter_script_counter];
				current_chapter_npc_transition[current_chapter_script_inventory_counter] = DatabaseVariablesScript.npc_transition[current_chapter_script_counter];
				current_chapter_inventory_update[current_chapter_script_inventory_counter] = DatabaseVariablesScript.inventory_update[current_chapter_script_counter];
				current_chapter_next_script[current_chapter_script_inventory_counter] = DatabaseVariablesScript.next_script[current_chapter_script_counter];
				
				//-- Incrementing
				current_chapter_script_inventory_counter++;
			}
			
			current_chapter_script_counter++;
		}
	}
	
	
	public static function conversation_timer_add():Void
	{
		conversation_timer = new Timer(200,0);
		conversation_timer.addEventListener(TimerEvent.TIMER, conversation_typewriter);
		
		conversation_colored_text_timer = new Timer(200, 0);
		conversation_colored_text_timer.addEventListener(TimerEvent.TIMER, ScriptConversationsSpecialEvents.colored_conversation_typewriter);
		
		timestamp_timer = new Timer(100, 0);
		timestamp_timer.addEventListener(TimerEvent.TIMER, ScriptConversationsSpecialEvents.timestamp_typewriter);
		
		special_event_timer = new Timer(300, 0);
		special_event_timer.addEventListener(TimerEvent.TIMER, ScriptConversationsSpecialEvents.special_event);
		special_event_timer.addEventListener(TimerEvent.TIMER_COMPLETE, ScriptConversationsSpecialEvents.special_event_stop);
	}
	
	public static function conversation_timer_start(name_tag:String,gender:String,words:String,delay:Float,npc_transition:String,inventory_update:String):Void
	{
		detect_transition = 0;
		conversation_letter_counter = 0;
		conversation_current_nametag = name_tag;
		conversation_current_gender = gender;
		conversation_current_words = words;
		conversation_current_delay = delay;
		conversation_current_inventory_update = inventory_update;
		conversation_current_transition = npc_transition;
		
		
		if (npc_transition != "")
		{
			var detect_npc_transition:Array<String> = npc_transition.split(",");
			var check_graphic_load:Int = 0;
			graphic_location = "None";
			graphic_string_size = "0x0";
			graphic_size = null;
			
			while (DatabaseVariablesProfiles.npc_name[check_graphic_load] != null )
			{
				if (DatabaseVariablesProfiles.npc_id[check_graphic_load] == detect_npc_transition[1])
				{
					graphic_location = DatabaseVariablesProfiles.npc_assets[check_graphic_load];
					graphic_string_size = DatabaseVariablesProfiles.npc_assets_dimensions[check_graphic_load];
					graphic_size = graphic_string_size.split("x");
					break;
				}
				check_graphic_load++;
			}
			
			//--  NPC Spawner
			if (detect_npc_transition[0] == "notransition")
			{
				//-- No Changes
				detect_transition = 0;
				UpperGUI.main_conversation_box.animation.play("invisible");
				
				if (UpperGUI.investigation_universal_NPC.alive == false)
				{
					UpperGUI.investigation_universal_NPC.alive = true;
					UpperGUI.investigation_universal_NPC.exists = true;
				}
				
				UpperGUI.investigation_universal_NPC.loadGraphic(graphic_location, true, graphic_size[0], graphic_size[1], false);
				UpperGUI.investigation_universal_NPC.x = (445 / 2) - (UpperGUI.investigation_universal_NPC.width / 2);
				staticendnpcanimations();
			}
			else if (detect_npc_transition[0] == "effectprev" && UpperGUI.investigation_universal_NPC.alive == true)
			{
				//-- First pic have effects
				detect_transition = 1;
				UpperGUI.main_conversation_box.animation.play("invisible");
				FlxTween.color(UpperGUI.investigation_universal_NPC, 1, 0xffffff, 0xffffff, 1, 0, { complete:effectprev } );
			}
			else if (detect_npc_transition[0] == "effectnext")
			{
				//-- Next pic have effects
				detect_transition = 1;
				UpperGUI.main_conversation_box.animation.play("invisible");
				
				if (UpperGUI.investigation_universal_NPC.alive == false)
				{
					UpperGUI.investigation_universal_NPC.alive = true;
					UpperGUI.investigation_universal_NPC.exists = true;
				}
				
				UpperGUI.investigation_universal_NPC.alpha = 0;
				UpperGUI.investigation_universal_NPC.loadGraphic(graphic_location, true, graphic_size[0], graphic_size[1], false);
				UpperGUI.investigation_universal_NPC.x = (445 / 2) - (UpperGUI.investigation_universal_NPC.width / 2);
				FlxTween.color(UpperGUI.investigation_universal_NPC, 1, 0xffffff, 0xffffff, 0, 1, { complete:endnpcanimations } );
			}
			else if (detect_npc_transition[0] == "effectboth" && UpperGUI.investigation_universal_NPC.alive == true)
			{
				//-- Both of them have effects
				detect_transition = 1;
				UpperGUI.main_conversation_box.animation.play("invisible");
				FlxTween.color(UpperGUI.investigation_universal_NPC, 1, 0xffffff, 0xffffff, 1, 0, { complete:effectboth } );
			}
			else if (detect_npc_transition[0] == "emptyeffect" && UpperGUI.investigation_universal_NPC.alive == true)
			{
				//-- Slowly disappear
				detect_transition = 1;
				UpperGUI.main_conversation_box.animation.play("invisible");
				FlxTween.color(UpperGUI.investigation_universal_NPC, 1, 0xffffff, 0xffffff, 0, 1, { complete:endnpcanimations } );
			}
			else if (detect_npc_transition[0] == "emptynoeffect" && UpperGUI.investigation_universal_NPC.alive == true)
			{
				//-- Just POOF
				detect_transition = 0;
				UpperGUI.main_conversation_box.animation.play("invisible");
				UpperGUI.investigation_universal_NPC.alive = false;
				UpperGUI.investigation_universal_NPC.exists = false;
			}
		}
		
		FlxG.log.add("This is what evidence update contain: " + conversation_current_inventory_update);
		
		if (conversation_current_inventory_update != "")
		{
			temp_new_item_index = 0;
			temp_inventory_type_checker = conversation_current_inventory_update.split(",");
			
			UpperGUI.main_conversation_text.htmlText = "";
			UpperGUI.main_conversation_text.text = "";
			
			UpperGUI.stamp_record_file01.htmlText = "";
			UpperGUI.stamp_record_file02.htmlText = "";
			UpperGUI.stamp_record_file03.htmlText = "";
			
			UpperGUI.stamp_record_file01.text = "";
			UpperGUI.stamp_record_file02.text = "";
			UpperGUI.stamp_record_file03.text = "";
			
			LowerGUI.arrow_main_conversation.alive = false;
			LowerGUI.arrow_main_conversation.exists = false;
			
			if(temp_inventory_type_checker[0] == "add")
			{
				//-- Update stuff show court record
				ScriptMouseChecks.halt_mouse_trigger = 2;
				LowerGUI.button_main_conversation.animation.play("disappear");
				
				UpperGUI.main_conversation_evidence_obtain.alive = true;
				UpperGUI.main_conversation_evidence_obtain.exists = true;
				
				UpperGUI.conversation_evidence_show_nametag.alive = true;
				UpperGUI.conversation_evidence_show_nametag.exists = true;
				
				UpperGUI.conversation_evidence_show_info.alive = true;
				UpperGUI.conversation_evidence_show_info.exists = true;
				
				UpperGUI.main_conversation_evidence_obtain.x = 445;
				UpperGUI.conversation_evidence_show_nametag.x = 598;
				UpperGUI.conversation_evidence_show_info.x = 600;
				
				FlxTween.tween(UpperGUI.main_conversation_evidence_obtain, { x:0 }, 0.5);
				FlxTween.tween(UpperGUI.conversation_evidence_show_nametag, { x:153 }, 0.5);
				FlxTween.tween(UpperGUI.conversation_evidence_show_info, { x:155 }, 0.5);
				ScriptCourtRecords.evidence_inventory.push(temp_inventory_type_checker[1]);
				
				var temp_evidence_add_counter:Int = 0;
				
				while (ScriptCourtRecords.evidence_inventory[temp_evidence_add_counter] != null)
				{
					if (ScriptCourtRecords.evidence_inventory[temp_evidence_add_counter] == temp_inventory_type_checker[1])
					{
						temp_new_item_index = temp_evidence_add_counter;
						break;
					}
					
					temp_evidence_add_counter++;
				}
			}
			else if (temp_inventory_type_checker[0] == "delete")
			{
				//-- Delete stuff but do not show anything court record related
				ScriptMouseChecks.halt_mouse_trigger = 2;
				ScriptCourtRecords.evidence_inventory.remove(temp_inventory_type_checker[1]);
				
				conversation_timer.start();
			}
			else if (temp_inventory_type_checker[0] == "update")
			{
				//-- Update stuff show court record
				ScriptMouseChecks.halt_mouse_trigger = 2;
				LowerGUI.button_main_conversation.animation.play("disappear");
				
				UpperGUI.main_conversation_evidence_obtain.alive = true;
				UpperGUI.main_conversation_evidence_obtain.exists = true;
				
				UpperGUI.conversation_evidence_show_nametag.alive = true;
				UpperGUI.conversation_evidence_show_nametag.exists = true;
				
				UpperGUI.conversation_evidence_show_info.alive = true;
				UpperGUI.conversation_evidence_show_info.exists = true;
				
				UpperGUI.main_conversation_evidence_obtain.x = 445;
				UpperGUI.conversation_evidence_show_nametag.x = 598;
				UpperGUI.conversation_evidence_show_info.x = 600;
				
				FlxTween.tween(UpperGUI.main_conversation_evidence_obtain, { x:0 }, 0.5);
				FlxTween.tween(UpperGUI.conversation_evidence_show_nametag, { x:153 }, 0.5);
				FlxTween.tween(UpperGUI.conversation_evidence_show_info, { x:155 }, 0.5);
				
				var temp_evidence_edit_counter:Int = 0;
				
				while (ScriptCourtRecords.evidence_inventory[temp_evidence_edit_counter] != null)
				{
					if (ScriptCourtRecords.evidence_inventory[temp_evidence_edit_counter] == temp_inventory_type_checker[1])
					{
						ScriptCourtRecords.evidence_inventory[temp_evidence_edit_counter] = temp_inventory_type_checker[2];
						temp_new_item_index = temp_evidence_edit_counter;
						break;
					}
					
					temp_evidence_edit_counter++;
				}
			}
		}
		else if (name_tag == "Timestamp")
		{
			var timestamp_info_array:Array<String> = new Array();
			timestamp_info_array = words.split("#");
			
			UpperGUI.main_conversation_box.alive = true;
			UpperGUI.main_conversation_box.exists = true;
			
			UpperGUI.main_conversation_text.htmlText = "";
			UpperGUI.main_conversation_text.text = "";
			
			UpperGUI.stamp_record_file01.htmlText = "";
			UpperGUI.stamp_record_file02.htmlText = "";
			UpperGUI.stamp_record_file03.htmlText = "";
			
			UpperGUI.stamp_record_file01.text = "";
			UpperGUI.stamp_record_file02.text = "";
			UpperGUI.stamp_record_file03.text = "";
			
			if (LowerGUI.arrow_main_conversation.alive == true)
			{
				LowerGUI.arrow_main_conversation.alive = false;
				LowerGUI.arrow_main_conversation.exists = false;
			}
			
			if (timestamp_info_array[0] != null)
			{
				ScriptConversationsSpecialEvents.show_timestamp_line01 = timestamp_info_array[0];
			}
			else
			{
				ScriptConversationsSpecialEvents.show_timestamp_line01 = "";
			}
			
			if (timestamp_info_array[1] != null)
			{
				ScriptConversationsSpecialEvents.show_timestamp_line02 = timestamp_info_array[1];
			}
			else
			{
				ScriptConversationsSpecialEvents.show_timestamp_line02 = "";
			}
			
			if (timestamp_info_array[2] != null)
			{
				ScriptConversationsSpecialEvents.show_timestamp_line03 = timestamp_info_array[2];
			}
			else
			{
				ScriptConversationsSpecialEvents.show_timestamp_line03 = "";
			}
			
			UpperGUI.stamp_sample_file01.htmlText = ScriptConversationsSpecialEvents.show_timestamp_line01;
			UpperGUI.stamp_sample_file02.htmlText = ScriptConversationsSpecialEvents.show_timestamp_line02;
			UpperGUI.stamp_sample_file03.htmlText = ScriptConversationsSpecialEvents.show_timestamp_line03;
			
			UpperGUI.stamp_record_file01.x = (Math.round(445 / 2) - Math.round(UpperGUI.stamp_sample_file01.width / 2)) ;
			UpperGUI.stamp_record_file02.x = (Math.round(445 / 2) - Math.round(UpperGUI.stamp_sample_file02.width / 2)) ;
			UpperGUI.stamp_record_file03.x = (Math.round(445 / 2) - Math.round(UpperGUI.stamp_sample_file03.width / 2)) ;
			
			ScriptConversationsSpecialEvents.show_timestamp_current_words_line = 1;
			
			if (detect_transition != 1)
			{
				ScriptConversations.timestamp_timer.start();
			}
		}
		else
		{
			if (LowerGUI.button_court_record.y == ScriptCourtRecords.upper_buttons_inactive_y)
			{
				//-- Revive it!
				LowerGUI.button_court_record.alive = true;
				LowerGUI.button_court_record.exists = true;
				LowerGUI.border_normal_upper.alive = false;
				LowerGUI.border_normal_upper.exists = false;
				LowerGUI.border_default_advance_upper.alive = true;
				LowerGUI.border_default_advance_upper.exists = true;
				
				//-- Put em down
				FlxTween.linearMotion(LowerGUI.button_court_record, ScriptCourtRecords.upper_buttons_inactive_x, ScriptCourtRecords.upper_buttons_inactive_y, ScriptCourtRecords.upper_buttons_active_x, ScriptCourtRecords.upper_buttons_active_y, 0.1, true);
			}
			
			LowerGUI.arrow_main_conversation.alive = false;
			LowerGUI.arrow_main_conversation.exists = false;
			
			UpperGUI.main_conversation_text.htmlText = "";
			UpperGUI.main_conversation_text.text = "";
			
			//UpperGUI.text_conversation_nametag.htmlText = "";
			UpperGUI.text_conversation_nametag.text = "";
			
			UpperGUI.stamp_record_file01.htmlText = "";
			UpperGUI.stamp_record_file02.htmlText = "";
			UpperGUI.stamp_record_file03.htmlText = "";
			
			UpperGUI.stamp_record_file01.text = "";
			UpperGUI.stamp_record_file02.text = "";
			UpperGUI.stamp_record_file03.text = "";
			
			if (detect_transition != 1)
			{
				UpperGUI.text_conversation_nametag.alive = true;
				UpperGUI.text_conversation_nametag.exists = true;
				
				if (name_tag == "")
				{
					UpperGUI.main_conversation_box.animation.play("empty");
					UpperGUI.text_conversation_nametag.text = "";
				}
				else
				{
					UpperGUI.main_conversation_box.animation.play("nametag");
					UpperGUI.text_conversation_nametag.text = name_tag;
				}
				
				ScriptConversations.conversation_timer.start();
			}
		}
	}
	
	public static function conversation_timer_update(updated_delay:Int):Void
	{
		conversation_current_delay = updated_delay;
	}
	
	private static function conversation_typewriter(e:Event):Void
	{
		conversation_timer.delay = conversation_current_delay;
		
		if ( conversation_letter_counter <= conversation_current_words.length)
		{
			if (conversation_current_words.charAt(conversation_letter_counter) == "{")
			{
				//-- Avoiding The Bracket
				conversation_letter_counter++;
				var special_event_sequence:String = "";
				var special_event_stop_check:Float = 0;
				
				while( special_event_stop_check == 0 )
				{
					if (conversation_current_words.charAt(conversation_letter_counter) != "}")
					{
						special_event_sequence = special_event_sequence + conversation_current_words.charAt(conversation_letter_counter);
					}
					else
					{
						special_event_stop_check = 1;
						break;
					}
					
					conversation_letter_counter++;
				}
				
				if (special_event_sequence.charAt(0) =="#")
				{
					ScriptConversationsSpecialEvents.special_parameters = special_event_sequence.split(",");
					ScriptConversationsSpecialEvents.colored_conversation_current_words = ScriptConversationsSpecialEvents.special_parameters[1];
					conversation_text_color = ScriptConversationsSpecialEvents.special_parameters[0];
					ScriptConversationsSpecialEvents.colored_conversation_letter_counter = 0;
					conversation_timer.stop();
					conversation_colored_text_timer.start();
				}
				else
				{
					ScriptConversationsSpecialEvents.special_parameters = special_event_sequence.split(",");
					special_event_timer.repeatCount = ScriptConversationsSpecialEvents.special_parameters[1];
					conversation_timer.stop();
					special_event_timer.start();
				}
			}
			else if (conversation_current_words.charAt(conversation_letter_counter) == " ")
			{
				if (conversation_current_nametag == "")
				{
					UpperGUI.main_conversation_box.animation.play("empty");
					UpperGUI.text_conversation_nametag.text = "";
				}
				else
				{
					UpperGUI.main_conversation_box.animation.play("nametag");
					UpperGUI.text_conversation_nametag.text = conversation_current_nametag;
				}
				
				UpperGUI.main_conversation_text.htmlText = UpperGUI.main_conversation_text.htmlText + conversation_current_words.charAt(conversation_letter_counter);
				UpperGUI.sfx_blipmale.stop();
				UpperGUI.sfx_blipfemale.stop();
				conversation_letter_counter++;
			}
			else
			{	
				if (conversation_current_nametag == "")
				{
					UpperGUI.main_conversation_box.animation.play("empty");
					UpperGUI.text_conversation_nametag.text = "";
				}
				else
				{
					UpperGUI.main_conversation_box.animation.play("nametag");
					UpperGUI.text_conversation_nametag.text = conversation_current_nametag;
				}
				
				if (conversation_current_gender == "F")
				{
					UpperGUI.sfx_blipfemale.stop();
					UpperGUI.sfx_blipfemale.play();
				}
				else if (conversation_current_gender == "M")
				{
					UpperGUI.sfx_blipmale.stop();
					UpperGUI.sfx_blipmale.play();
				}
				
				//-- Default Conversations
				UpperGUI.main_conversation_text.htmlText = UpperGUI.main_conversation_text.htmlText + "<font color='"+ conversation_default_color +"'>" + conversation_current_words.charAt(conversation_letter_counter) + "</font>";
				conversation_letter_counter++;
			}
		}
		else
		{
			conversation_timer.stop();
			conversation_timer.reset();
			
			if (ScriptMouseChecks.halt_mouse_trigger != 2)
			{
				LowerGUI.arrow_main_conversation.alive = true;
				LowerGUI.arrow_main_conversation.exists = true;
			}
		}
	}
	
	//-- Transitions Effect
	public static function effectprev(tween:FlxTween):Void
	{
		UpperGUI.investigation_universal_NPC.loadGraphic(graphic_location, true, graphic_size[0], graphic_size[1], false);
		UpperGUI.investigation_universal_NPC.x = (445 / 2) - (UpperGUI.investigation_universal_NPC.width / 2);
		UpperGUI.investigation_universal_NPC.alpha = 1;
		
		//-- NPC Animations here!
		DatabaseAnimationNPC.animation_listing();
		ScriptConversations.conversation_timer.start();
	}
	
	//-- Transitions Effect
	public static function effectboth(tween:FlxTween):Void
	{
		UpperGUI.investigation_universal_NPC.loadGraphic(graphic_location, true, graphic_size[0], graphic_size[1], false);
		UpperGUI.investigation_universal_NPC.x = (445 / 2) - (UpperGUI.investigation_universal_NPC.width / 2);
		FlxTween.color(UpperGUI.investigation_universal_NPC, 1, 0xffffff, 0xffffff, 0, 1, { complete:endnpcanimations } );
	}
	
	//-- End NPC stuff
	public static function endnpcanimations(tween:FlxTween):Void
	{
		UpperGUI.text_conversation_nametag.alive = true;
		UpperGUI.text_conversation_nametag.exists = true;
		
		//-- NPC Animations here!
		DatabaseAnimationNPC.animation_listing();
		ScriptConversations.conversation_timer.start();
	}
	
	public static function staticendnpcanimations():Void
	{
		UpperGUI.text_conversation_nametag.alive = true;
		UpperGUI.text_conversation_nametag.exists = true;
		
		//-- NPC Animations here!
		DatabaseAnimationNPC.animation_listing();
		ScriptConversations.conversation_timer.start();
	}
}