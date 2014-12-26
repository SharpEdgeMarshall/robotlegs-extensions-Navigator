package robotlegs.bender.extensions.navigator.validation.elements {
	import org.osflash.signals.Signal;
	
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateInitialization;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateValidation;

	/**
	 * @author Eric-Paul Lecluse (c) epologee.com
	 */
	public class ResponderIV implements IHasStateInitialization, IHasStateValidation, ISignalResponder {
		public var initialized : Signal = new Signal();
		private var stateToValidate : NavigationState;

		public function ResponderIV(inStateToValidate : NavigationState) {
			stateToValidate = inStateToValidate;
		}

		public function removeAllSignalListeners() : void {
			initialized.removeAll();
		}

		public function initialize() : void {
			initialized.dispatch();
		}

		public function validate(inTruncated : NavigationState, inFull : NavigationState) : Boolean {
			return inTruncated.equals(stateToValidate);
		}
	}
}
