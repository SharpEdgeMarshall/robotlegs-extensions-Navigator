package robotlegs.bender.extensions.navigator
{
	import robotlegs.bender.extensions.navigator.api.IStateViewMap;
	import robotlegs.bender.extensions.navigator.impl.StateViewMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.IInjector;
	
	public class StateViewMapExtension implements IExtension
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
			_injector.map(IStateViewMap).toSingleton(StateViewMap);
		}
		
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function whenDestroying():void
		{
			if (_injector.satisfiesDirectly(IStateViewMap))
			{
				_injector.unmap(StateViewMap);
			}
		}
	}
}