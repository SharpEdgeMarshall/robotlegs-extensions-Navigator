//------------------------------------------------------------------------------
//  Copyright (c) 2012 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator
{
	import robotlegs.bender.extensions.navigator.api.INavigatorHistory;
	import robotlegs.bender.extensions.navigator.impl.NavigatorHistory;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.IInjector;

	public class NavigatorHistoryExtension implements IExtension
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
			_injector.map(INavigatorHistory).toSingleton(NavigatorHistory);
		}
		
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function whenDestroying():void
		{
			if (_injector.satisfiesDirectly(INavigatorHistory))
			{
				_injector.unmap(INavigatorHistory);
			}
		}		
		
	}
}