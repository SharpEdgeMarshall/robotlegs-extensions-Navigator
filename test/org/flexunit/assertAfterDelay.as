package org.flexunit {
	import flash.utils.setTimeout;

	/**
	 * @author Eric-Paul Lecluse (c) epologee.com
	 */
	public function assertAfterDelay(delayMS:Number, assertionCallback:Function, ...parameters:Array) : void {
		setTimeout(assertionCallback, delayMS, parameters);
	}
}
