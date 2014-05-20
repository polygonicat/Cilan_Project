package scripts;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxSound;

import sprites.UpperGUI;
import sprites.LowerGUI;

import flash.events.Event;
import flash.utils.Timer;
import flash.events.TimerEvent;

class ScriptConversationsSpecialEvents extends FlxState
{
	
	public static var special_parameters:Array<Dynamic> = new Array();
	public static var colored_conversation_current_words:String;
	public static var colored_conversation_letter_counter:Int;
	
	public static var show_evidence_current_words:String;
	public static var show_evidence_letter_counter:Int;
	
	public static var show_timestamp_current_words:String;
	public static var show_timestamp_letter_counter:Int;
	public static var show_timestamp_current_words_line:Int;
	public static var show_timestamp_line01:String;
	public static var show_timestamp_line02:String;
	public static var show_timestamp_line03:String;
	
	public function new() 
	{
		super();
	}
	
	public static function special_event(e:Event):Void
	{
		if (special_parameters[0] == "lightshake")
		{
			FlxG.camera.shake(0.003, 0.8, null, true, 0);
		}
		else if (special_parameters[0] == "hardshake")
		{
			FlxG.camera.shake(0.02, 0.8, null, true, 0);
		}
		else if (special_parameters[0] == "flash")
		{
			FlxG.camera.flash(0xffffff,0.3,null,true);
		}
		else if (special_parameters[0] == "lightflash")
		{
			FlxG.camera.flash(0xffffff, 0.3, null, true);
			FlxG.camera.shake(0.003, 0.8, null, true, 0);
		}
		else if (special_parameters[0] == "hardflash")
		{
			FlxG.camera.flash(0xffffff,0.3,null,true);
			FlxG.camera.shake(0.02, 0.8, null, true, 0);
		}
		else if (special_parameters[0] == "delay")
		{
			ScriptConversations.special_event_timer.repeatCount = 1;
			ScriptConversations.conversation_timer_update(special_parameters[1]);
		}
		else if (special_parameters[0] == "leftevidence")
		{
			//-- Necromancy: Summoning Frame
			UpperGUI.main_conversation_court_record_show_frame.alive = true;
			UpperGUI.main_conversation_court_record_show_frame.exists = true;
			
			ScriptConversations.special_event_timer.repeatCount = 1;
			UpperGUI.main_conversation_court_record_show_frame.x = 1;
			UpperGUI.main_conversation_court_record_show_profile.x = 8;
			UpperGUI.main_conversation_court_record_show_evidence.x = 8;
			UpperGUI.main_conversation_court_record_show_frame.facing = 0;
			UpperGUI.main_conversation_court_record_show_frame.animation.play("appear");
		}
		else if (special_parameters[0] == "rightevidence")
		{
			//-- Necromancy: Summoning Frame
			UpperGUI.main_conversation_court_record_show_frame.alive = true;
			UpperGUI.main_conversation_court_record_show_frame.exists = true;
			
			ScriptConversations.special_event_timer.repeatCount = 1;
			UpperGUI.main_conversation_court_record_show_frame.x = 329;
			UpperGUI.main_conversation_court_record_show_profile.x = 336;
			UpperGUI.main_conversation_court_record_show_evidence.x = 336;
			UpperGUI.main_conversation_court_record_show_frame.facing = 1;
			UpperGUI.main_conversation_court_record_show_frame.animation.play("appear");
		}
		else if (special_parameters[0] == "animations")
		{
			if (ScriptConversations.conversation_timer.running == true)
			{
				ScriptConversations.conversation_timer.stop();
			}
			
			if (ScriptConversationsSpecialEvents.special_parameters[2] == "true" && UpperGUI.finished_npc == 0)
			{
				UpperGUI.finished_npc = 1;
				UpperGUI.main_conversation_box.animation.play("invisible");
				UpperGUI.text_conversation_nametag.text = "";
				UpperGUI.investigation_universal_NPC.animation.play(special_parameters[1]);
			}
			else if(ScriptConversationsSpecialEvents.special_parameters[2] == "false")
			{
				UpperGUI.investigation_universal_NPC.animation.play(special_parameters[1]);
				special_parameters[0] = "None";
				ScriptConversations.conversation_timer.start();
			}
		}
	}
	
	public static function special_event_stop(e:Event):Void
	{
		ScriptConversations.special_event_timer.stop();
		ScriptConversations.special_event_timer.reset();
		
		if (ScriptConversations.conversation_timer.running == false && special_parameters[0] != "animations")
		{
			ScriptConversations.conversation_timer.start();
		}
	}
	
