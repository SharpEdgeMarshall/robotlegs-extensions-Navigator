//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.impl
{
	import robotlegs.bender.extensions.navigator.dsl.IStateViewUnmapper;

	/**
	 * @private
	 */
	public class NullStateViewUnmapper implements IStateViewUnmapper
	{

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function fromView(viewClass:Class):void
		{
		}

		/**
		 * @private
		 */
		public function fromAll():void
		{
		}
	}
}
