package;

import openfl.display.Sprite;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import openfl.geom.Point;

/**
 * Keyboard controlled arrow
 *  (yes, the keyboard code should be placed in its own class to be DRY adn all)
 */
class Arrow extends Sprite
{
	// will store the keys that are pressed.
	// the key of the map is the key code of a pressed key.
	// the value is true
	// (when key is released it is removed from the map, essentially eliminating the value false for keys in this map)
	var keysPressed:Map<Int, Bool> = new Map<Int, Bool>();

	// the speed of the arrow (in pixels per second)
	inline static var speed:Int = 90;

	// the speed at which the ship can rotate (in degrees per second)
	inline static var rotationSpeed:Int = 70;

	/**
	 * Constructor.
	 *
	 * Draws the triangle representing this
	 * Sets up listeners for key presses and -releases
	 *
	 */
	public function new()
	{
		super();
		drawArrow();

		// listen for keyboard events
		Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
		Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, onKeyUp );
	}

	/**
	 * updates the ship's position based on keyboardinput
	 *
	 * @param deltaTime 	The time passed since the last update (in seconds)
	 */
	public function update( deltaTime:Float )
	{
		// first check if rotation keys are pressed
		// if so, rotate ship accordingly taking time into account
		if(keysPressed.get(Keyboard.LEFT))
			rotation -= rotationSpeed * deltaTime;
		if(keysPressed.get(Keyboard.RIGHT))
			rotation += rotationSpeed * deltaTime;

		// then check throttle key
		// if pressed, calculate
		if(keysPressed.get(Keyboard.UP))
		{
			var velocity:Point = Point.polar(speed * deltaTime, rotation * Math.PI / 180);
			// alternative would be the more generic/language agnostic:
			// var velocity = new Point(Math.cos(rotation * Math.PI / 180), Math.sin(rotation * Math.PI / 180));
			// velocity.normalize(speed*deltaTime);
			x += velocity.x;
			y += velocity.y;
		}
	}

	/**
	 * Draws a basic triangle to represent the arrow.
	 *
	 */
	function drawArrow()
	{
		this.graphics.lineStyle(0x000000);
		this.graphics.beginFill(0x00FF00);
		this.graphics.moveTo(10, 0);
		this.graphics.lineTo(-10, -5);
		this.graphics.lineTo(-10, 5);
		this.graphics.lineTo(10, 0);
		this.graphics.endFill();
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