package robotlegs.bender.extensions.navigator.events
{
	import flash.events.Event;
	
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	
	public class NavigatorStateEvent extends Event
	{		
		public static const STATE_REQUESTED : String = "STATE_REQUESTED";
		public static const STATE_REDIRECTING : String = "STATE_REDIRECTING";
		public static const STATE_CHANGING : String = "STATE_CHANGING";
		public static const STATE_CHANGED : String = "STATE_CHANGED";
		
		public function get newState () : NavigationState { return _newState; }
		public function get oldState () : NavigationState { return _oldState; }
		
		private var _newState : NavigationState;
		private var _oldState : NavigationState;
		
		public function NavigatorStateEvent(type:String, oldState:NavigationState, newState:NavigationState)
		{
			super(type, false, false);
			
			_oldState = oldState;
			_newState = newState;
		}
		
		override public function clone():Event {
			return new NavigatorStateEvent( type, _oldState, _newState );
		}
	}
}