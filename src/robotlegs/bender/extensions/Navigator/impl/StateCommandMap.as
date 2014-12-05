package robotlegs.bender.extensions.navigator.impl
{
	import robotlegs.bender.extensions.commandCenter.impl.CommandTriggerMap;
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.extensions.navigator.api.IStateCommandMap;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateUpdate;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateValidationOptional;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;
	
	public class StateCommandMap implements IStateCommandMap, IHasStateValidationOptional, IHasStateUpdate
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private const _mappingProcessors:Array = [];
		
		private var _injector:IInjector;
		
		private var _navigator:INavigator;
		
		private var _triggerMap:CommandTriggerMap;
		
		private var _logger:ILogger;
		
		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/
		
		/**
		 * @private
		 */
		public function StateCommandMap(context:IContext, navigator:INavigator)
		{
			_injector = context.injector;
			_logger = context.getLogger(this);
			_navigator = navigator;
			//_triggerMap = new CommandTriggerMap(getKey, createTrigger);
		}
		
		public function willValidate(truncated : NavigationState, full : NavigationState) : Boolean {
			return false;
		}
		
		public function validate(truncated : NavigationState, full : NavigationState) : Boolean {
			return true;
		}
		
		public function updateState(truncated : NavigationState, full : NavigationState) : void {
			
		}
	}
}