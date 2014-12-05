package robotlegs.bender.bundles.navigator
{
	import robotlegs.bender.extensions.navigator.NavigatorExtension;
	import robotlegs.bender.extensions.navigator.NavigatorHistoryExtension;
	import robotlegs.bender.framework.api.IBundle;
	import robotlegs.bender.framework.api.IContext;

	public class NavigatorCompleteBundle implements IBundle
	{
		/**
		 * @inheritDoc
		 */
		public function extend(context:IContext):void
		{			
			context.install(				
				NavigatorExtension,
				NavigatorHistoryExtension
			);			
		}
	}
}