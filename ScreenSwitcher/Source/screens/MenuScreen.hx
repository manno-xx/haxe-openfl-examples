package screens;

import openfl.Assets;

import openfl.display.Sprite;

class MenuScreen extends Screen
{
	public function new()
	{
		super();
	}
	
	override public function onLoad():Void
	{
		var it:InstructionText = new InstructionText( "This is the menu screen. Choice is plentyful" );
		it.x = (stage.stageWidth - it.width) / 2;
		it.y = stage.stageHeight / 2;
		addChild( it );

		var toGame:Button = new Button( 
			Assets.getBitmapData("images/Button.png"), 
			Assets.getBitmapData("images/Button_over.png"), 
			Assets.getBitmapData("images/Button_pressed.png"), 
			"Play", 
			onPlayClick );

		toGame.x = (stage.stageWidth-toGame.width) / 2;
		toGame.y = stage.stageHeight / 3;
		addChild( toGame );
	}

	private function onPlayClick()
	{
		Main.instance.loadScreen( ScreenTypes.GAME_SCREEN );
	}

}