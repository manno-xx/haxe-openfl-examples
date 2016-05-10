package screens;

import openfl.display.Sprite;

import openfl.events.Event;

/**
 * The base class for all screens.
 * The onLoad and onDestroy can be implemented in the derived classes.
 */
class Screen extends Sprite
{
	public function new()
	{
		super();
	}

	public function onLoad():Void
	{
	}
	public function onDestroy():Void
	{
	}
}