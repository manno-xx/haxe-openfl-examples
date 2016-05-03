package;

import shapes.*;

import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.filters.GlowFilter;

import openfl.geom.Rectangle;

/**
 * Collision detection demo.
 * Demonstrates:
 * - basic built-in hitTestObject(). Uses Axis Aligned Bounding Box (= fast)
 * - rectangle intersection with adjusted rects. Uses Axis Aligned Bounding Box (= fast and customizable to some extent)
 *
 * AABB collision detection is crude but very fast. 
 * Crude because the in game objects cannot always be properly represented by the single rectangle used for the collision detection
 * Fast because the collision check only needs to compare 2 numbers at max four times 
 *   (if the right size of rect A is 'greater' than the left side of rect B, the rects cannot overlap. repeat for all sides)
 */
class Main extends Sprite 
{
	var hitIndicationFilter:GlowFilter = new GlowFilter(0xFF00FF, 1, 6, 6, 4, 3, false, false );

	var rectIntersectCircle:Sprite = new RectIntersectCircle();
	var rectIntersectRect:Sprite = new RectIntersectRect();
	var rectIntersectAlreadyDetected:Bool = false;

	var hitTestCircle:Sprite = new HitTestCircle();
	var hitTestRect:Sprite = new HitTestRect();
	var hitTestAlreadyDetected:Bool = false;
	
	/**
	 * Add all the elements to the screen
	 * Set the event listeners for mouse down and enter frame
	 *
	 */
	public function new () 
	{
		super ();

		hitTestCircle.x = stage.stageWidth / 3;
		hitTestCircle.y = stage.stageHeight / 3;
		addChild( hitTestCircle );

		hitTestRect.x = stage.stageWidth - stage.stageWidth / 3;
		hitTestRect.y = stage.stageHeight / 3;
		addChild( hitTestRect );

		var instructions:InstructionText = new InstructionText( "Drag the circle onto the rectangle to use hitTestObject()" );
		instructions.x = (stage.stageWidth - instructions.width) / 2;
		instructions.y = stage.stageHeight / 3;
		addChild( instructions );

		rectIntersectCircle.x = stage.stageWidth / 3;
		rectIntersectCircle.y = stage.stageHeight - (stage.stageHeight / 3);
		addChild(rectIntersectCircle);

		rectIntersectRect.x = stage.stageWidth - stage.stageWidth / 3;
		rectIntersectRect.y = stage.stageHeight - (stage.stageHeight / 3);
		addChild( rectIntersectRect );

		instructions = new InstructionText( "Drag the circle onto the rectangle to use rectangle.intersects()" );
		instructions.x = (stage.stageWidth - instructions.width) / 2;
		instructions.y = stage.stageHeight - (stage.stageHeight / 3);
		addChild( instructions );
		
		addEventListener(MouseEvent.MOUSE_DOWN, onMousePress );
		addEventListener( Event.ENTER_FRAME, onUpdate );
	}

	/**
	 * Check for collisions every frame
	 *
	 */
	private function onUpdate( e:Event )
	{
		doHitTestObjectCheck();
		
		doRectIntersectsCheck();
	}

	/**
	 * The check with hitTestObject on the blue elements
	 * 
	 * Check if the red sprites overlap using the hitTestObject() method of the DisplayObject class (http://api.openfl.org/openfl/display/DisplayObject.html#hitTestObject)
	 * 
	 * If there is an overlap and it has not already been detected earlier: apply glow filter
	 * else: if there is no overlap and one was detected earlier: remove glow filter
	 * 
	 * Because the bounding box is used for the collision check, the collision code is triggered even when the sprites don't visually overlap
	 *
	 */
	private function doHitTestObjectCheck()
	{
		var hitTestIsHappening:Bool = hitTestCircle.hitTestObject( hitTestRect );
		if( hitTestIsHappening && !hitTestAlreadyDetected )
		{
			hitTestRect.filters = [hitIndicationFilter];
			hitTestCircle.filters = [hitIndicationFilter];
			hitTestAlreadyDetected = true;
		}
		else if( !hitTestIsHappening && hitTestAlreadyDetected )
		{
			hitTestRect.filters = [];
			hitTestCircle.filters = [];
			hitTestAlreadyDetected = false;
		}
	}

	/**
	 * The check with the rect.intersects( rect ) on the red elements
	 *
	 * First get the bounding rects of the two elements to check (the blue sprites)
	 * Check if they overlap using the intersects method of the Rectangle class (http://api.openfl.org/openfl/geom/Rectangle.html#intersects)
	 * 
	 * If there is an overlap and it has not already been detected earlier: apply glow filter
	 * else: if there is no overlap and one was detected earlier: remove glow filter
	 *
	 * Because the circle has a shrunken bounding box, the collision code is only triggered when the collision is very obvious.
	 *
	 */
	private function doRectIntersectsCheck()
	{
		var circleRect:Rectangle = rectIntersectCircle.getBounds( this );
		var rectRect:Rectangle = rectIntersectRect.getBounds( this );
		var rectIntersectIsHappening:Bool = circleRect.intersects( rectRect );
		if( rectIntersectIsHappening && !rectIntersectAlreadyDetected )
		{
			rectIntersectRect.filters = [hitIndicationFilter];
			rectIntersectCircle.filters = [hitIndicationFilter];
			rectIntersectAlreadyDetected = true;
		}
		else if( !rectIntersectIsHappening && rectIntersectAlreadyDetected )
		{
			rectIntersectRect.filters = [];
			rectIntersectCircle.filters = [];
			rectIntersectAlreadyDetected = false;
		}
	}

	/**
	 * This and the function below make circles draggable
	 *
	 */
	private function onMousePress( e:MouseEvent )
	{
		if( e.target == hitTestCircle || e.target == rectIntersectCircle )
		{
			var sprite:Sprite = e.target;
			sprite.startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseRelease );
		}
	}
	private function onMouseRelease( e:MouseEvent )
	{
		stopDrag();
		removeEventListener(MouseEvent.MOUSE_UP, onMouseRelease );
	}
}