	public  static function timestamp_typewriter(e:Event):Void
	{
		//-- Time Stamp Event
		
		if (show_timestamp_current_words_line == 0)
		{
			ScriptConversations.timestamp_timer.reset();
			ScriptConversations.timestamp_timer.stop();
			
			UpperGUI.stamp_sample_file01.htmlText = "";
			UpperGUI.stamp_sample_file02.htmlText = "";
			UpperGUI.stamp_sample_file03.htmlText = "";
			
			LowerGUI.arrow_main_conversation.alive = true;
			LowerGUI.arrow_main_conversation.exists = true;
		}
		else if (show_timestamp_current_words_line == 1)
		{
			if (show_timestamp_letter_counter <= show_timestamp_line01.length)
			{
				UpperGUI.stamp_record_file01.htmlText = UpperGUI.stamp_record_file01.htmlText + show_timestamp_line01.charAt(show_timestamp_letter_counter);
				show_timestamp_letter_counter++;
				
				if (show_timestamp_line01.charAt(show_timestamp_letter_counter) != " ")
				{
					UpperGUI.sfx_typewriter.stop();
					UpperGUI.sfx_typewriter.play();
				}
			}
			else
			{
				show_timestamp_letter_counter = 0;
				show_timestamp_current_words_line++;
			}
		}
		else if (show_timestamp_current_words_line == 2)
		{
			if (show_timestamp_letter_counter <= show_timestamp_line02.length)
			{
				UpperGUI.stamp_record_file02.htmlText = UpperGUI.stamp_record_file02.htmlText + show_timestamp_line02.charAt(show_timestamp_letter_counter);
				show_timestamp_letter_counter++;
				
				if (show_timestamp_line02.charAt(show_timestamp_letter_counter) != " ")
				{
					UpperGUI.sfx_typewriter.stop();
					UpperGUI.sfx_typewriter.play();
				}
			}
			else
			{
				show_timestamp_letter_counter = 0;
				show_timestamp_current_words_line++;
			}
		}
		else if (show_timestamp_current_words_line == 3)
		{
			if (show_timestamp_letter_counter <= show_timestamp_line03.length)
			{
				UpperGUI.stamp_record_file03.htmlText = UpperGUI.stamp_record_file03.htmlText + show_timestamp_line03.charAt(show_timestamp_letter_counter);
				show_timestamp_letter_counter++;
				
				if (show_timestamp_line03.charAt(show_timestamp_letter_counter) != " ")
				{
					UpperGUI.sfx_typewriter.stop();
					UpperGUI.sfx_typewriter.play();
				}
			}
			else
			{
				show_timestamp_letter_counter = 0;
				show_timestamp_current_words_line = 0;
			}
		}
	}
	
	public static function colored_conversation_typewriter(e:Event):Void
	{
		ScriptConversations.conversation_colored_text_timer.delay = ScriptConversations.conversation_current_delay;
		
		if ( colored_conversation_letter_counter <= colored_conversation_current_words.length)
		{
			if (colored_conversation_current_words.charAt(colored_conversation_letter_counter) == "{")
			{
				//-- Avoiding The Bracket
				colored_conversation_letter_counter++;
				var special_event_sequence:String = "";
				var special_event_stop_check:Float = 0;
				
				while( special_event_stop_check == 0 )
				{
					if (colored_conversation_current_words.charAt(colored_conversation_letter_counter) != "}")
					{
						special_event_sequence = special_event_sequence + colored_conversation_current_words.charAt(colored_conversation_letter_counter);
					}
					else
					{
						special_event_stop_check = 1;
					}
					
					colored_conversation_letter_counter++;
				}
				
				ScriptConversationsSpecialEvents.special_parameters = special_event_sequence.split(",");
				ScriptConversations.special_event_timer.repeatCount = ScriptConversationsSpecialEvents.special_parameters[1];
				ScriptConversations.special_event_timer.start();
				
				if (ScriptConversationsSpecialEvents.special_parameters[2] == "true" && ScriptConversationsSpecialEvents.special_parameters[2] != null )
				{
					ScriptConversations.conversation_colored_text_timer.stop();
				}
			}
			else if (colored_conversation_current_words.charAt(colored_conversation_letter_counter) == " ")
			{
				if (ScriptConversations.conversation_current_nametag == "")
				{
					UpperGUI.main_conversation_box.animation.play("empty");
					UpperGUI.text_conversation_nametag.text = "";
				}
				else
				{
					UpperGUI.main_conversation_box.animation.play("nametag");
					UpperGUI.text_conversation_nametag.text = ScriptConversations.conversation_current_nametag;
				}
				
				UpperGUI.main_conversation_text.htmlText = UpperGUI.main_conversation_text.htmlText + colored_conversation_current_words.charAt(colored_conversation_letter_counter);
				UpperGUI.sfx_blipmale.stop();
				UpperGUI.sfx_blipfemale.stop();
				colored_conversation_letter_counter++;
			}
			else
			{
				if (ScriptConversations.conversation_current_nametag == "")
				{
					UpperGUI.main_conversation_box.animation.play("empty");
					UpperGUI.text_conversation_nametag.text = "";
				}
				else
				{
					UpperGUI.main_conversation_box.animation.play("nametag");
					UpperGUI.text_conversation_nametag.text = ScriptConversations.conversation_current_nametag;
				}
				
				if (ScriptConversations.conversation_current_gender == "F")
				{
					UpperGUI.sfx_blipfemale.stop();
					UpperGUI.sfx_blipfemale.play();
				}
				else if (ScriptConversations.conversation_current_gender == "M")
				{
					UpperGUI.sfx_blipmale.stop();
					UpperGUI.sfx_blipmale.play();
				}
				
				//-- Default Conversations
				UpperGUI.main_conversation_text.htmlText = UpperGUI.main_conversation_text.htmlText + "<font color='"+ ScriptConversations.conversation_text_color +"'>" + colored_conversation_current_words.charAt(colored_conversation_letter_counter) + "</font>";
				colored_conversation_letter_counter++;
			}
		}
		else
		{
			ScriptConversations.conversation_colored_text_timer.stop();
			ScriptConversations.conversation_colored_text_timer.reset();
			ScriptConversations.conversation_timer.start();
		}
	}
	
	public static function evidence_update_end():Void
	{
		ScriptMouseChecks.halt_mouse_trigger = 0;
		ScriptMouseChecks.inventory_update_resume();
	}
	
	//-- END HERE
}