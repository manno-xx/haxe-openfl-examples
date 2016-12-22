package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

/**
 * Very Basic demo of how to move some sprite in a certain direction.
 * Code essential to the demo is in the Arrow class.
 *
 * This just creates a few sprites and tells them to update every frame.
 *
 */
class Main extends Sprite 
{
	
	var lastUpdate:Int;
	var ships:Array<Arrow>;

	public function new () 
	{
		super ();
		
		createShips( 3 );

		// make sure the 'game loop' runs
		addEventListener( Event.ENTER_FRAME, update );
	}

	/**
	 * The 'game loop'
	 * Updates all the ships in the array of ships
	 *
	 */
	public function update( e:Event )
	{
		var now = Lib.getTimer();
		var deltaTime:Float = (now - lastUpdate) / 1000;
		lastUpdate = now;

		for (ship in ships) 
		{
			ship.update( deltaTime );
		}
	}

	/**
	 * Generate a number of ships
	 *
	 * @param count 	The number of 'ships' to create
	 */
	function createShips( count:Int ):Void
	{
		var tempShip:Arrow;

		ships = new Array<Arrow>();

		for( i in 0...count)
		{
			var ship:Arrow = new Arrow( Math.floor(Math.random() * 0xFFFFFF) );
			ship.x = Math.random() * Lib.current.stage.stageWidth;
			ship.y = Math.random() * Lib.current.stage.stageHeight;
			addChild( ship );
			ships.push(ship);
			
		}
	}
	
}