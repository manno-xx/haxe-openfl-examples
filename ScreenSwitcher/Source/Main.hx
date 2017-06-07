package;

import openfl.display.Sprite;

import screens.*;

/**
 * Demonstrates a way to devide up an application into seperate screens represented by their own class.
 *
 * This Main class is a Singleton
 */
class Main extends Sprite 
{

	// which screen is visible/active now
	private var currentScreen:Screen;

	// the static variable pointing to the instance of this class
	// see http://haxe.org/manual/class-field-property.html for the access modifiers
	public static var instance(get, null):Main;

	/** 
	 * This constructor does not do much...
	 */
	private function new () 
	{
		super ();
	}

	/**
	 * Load a screen.
	 * If there is a screen active:
	 * - it is removed first from the display list
	 * - it's onDestroy function is called to do possible house keeping tasks
	 *
	 * Then a check is done for which screen to load, 
	 *  it is instantitated, added to the display list and it's onLoad function is called.
	 *
	 * @param which 	The type of screen to load next
	 */
	public function loadScreen( which:ScreenType )
	{
		if( currentScreen != null && contains( currentScreen ) )
		{
			currentScreen.onDestroy();
			removeChild( currentScreen );
		}

		switch ( which ) 
		{
			case ScreenType.Menu:
				currentScreen = new MenuScreen();
			case ScreenType.Game:
				currentScreen = new GameScreen();
		}

		addChild( currentScreen );
		currentScreen.onLoad();
	}

	/**
	 * The public access to the private instance variable
	 *
	 */
	public static function get_instance():Main
	{
		if( instance == null )
			instance = new Main();

		return instance;
	}

	/**
	 * The static function main is first called by the OpenFL framework
	 * This allows for the actual constructor to be private, living up to the Singleton pattern
	 */
	public static function main()
	{
		var m:Main = Main.instance;
		openfl.Lib.current.stage.addChild( m );

		m.loadScreen( ScreenType.Menu );
	}
}