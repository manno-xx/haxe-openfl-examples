package;

import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.ProgressEvent;

import openfl.net.URLLoader;
import openfl.net.URLRequest;

/**
 * Demo of how to load textual content from the internet
 * Uses the openfl URLLoader class with the URLRequest class
 *   http://api.openfl.org/openfl/net/URLLoader.html
 *   http://api.openfl.org/openfl/net/URLRequest.html
 *
 * Have the output window open to see the result of the loading of the URL
 * In FlashDevelop you may have to set the compilation type to Debug, not Release.
 */
class Main extends Sprite 
{
	public function new () 
	{
		super ();
				
		loadData();
	}

	/**
	 * Load data from a URL
	 * 
	 * Creates the URL request object
	 * Creates the URL loader
	 * sets up an event listener for the COMPLETE event (for when the data is in)
	 * sets up an event listener for ProgressEvent.PROGRESS event (for while the data is loading)
	 * sets up an event listener for the IOErrorEvent.IOError event (for when an IO error occurs)
	 * Starts the actual loading.
	 *
	 */
	function loadData()
	{
		var urlRequest:URLRequest = new URLRequest( "http://www.haxe.org" );
		
		var urlLoader:URLLoader = new URLLoader();
		urlLoader.addEventListener( Event.COMPLETE, onLoaded );
		urlLoader.addEventListener(ProgressEvent.PROGRESS, onProgress);
		urlLoader.addEventListener( IOErrorEvent.IO_ERROR, onIOError );
		urlLoader.load( urlRequest );
	}
	
	/**
	 * Triggered when the data is loaded.
	 *
	 * The target of the event is the URLLoader
	 * The data property of the target is the actual data that was loaded
	 * 
	 * @param event 	The Event.COMPLETE that triggered this event handler
	 */
	function onLoaded( event:Event )
	{
		trace( event.target.data );
	}

	/**
	 * While the data is loading, this event handler is ocasionally called.
	 * It allows you to monitor loading progress to, for instance, display a loading bar
	 *
	 */
	function onProgress(event:ProgressEvent):Void 
	{
		trace( "progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
	}

	/**
	 * Triggered when an IOError occurs (input output error)
	 * 
	 * Sadly the text of the error event is not always very descriptive.
	 */
	function onIOError( event:IOErrorEvent )
	{
		trace( event.text );
	}
}

