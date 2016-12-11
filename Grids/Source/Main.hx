package;

import openfl.display.Sprite;

/**
 * Simple demo to generate a grid
 * There is plenty of ways to do this and this demonstrates just a few:
 * - using a nested loop; One loop for rows and one for colums
 * - a single loop
 * The Haxe Cook book has yet another: http://code.haxe.org/category/data-structures/grid-iterator.html
 *
 * (un)comment code as desired to see each type in action
 * 
 * @author Manno
 */
class Main extends Sprite 
{
	var itemWidth:Int = 40;
	var margin:Int = 10;
	var gridOffset:Int = 10;
	
	public function new () 
	{	
		super ();
		
		singleLoopGrid();
		// doubleLoopGrid();
		// singleLoopGridTwo();
	}

	/**
	 * This draws a grid in a doulble (nested) loop
	 * Rows and columns/width and height both have a set length.
	 * 
	 */
	function doubleLoopGrid()
	{
		var columns:Int = 4;
		var rows:Int = 3;

		var itemX:Int;
		var itemY:Int;

		this.graphics.beginFill( 0xFF00FF );

		for (row in 0 ... rows) 
		{
			for (column in 0 ... columns) 
			{
				itemX = gridOffset + column * (itemWidth + margin);
				itemY = gridOffset + row * (itemWidth + margin);

				this.graphics.drawRect( itemX, itemY, itemWidth, itemWidth );
			}
		}
		
		this.graphics.endFill();
	}

	/**
	 * This draws a grid in a single loop. 
	 * The horizontal side of the grid has a restricted length. 
	 * The vertical side's length is determined by: 
	 *   the length of the horizontal side divided by the amount of items that go into the grid.
	 *
	 */
	function singleLoopGrid()
	{
		var itemCount:Int = 12;
		var columns:Int = 4;

		var itemX:Int;
		var itemY:Int;

		this.graphics.beginFill( 0xFF00FF );

		for (i in 0 ... itemCount) 
		{
			var row:Int = Std.int(i / columns);
			var column:Int = i % columns;

			itemX = gridOffset + column * (itemWidth + margin);
			itemY = gridOffset + row * (itemWidth + margin);

			this.graphics.drawRect( itemX, itemY, itemWidth, itemWidth );
		}

		this.graphics.endFill();
	}


	/**
	 * This draws a grid in a single loop. 
	 * Similar to the one above but now with the vertical side with a restricted length
	 *
	 */
	function singleLoopGridTwo()
	{
		var itemCount:Int = 24;
		var rows:Int = 4;

		var itemX:Int;
		var itemY:Int;

		this.graphics.beginFill( 0xFF00FF );

		for (i in 0 ... itemCount) 
		{
			var column:Int = Std.int(i / rows);
			var row:Int = i % rows;

			itemX = gridOffset + column * (itemWidth + margin);
			itemY = gridOffset + row * (itemWidth + margin);

			this.graphics.drawRect( itemX, itemY, itemWidth, itemWidth );
		}

		this.graphics.endFill();
	}
}