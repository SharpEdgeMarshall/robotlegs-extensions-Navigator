package robotlegs.bender.extensions.navigator.impl.transitions
{
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateValidation;
	import robotlegs.bender.extensions.navigator.behaviors.IHasStateValidationAsync;
	import robotlegs.bender.extensions.navigator.impl.ns.validation;
	import robotlegs.bender.extensions.navigator.impl.Navigator;

	public class ValidationPreparedDelegate {
		private var _navigator : Navigator;
		private var _validator : IHasStateValidationAsync;
		private var _truncated : NavigationState;
		private var _full : NavigationState;
		
		public function ValidationPreparedDelegate(validator : IHasStateValidation, truncated : NavigationState, full : NavigationState, navigator : Navigator) {
			_validator = IHasStateValidationAsync(validator);
			_truncated = truncated;
			_full = full;
			_navigator = navigator;
		}
		
		/**
		 * The reason this method has rest parameter, is because
		 * then you can either call it by using call() or bind it
		 * to an event handler that will send an event argument.
		 * 
		 * The arguments are ignored.
		 */
		validation function call(...ignoreParameters) : void {
			_navigator.validation::notifyValidationPrepared(_validator, _truncated, _full);
			_validator = null;
			_truncated = null;
			_full = null;
			_navigator = null;
		}
	}
}