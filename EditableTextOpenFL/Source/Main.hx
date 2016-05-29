package;

import openfl.Assets;

import openfl.display.Sprite;

import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

class Main extends Sprite 
{
	
	var inputField:TextField;
	var outputField:TextField;

	public function new () 
	{
		super ();
				
		setupUI();	
	}

	/**
	 * Creates and sets up the textfield for input
	 *
	 */
	private function setupUI():Void
	{
		var textFormat:TextFormat = new TextFormat( "_sans", 24, 0x000000, true, false, false, null, null, TextFormatAlign.CENTER );

		inputField = new TextField();
		inputField.defaultTextFormat = textFormat;
		inputField.type = TextFieldType.INPUT;
		inputField.width = 200;
		inputField.wordWrap = true;
		inputField.multiline = true;
		inputField.x = (stage.stageWidth - inputField.width ) / 2;
		inputField.y = (stage.stageHeight - inputField.height ) / 2;
		inputField.border = true;

		addChild( inputField );

		var button:Button = new Button( Assets.getBitmapData("img/Button.png"), 
										Assets.getBitmapData("img/Button_over.png"), 
										Assets.getBitmapData("img/Button_pressed.png"),
										"name it",
										displayContents );
		button.x = (stage.stageWidth - button.width ) / 2;
		button.y = (inputField.y + inputField.height );
		addChild( button );

		outputField = new TextField();
		outputField.defaultTextFormat = textFormat;
		outputField.selectable = false;
		outputField.autoSize = TextFieldAutoSize.CENTER;
		// outputField.wordWrap = true;
		// outputField.multiline = true;
		outputField.x = (stage.stageWidth - outputField.width ) / 2;
		outputField.y = button.y + button.height;
		outputField.border = true;
		addChild( outputField );
	}

	/**
	 * Display the contents of the input field in the ... output field
	 *
	 */
	private function displayContents()
	{
		outputField.text = 'The contents of the input field is: ${inputField.text}';
	}
	
}