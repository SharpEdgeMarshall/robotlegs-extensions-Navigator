package robotlegs.bender.extensions.navigator.events
{
	import flash.events.Event;
	
	public class TransitionEvent extends Event
	{
		public static const TRANSITION_STARTED : String = "TRANSITION_STARTED";
		public static const TRANSITION_FINISHED : String = "TRANSITION_FINISHED";
		
		public function TransitionEvent( type:String )
		{
			super(type, false, false);
		}
		
		override public function clone():Event {
			return new TransitionEvent( type );
		}
	}
}