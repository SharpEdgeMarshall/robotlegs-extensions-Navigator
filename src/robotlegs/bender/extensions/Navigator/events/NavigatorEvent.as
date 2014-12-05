package robotlegs.bender.extensions.navigator.events
{
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	
	public class NavigatorEvent extends Event
	{
		public static const TRANSITION_STATUS_UPDATED : String = "TRANSITION_STATUS_UPDATED";
		public static const STATE_REQUESTED : String = "STATE_REQUESTED";
		public static const STATE_CHANGED : String = "STATE_CHANGED";
		public static const TRANSITION_STARTED : String = "TRANSITION_STARTED";
		public static const TRANSITION_FINISHED : String = "TRANSITION_FINISHED";
		
		// Public properties
		public var statusByResponder : Dictionary;
		public var state : NavigationState;
		
		public function NavigatorEvent(type : String, statusByResponder:Dictionary = null) {
			super(type, false);
			this.statusByResponder = statusByResponder;
		}
		
		override public function toString() : String {
			return getQualifiedClassName(this);
		}
		
		override public function clone():Event {
			return new NavigatorEvent( type, statusByResponder );
		}
	}
}