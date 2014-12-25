//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.impl
{
	import mockolate.received;
	import mockolate.runner.MockolateRule;
	
	import org.hamcrest.assertThat;
	
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.framework.impl.RobotlegsInjector;

	public class StateCommandTriggerTest
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Rule]
		public var mocks:MockolateRule = new MockolateRule();

		[Mock]
		public var navigator:INavigator;

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var subject:StateCommandTrigger;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/

		[Before]
		public function before():void
		{
			subject = new StateCommandTrigger(new RobotlegsInjector(), navigator, null);
		}

		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/

		[Test]
		public function activating_adds_listener():void
		{
			subject.activate();
			assertThat(navigator, received().method('add').once());
		}

		[Test]
		public function deactivating_removes_listener():void
		{
			subject.deactivate();
			assertThat(navigator, received().method('remove').once());
		}
		
		[Test]
		public function test_doesnt_throw_error_when_deactivating_without_signal():void
		{
			subject.deactivate();
			// note: no assertion. we just want to know if an error is thrown
		}
	}
}
