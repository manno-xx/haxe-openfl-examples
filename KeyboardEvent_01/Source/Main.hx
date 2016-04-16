package;

import openfl.display.Sprite;
import openfl.events.KeyboardEvent;

/**
 * Very basic keyboard event example.
 * Make sure you can see debug messages (trace) in your editor/IDE
 * Notice that when yu press and hold a key:
 * - the message(s) appear(s) once
 * - for a brief period nothing happens
 * - The message(s) appear with a very short interval
 * 
 * This is just like keeping a key pressed in a text editor
 *
 */
class Main extends Sprite 
{

	public function new () 
	{
		super ();
		
		// have the stage listen for key presses
		stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
	}
	
	/**
	 * The event handler for keyboard events
	 * Displays:
	 * - the event type (keyDown or keyUp)
	 * - the key code of the key that triggered the event
	 *
	 */
	private function onKeyDown( event:KeyboardEvent )
	{
		trace( "The type of event is: " + event.type );
		trace( "The keycode of the key is: " + event.keyCode );
	}
}