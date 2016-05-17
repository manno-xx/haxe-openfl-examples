package;

import openfl.display.Bitmap;
import openfl.display.Sprite;

import openfl.events.KeyboardEvent;

/**
 * The object that can be in several states, the state machine
 * 
 * It represents a light which can be toggled by the space bar.
 * If the light is on and SPACE is pressed, the light is turned off
 * If the light is off and SPACE is pressed, the light is turned on.
 *
 * Those behaviors are programmed in the classes representing the on- and off states: OnState and OffState
 *
 * Both the classes implement the interface called LampState.
 * Interfaces have to do with polymorphism. An interface defines functions without providing an implementation for them.
 * The class that implements an interface provides an implementation for those functions. 
 * If a class implements an interface you know 100% sure it will have certain functions.
 * 
 * This makes it possible to treat all states in a similar way. In this case calling their handleInput() function
 * 
 */
class Lamp extends Sprite
{
	
	// the variable in which the current state is stored.
	private var currentState:LampState;

	public function new()
	{
		super();

		setState( new OffState( this ) );
	
		openfl.Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
	}

	/**
	 * The event handler for the KeyboardEvent
	 *
	 */
	private function onKeyDown( e:KeyboardEvent )
	{
		currentState.handleInput( e );
	}

	/**
	 * Displays a given bitmap. (All other child elements are removed first)
	 * This function is called from the states so this class displays the graphic that represents the state.
	 *
	 */
	public function onSetGraphic( bitmap:Bitmap )
	{
		removeChildren();
		addChild( bitmap );
	}

	/**
	 * Sets the current state for this class.
	 *
	 *
	 */
	public function setState( newState:LampState ):Void
	{
		currentState = newState;
	}
}