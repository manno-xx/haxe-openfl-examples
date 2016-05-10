package;

import openfl.display.Sprite;
/*
 * A singleton demo
 *
 * Singletons have two properties:
 * - there can be only one instance of the class.
 * - the class is accessible throughout the entire application
 * 
 * This makes it a good solution for, for instance:
 * - communication with external data source (database, file system, ...)
 * - screen loader mechanism
 *
 * See also:
 * http://gameprogrammingpatterns.com/singleton.html
 *
 * In this demo a singleton is created that just keeps track of a score.
 * Maybe not what you'd typically use a Singleton for but demonstrates the setup of a singleton 
 * Keep the output window open in FlashDevelop to see the values for the score variable in the Singleton
 */
class Main extends Sprite 
{
	public function new () 
	{
		super ();

		// display score stored in the Singleton class
		// notice there is no instance created with new ...
		trace( SingletonDemo.instance.getScore() );
		
		// set the score
		SingletonDemo.instance.setScore( 10 );
		
		// display again
		trace( SingletonDemo.instance.getScore() );
		
		// subtract two points
		SingletonDemo.instance.addToScore( -2 );
		
		// display again
		trace( SingletonDemo.instance.getScore() );
	}
}