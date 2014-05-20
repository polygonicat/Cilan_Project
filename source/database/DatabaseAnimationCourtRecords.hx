package database;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import sprites.UpperGUI;
import sprites.LowerGUI;
import database.DatabaseVariablesEvidence;
import database.DatabaseVariablesProfiles;

class DatabaseAnimationCourtRecords
{
	public static function animation_profile():Void
	{
		var  temp_index_profile:Int = 0;
		
		while (DatabaseVariablesProfiles.npc_id[temp_index_profile] != null)
		{
			var temp_animation_array_profile:Array<Int> = new Array();
			temp_animation_array_profile[0] = DatabaseVariablesProfiles.npc_potrait_index[temp_index_profile];
			
			UpperGUI.main_conversation_court_record_show_profile.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.more_detail_potrait_profile_01.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.more_detail_potrait_profile_02.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			
			LowerGUI.court_record_profile_potrait_01_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_02_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_03_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_04_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_05_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_06_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_07_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_08_a.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			
			LowerGUI.court_record_profile_potrait_01_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_02_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_03_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_04_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_05_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_06_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_07_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			LowerGUI.court_record_profile_potrait_08_b.animation.add(DatabaseVariablesProfiles.npc_id[temp_index_profile], temp_animation_array_profile, 0, false);
			
			temp_index_profile++;
		}
	}
	
	public static  function animation_evidence()
	{
		var  temp_index_evidence:Int = 0;
		
		while (DatabaseVariablesEvidence.item_id[temp_index_evidence] != null)
		{
			var temp_animation_array_evidence:Array<Int> = new Array();
			temp_animation_array_evidence[0] = DatabaseVariablesEvidence.item_animation_array[temp_index_evidence];
			
			UpperGUI.main_conversation_court_record_show_evidence.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.more_detail_potrait_evidence_01.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.more_detail_potrait_evidence_02.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			
			LowerGUI.court_record_evidence_potrait_01_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_02_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_03_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_04_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_05_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_06_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_07_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_08_a.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			
			LowerGUI.court_record_evidence_potrait_01_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_02_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_03_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_04_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_05_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_06_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_07_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			LowerGUI.court_record_evidence_potrait_08_b.animation.add(DatabaseVariablesEvidence.item_animation_name[temp_index_evidence], temp_animation_array_evidence, 0, false);
			
			temp_index_evidence++;
		}
	}
	
}