package robotlegs.bender.extensions.navigator.api
{
	public class NavigationStatesCollection
	{
		
		private var _truncated : NavigationState;
		private var _full : NavigationState;
		
		public function get truncated():NavigationState {
			return _truncated;
		}
		
		public function get full():NavigationState {
			return _full;
		}
		
		public function NavigationStatesCollection( truncated:NavigationState, full:NavigationState )
		{
			_truncated = truncated;
			_full = full;			
		}
	}
}