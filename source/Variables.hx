package ;

//-- Flixel Stuff
import flixel.FlxG;
import flixel.FlxState;

//-- Important Stuff Valueable Assets
import sprites.LowerGUI;
import sprites.UpperGUI;

class Variables extends FlxState
{
	public static var elements_lower_gui:LowerGUI;
	public static var elements_upper_gui:UpperGUI;
	
	public static var mouse_x:Float = 0;
	public static var mouse_y:Float = 0;
	
	public static var elements_state:Float = 0;
	
	public function Variables() 
	{
		
	}
	
}