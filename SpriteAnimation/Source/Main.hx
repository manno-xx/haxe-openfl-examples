package;

import openfl.display.Sprite;

import openfl.events.Event;

import openfl.Lib;

/**
 * Demo of a sprite sheet animation
 * The Runner class represents a character in a game with its animation in a sprite sheet
 * 
 * Most important things this demo demonstrates:
 * - a very basic form of using a sprite sheet with the openfl.display.TileSheet class
 * - a way to do frame independent animation (animations play slower than the frame rate)
 */
class Main extends Sprite 
{
	var runner:Runner;

	// the time the last update was at
	var lastUpdate:Int;

	public function new () 
	{
		super ();
		
		// create and position the character
		runner = new Runner();
		runner.x = stage.stageWidth / 2;
		runner.y = stage.stageHeight / 2;
		addChild( runner );
		
		addEventListener( Event.ENTER_FRAME, update );
		
		lastUpdate = Lib.getTimer();
	}

	/**
	 * The game loop updating all game objects
	 * Uses delta time to be frame rate independent
	 * 
	 */
	private function update( event:Event )
	{
		var now:Int = Lib.getTimer();
		var deltaTime:Float = (now - lastUpdate) / 1000;
		lastUpdate = now;
		
		runner.update( deltaTime );
	}
}