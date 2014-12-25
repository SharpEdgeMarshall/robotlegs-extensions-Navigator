//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.api
{
	

	/**
	 * Represents a StateView mapping
	 */
	public interface IStateViewMapping
	{
		/**
		 * The matcher for this mapping
		 */
		function get state():NavigationState;

		/**
		 * The concrete view class
		 */
		function get viewClass():Class;

		/**
		 * A list of guards to check before allowing mediator creation
		 */
		function get guards():Array;

		/**
		 * A list of hooks to run before creating a mediator
		 */
		function get hooks():Array;

		/**
		 * Should the view be removed when the mediated item looses scope?
		 */
		function get autoRemoveEnabled():Boolean;
	}
}
