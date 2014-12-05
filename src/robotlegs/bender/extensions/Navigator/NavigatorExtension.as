//------------------------------------------------------------------------------
//  Copyright (c) 2014 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator
{
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.extensions.navigator.impl.Navigator;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.IInjector;

	public class NavigatorExtension implements IExtension
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var _injector:IInjector;
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		public function extend(context:IContext):void
		{
			context.whenDestroying(whenDestroying);
			_injector = context.injector;
			_injector.map(INavigator).toSingleton(Navigator);
		}	
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function whenDestroying():void
		{
			if (_injector.satisfiesDirectly(INavigator))
			{
				_injector.unmap(INavigator);
			}
		}		
		
	}
}