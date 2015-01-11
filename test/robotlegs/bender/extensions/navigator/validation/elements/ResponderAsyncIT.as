package robotlegs.bender.extensions.navigator.validation.elements {
	import flash.utils.setTimeout;
	
	import org.osflash.signals.Signal;
	
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateInitialization;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateTransition;

	/**
	 * @author Eric-Paul Lecluse (c) epologee.com
	 */
	public class ResponderAsyncIT implements IHasStateInitialization, IHasStateTransition, ISignalResponder {
		public var visible : Boolean;
		//
		public var initialized : Signal = new Signal();
		public var transitionedIn : Signal = new Signal();
		public var transitionedOut : Signal = new Signal();
		
		public function get durationMS() : Number {
			return 500;
		}

		public function removeAllSignalListeners() : void {
			initialized.removeAll();
			transitionedIn.removeAll();
			transitionedOut.removeAll();
		}

		public function initialize() : void {
			visible = false;
			initialized.dispatch();
		}

		public function transitionIn(inCallOnComplete : Function) : void {
			visible = true;
			setTimeout(finishTransition, durationMS, inCallOnComplete, transitionedIn);
		}

		private function finishTransition(inCallOnComplete : Function, inSignalToDispatch:Signal) : void {
			inCallOnComplete();
			inSignalToDispatch.dispatch();
		}

		public function transitionOut(inCallOnComplete : Function) : void {
			visible = false;
			setTimeout(finishTransition, durationMS, inCallOnComplete, transitionedOut);
		}
	}
}
