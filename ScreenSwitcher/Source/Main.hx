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
		
		loadScreen( ScreenTypes.MENU_SCREEN );
	}

	public function loadScreen( which:ScreenTypes )
	{
		if( currentScreen != null && contains( currentScreen ) )
		{
			removeChild( currentScreen );
			currentScreen.onDestroy();
		}

		switch ( which ) 
		{
			case ScreenTypes.MENU_SCREEN:
				currentScreen = new MenuScreen();
			case ScreenTypes.GAME_SCREEN:
				currentScreen = new GameScreen();
		}

		addChild( currentScreen );
		currentScreen.onLoad();
	}
}