package;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * A fairly crude button with state functionality and a callback for when clicked.
 *
 */
class Button extends Sprite 
{
	var upBitmapData:BitmapData;
	var overBitmapData:BitmapData;
	var downBitmapData:BitmapData;

	var mousePressed:Bool = false;

	var image:Bitmap;

	var callback:Void->Void;

	/**
	 * Create the button
	 *
	 * @param up 		The bitmap data for the up state
	 * @param over 		The bitmap data for the over state
	 * @param down 		The bitmap data for the down state
	 * @param label 	The text on the button
	 * @param callback	The function to be called when the button is clicked
	 *
	 */
	public function new( up:BitmapData, over:BitmapData, down:BitmapData, label:String, callback:Void->Void )
	{
		super();

		upBitmapData = up;
		overBitmapData = over;
		downBitmapData = down;

		image = new Bitmap( upBitmapData );
		addChild( image );

		if( label.length > 0 )
		{
			var tfmt:TextFormat = new TextFormat( Assets.getFont("fonts/Retro Computer_DEMO.ttf").fontName, 22, 0x000000, true, false, false, null, null, TextFormatAlign.CENTER );
			var tf:TextField = new TextField();
			tf.defaultTextFormat = tfmt;
			tf.embedFonts = true;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.mouseEnabled = false;
			tf.selectable = false;
			tf.text = label;
			addChild( tf );
		}
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}

	function init( e:Event)
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		addEventListener( MouseEvent.CLICK, onClick );
		addEventListener( MouseEvent.MOUSE_OVER, onHover );
		addEventListener( MouseEvent.MOUSE_OUT, onOut );
		addEventListener( MouseEvent.MOUSE_DOWN, onDown );
		stage.addEventListener( MouseEvent.MOUSE_UP, onUp );
	}

	function onHover( e:MouseEvent ):Void
	{
		if( mousePressed )
			image.bitmapData = downBitmapData;
		else
			image.bitmapData = overBitmapData;
	}
	function onOut( e:MouseEvent ):Void
	{
		image.bitmapData = upBitmapData;	
	}
	function onDown( e:MouseEvent ):Void
	{
		image.bitmapData = downBitmapData;
		mousePressed = true;
	}
	function onUp( e:MouseEvent ):Void
	{
		image.bitmapData = upBitmapData;
		mousePressed = false;
	}

	function onClick( e:MouseEvent ):Void
	{
		callback();
	}
}