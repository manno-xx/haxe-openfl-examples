package shapes;

import openfl.display.Sprite;

class Circle extends Sprite
{
	// make the radius variable public to read and private to write
	public var radius(default, null):Int;
	
	public function new(color:Int, r:Int)
	{
		super();

		radius = r;	

		draw( color );
	}

	private function draw( color:Int )
	{
		this.graphics.beginFill( color );
		this.graphics.drawCircle( 0, 0, radius );
		this.graphics.endFill();
	}
}