package;

import openfl.display.Sprite;

class Box extends Sprite
{
	
	public function new( color:Int = 0x000000 )
	{
		super();

		this.graphics.beginFill( color );
		this.graphics.drawRect( -20, -20, 40, 40 );
		this.graphics.endFill();
	}
}