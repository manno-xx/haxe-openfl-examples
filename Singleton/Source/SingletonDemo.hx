package;

/**
 * A very basic singleton demo.
 * Just keeps track of a score.
 *
 */
class SingletonDemo 
{
	// this static variable will store a reference to an instance of this class.
	// because it is a static variable it's value is the same across all possible instances of the class
	private static var instance:SingletonDemo;

	// this variable is not Singleton specific. It gives this singleton puropose: This singleton is a score tracker
	private var score:Int = 0;

	/**
	 * Having a private constructor prevents this class being instantiated by other classes using:
	 *
	 * var singletonDemo:SingletonDemo = new SingletonDemo();
	 * 
	 * (remember: private variables and functions can only be used by the class itself)
	 * Only this class itself can create a new instance of itself.
	 * 
	 * That way this class can make sure there can be only one instance of this class:
	 * - This class is the only one that can instantiate this class
	 * - It will only do so if the variable in which an instance is stored is still empty
	 *
	 * Other classes that want to use it must request access to the instance through the getInstance function
	 * 
	 * As you may notice, the Singleton design pattern heavily relies on the use of static variables.
	 */
	private function new()
	{
	}

	public function getScore():Int
	{
		return score;
	}

	public function setScore( value:Int )
	{
		score = value;
	}

	public function addToScore( amount:Int )
	{
		score += amount;
	}

	/**
	 * This static function, when called, will check if the static var instance already has a value
	 * if not, it will be made to store a new instance of this class.
	 *
	 * In any case, the variable's value is returned; An instance of this class
	 */
	public static function getInstance():SingletonDemo
	{
		if( instance == null )
			instance = new SingletonDemo();

		return instance;
	}
}