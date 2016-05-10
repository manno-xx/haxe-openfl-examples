package screens;

import openfl.Assets;
import openfl.Lib;

import openfl.display.Sprite;

import openfl.events.Event;

/**
 * Simple screen in the application.
 * Shows a text, a button and a moving element.
 *
 */
class GameScreen extends Screen
{
	private var lastUpdate:Int;

	private var bouncer:BouncingBall;

	public function new()
	{
		super();
	}

	override public function onLoad():Void
	{
		var it:InstructionText = new InstructionText( "This is the action packed game screen" );
		it.x = (stage.stageWidth - it.width) / 2;
		it.y = stage.stageHeight / 2;
		addChild( it );

		var toMenu:Button = new Button( 
			Assets.getBitmapData("images/Button.png"), 
			Assets.getBitmapData("images/Button_over.png"), 
			Assets.getBitmapData("images/Button_pressed.png"), 
			"quit", 
			onQuitClick );

		toMenu.x = (stage.stageWidth-toMenu.width) / 2;
		toMenu.y = stage.stageHeight / 3;
		addChild( toMenu );

		bouncer = new BouncingBall();
		bouncer.x = stage.stageWidth / 2;
		bouncer.y = stage.stageHeight / 2;
		addChild( bouncer );

		lastUpdate = Lib.getTimer();

		addEventListener( Event.ENTER_FRAME, update );
	}

	private function update( e:Event )
	{
		var now:Int = Lib.getTimer();
		var secondsPassed:Float = (now-lastUpdate) / 1000;
		lastUpdate = now;

		bouncer.update( secondsPassed );
	}

	private function onQuitClick()
	{
		Main.getInstance().loadScreen( ScreenType.Menu );
	}

	override public function onDestroy()
	{
		removeEventListener( Event.ENTER_FRAME, update );
	}

}