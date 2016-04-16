package;

import openfl.display.Sprite;

/**
 * Very basic class
 * Represented by a circle
 * Has a speed variable defining the pixels per second this moves
 * 
 */
class TimeBasedMover extends Sprite
{
	// The speed in pixels per second
	private var speed:Int = 20;

	/**
	 * Constructor
	 */
	public function new()
	{
		super();
		drawMe();
	}

	/** 
	 * This function is called every frame.
	 * The displacement of this is calculated based on pixels / seconds
	 * if speed equals 10 and passedTime equals 0.02 (fps: 50) 
	 *   then the displacement in this frame will be 0.2 pixels
	 * 
	 * @param passedTime 	The time passed since last update in seconds
	 */
	public function update( passedTime:Float )
	{
		this.x += speed * passedTime;
	}

	/**
	 * Draw a nice Magenta circle representing this.
	 *
	 */
	private function drawMe()
	{
		this.graphics.beginFill( 0xFF00FF );
		this.graphics.drawCircle( 0, 0, 20 );
		this.graphics.endFill();
	}
}