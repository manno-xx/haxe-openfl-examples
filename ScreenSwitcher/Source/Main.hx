package;


import openfl.display.Sprite;

import screens.*;



class Main extends Sprite 
{

	// which screen is visible/active now
	private var currentScreen:Screen;

	// see for the stuff between brackets: http://haxe.org/manual/class-field-property.html
	public static var instance(default, null):Main;

	public function new () 
	{
		super ();

		instance = this;
		
		loadScreen( ScreenType.Menu );
	}

	public function loadScreen( which:ScreenType )
	{
		if( currentScreen != null && contains( currentScreen ) )
		{
			removeChild( currentScreen );
			currentScreen.onDestroy();
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
}