package;

import openfl.events.KeyboardEvent;

/**
 * The interface every state should implement
 *
 * When a class implements an interface it means that 
 *  that class will have a concrete function for every function that the interface defines.
 * 
 * A concrete function is a function that actually does something
 * The interface only defines that a function with a given signature should exist (but does not define functionality)
 *
 */
interface LampState 
{
	function handleInput( e:KeyboardEvent ):Void;
}