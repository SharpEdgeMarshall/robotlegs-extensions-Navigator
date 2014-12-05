package robotlegs.bender.extensions.navigator.behaviors {
	import robotlegs.bender.extensions.navigator.api.NavigationState;

	public interface IHasStateValidation extends INavigationResponder {
		/**
		 * Synchronous validation.
		 * Will provide the result of subtracting the registered state from the requested (inFull) state to give you the inTruncated state.
		 */
		function validate(truncated:NavigationState, full : NavigationState):Boolean;
	}
}
