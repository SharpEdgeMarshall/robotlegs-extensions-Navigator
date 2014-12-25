//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.navigator.impl
{
	import flash.display.DisplayObjectContainer;
	
	import robotlegs.bender.extensions.navigator.api.IStateViewMapping;
	import robotlegs.bender.extensions.navigator.api.NavigationState;
	import robotlegs.bender.extensions.navigator.dsl.IStateViewConfigurator;

	/**
	 * @private
	 */
	public class StateViewMapping implements IStateViewMapping, IStateViewConfigurator
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		private var _state:NavigationState;

		/**
		 * @inheritDoc
		 */
		public function get state():NavigationState
		{
			return _state;
		}

		private var _viewClass:Class;

		/**
		 * @inheritDoc
		 */
		public function get viewClass():Class
		{
			return _viewClass;
		}

		private var _guards:Array = [];

		/**
		 * @inheritDoc
		 */
		public function get guards():Array
		{
			return _guards;
		}

		private var _hooks:Array = [];

		/**
		 * @inheritDoc
		 */
		public function get hooks():Array
		{
			return _hooks;
		}

		private var _autoRemoveEnabled:Boolean = true;

		/**
		 * @inheritDoc
		 */
		public function get autoRemoveEnabled():Boolean
		{
			return _autoRemoveEnabled;
		}

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		/**
		 * @private
		 */
		public function StateViewMapping(state:NavigationState, viewClass:Class)
		{
			_state = state;
			_viewClass = viewClass;
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		/**
		 * @inheritDoc
		 */
		public function withGuards(... guards):IStateViewConfigurator
		{
			_guards = _guards.concat.apply(null, guards);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function withHooks(... hooks):IStateViewConfigurator
		{
			_hooks = _hooks.concat.apply(null, hooks);
			return this;
		}
		
		/**
		 * @parent
		 */
		public function appendTo(parent : IStateViewMapping):IStateViewConfigurator
		{
			if( parent is IStateViewMapping ) {
				
			}else if( parent is DisplayObjectContainer){}
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function autoRemove(value:Boolean = true):IStateViewConfigurator
		{
			_autoRemoveEnabled = value;
			return this;
		}
	}
}
