package robotlegs.bender.extensions.navigator
{
	import robotlegs.bender.extensions.navigator.api.IStateCommandMap;
	import robotlegs.bender.extensions.navigator.impl.StateCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.IInjector;
	
	public class StateCommandMapExtension implements IExtension
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
			_injector.map(IStateCommandMap).toSingleton(StateCommandMap);
		}
		
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function whenDestroying():void
		{
			if (_injector.satisfiesDirectly(IStateCommandMap))
			{
				_injector.unmap(StateCommandMap);
			}
		}
	}
}