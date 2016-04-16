package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * Example of time based animation
 * Each frame the time passed since last update in seconds is calculated
 * This value is passed to the update function of an instance of a class (TimeBasedMover)
 * There the value is used to calculate the amount of pixels to move based on its speed in pixels / second
 * 
 */
class Main extends Sprite 
{
	// when the last update ran
	private var lastUpdate:Int;

	private var tbm:TimeBasedMover;
	
	public function new () 
	{
		super ();

		// create and position (vertically centered) a TimeBasedMover instance
		tbm = new TimeBasedMover();
		tbm.y = stage.stageHeight / 2;
		addChild( tbm );

		// set the last update to the current time (in milliseconds)
		lastUpdate = Lib.getTimer();

		// call update function every frame
		addEventListener( Event.ENTER_FRAME, update );
	}

	/** 
	 * This function is called every frame.
	 * Calculates the time passed since previous update. 
	 * Calls the update function in the TimeBasedMOver instance passing the calculated value
	 * 
	 * @param event 	The Event.ENTER_FRAME event
	 */
	function update( event:Event )
	{
		// get current time, subtract lastupdate, devide by 1000
		var now:Int = Lib.getTimer();
		var passedTime:Float = (now - lastUpdate) / 1000;
	
		tbm.update( passedTime );
		
		lastUpdate = now;
	}
}