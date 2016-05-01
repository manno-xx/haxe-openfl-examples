package;

import openfl.Lib;

import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.events.Event;

import openfl.text.TextField;
import openfl.text.TextFormat;

/**
 * Small Demo of static variables.
 *
 * - Static variables are variables 
 *   + that are the same for all instances created from the class in which the variable is defined.
 *   + that already exist without creating an instance of the class it is defined in (they are class variables, not instance variables)
 * 
 * Where a 'normal' variable (an instance variable) is accessed through the instance of a class, a static variable is accessed through the class itself:
 * an instance variable:
 *     var image:Sprite = new Sprite();
 *     image.x = 100;
 *
 * a static variable:
 *     var radius:Float = 10;
 *     var circomference:Float = Math.PI * radius; // Math.PI is a static variable in the Math class (and a constant too; it cannot be changed)
 * 
 * - To use a static variable you do not use the instance of the class, but address the class directly:
 *     Math.PI is the usage of the static variable PI in the Math class (value ~= 3.14)
 *     Events.ENTER_FRAME is the usage of the static variable ENTER_FRAME in the events class
 *     Keyboard.UP is the usage of the static variable UP (defining the key code of the up arrow key) in the Keyboard class
 *
 * - Static variables are _not_ variables that cannot be changed (as the name might imply).
 *     Those are so called constants. In haxe indicated by the 'inline' prefix. From the event class:
 *     public static inline var ENTER_FRAME = "enterFrame";
 *     However, static variables are often constants too.
 * 
 * In this demo there is a static variable in the class RotatingThing. The variable defines the rotation speed of the rectangle the class represents.
 * The value of the static variable is changed according to the horizontal position of the mouse.
 * 
 */
class Main extends Sprite 
{
	private var lastUpdate:Int;

	private var allSquares:Array<RotatingThing> = new Array<RotatingThing>();

	/**
	 * The constructor initializes the demo
	 *
	 */
	public function new () 
	{
		super ();
		
		addInfoText();

		addSquares( 30 );

		lastUpdate = Lib.getTimer();

		stage.addEventListener( MouseEvent.MOUSE_MOVE, mouseHasMoved );
		addEventListener( Event.ENTER_FRAME, update );
	}

	/**
	 * Update all rotating rectangles based on the passed time since previous update
	 *
	 */
	private function update( event:Event )
	{
		var now:Int = Lib.getTimer();
		var passedSeconds:Float = (now-lastUpdate) / 1000;
		lastUpdate = now;

		for( square in allSquares )
		{
			square.update( passedSeconds );
		}
	}
	
	/**
	 * Whenever the mouse moves.
	 * Divide the x position of the mouse by the with of the stage (resulting in a value between 0 and 1)
	 * Multiply that value by the static variable maxRotationSpeed of the class RotatingThing
	 * Set the static variable rotationSpeed of RotatingThing to the result 
	 */
	private function mouseHasMoved( event:MouseEvent )	
	{
		RotatingThing.rotationSpeed = RotatingThing.maxRotationSpeed * (event.stageX / stage.stageWidth);
	}

	/**
	 * Create a number of RotatingThing instances (a square that rotates at a certain speed)
	 * Add all to an array for future reference (in order to update them every frame)
	 */
	private function addSquares( amount:Int )
	{
		// create a number of instances of the RotatingThing class
		for( i in 0...amount )
		{
			var rot:RotatingThing = new RotatingThing();
			rot.x = Math.random() * stage.stageWidth;
			rot.y = Math.random() * stage.stageHeight;
			addChild( rot );
			allSquares.push( rot );
		}
	}

	/**
	 * Create the instruction text
	 * uses a font from the assets folder, is multi line and wraps the text
	 *
	 */
	private function addInfoText()
	{
		var textFormat:TextFormat = new TextFormat( openfl.Assets.getFont("assets/Andale Mono.ttf").fontName, 48, 0x000000, true, false, false, null, null, openfl.text.TextFormatAlign.CENTER );
		var infoTextField:TextField = new TextField();
		addChild( infoTextField );

		infoTextField.defaultTextFormat = textFormat;
		infoTextField.wordWrap = true;
		infoTextField.embedFonts = true;
		infoTextField.multiline = true;
		infoTextField.text = "move your mouse horizontally across the screen to change the rotation speed";
		infoTextField.selectable = false;
		infoTextField.width = 400;
		infoTextField.height = 600;
		infoTextField.x = (stage.stageWidth - infoTextField.width) / 2;
	}
}
















