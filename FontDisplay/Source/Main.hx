package;

import openfl.Assets;

import openfl.display.Sprite;

import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;

/**
 * This demo shows how to display 'special' fonts OpenFL.
 * 
 */
class Main extends Sprite 
{
	public function new () 
	{	
		super ();
		
		var tfmt:TextFormat = new TextFormat( Assets.getFont("assets/fonts/Retro Computer_DEMO.ttf").fontName, 28, 0xFF00FF, true );

		var tf:TextField = new TextField();
		tf.embedFonts = true;
		tf.autoSize = TextFieldAutoSize.LEFT;
		tf.height = 150;
		tf.defaultTextFormat = tfmt;
		tf.text = "Demonstrates use of 'special' fonts.";
		addChild( tf );
	}
}