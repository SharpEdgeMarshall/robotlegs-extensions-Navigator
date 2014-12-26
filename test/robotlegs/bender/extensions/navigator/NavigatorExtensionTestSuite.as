//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator
{
	import robotlegs.bender.extensions.navigator.responders.TestResponders;
	import robotlegs.bender.extensions.navigator.states.TestNavigationState;
	import robotlegs.bender.extensions.navigator.validation.TestValidation;
	
	

	[RunWith("org.flexunit.runners.Suite")]
	[Suite]
	public class NavigatorExtensionTestSuite
	{	

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/
		public var navigationState : TestNavigationState;
		public var validation : TestValidation;
		public var responders : TestResponders;

	}
}
