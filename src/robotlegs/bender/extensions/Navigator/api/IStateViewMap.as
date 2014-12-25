package robotlegs.bender.extensions.navigator.api {
	import robotlegs.bender.extensions.navigator.dsl.IStateViewMapper;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewUnmapper;
	
	public interface IStateViewMap {
		
		/**
		 * @param inStateOrPath can be one of three types. A string containing a path, a NavigationState object, or an array of those mixed.
		 */
		function map(statesOrPaths : *) : IStateViewMapper;
		
		/**
		 * @param inStateOrPath can be one of three types. A string containing a path, a NavigationState object, or an array of those mixed.
		 */
		function unmap(statesOrPaths : *) : IStateViewUnmapper;
		
	}
}
