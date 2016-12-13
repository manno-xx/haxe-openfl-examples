package;

import openfl.display.Sprite;
import openfl.geom.Point;

/**
 * Keyboard controlled arrow
 */
class Arrow extends Sprite
{
	// the speed of the arrow (in pixels per second)
	inline static var speed:Int = 90;

	// the speed at which the ship can rotate (in degrees per second)
	inline static var rotationSpeed:Int = 70;

	// the keys that steer the ship. Because variables can vary across instances
	var upKey:Int;
	var leftKey:Int;
	var rightKey:Int;

	// the color to discern
	var color:Int;

	/**
	 * Constructor.
	 *
	 * Draws the triangle representing this
	 * Sets up listeners for key presses and -releases
	 *
	 */
	public function new( up:Int, left:Int, right:Int, c:Int )
	{
		super();

		upKey = up;
		leftKey = left;
		rightKey = right;

		color = c;
		
		drawArrow();
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
		if(Key.isDown(leftKey))
			rotation -= rotationSpeed * deltaTime;
		if(Key.isDown(rightKey))
			rotation += rotationSpeed * deltaTime;

		// then check throttle key
		// if pressed, calculate
		if(Key.isDown(upKey))
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
		this.graphics.beginFill(color);
		this.graphics.moveTo(10, 0);
		this.graphics.lineTo(-10, -5);
		this.graphics.lineTo(-10, 5);
		this.graphics.lineTo(10, 0);
		this.graphics.endFill();
	}
}