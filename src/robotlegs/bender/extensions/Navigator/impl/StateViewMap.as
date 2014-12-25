
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
	import robotlegs.bender.extensions.navigator.api.IStateViewMap;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewMapper;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewUnmapper;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.ILogger;
	
	/**
	 * @private
	 */
	public class StateViewMap implements IStateViewMap
	{
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private const _mappers:Dictionary = new Dictionary();
		
		private var _logger:ILogger;
		
		private var _navigator:INavigator;
		
		private var _factory:ViewFactory;
		
		private var _stateHandler:ViewStateHandler;
		
		private const NULL_UNMAPPER:IStateViewUnmapper = new NullStateViewUnmapper();
		
		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/
		
		/**
		 * @private
		 */
		public function StateViewMap(context:IContext, navigator:INavigator)
		{
			_logger = context.getLogger(this);
			_factory = new ViewFactory(context.injector);
			_stateHandler = new ViewStateHandler(_factory);
			_navigator = navigator;
		}
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		/**
		 * @inheritDoc
		 */
		public function map(stateOrPath : *):IStateViewMapper
		{
			var state : NavigationState = new NavigationState( stateOrPath );
			return _mappers[ state.toString() ] ||= createMapper( state );
		}
		
		/**
		 * @inheritDoc
		 */
		public function unmap(stateOrPath : *):IStateViewUnmapper
		{
			return _mappers[ new NavigationState( stateOrPath ).toString() ] || NULL_UNMAPPER;
		}
		
		/**
		 * @inheritDoc
		 */
		/*public function handleState(state : NavigationState):void
		{
			_stateHandler.handleState(state);
		}*/
		
		/**
		 * @inheritDoc
		 */
		/*public function unmediate(item:Object):void
		{
			_factory.removeMediators(item);
		}*/
		
		/**
		 * @inheritDoc
		 */
		/*public function unmediateAll():void
		{
			_factory.removeAllMediators();
		}*/
		
		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/
		
		private function createMapper(state : NavigationState):IStateViewMapper
		{
			return new StateViewMapper(state, _stateHandler, _navigator, _logger);
		}
	}
}


