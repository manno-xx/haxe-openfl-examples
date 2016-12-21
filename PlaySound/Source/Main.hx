package;

import openfl.Assets;

import openfl.display.Sprite;

import openfl.events.Event;

import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

class Main extends Sprite 
{
	
	var channel:SoundChannel;

	var isPaused:Bool = false;
	var soundPosition:Float = 0;

	public function new () 
	{
		super ();

		var playButton:Button = new Button( Assets.getBitmapData("images/Button.png"), 
							  Assets.getBitmapData("images/Button_over.png"), 
							  Assets.getBitmapData("images/Button_pressed.png"), 
							  "play",
							  playSound );
		playButton.x = (stage.stageWidth - playButton.width) / 2;
		playButton.y = 50;
		addChild( playButton );

		var pauseButton:Button = new Button( Assets.getBitmapData("images/Button.png"), 
							  Assets.getBitmapData("images/Button_over.png"), 
							  Assets.getBitmapData("images/Button_pressed.png"), 
							  "pause",
							  togglePause );
		pauseButton.x = (stage.stageWidth - pauseButton.width) / 2;
		pauseButton.y = 150;
		addChild( pauseButton );

		var stopButton:Button = new Button( Assets.getBitmapData("images/Button.png"), 
							  Assets.getBitmapData("images/Button_over.png"), 
							  Assets.getBitmapData("images/Button_pressed.png"), 
							  "stop",
							  stopSound );
		stopButton.x = (stage.stageWidth - stopButton.width) / 2;
		stopButton.y = 250;
		addChild( stopButton );
	}
	
	/**
	 * Play the sound.
	 * If it was already playing, it is stopped first
	 *
	 */
	private function playSound( ):Void
	{
		if( channel != null )
		{
			trace("stopping");
			channel.removeEventListener( Event.SOUND_COMPLETE, onSoundComplete );
			channel.stop();
		}

		// get the sound (mp3, ogg) based on publishig target
		var snd:Sound = getAudio("vinyl-static");

		// tell the sound to play and store the reference to the channel it plays in in a variable
		// the three parameters are optional: start point (see pause function), loopcount and volume and panning settings
		// This would have worked here too:
		// channel = snd.play( );
		channel = snd.play( 0, 1, new SoundTransform( 1, 0 ) );
		channel.addEventListener( Event.SOUND_COMPLETE, onSoundComplete );
	}
	
	/**
	 * If there is a sound playing 
	 *   if it is paused: play it from the point it was previousely paused at
	 *   otherwise: pause it and store the position of the sound for future reference
	 * 
	 */
	private function togglePause():Void
	{
		if( channel == null )
			return;

		if( isPaused )
		{
			trace( "resume playing" );
			var snd:Sound = getAudio("vinyl-static");
			channel = snd.play( soundPosition, 1, new SoundTransform( 1, 0 ) );
		}
		else
		{
			trace( "pause playing" );
			soundPosition = channel.position;
			channel.stop();
		}

		isPaused = !isPaused;
	}

	/**
	 * Stops the sound playing in SoundChannel channel
	 *
	 */
	private function stopSound():Void
	{
		if( channel != null )
		{
			trace( "stop playing" );
			channel.stop();
			channel = null;
		}
	}

	/**
	 * Triggered when the sound is done playing
	 *
	 */
	function onSoundComplete( e:Event ):Void
	{
		trace( "done playing" );
		channel = null;
	}

	/**
	 * get a certain audio file based on it's 'base name', the filename minus the extension
	 * 
	 */
	function getAudio( basename:String ):Sound
	{
		// conditional compilation depending on the target (neko does not have the mp3 licenses so plays .ogg files)
		#if flash
		var snd:Sound = Assets.getSound( "sounds/" + basename + ".mp3" );
		#elseif neko
		var snd:Sound = Assets.getSound( "sounds/" + basename + ".ogg" );
		#end

		return snd;
	}
}


