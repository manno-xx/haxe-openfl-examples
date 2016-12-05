package;

import openfl.display.Sprite;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.Lib;

import openfl.ui.Keyboard;

/**
 * Simple demo for movement of elements based on keyboard input
 *
 * Explains the very basic elements of the structure,
 *   as such is not necessarily the most optimal solution.
 *
 * This demo suffers from the 'feature' that 
 *   diagonal movement is the sum of horizontal and vertical movement.
 * 
 */
class Main extends Sprite 
{
	// will store the keys that are pressed.
	// the key of the map is the key code of a pressed key.
	// the value is true
	// (when key is released it is removed from the map, essentially eliminating the value false for keys in this map)
	var keysPressed:Map<Int, Bool> = new Map<Int, Bool>();

	// the magenta circle to move
	var dotToMove:Sprite;
	// the speed (px per second) to move the dot by
	var dotSpeed:Int = 50;

	// the time of the last update
	var lastUpdate:Int;

	public function new () 
	{
		super ();
		
		createDot();

		// listen for keyboard events
		Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
		Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, onKeyUp );

		// set up the 'game loop'. In the function update, the dot will be moved.
		addEventListener( Event.ENTER_FRAME, update );

		lastUpdate = Lib.getTimer();
	}

	/**
	 * Checks keys of interest and moves the dot accordingly
	 *
	 */
	function update(e:Event)
	{
		var now:Int = Lib.getTimer();
		var deltaTime:Float = (now - lastUpdate) / 1000.0;
		lastUpdate = now;

		if(keysPressed.get(Keyboard.UP))
		{
			dotToMove.y -= dotSpeed * deltaTime;
		}
		if(keysPressed.get(Keyboard.DOWN))
		{
			dotToMove.y += dotSpeed * deltaTime;
		}
		if(keysPressed.get(Keyboard.LEFT))
		{
			dotToMove.x -= dotSpeed * deltaTime;
		}
		if(keysPressed.get(Keyboard.RIGHT))
		{
			dotToMove.x += dotSpeed * deltaTime;
		}
	}

	/**
	 * Creates, postitions and adds the dot to the stage
	 *
	 */
	function createDot()
	{
		dotToMove = new Sprite();
		dotToMove.graphics.beginFill( 0xFF00FF );
		dotToMove.graphics.drawCircle(0, 0, 10 );
		dotToMove.graphics.endFill();

		dotToMove.x = Lib.current.stage.stageWidth / 2;
		dotToMove.y = Lib.current.stage.stageHeight / 2;

		addChild(dotToMove);
	}

	/**
	 * Eventhandler for the key down event. The corresponding key is registered as 'down'
	 *
	 */
	function onKeyDown(e:KeyboardEvent)
	{
		keysPressed.set(e.keyCode, true);
	}
	/**
	 * Eventhandler for the key up event. Removes previous registration of the key as 'down'
	 *
	 */
	function onKeyUp(e:KeyboardEvent)
	{
		keysPressed.remove(e.keyCode);
	}
}