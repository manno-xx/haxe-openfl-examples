package;

import openfl.display.Sprite;

class Circle extends Sprite
{
	
	public function new( radius:Int )
	{
		super();
		this.graphics.beginFill( Std.int( Math.random() * 0xFFFFFF ) );
		this.graphics.drawCircle( 0, 0, radius );
		this.graphics.endFill();
	}
}