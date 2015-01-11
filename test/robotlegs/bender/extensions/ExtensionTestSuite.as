//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions
{
	import robotlegs.bender.extensions.navigator.NavigatorExtensionTestSuite;
	import robotlegs.bender.extensions.navigator.StateCommandMapExtensionTestSuite;

	[RunWith("org.flexunit.runners.Suite")]
	[Suite]
	public class ExtensionTestSuite
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		public var navigatorTest:NavigatorExtensionTestSuite;
		public var statecommandTest:StateCommandMapExtensionTestSuite;
	}
}
