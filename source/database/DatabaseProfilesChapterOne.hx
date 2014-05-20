package database;

import flixel.FlxState;
import flixel.FlxG;

class DatabaseProfilesChapterOne
{
	public static function profiles():Void
	{
		DatabaseVariablesProfiles.profiles_chapter_index++;
		
		DatabaseVariablesProfiles.npc_chapter[DatabaseVariablesProfiles.npc_index] = DatabaseVariablesProfiles.profiles_chapter_index;
		DatabaseVariablesProfiles.npc_id[DatabaseVariablesProfiles.npc_index] = "Normal_Cilan";
		DatabaseVariablesProfiles.npc_name[DatabaseVariablesProfiles.npc_index] = "Cilan";
		DatabaseVariablesProfiles.npc_gender[DatabaseVariablesProfiles.npc_index] = "M";
		DatabaseVariablesProfiles.npc_age[DatabaseVariablesProfiles.npc_index] = "15";
		DatabaseVariablesProfiles.npc_description[DatabaseVariablesProfiles.npc_index] = "Plant type wonder Cilan!";
		DatabaseVariablesProfiles.npc_assets[DatabaseVariablesProfiles.npc_index] = "N/A";
		DatabaseVariablesProfiles.npc_potrait_index[DatabaseVariablesProfiles.npc_index] = 1;
		DatabaseVariablesProfiles.npc_assets_dimensions[DatabaseVariablesProfiles.npc_index] = "251x334";
		
		DatabaseVariablesProfiles.npc_index++;
		
		DatabaseVariablesProfiles.npc_chapter[DatabaseVariablesProfiles.npc_index] = DatabaseVariablesProfiles.profiles_chapter_index;
		DatabaseVariablesProfiles.npc_id[DatabaseVariablesProfiles.npc_index] = "Normal_Cress";
		DatabaseVariablesProfiles.npc_name[DatabaseVariablesProfiles.npc_index] = "Cress";
		DatabaseVariablesProfiles.npc_gender[DatabaseVariablesProfiles.npc_index] = "M";
		DatabaseVariablesProfiles.npc_age[DatabaseVariablesProfiles.npc_index] = "15";
		DatabaseVariablesProfiles.npc_description[DatabaseVariablesProfiles.npc_index] = "Water type wonder Cress!";
		DatabaseVariablesProfiles.npc_assets[DatabaseVariablesProfiles.npc_index] = "assets/images/GUI/character/NPC/sprite_cress_normal.png";
		DatabaseVariablesProfiles.npc_potrait_index[DatabaseVariablesProfiles.npc_index] = 2;
		DatabaseVariablesProfiles.npc_assets_dimensions[DatabaseVariablesProfiles.npc_index] = "254x334";	
		
		DatabaseVariablesProfiles.npc_index++;
		
		DatabaseVariablesProfiles.npc_chapter[DatabaseVariablesProfiles.npc_index] = DatabaseVariablesProfiles.profiles_chapter_index;
		DatabaseVariablesProfiles.npc_id[DatabaseVariablesProfiles.npc_index] = "Normal_Chili";
		DatabaseVariablesProfiles.npc_name[DatabaseVariablesProfiles.npc_index] = "Chili";
		DatabaseVariablesProfiles.npc_gender[DatabaseVariablesProfiles.npc_index] = "M";
		DatabaseVariablesProfiles.npc_age[DatabaseVariablesProfiles.npc_index] = "15";
		DatabaseVariablesProfiles.npc_description[DatabaseVariablesProfiles.npc_index] = "Fire type wonder Chili!";
		DatabaseVariablesProfiles.npc_assets[DatabaseVariablesProfiles.npc_index] = "assets/images/GUI/character/NPC/sprite_chili_normal.png";
		DatabaseVariablesProfiles.npc_potrait_index[DatabaseVariablesProfiles.npc_index] = 3;
		DatabaseVariablesProfiles.npc_assets_dimensions[DatabaseVariablesProfiles.npc_index] = "197x334";
		
		//DatabaseVariablesProfiles.npc_index++;
	}
}