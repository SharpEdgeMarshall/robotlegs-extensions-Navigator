//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.impl
{
	import flash.utils.Dictionary;
	
	import robotlegs.bender.extensions.navigator.api.INavigator;
	import robotlegs.bender.extensions.navigator.api.IStateViewMapping;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewConfigurator;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewMapper;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewUnmapper;
	import robotlegs.bender.framework.api.ILogger;

	/**
	 * @private
	 */
	public class StateViewMapper implements IStateViewMapper, IStateViewUnmapper
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private const _mappings:Dictionary = new Dictionary();

		private var _state:NavigationState;

		private var _handler:ViewStateHandler;

		private var _navigator:INavigator;
		
		private var _logger:ILogger;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function StateViewMapper(state:NavigationState, handler:ViewStateHandler, navigator:INavigator, logger:ILogger = null)
		{
			_state = state;
			_handler = handler;
			_logger = logger;
			_navigator = navigator;
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		/**
		 * @inheritDoc
		 */
		public function toView(viewClass:Class):IStateViewConfigurator
		{
			const mapping:IStateViewMapping = _mappings[viewClass];
			return mapping
				? overwriteMapping(mapping)
				: createMapping(viewClass);
		}

		/**
		 * @inheritDoc
		 */
		public function fromView(viewClass:Class):void
		{
			const mapping:IStateViewMapping = _mappings[viewClass];
			mapping && deleteMapping(mapping);
		}

		/**
		 * @inheritDoc
		 */
		public function fromAll():void
		{
			for each (var mapping:IStateViewMapping in _mappings)
			{
				deleteMapping(mapping);
			}
		}

		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/

		private function createMapping(viewClass:Class):StateViewMapping
		{
			const mapping:StateViewMapping = new StateViewMapping(_state, viewClass);
			_handler.addMapping(mapping);
			_mappings[viewClass] = mapping;
			_logger && _logger.debug('{0} mapped to {1}', [_state, mapping]);
			return mapping;
		}

		private function deleteMapping(mapping:IStateViewMapping):void
		{
			_handler.removeMapping(mapping);
			delete _mappings[mapping.viewClass];
			_logger && _logger.debug('{0} unmapped from {1}', [_state, mapping]);
		}

		private function overwriteMapping(mapping:IStateViewMapping):IStateViewConfigurator
		{
			_logger && _logger.warn('{0} already mapped to {1}\n' +
				'If you have overridden this mapping intentionally you can use "unmap()" ' +
				'prior to your replacement mapping in order to avoid seeing this message.\n',
				[_state, mapping]);
			deleteMapping(mapping);
			return createMapping(mapping.viewClass);
		}
	}
}
