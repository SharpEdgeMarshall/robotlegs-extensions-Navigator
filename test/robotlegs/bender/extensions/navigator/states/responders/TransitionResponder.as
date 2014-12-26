package robotlegs.bender.extensions.navigator.states.responders {
	import flash.utils.setTimeout;
	
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateInitialization;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateTransition;

	/**
	 * @author epologee
	 */
	public class TransitionResponder implements IHasStateTransition, IHasStateInitialization {
		public var isInitialized : Boolean = false;
		public var isVisible : Boolean;
		
		public function initialize() : void {
			isInitialized = true;
		}

		public function transitionIn(inCallOnComplete : Function) : void {
			isVisible = true;
			setTimeout(inCallOnComplete, 500);
		}

		public function transitionOut(inCallOnComplete : Function) : void {
			isVisible = false;
			setTimeout(inCallOnComplete, 500);
		}
	}
}
