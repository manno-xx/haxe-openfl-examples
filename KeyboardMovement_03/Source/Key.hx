// Key.hx
package;

import openfl.display.Stage;
import openfl.events.Event;
import openfl.events.KeyboardEvent;

/**
 *
 * From: https://www.kirupa.com/forum/showthread.php?223798-ActionScript-3-Tip-of-the-Day/page22&p=2098269#post2098269
 *
 * The Key class recreates functionality of
 * Key.isDown of ActionScript 1 and 2. Before using
 * Key.isDown, you first need to initialize the
 * Key class with a reference to the stage using
 * its Key.initialize() method. For key
 * codes use the flash.ui.Keyboard class.
 *
 * Usage:
 * Key.initialize(stage);
 * if (Key.isDown(Keyboard.LEFT)) {
 *    // Left key is being pressed
 * }
 */
class Key
{
	private static var initialized: Bool = false; // marks whether or not the class has been initialized
	private static var keysDown: Map<Int, Bool> = new Map<Int, Bool>(); // stores key codes of all keys pressed

	/**
	 * Initializes the key class creating assigning event
	 * handlers to capture necessary key events from the stage
	 */
	public static function initialize(stage: Stage)
	{
		if (!initialized)
		{
			// assign listeners for key presses and deactivation of the player
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
			
			// mark initialization as true so redundant
			// calls do not reassign the event handlers
			initialized = true;
		}
	}

	/**
	 * Returns true or false if the key represented by the
	 * keyCode passed is being pressed
	 */
	public static function isDown(keyCode: Int): Bool
	{
		if (!initialized)
		{
			// throw an error if isDown is used
			// prior to Key class initialization
			throw "Key class has yet been initialized.";
		}
		return keysDown.exists(keyCode);
	}

	/**
	 * Event handler for capturing keys being pressed
	 */
	private static function keyPressed(event: KeyboardEvent): Void
	{
		// create a property in keysDown with the name of the keyCode
		keysDown.set(event.keyCode, true);
	}

	/**
	 * Event handler for capturing keys being released
	 */
	private static function keyReleased(event: KeyboardEvent): Void
	{
		// delete the property in keysDown if it exists
		keysDown.remove(event.keyCode);
	}

	/**
	 * Event handler for Flash Player deactivation
	 */
	private static function clearKeys(event: Event): Void
	{
		// clear all keys in keysDown since the player cannot
		// detect keys being pressed or released when not focused
		keysDown = new Map<Int, Bool>();
	}
}