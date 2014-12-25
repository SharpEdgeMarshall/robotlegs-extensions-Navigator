package robotlegs.bender.extensions.navigator.impl
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandTriggerMap;
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.extensions.navigator.api.IStateCommandMap;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;
	
	public class StateCommandMap implements IStateCommandMap
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
			_triggerMap = new CommandTriggerMap( getKey, createTrigger );
		}
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		/**
		 * @inheritDoc
		 */
		public function map( stateOrPath : *, exactMatch : Boolean = false ):ICommandMapper
		{
			return getTrigger( new NavigationState( stateOrPath ), exactMatch ).createMapper();
		}
		
		/**
		 * @inheritDoc
		 */
		public function unmap( stateOrPath : * ):ICommandUnmapper
		{
			return getTrigger( new NavigationState( stateOrPath ) ).createMapper();
		}
		
		/**
		 * @inheritDoc
		 */
		public function addMappingProcessor( handler:Function ):IStateCommandMap
		{
			if (_mappingProcessors.indexOf(handler) == -1)
				_mappingProcessors.push(handler);
			return this;
		}
		
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function getKey( navState:NavigationState, exactMatch:Boolean ):String
		{
			return navState.toString() + exactMatch;
		}
		
		private function getTrigger( navState:NavigationState, exactMatch:Boolean = false  ):StateCommandTrigger
		{
			return _triggerMap.getTrigger( navState, exactMatch ) as StateCommandTrigger;
		}
		
		private function createTrigger( navState:NavigationState, exactMatch:Boolean = false ):StateCommandTrigger
		{
			return new StateCommandTrigger( _injector, _navigator, navState, exactMatch, _mappingProcessors,  _logger);
		}
	}
}