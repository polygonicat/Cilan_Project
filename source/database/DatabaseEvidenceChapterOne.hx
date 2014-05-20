package database;

import flixel.FlxState;
import flixel.FlxG;

class DatabaseEvidenceChapterOne
{
	public static function evidence():Void
	{
		DatabaseVariablesEvidence.evidence_chapter_index++;
		
		DatabaseVariablesEvidence.item_chapter[DatabaseVariablesEvidence.item_index] = DatabaseVariablesEvidence.evidence_chapter_index;
		DatabaseVariablesEvidence.item_id[DatabaseVariablesEvidence.item_index] = DatabaseVariablesEvidence.item_index;
		DatabaseVariablesEvidence.item_name[DatabaseVariablesEvidence.item_index] = "Pokeball 1";
		DatabaseVariablesEvidence.item_description[DatabaseVariablesEvidence.item_index] = "A peculiar looking ball. What does this do anyway?";
		DatabaseVariablesEvidence.item_type[DatabaseVariablesEvidence.item_index] = "Other";
		DatabaseVariablesEvidence.item_from[DatabaseVariablesEvidence.item_index] = "Given by Trucy";
		DatabaseVariablesEvidence.item_animation_name[DatabaseVariablesEvidence.item_index] = "evidence_pokeball";
		DatabaseVariablesEvidence.item_animation_array[DatabaseVariablesEvidence.item_index] = 1;
		
		DatabaseVariablesEvidence.item_index++;
		
		DatabaseVariablesEvidence.item_chapter[DatabaseVariablesEvidence.item_index] = DatabaseVariablesEvidence.evidence_chapter_index;
		DatabaseVariablesEvidence.item_id[DatabaseVariablesEvidence.item_index] = DatabaseVariablesEvidence.item_index;
		DatabaseVariablesEvidence.item_name[DatabaseVariablesEvidence.item_index] = "Pokeball 2";
		DatabaseVariablesEvidence.item_description[DatabaseVariablesEvidence.item_index] = "A peculiar looking ball. What does this do anyway?";
		DatabaseVariablesEvidence.item_type[DatabaseVariablesEvidence.item_index] = "Other";
		DatabaseVariablesEvidence.item_from[DatabaseVariablesEvidence.item_index] = "Given by Trucy";
		DatabaseVariablesEvidence.item_animation_name[DatabaseVariablesEvidence.item_index] = "evidence_pokeball";
		DatabaseVariablesEvidence.item_animation_array[DatabaseVariablesEvidence.item_index] = 1;
		
		DatabaseVariablesEvidence.item_index++;
	}
}