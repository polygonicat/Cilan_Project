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
		DatabaseVariablesEvidence.item_name[DatabaseVariablesEvidence.item_index] = "Pokeball";
		DatabaseVariablesEvidence.item_description[DatabaseVariablesEvidence.item_index] = "The pokemon trainer's essential item, never get into the tall grass without it! Contains: Pansage";
		DatabaseVariablesEvidence.item_type[DatabaseVariablesEvidence.item_index] = "Other";
		DatabaseVariablesEvidence.item_from[DatabaseVariablesEvidence.item_index] = "One of my possessions";
		DatabaseVariablesEvidence.item_animation_name[DatabaseVariablesEvidence.item_index] = "evidence_pokeball";
		DatabaseVariablesEvidence.item_animation_array[DatabaseVariablesEvidence.item_index] = 1;
		
		DatabaseVariablesEvidence.item_index++;
		
		DatabaseVariablesEvidence.item_chapter[DatabaseVariablesEvidence.item_index] = DatabaseVariablesEvidence.evidence_chapter_index;
		DatabaseVariablesEvidence.item_id[DatabaseVariablesEvidence.item_index] = DatabaseVariablesEvidence.item_index;
		DatabaseVariablesEvidence.item_name[DatabaseVariablesEvidence.item_index] = "A Class Badge";
		DatabaseVariablesEvidence.item_description[DatabaseVariablesEvidence.item_index] = "The symbol of a true connoisseur, it must always be with me to prove myself of my authority.";
		DatabaseVariablesEvidence.item_type[DatabaseVariablesEvidence.item_index] = "Other";
		DatabaseVariablesEvidence.item_from[DatabaseVariablesEvidence.item_index] = "One of my possessions";
		DatabaseVariablesEvidence.item_animation_name[DatabaseVariablesEvidence.item_index] = "evidence_a_class_badge";
		DatabaseVariablesEvidence.item_animation_array[DatabaseVariablesEvidence.item_index] = 3;
		
		DatabaseVariablesEvidence.item_index++;
	}
}