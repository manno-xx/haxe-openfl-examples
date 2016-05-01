package;

import openfl.display.Sprite;
import openfl.display.Shape;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;

/**
 * Can be used as progress bar for loading, a health bar for characters or a time bar (music, video etc.)
 * Draws an outline for the boundaries of the shape.
 * Creates a shape to fill the outline.
 * Scaling the shape with the fill to a value between 0 and 1 makes this bar's size between 0 and 100 percent of the original width
 */
class UIProgressBar extends Sprite
{
	// the width of the entire bar (incl. outline)
	var barWidth:Int = 60;
	// the height of the entire bar (incl. outline)
	var barHeight:Int = 8;
	// the size/thickness of the outline
	var outlineWidth:Int = 2;

	// variable indicating the current state of the bar (how far it is 'filled')
	var value:Float = 1;
	
	// the shape actually indicating the bar (so not the outline of the bar)
	// because the bar needs change now and then, it is stored in a var
	var barShape:Shape;

	public function new( width:Int = 60, height:Int = 8, outlineThickness:Int = 2 )
	{
		super();

		barWidth = width;
		barHeight = height;
		outlineWidth = outlineThickness;

		drawBar();
		drawOutline();
	}

	/**
	 * Draw the static outline of the bar. 
	 * Does not change, no need to reference it later 
	 *  so not stored in a variable
	 *
	 */
	private function drawOutline()
	{
		this.graphics.lineStyle( outlineWidth, 0x000000, 1, true, null, CapsStyle.SQUARE, JointStyle.MITER );
		this.graphics.beginFill( 0xffffff );
		this.graphics.drawRect( 0, 0, barWidth, barHeight );
	}

	/**
	 * Draw the actual bar.
	 * This is the changing element so a reference is needed.
	 * The variable with the name barShape is used.
	 */
	private function drawBar()
	{
		barShape = new Shape();
		barShape.x = outlineWidth / 2;
		barShape.y = outlineWidth / 2;
		barShape.graphics.beginFill( 0x00DD00 );
		barShape.graphics.drawRect( 0, 0, barWidth - outlineWidth, barHeight - outlineWidth );
		barShape.graphics.endFill();
		addChild( barShape );
	}

	/**
	 * To update the bar, call this function with a new value between 0 and 1
	 *  - The incoming value is clamped between 0 and 1.
	 *  - And the bar is updated
	 * 
	 */
	public function setValue( val:Float )
	{
		// make sure the value variable cannot be outside the range 0 ... 1
		this.value = Math.min( Math.max( 0, val ), 1 );

		updateBar();
	}

	/**
	 * update the scale of the bar based on the value of the ... value variable
	 * 
	 */
	private function updateBar()
	{
		barShape.scaleX = this.value;
	}
}