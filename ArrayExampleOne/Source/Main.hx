package;

import openfl.Assets;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.events.KeyboardEvent;

/**
 * Example that uses an array as a source of items to use one by one
 * Same setup could be used for:
 * - array of questions in a quiz...
 * - texts to display in a linear order
 * - basically anything that needs to be done in a linear order
 *
 * The essence is that the application uses the array as a datasource
 * Whenever an item is used, it is removed from the array as well.
 * When the array runs out of items, the application kind of 'stops'. The source ran dry...
 *
 * The button that triggers the 'use' of the item in this demo can be anything:
 * - a timer
 * - a button
 * - an event like killing the previous opponent that was in the array
 * - ...
 */
class Main extends Sprite 
{
	// the array (here it contains just plain simple integers)
	var arrayWithItems:Array<Int>;

	// the output text field displaying items from the array
	var textField:TextField;
	
	/**
	 * Initialize the aplpication
	 *
	 */
	public function new () 
	{	
		super ();
		
		createUI();
		generateArrayWithItems();
	}

	/**
	 * If the array still contains elements, remove the last element and 'use' it.
	 * If the array is empty, display a text that the show is over.
	 *
	 * (this function is called by clicking the button)
	 */
	function displayItemFromArray()
	{
		if( arrayWithItems.length > 0 )
		{
			var theQuestion:Int = arrayWithItems.pop();
			textField.text = Std.string( theQuestion );
		}
		else
		{
			textField.text = "Nothing more in the array";
		}
	}

	/**
	 * Fills the array.
	 * In this example pretty basic because the array only contains integers.
	 * In a more real-world-application the array would probably contain info from a database or other more complex things.
	 * That would obviously make this function a bit more complex.
	 * 
	 */
	function generateArrayWithItems()
	{
		arrayWithItems = new Array<Int>();

		for( i in 0...10 )
		{
			arrayWithItems.push( i );
		}
	}

	/**
	 * Builds the user interface to use in the demo
	 * Just an output text field and a button that will make the application go through the items in the array
	 */
	function createUI()
	{
		textField = new TextField();
		textField.border = true;
		textField.width = 200;
		textField.x = (stage.stageWidth - textField.width) / 2;
		textField.y = (stage.stageHeight - textField.height) / 2;
		addChild( textField );

		var button:Button = new Button( 
										Assets.getBitmapData( "img/Button.png" ),
										Assets.getBitmapData( "img/Button_over.png" ),
										Assets.getBitmapData( "img/Button_pressed.png" ),
										"Click me",
										displayItemFromArray );
		button.x = (stage.stageWidth - button.width) / 2;
		button.y = textField.y + textField.height;
		addChild( button );
	}
}









