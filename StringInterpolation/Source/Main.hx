package;

import openfl.display.Sprite;

class Main extends Sprite 
{
	/**
	 * This demo uses String interpolation: http://haxe.org/manual/lf-string-interpolation.html
	 *
	 * Use case: you want to insert the name of the current player an his/her score into an SQLite database.
	 * You need a query like: INSERT INTO scores ( name, score ) VALUES ( 'John Doe', 10000 );
	 * However, the name of the player and the score are always different, you cannot write the entire query at time of coding.
	 *
	 * Solution:
	 * Construct a 'template query' with placeholders for the actual values.
	 * Then, let Haxe do a sort of find and replace on those items to replace them with the actual values.
	 * 
	 * This is a demo of how that can be achieved.
	 *
	 */
	public function new () 
	{
		super ();

		// the actual data as you want it to be inserted into the database
		var playerName:String = "John Doe";
		var score:Int = 123;

		/*
		 * This is where the 'magic' happens.
		 * Any identifier in a string prepended by a dollar sign is replaced by the value of the variable with the same name
		 * This ONLY works if the string is surrounded by SINGLE qoutes.
		 *
		 * In this example there's a slight extra complication:
		 *  In SQL string values (like the name of a player) should be surrounded by quotes. 
		 *  Using a quote in a String may however lead to Haxe thinking that the string stops at that point.
		 *  To still insert a quote, you can 'escape' it by prepending it with a backslash: \'
		 *  This is done around $playername in this SQL query.
		 * 
		 */
		var sql:String = 'INSERT INTO scores ( name, score ) VALUES ( "$playerName", $score );'; 
		trace( sql );
	}
}