package;

import openfl.Assets;

import openfl.display.Sprite;

import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;

#if neko
	@:font("Assets/fonts/Retro Computer_DEMO.ttf") class RetroFont extends Font {}
#end

/**
 * This demo shows how to display 'special' fonts in both Flash and Neko.
 * 
 * By some conditional code compilation a 
 *   different TextFormat is created depending on the publishing target (Flash or Neko)
 *
 * A bit more on conditional compilation at:
 *   http://haxeflixel.com/documentation/compiler-conditionals/
 *   or:
 *   http://haxe.org/manual/lf-condition-compilation.html
 * 
 */
class Main extends Sprite 
{
	
	public function new () 
	{	
		super ();
		
		// using embedded font as defined above using @font()
		#if neko
			Font.registerFont (RetroFont);
			//trace( new Main.RetroFont().fontName );
			var tfmt:TextFormat = new TextFormat( new Main.RetroFont().fontName, 28, 0xFF00FF, true );
		#elseif flash
			// using the fonts by means of the Assets class
			var font:Font = Assets.getFont( "fonts/test_font.ttf" );
			//trace( font.fontName );
			var tfmt:TextFormat = new TextFormat( font.fontName, 14, 0xFF00FF, true );
		#end

		var tf:TextField = new TextField();
		tf.embedFonts = true;
		tf.autoSize = TextFieldAutoSize.LEFT;
		tf.height = 150;
		tf.defaultTextFormat = tfmt;
		tf.text = "Demonstrates use of 'special' fonts in Flash and Neko as well as \nconditional compilation of code depending on the publishing target.\n\nIn Neko this will display another font than in Flash.";
		addChild( tf );
	}
}