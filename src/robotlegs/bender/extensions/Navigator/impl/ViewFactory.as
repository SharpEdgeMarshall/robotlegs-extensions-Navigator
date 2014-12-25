package robotlegs.bender.extensions.navigator.impl
{
	import flash.utils.Dictionary;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMapping;
	import robotlegs.bender.framework.api.IInjector;

	public class ViewFactory
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private const _views:Dictionary = new Dictionary();
		
		private var _injector:IInjector;
		
		public function ViewFactory(injector:IInjector)
		{
			_injector = injector;
		}
		
		public function createViews(item:Object, type:Class, mappings:Array):void {
			const createdViews:Array = [];
			var view:Object;
			for each (var mapping:IMediatorMapping in mappings)
			{
				view = getView(item, mapping);
				
				if (!view)
				{
					mapTypeForFilterBinding(mapping.matcher, type, item);
					view = createMediator(item, mapping);
					unmapTypeForFilterBinding(mapping.matcher, type, item)
				}
				
				if (view)
					createdMediators.push(view);
			}
			return createdMediators;
		}
	}
}