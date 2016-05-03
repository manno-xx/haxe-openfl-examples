package shapes;

import openfl.display.Sprite;

class Circle extends Sprite
{
	private function draw( color:Int )
	{
		this.graphics.beginFill( color );
		this.graphics.drawCircle( 0, 0, 30 );
		this.graphics.endFill();
	}
}