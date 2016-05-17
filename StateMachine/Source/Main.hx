package;


import openfl.display.Sprite;

/**
 * Demo of a so called Finite State Machine (FMS)
 * 
 * Finite State Machine is a design pattern. Design patterns are general descriptions for 
 * 
 * A very good article about state machines is:
 * http://gameprogrammingpatterns.com/state.html
 * The examples in the article gradualy grow more complex.
 *
 * This example is, in order to explain the principle,  a very basic one: A lamp that has the states on and off.
 */
class Main extends Sprite 
{
	
	
	public function new () 
	{
		
		super ();
		
		var lamp:Lamp = new Lamp();
		lamp.x = (stage.stageWidth - lamp.width) / 2;
		lamp.y = (stage.stageHeight - lamp.height) / 2;
		addChild( lamp );
	}
}