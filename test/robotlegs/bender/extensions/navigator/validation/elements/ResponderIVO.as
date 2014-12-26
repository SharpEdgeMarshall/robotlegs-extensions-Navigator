package robotlegs.bender.extensions.navigator.validation.elements {
	import org.osflash.signals.Signal;
	
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateInitialization;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateValidationOptional;

	/**
	 * @author Eric-Paul Lecluse (c) epologee.com
	 */
	public class ResponderIVO implements IHasStateInitialization, IHasStateValidationOptional, ISignalResponder {
		public var initialized : Signal = new Signal();
		private var stateToValidate : NavigationState;
		private var stateForConfirmedValidation : NavigationState;

		public function ResponderIVO(inStateForConfirmedValidation : NavigationState, inStateToValidate : NavigationState) {
			stateForConfirmedValidation = inStateForConfirmedValidation;
			stateToValidate = inStateToValidate;
		}

		public function removeAllSignalListeners() : void {
			initialized.removeAll();
		}

		public function initialize() : void {
			initialized.dispatch();
		}

		public function willValidate(inTruncated : NavigationState, inFull : NavigationState) : Boolean {
			return inTruncated.contains(stateForConfirmedValidation);
		}

		public function validate(inTruncated : NavigationState, inFull : NavigationState) : Boolean {
			return inTruncated.equals(stateToValidate);
		}
	}
}
