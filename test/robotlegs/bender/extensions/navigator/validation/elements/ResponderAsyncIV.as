package robotlegs.bender.extensions.navigator.validation.elements {
	import flash.utils.setTimeout;
	
	import org.osflash.signals.Signal;
	
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateInitialization;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateValidationAsync;

	/**
	 * @author Eric-Paul Lecluse (c) epologee.com
	 */
	public class ResponderAsyncIV implements IHasStateValidationAsync, IHasStateInitialization, ISignalResponder {
		public var initialized : Signal = new Signal();
		public var durationMS : Number;
		public var instantPreparation : Boolean = false;
		//
		private var _stateToValidate : NavigationState;

		public function ResponderAsyncIV(inStateToValidate : NavigationState, inAsyncDurationMS : Number = 500) {
			durationMS = inAsyncDurationMS;
			_stateToValidate = inStateToValidate;
		}

		public function removeAllSignalListeners() : void {
			initialized.removeAll();
		}

		public function initialize() : void {
			initialized.dispatch();
		}

		public function prepareValidation(inTruncated : NavigationState, inFull : NavigationState, inCallOnPrepared : Function) : void {
			if (instantPreparation) {
				inCallOnPrepared();
			} else {
				setTimeout(inCallOnPrepared, durationMS);
			}
		}

		public function validate(inTruncated : NavigationState, inFull : NavigationState) : Boolean {
			return inTruncated.equals(_stateToValidate);
		}
	}
}
