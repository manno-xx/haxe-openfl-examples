package;

import openfl.Lib;

import openfl.display.Sprite;
import openfl.events.Event;

/**
 * Demonstrates a use of a 'progress bar'.
 * Progress bars can be used for many things:
 * - data loading progress (i.e. bytes loaded of a total amount of bytes)
 * - health value indicator
 * - time (i.e. seconds left to act)
 * - time (i.e. current time of audio/video track)
 *
 * More general:
 * Mapping a value with a range from one to x to it's equavalent from 0 to 1
 *  makes it easy to convert the value in order to:
 *  - have a graphic fade according to the value (alpha is a value from 0-1)
 *  - have a graphic scale according to the value (scaleX and scaleY are values from 0-1. Or higher if you want to scale up)
 *  - position something relative to the width or height of a container (such as the stage).
 * 
 * Example 
 * 50 on the scale of 0 to 100 is similar to 0.5 on a scale of 0 to 1. 
 * Applying that number to a graphic would scale it to half the original size.
 *
 * In this demo it is used to indicate time left
 * When the time is up, it is reset to start counting down again.
 * The purpose of the bar is totally dependent on what value it recieves and when.
 *
 * The UIProgressBar uses a value from 0 to 1 to scale the bar
 * The object the progress bar belongs to (here Main doing the math of time left) calculates a fraction (current value / max value)
 *   this could be anything from health to current time in audio track
 * The fraction is then sent to the update() function of the UIProgressBar
 * 
 * 
 */
class Main extends Sprite 
{
	// the actual bar
	var timerBar:UIProgressBar;

	// the variables for the measurement
	var maxTime:Int = 10000;
	var currentTime:Int = 10000;
	var lastUpdate:Int;

	public function new () 
	{
		super ();
		
		// create and position the progres bar
		timerBar = new UIProgressBar( 100, 15, 4 );
		timerBar.x = timerBar.y = 200;
		timerBar.setValue( 0.6 );
		addChild( timerBar );

		// set the 'lastUpdate' for the first time
		lastUpdate = Lib.getTimer();

		addEventListener( Event.ENTER_FRAME, update );
	}

	/**
	 * Event handler for the Event.ENTER_FRAME event
	 * 
	 * 
	 * @param event 	The Event instance
	 */
	private function update( event:Event )
	{
		// calculate time passed since last update in milliseconds
		var now:Int = Lib.getTimer();
		var msPassed:Int = now - lastUpdate;
		lastUpdate = now;

		// subtract time passed from the currentTime variable
		currentTime -= msPassed;

		// if currentTime is less than or equal to zero the time is up. Reset the timer
		if( currentTime <= 0 )
		{
			// it currentTime was less than zero that amount is subtracted from maxTime and the result assigned to currentTime
			currentTime = maxTime + currentTime;
		}

		// calculate the percentage (between 0 and 1) to update the bar
		timerBar.setValue( currentTime / maxTime );
	}
}