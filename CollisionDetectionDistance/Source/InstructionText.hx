package;

import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormatAlign;

class InstructionText extends TextField
{
	public function new( msg:String )
	{
		super();

		var textFormat:TextFormat = new TextFormat( "_sans", 24, 0xCCCCCC, true, false, false, null, null, TextFormatAlign.CENTER );

		this.defaultTextFormat = textFormat;
		this.text = msg;
		this.selectable = false;
		this.mouseEnabled = false;
		this.autoSize = TextFieldAutoSize.LEFT;
	}
}