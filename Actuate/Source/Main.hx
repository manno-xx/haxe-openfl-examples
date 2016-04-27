package;

import motion.Actuate;
import motion.easing.Linear;
import motion.easing.Bounce;

import openfl.display.Sprite;

import openfl.events.MouseEvent;

/**
 * Tweening is making something move from A to B 
 *  in such a way that the steps taken to get from A to B are calculated by the 'tween engine'
 * These steps can have several forms: acceleration, deceleration, bounce, ..., 
 *   this is defined by the ease/easing setting of the tween.
 * 
 * In Haxe the more or less standard tween engine is Actuate.
 * It can do much much more than demonstrated here. See: https://github.com/openfl/actuate
 *
 * In this example a few elements are moved/changed using Actuate
 * - the magenta box moves towards the last location the mouse clicked.
 * - the red box bounces in the middle of the stage
 * - the green box fades out and when faded out moves somewhere else to fade out again
 * 
 */
class Main extends Sprite 
{
	var magentaBox:Box;
	var fadeBox:Box;
	
	public function new () 
	{
		super ();
		
		createClickMouseChaser();

		createBouncer();

		createFader();
	}

	/**
	 * Create the box that moves towards the position of a mouse click
	 *
	 */
	private function createClickMouseChaser()
	{
		magentaBox = new Box( 0xFF00FF );
		magentaBox.x = stage.stageWidth / 2;
		magentaBox.y = stage.stageHeight / 2;
		addChild( magentaBox );

		stage.addEventListener( MouseEvent.CLICK, moveToMouse );
	}
	/**
	 * Makes the magenta box move to the location that was clicked.
	 */
	function moveToMouse( event:MouseEvent )
	{
		Actuate.tween( magentaBox, 2, { x: event.stageX, y: event.stageY } );
	}

	/**
	 * A bouncing box at the middle of the stage
	 * 
	 */
	private function createBouncer()
	{
		// create and position box
		var bounceBox:Box = new Box( 0xFF0000 );
		bounceBox.x = stage.stageWidth / 2;
		bounceBox.y = bounceBox.height / 2;
		addChild( bounceBox );

		// tween the box to the bottom of the stage with a Bounce easing. The animation is repeated indefinetely with 2 second delays
		Actuate.tween( bounceBox, 4, {x: bounceBox.x, y: stage.stageHeight - bounceBox.height / 2 }).ease( Bounce.easeOut ).repeat().delay(2);
	}

	/**
	 * Create the fading box
	 */
	private function createFader()
	{
		fadeBox = new Box( 0x00FF00 );
		addChild( fadeBox );
		positionAndFade( fadeBox );
	}

	/**
	 * set alpha to 1 and position box randomly
	 * then start a tween that calls this function again when done with a delay of 1 second
	 * The autovisible(false) makes sure the sprite is not made invisible after fading out (visible=false is something else than alpha=0)
	 */
	private function positionAndFade( boxToFade:Box )
	{
		boxToFade.alpha = 1;
		boxToFade.x = Math.random() * stage.stageWidth;
		boxToFade.y = Math.random() * stage.stageHeight;
		Actuate.tween( boxToFade, 2, {alpha: 0} ).onComplete(positionAndFade, [boxToFade]).autoVisible(false).delay( 1 );
	}
}