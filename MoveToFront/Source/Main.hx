package;

import openfl.display.Sprite;

import openfl.events.MouseEvent;

/**
 * An example of how to create a 'move to front' functionality
 * 
 * This uses the setChildIndex() method.
 * As a side dish, positioning on a circle is demonstrated
 *
 * The example can be optimized attaching the eventhandler to this (Main) 
 *   but this is a little more explicit.
 */
class Main extends Sprite 
{

	public function new () 
	{
		
		super ();

		createAndPostionCircles();
	}

	/**
	 * This is what actually moves the circle that is clicked to the front.
	 *
	 * The index of a child element defines its position on the z-axis
	 * The highest index is the front most, zero is the hind most
	 * Setting the child index of an element equal to the amount of child elements minus one (remember it starts counting at zero)
	 *   makes it move to the front.
	 * 
	 * Look at the graphic in the assets folder for a diagram of the demo
	 *
	 */
	function moveToFront( event:MouseEvent )
	{
		this.setChildIndex( event.target, this.numChildren -1 );
	}

	/**
	 * - creates a number of sprites, 
	 * - draws a circle in them of a random color
	 * - positions them, evenly distributed, on an imaginary circle
	 * - makes the circle clickable
	 *
	 */
	function createAndPostionCircles()
	{
		var circleCount:Int = 3;		// how many circles
		var circleRadius:Int = 20;		// the radius of each circle
		var positionAngle:Float = 0;	// the position of a circle on the imaginary circle
		var positionRadius:Int = 15;	// the radius of the imaginary circle the smaller ones are positioned on

		for (i in 0 ... circleCount) 
		{
			var circle:Circle = new Circle( circleRadius );

			// the positioning of the circles. Not related to the 'move to front' functionality
			circle.x = ( stage.stageWidth / 2 ) + positionRadius * Math.cos( degreesToRadians( positionAngle ) );
			circle.y = ( stage.stageHeight / 2 ) + positionRadius * Math.sin( degreesToRadians( positionAngle ) );
			addChild( circle );
			
			// add the mouse event handler for a click on the circle
			circle.addEventListener( MouseEvent.CLICK, moveToFront );

			// move along the edge of the imaginary circle used for positioning.
			positionAngle += 360 / circleCount;
		}
	}

	/**
	 * Converts from degrees (more huan readable) to radians (required by trigonometry functions like sine and cosine)
	 */
	function degreesToRadians( deg:Float ):Float
	{
		return deg * Math.PI / 180;
	}
}