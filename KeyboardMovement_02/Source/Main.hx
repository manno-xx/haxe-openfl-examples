package;


import openfl.display.Sprite;

import openfl.events.Event;

import openfl.Lib;

/**
 * Fairly basic example on how to do movement vectors:
 *   move with a certain speed in the direction indicated by the arrow
 *
 */
class Main extends Sprite 
{
	var lastUpdate:Int;

	var arrow:Arrow;
	
	/**
	 * Constructor.
	 * 
	 * Creates the arrow (is in class Arrow)
	 * set lastUpdate to be 'now'
	 * sets up the game loop
	 */
	public function new () 
	{
		super ();
		
		arrow = new Arrow();
		arrow.x = stage.stageWidth / 2;
		arrow.y = stage.stageHeight / 2;
		addChild(arrow);

		lastUpdate = Lib.getTimer();

		addEventListener(Event.ENTER_FRAME, update);
	}

	/**
	 * Event Handler for enter frame event.
	 * 
	 * Calculates time since last update
	 * tells the arrow to update passing the time since last update as parameter
	 * 
	 */
	function update(e:Event)
	{
		var now = Lib.getTimer();
		var deltaTime:Float = (now - lastUpdate) / 1000;
		lastUpdate = now;

		arrow.update(deltaTime);
	}
}