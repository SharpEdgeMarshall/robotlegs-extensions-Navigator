package robotlegs.bender.extensions.navigator.impl
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;
	
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.extensions.navigator.api.IStateCommandMap;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.api.NavigationStatesCollection;
	import robotlegs.bender.extensions.navigator.support.CallbackCommand;
	import robotlegs.bender.extensions.navigator.support.NavStatesCollInjectedCallbackCommand;
	import robotlegs.bender.extensions.navigator.support.NullCommand;
	import robotlegs.bender.extensions.navigator.support.SupportState;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.impl.Context;

	public class StateCommandMapTest
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var subject:IStateCommandMap;
		
		private var mapper:ICommandMapper;
		
		private var reportedExecutions:Array;
		
		private var injector:IInjector;
		
		private var navigator:INavigator;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		
		[Before]
		public function before():void
		{
			reportedExecutions = [];
			const context:IContext = new Context();
			injector = context.injector;
			injector.map(Function, "reportingFunction").toValue(reportingFunction);
			navigator = new Navigator(context);
			subject = new StateCommandMap(context, navigator);
			
			navigator.start(SupportState.TYPE, SupportState.TYPE);
		}
		
		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/
		
		[Test]
		public function map_creates_mapper():void
		{
			assertThat(subject.map(SupportState.TYPE1), instanceOf(ICommandMapper));
		}		
		
		[Test]
		public function unmap_returns_mapper():void
		{
			mapper = subject.map(SupportState.TYPE1);
			assertThat(subject.unmap(SupportState.TYPE1), instanceOf(ICommandUnmapper));
		}
		
		[Test]
		public function robust_to_unmapping_non_existent_mappings():void
		{
			subject.unmap(SupportState.TYPE1).fromCommand(NullCommand);
		}
		
		[Test]
		public function command_executes_successfully():void
		{
			assertThat(commandExecutionCount(1), equalTo(1));
		}
		
		[Test]
		public function command_executes_repeatedly():void
		{
			assertThat(commandExecutionCount(5), equalTo(5));
		}
		
		[Test]
		public function fireOnce_command_executes_once():void
		{
			assertThat(oneshotCommandExecutionCount(5), equalTo(1));
		}
		
		[Test]
		public function state_coll_is_injected_into_command():void
		{
			var injectedStateColl:NavigationStatesCollection = null;
			injector.map(Function, 'executeCallback').toValue(function(command:NavStatesCollInjectedCallbackCommand):void
			{
				injectedStateColl = command.stateColl;
			});
			subject.map(SupportState.TYPE2W)
				.toCommand(NavStatesCollInjectedCallbackCommand);
			
			navigator.request(SupportState.TYPE21);
			assertThat(injectedStateColl.full.toString(), equalTo(new NavigationState(SupportState.TYPE21).toString()));
			//TODO check truncated
			navigator.request(SupportState.TYPE22);
			assertThat(injectedStateColl.full.toString(), equalTo(new NavigationState(SupportState.TYPE22).toString()));
		}
		
		[Test]
		public function command_does_not_execute_when_incorrect_status_dispatched():void
		{
			var executeCount:uint = 0;
			injector.map(Function, 'executeCallback').toValue(function():void
			{
				executeCount++;
			});
			subject.map(SupportState.TYPE1).toCommand(CallbackCommand);
			navigator.request(SupportState.TYPE2);
			assertThat(executeCount, equalTo(0));
		}
		
		[Test]
		public function command_does_not_execute_after_state_unmapped():void
		{
			var executeCount:uint = 0;
			injector.map(Function, 'executeCallback').toValue(function():void
			{
				executeCount++;
			});
			subject.map(SupportState.TYPE1).toCommand(CallbackCommand);
			subject.unmap(SupportState.TYPE1).fromCommand(CallbackCommand);
			navigator.request(SupportState.TYPE1);
			assertThat(executeCount, equalTo(0));
		}
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function commandExecutionCount(totalStatus:int = 1, oneshot:Boolean = false):uint
		{
			var executeCount:uint = 0;
			injector.map(Function, 'executeCallback').toValue(function():void
			{
				executeCount++;
			});
			
			subject.map(SupportState.TYPE2W).toCommand(CallbackCommand).once(oneshot);
			
			while (totalStatus--)
			{
				navigator.request((totalStatus%2 == 0) ? SupportState.TYPE21 : SupportState.TYPE22);
			}
			return executeCount;
		}
		
		private function oneshotCommandExecutionCount(totalStatus:int = 1):uint
		{
			return commandExecutionCount(totalStatus, true);
		}
		
		private function hookCallCount(... hooks):uint
		{
			var hookCallCount:uint = 0;
			injector.unmap(Function, 'reportingFunction');
			injector.map(Function, 'reportingFunction').toValue(function(hookClas:Class):void {
				hookCallCount++;
			});
			subject
			.map(SupportState.TYPE1)
				.toCommand(NullCommand)
				.withHooks(hooks);
			navigator.request(SupportState.TYPE1);
			return hookCallCount;
		}
		
		private function commandExecutionCountWithGuards(... guards):uint
		{
			var executionCount:uint = 0;
			injector.map(Function, 'executeCallback').toValue(function():void
			{
				executionCount++;
			});
			subject
			.map(SupportState.TYPE1)
				.toCommand(CallbackCommand)
				.withGuards(guards);
			navigator.request(SupportState.TYPE1);
			return executionCount;
		}
		
		private function reportingFunction(item:Object):void
		{
			reportedExecutions.push(item);
		}
	}
}
