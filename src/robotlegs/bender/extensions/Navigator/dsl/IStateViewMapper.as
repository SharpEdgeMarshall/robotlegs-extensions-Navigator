//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.dsl
{

	/**
	 * Maps a matcher to a concrete View class
	 */
	public interface IStateViewMapper
	{
		/**
		 * Maps a matcher to a concrete View class
		 * @param mediatorClass The concrete view class
		 * @return Mapping configurator
		 */
		function toView(viewClass:Class):IStateViewConfigurator;
	}
}
