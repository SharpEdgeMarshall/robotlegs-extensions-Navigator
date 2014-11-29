package robotlegs.bender.extensions.Navigator
{
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;

	public class NavigatorExtension implements IExtension
	{
				
		public function extend(context:IContext):void
		{
			trace(this, " is being installed into ", context);
			// BEWARE: the context may not be fully initialized.
		}
	}
}