//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator
{
	import robotlegs.bender.extensions.navigator.impl.StateCommandMapTest;
	import robotlegs.bender.extensions.navigator.impl.StateCommandTriggerTest;
	

	[RunWith("org.flexunit.runners.Suite")]
	[Suite]
	public class StateCommandMapExtensionTestSuite
	{	

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		public var eventCommandMapExtension:StateCommandMapExtensionTest;

		public var stateCommandMap:StateCommandMapTest;

		public var stateCommandTrigger:StateCommandTriggerTest;

	}
}
