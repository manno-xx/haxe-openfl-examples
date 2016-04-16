package;


import openfl.display.Sprite;
import openfl.Lib;

/**
 * An example of map generation using Cellular Automata
 * 
 * More Info on this type ('life-like') of Cellular Automata
 * http://www.conwaylife.com/wiki/Cellular_automaton
 *
 * Based on:
 * http://gamedevelopment.tutsplus.com/tutorials/generate-random-cave-levels-using-cellular-automata--gamedev-9664
 */
class Main extends Sprite 
{

	// the size in pixels of one cell in the CA
	public static inline var CELL_SIZE:Int = 10;

	// the chance a cell is alive in the initial field
	var initialAliveChance:Float = 0.4;

	//The data for the S/B ruleString. See above link for more info b5678s345678
	public static var BIRTH:Array<Int> = [5, 6, 7, 8];
	public static var SURVIVAL:Array<Int> = [3, 4, 5, 6, 7, 8];

	// the 2D map
	var cellMap:Array< Array<Bool> >;
	
	public function new () 
	{
		super ();
		
		cellMap = createMap();

		draw();

		stage.addEventListener( openfl.events.MouseEvent.CLICK, onStageClick );
	}

	/**
	 * The Cellular Automaton runs one step when the stage is clicked
	 * 
	 */
	function onStageClick( event:openfl.events.MouseEvent ):Void
	{
		var now = Lib.getTimer();
		
		simulationStep();
		
		trace( Lib.getTimer() - now );
		
		draw();

		trace( Lib.getTimer() - now );
	}

	/**
	 * Create the initial map 
	 * uses http://haxe.org/manual/lf-array-comprehension.html
	 *
	 */
	function createMap():Array< Array<Bool> >
	{
		var h = Math.floor(stage.stageHeight / CELL_SIZE);
		var w = Math.floor(stage.stageWidth / CELL_SIZE);
		var map = [ for( y in 0...h ) [ for( x in 0...w ) if( Math.random() < initialAliveChance ) true else false ] ];

		return map;
	}

	/**
	 * One step in the simulation
	 * Apply the S/B rulestring to the map
	 * 
	 */
	function simulationStep()
	{
		var tempMap = createMap();
		
		for( row in 0...cellMap.length )
		{
			for( col in 0...cellMap[row].length )
			{
				var neighbourCount:Int = getNeighbourCount( col, row );

				// indexOf is not the fastest... 
				// Let me accept the slow performance with the excuse a map is most likely precalculated
				if( cellMap[row][col] && SURVIVAL.indexOf(neighbourCount) > -1 )	// survival
				{
					tempMap[row][col] = true;
				}
				else if( !cellMap[row][col] && BIRTH.indexOf(neighbourCount) > -1 )	// birth
				{
					tempMap[row][col] = true;
				}
				else
				{
					tempMap[row][col] = false;
				}
			}
		}

		cellMap = tempMap.copy();
	}

	/**
	 * Draw the map in its current state
	 * 
	 */
	function draw()
	{
		this.graphics.clear();
		this.graphics.beginFill( 0x000000 );

		for( y in 0...cellMap.length )
		{
			for( x in 0...cellMap[y].length )
			{
				if( cellMap[ y ][ x ] )
				{
					this.graphics.drawRect( x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE );
				}
			}
		}

		this.graphics.endFill();
	}

	/**
	 * Look for alive neighbours in Moore space
	 * 
	 * @param x 	the x coord of the center cell of the neighbourhood
	 * @param y 	the y coord of the center cell of the neighbourhood
	 */
	function getNeighbourCount( x:Int, y:Int ):Int
	{
		var counter:Int = 0;
		var topLeft:openfl.geom.Point = new openfl.geom.Point( x-1, y-1 );

		for( col in -1...2 )
		{
			for( row in -1...2 )
			{
				var gridX = x + col;
				var gridY = y + row;

				// 'this' cell
				if( col == 0 && row == 0 )
				{
					continue;
				}
				// out of bounds cells count as 'alive'
				if( gridX < 0 || gridY < 0 || gridX >= cellMap[0].length || gridY >= cellMap.length )
				{
					counter++;
				}
				// 'alive' cells do too
				else if( cellMap[gridY][gridX] )
				{
					counter++;
				} 
			}
		}
		return counter;
	}
}
















