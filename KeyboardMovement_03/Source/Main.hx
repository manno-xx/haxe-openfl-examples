package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.ui.Keyboard;

/**
 * Basic example of controling multiple avatars on one keyboard
 * The Key class is a copy from: https://www.kirupa.com/forum/showthread.php?223798-ActionScript-3-Tip-of-the-Day/page22&p=2098269#post2098269
 * 
 */
class Main extends Sprite 
{
	var lastUpdate:Int;

	var ships:Array<Arrow>;

	public function new () 
	{
		super ();
	
		// tell the key class to initialize
		// the Key class keeps track of which keys are pressed.
		Key.initialize( Lib.current.stage );
		
		createShips();

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
	 * Creates two ships and adds them to the screen/stage as well as an array kooping track of all ships.
	 *
	 */
	function createShips():Void
	{
		var tempShip:Arrow;

		ships = new Array<Arrow>();

		tempShip = new Arrow(Keyboard.UP, Keyboard.LEFT, Keyboard.RIGHT, 0xFF00FF);
		tempShip.x = stage.stageWidth / 3;
		tempShip.y = stage.stageHeight / 2;
		tempShip.rotation = -180;
		addChild( tempShip );

		ships.push( tempShip );


		tempShip = new Arrow(Keyboard.W, Keyboard.A, Keyboard.D, 0x00FF00);
		tempShip.x = stage.stageWidth - stage.stageWidth / 3;
		tempShip.y = stage.stageHeight / 2;
		addChild( tempShip );

		ships.push( tempShip );
	}
}