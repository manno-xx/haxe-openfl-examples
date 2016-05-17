package;

import openfl.Assets;
import openfl.events.KeyboardEvent;

class OffState implements LampState
{

	// refers to the lamp so that it's graphic can be set and its state be changed
	private var owner:Lamp;
	
	/**
	 * Constructor. 
	 * Stores a reference to the state machine class
	 * sets the graphic in the state machine class
	 */
	public function new( owner:Lamp )
	{
		this.owner = owner;
		this.owner.onSetGraphic( new openfl.display.Bitmap(Assets.getBitmapData( "assets/light-bulb-off.png" ) ) );
	}

	/**
	 * This handles the keyboard input in a for this state appropriate way
	 * 
	 * @param e 	The keyboardEvent
	 */
	public function handleInput( e:KeyboardEvent ):Void
	{
		if( e.keyCode == openfl.ui.Keyboard.SPACE )
		{
			this.owner.setState( new OnState( this.owner ) );
		}
	}

}