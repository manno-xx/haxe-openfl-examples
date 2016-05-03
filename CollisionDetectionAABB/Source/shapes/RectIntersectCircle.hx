package shapes;

import openfl.display.DisplayObject;

import openfl.geom.Rectangle;

/**
 * This circle uses a shrunken bounding rectangle for collision detection
 * 
 * When you use a shrunken rectangle collisions have to be more evident in order to register (to prevent the "Now way I was hit!")
 * When you use an expanded rectangle collisions trigger sooner (nice for pick ups etc)
 *
 */
class RectIntersectCircle extends Circle
{
	public function new()
	{
		super();

		draw( 0x0000FF );
	}

	/**
	 * This overrides the default function that indicates the bouding rectangle of this sprite:
	 * - it retrieves the bounding rectangle by calling the default function first
	 * - it then scales that rectangle by some amount (here it scales down by 15 pixels on all four sides).
	 * - it returns the scaled down rectangle
	 * 
	 */
	override public function getBounds( space:DisplayObject )
	{
		var myRect:Rectangle = super.getBounds( space );
		myRect.inflate( -10, -10 );
		return myRect;
	}
}