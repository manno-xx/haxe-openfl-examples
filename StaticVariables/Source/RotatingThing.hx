package ;

import openfl.events.Event;

import openfl.display.Sprite;
import openfl.display.GradientType;

import openfl.geom.Matrix;

class RotatingThing extends Sprite
{
	// the static variable that defines rotation speed
	public static var rotationSpeed:Float = 0;

	// the static var that defines the max rotation speed in degrees per second
	public static inline var MAX_ROTATION_SPEED:Int = 180;

	public function new()
	{
		super();
		draw();
	}

	/**
	 * Rotate this by the number of degrees indicated in the static var rotationSpeed
	 * rotation is in degrees per second, hence the multiplication by the passed seconds parameter
	 */
	public function update( passedSeconds:Float )
	{
		this.rotation += rotationSpeed * passedSeconds;
	}

	/**
	 * Draw rectangle with a gradient to see rotation better
	 *
	 */
	private function draw()
	{
		var BOXSIZE:Int = 32;
		var matrix:Matrix = new Matrix();
		matrix.createGradientBox( BOXSIZE, BOXSIZE, 0, -(BOXSIZE/2), -(BOXSIZE/2) );
		this.graphics.beginGradientFill( GradientType.LINEAR, [0xFF0000, 0x00FF00], [1, 1], [0, 255], matrix );
		this.graphics.drawRect( -(BOXSIZE/2), -(BOXSIZE/2), BOXSIZE, BOXSIZE );
		this.graphics.endFill();
	}
}