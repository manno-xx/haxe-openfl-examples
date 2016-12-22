package;

import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.Lib;

/**
 * Arrow that move towards the mouse
 * It has no restrictions in 'turning radius', this means that when it gets to the mouse, it keeps spinning franticly around the mouse position.
 * 
 */
class Arrow extends Sprite
{
	// the speed of the arrow (in pixels per second)
	inline static var speed:Int = 90;

	// the color to discern
	var color:Int;

	/**
	 * Constructor.
	 *
	 * Draws the triangle representing this
	 *
	 * @param c 	The color this arrow is
	 */
	public function new( c:Int )
	{
		super();

		color = c;
		
		drawArrow();
	}

	/**
	 * updates the ship's position based on mouse position
	 *
	 * @param deltaTime 	The time passed since the last update (in seconds)
	 */
	public function update( deltaTime:Float )
	{
		// calculate the angle the 'horizon' makes with the line between this arrow and the mouse. result is in radians!
		var rotationInRadians = Math.atan2( Lib.current.stage.mouseY - this.y, Lib.current.stage.mouseX - this.x );

		// make sure this arrow points in the same direction (towards the mouse)
		this.rotation = rotationInRadians * 180 / Math.PI;

		// move in the direction this sprite is rotated
		var velocity:Point = Point.polar(speed * deltaTime, rotationInRadians);
		x += velocity.x;
		y += velocity.y;
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