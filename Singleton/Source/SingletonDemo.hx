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
	// It is a class variable, not an instance variable
	public static var instance(default, null):SingletonDemo = new SingletonDemo();

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
	 * - It does so when the application starts and all static variables are initialized
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
}