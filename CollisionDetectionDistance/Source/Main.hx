
package;

import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

import shapes.Circle;

/**
 * Quick demo on how to do collision detection based on distance between circles.
 * In this demo actual circles are used however, if you use an actual
 *
 *
 */
class Main extends Sprite 
{
	var circleOne:Circle;
	var circleTwo:Circle;

	public function new () 
	{
		super ();

		var instructionText:InstructionText = new InstructionText( "Drag one of the circles and check the sources" );
		addChild( instructionText );

		circleOne = new Circle( 0xFF0000, 40 );
		circleOne.x = stage.stageWidth / 3;
		circleOne.y = stage.stageHeight / 2;
		circleOne.addEventListener( MouseEvent.MOUSE_DOWN, onMousePress );
		addChild( circleOne );
		
		circleTwo = new Circle( 0x00FF00, 40 );
		circleTwo.x = stage.stageWidth - stage.stageWidth / 3;
		circleTwo.y = stage.stageHeight / 2;
		circleTwo.addEventListener( MouseEvent.MOUSE_DOWN, onMousePress );
		addChild( circleTwo );
		
		addEventListener( Event.ENTER_FRAME, onUpdate );
	}

	/**
	 * Somewhat elaborate way to put it in code but:
	 * 1. the distance between the centres of the circles is calculated (Pythagoriam Theorem; A squared + B sqaured = C squared)
	 * 2. the sum of the radii is calculated
	 * 3. the check is done if the distance is less than the sum of the radii
	 *
	 */
	function onUpdate( e:Event )
	{
		var deltaX:Float = Math.abs(circleOne.x - circleTwo.x);
		var deltaY:Float = Math.abs(circleOne.y - circleTwo.y);

		var distance:Float = Math.sqrt( deltaX * deltaX + deltaY * deltaY );

		var sumOfRadii:Float = circleOne.radius + circleTwo.radius;

		if (distance < sumOfRadii)
		{
			circleOne.alpha = circleTwo.alpha = 0.5;
		}
		else
		{
			circleOne.alpha = circleTwo.alpha = 1;
		}
	}

	/**
	 * This and the function below make circles draggable (and droppable)
	 *
	 */
	private function onMousePress( e:MouseEvent )
	{
		var clickedItem:Sprite = e.target;

		clickedItem.startDrag();
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseRelease );
	}
	private function onMouseRelease( e:MouseEvent )
	{
		stopDrag();
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseRelease );
	}
}