//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.impl
{
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	
	import robotlegs.bender.extensions.navigator.api.IStateViewMapping;
	import robotlegs.bender.extensions.navigator.api.NavigationState;

	/**
	 * @private
	 */
	public class ViewStateHandler
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private const _mappings:Array = [];

		private var _knownMappings:Dictionary = new Dictionary(true);

		private var _factory:ViewFactory;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function ViewStateHandler(factory:ViewFactory):void
		{
			_factory = factory;
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function addMapping(mapping:IStateViewMapping):void
		{
			const index:int = _mappings.indexOf(mapping);
			if (index > -1)
				return;
			_mappings.push(mapping);
			flushCache();
		}

		/**
		 * @private
		 */
		public function removeMapping(mapping:IStateViewMapping):void
		{
			const index:int = _mappings.indexOf(mapping);
			if (index == -1)
				return;
			_mappings.splice(index, 1);
			flushCache();
		}

		/**
		 * @private
		 */
		public function handleState(state : NavigationState):void
		{
			const interestedMappings:Array = getInterestedMappingsFor(state);
			if (interestedMappings)
				_factory.createMediators(view, type, interestedMappings);
		}

		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/

		private function flushCache():void
		{
			_knownMappings = new Dictionary(true);
		}

		/*private function getInterestedMappingsFor(state : NavigationState):Array
		{
			var mapping:IStateViewMapping;
			var path:String = state.toString();

			// we've seen this type before and nobody was interested
			if (_knownMappings[path] === false)
				return null;

			// we haven't seen this type before
			if (_knownMappings[path] == undefined)
			{
				_knownMappings[path] = false;
				for each (mapping in _mappings)
				{
					if (state.equals(mapping.state))
					{
						_knownMappings[path] ||= [];
						_knownMappings[path].push(mapping);
					}
				}
				// nobody cares, let's get out of here
				if (_knownMappings[path] === false)
					return null;
			}

			// these mappings really do care
			return _knownMappings[path] as Array;
		}*/
	}
}
