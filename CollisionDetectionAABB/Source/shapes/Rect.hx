package shapes;

import openfl.display.Sprite;

class Rect extends Sprite
{
	private function draw( color:Int )
	{
		this.graphics.beginFill( color );
		this.graphics.drawRect( -30, -30, 60, 60 );
		this.graphics.endFill();
	}
}