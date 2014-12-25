//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.dsl
{

	/**
	 * Unmaps a View
	 */
	public interface IStateViewUnmapper
	{
		/**
		 * Unmaps a view from this matcher
		 * @param viewClass View to unmap
		 */
		function fromView(viewClass:Class):void;

		/**
		 * Unmaps all view mappings for this matcher
		 */
		function fromAll():void;
	}
}
