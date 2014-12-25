//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.dsl
{

	/**
	 * Configures a view mapping
	 */
	public interface IStateViewConfigurator
	{
		/**
		 * Guards to check before allowing a view to be created
		 * @param guards Guards
		 * @return Self
		 */
		function withGuards(... guards):IStateViewConfigurator;

		/**
		 * Hooks to run before a view is created
		 * @param hooks Hooks
		 * @return Self
		 */
		function withHooks(... hooks):IStateViewConfigurator;

		/**
		 * Should the view be removed when the mediated item looses scope?
		 *
		 * <p>Usually this would be when the mediated item is a Display Object
		 * and it leaves the stage.</p>
		 *
		 * @param value Boolean
		 * @return Self
		 */
		function autoRemove(value:Boolean = true):IStateViewConfigurator;
	}
}
