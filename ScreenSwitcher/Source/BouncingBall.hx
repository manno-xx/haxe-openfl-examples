package;

import openfl.display.Sprite;

import openfl.events.Event;

import openfl.geom.Point;

/**
 * A simple bouncing ball
 * 
 */
class BouncingBall extends Sprite
{
	private var radius:Int = 20;

	private var speed:Int = 100;
	private var velocity:Point;

	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init );
	}

	/**
	 * Initialize after this ball has been added to the stage
	 */
	public function init( e:Event )
	{
		velocity = Point.polar( speed, Math.random() * Math.PI * 2 );

		this.graphics.beginFill( 0x000000 );
		this.graphics.drawCircle( 0, 0, radius );
		this.graphics.endFill();
	}

	/**
	 * Make the ball move on the screen based on the time from previous update
	 * 
	 */
	public function update( secondsPassed:Float )
	{
		this.x += velocity.x * secondsPassed;
		this.y += velocity.y * secondsPassed;

		bounce();
	}

	/**
 	 * Makes sure the ball stays within bounds of the screen
 	 *
 	 */
	private function bounce()
	{
		if( this.x > (stage.stageWidth - radius) && velocity.x > 0 )
		{
			velocity.x *= -1;
		}
		if( this.x < (0 + radius) && velocity.x < 0 )
		{
			velocity.x *= -1;
		}

		if( this.y > (stage.stageHeight - radius) && velocity.y > 0 )
		{
			velocity.y *= -1;
		}
		if( this.y < (0 + radius) && velocity.y < 0 )
		{
			velocity.y *= -1;
		}
	}
}