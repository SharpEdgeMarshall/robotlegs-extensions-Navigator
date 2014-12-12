package robotlegs.bender.extensions.navigator.impl
{
	import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
	import robotlegs.bender.extensions.commandCenter.api.ICommandExecutor;
	import robotlegs.bender.extensions.commandCenter.api.ICommandMappingList;
	import robotlegs.bender.extensions.commandCenter.api.ICommandTrigger;
	import robotlegs.bender.extensions.commandCenter.impl.CommandExecutor;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMapper;
	import robotlegs.bender.extensions.commandCenter.impl.CommandMappingList;
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateUpdate;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.ILogger;

	public class StateCommandTrigger implements ICommandTrigger, IHasStateUpdate
	{
		private var _navState:NavigationState;
		
		private var _exactMatch:Boolean;
		
		private var _navigator:INavigator;
		
		private var _mappings:ICommandMappingList;
		
		private var _executor:ICommandExecutor;
		
		public function StateCommandTrigger( 
			injector:IInjector,
			navigator:INavigator,
			navState:NavigationState,
			exactMatch:Boolean = false,
			processors:Array = null,
			logger:ILogger = null )
		{
			_navigator = navigator;
			_navState = navState;
			_exactMatch = exactMatch;
			_mappings = new CommandMappingList(this, processors, logger);
			_executor = new CommandExecutor(injector, _mappings.removeMapping);
			
		}
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		/**
		 * @private
		 */
		public function createMapper():CommandMapper
		{
			return new CommandMapper(_mappings);
		}
		
		public function updateState( truncated:NavigationState, full:NavigationState ) : void {
			
			if( _exactMatch && !full.equals(_navState)) return;
			
			_executor.executeCommands(_mappings.getList(), new CommandPayload([truncated, full],
																			[NavigationState, NavigationState],
																			['truncated', 'full']));
		}		
		
		/**
		 * Invoked when the trigger should be activated.
		 */
		public function activate():void{
			_navigator.add(this, _navState);
		}
		
		/**
		 * Invoked when the trigger should be deactivated.
		 */
		public function deactivate():void{
			_navigator.remove(this, _navState);
		}
		
	}
}