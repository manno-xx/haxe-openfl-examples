package;

import openfl.Assets;
import openfl.Lib;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.media.Sound;
import openfl.media.SoundTransform;

/**
 * Simple example to play one shot audio
 *
 */
class Main extends Sprite 
{
	
	
	public function new () 
	{	
		super ();

		var upState:BitmapData = Assets.getBitmapData("img/Button.png");
		var overState:BitmapData = Assets.getBitmapData("img/Button_over.png");
		var pressedState:BitmapData = Assets.getBitmapData("img/Button_pressed.png");

		var playOneShotButton:Button = new Button( upState, overState, pressedState, "normal", playSingle );
		playOneShotButton.x = (Lib.current.stage.stageWidth - playOneShotButton.width) / 2;
		addChild( playOneShotButton );

		var playWithVolumeButton:Button = new Button( upState, overState, pressedState, "soft", playSingleWithVolume );
		playWithVolumeButton.x = (Lib.current.stage.stageWidth - playWithVolumeButton.width) / 2;
		playWithVolumeButton.y = 100;
		addChild( playWithVolumeButton );

		var playWithPanningButton:Button = new Button( upState, overState, pressedState, "left", playSingleWithPanning );
		playWithPanningButton.x = (Lib.current.stage.stageWidth - playWithPanningButton.width) / 2;
		playWithPanningButton.y = 200;
		addChild( playWithPanningButton );

		var play10Times:Button = new Button( upState, overState, pressedState, "* 10", play10Times );
		play10Times.x = (Lib.current.stage.stageWidth - play10Times.width) / 2;
		play10Times.y = 300;
		addChild( play10Times );

	}

	function playSingle()
	{
		var snd:Sound;
		#if flash
		snd = Assets.getSound("sound/Pickup_Coin_01.mp3");
		#else
		snd = Assets.getSound("sound/Pickup_Coin_01.ogg");
		#end
		snd.play();
	}

	function playSingleWithVolume()
	{
		// first parameter of soundTransform is volume. 0 for mute, 1 for max
		// http://api.openfl.org/openfl/media/SoundTransform.html
		var soundTransform:SoundTransform = new SoundTransform( 0.2, 0 );
		var snd:Sound;
		#if flash
		snd = Assets.getSound("sound/Pickup_Coin_01.mp3");
		#else
		snd = Assets.getSound("sound/Pickup_Coin_01.ogg");
		#end
		snd.play( 0, 0, soundTransform );
	}

	function playSingleWithPanning()
	{
		// second parameter of soundTransform is panning. -1 for left, 0 for center, 1 for right
		// http://api.openfl.org/openfl/media/SoundTransform.html
		var soundTransform:SoundTransform = new SoundTransform( 1, -1 );
		var snd:Sound;
		#if flash
		snd = Assets.getSound("sound/Pickup_Coin_01.mp3");
		#else
		snd = Assets.getSound("sound/Pickup_Coin_01.ogg");
		#end
		snd.play( 0, 0, soundTransform );
	}

	function play10Times()
	{
		// second parameter of play is loop count
		var snd:Sound;
		#if flash
		snd = Assets.getSound("sound/Pickup_Coin_01.mp3");
		#else
		snd = Assets.getSound("sound/Pickup_Coin_01.ogg");
		#end
		snd.play( 0, 10 );
	}
}