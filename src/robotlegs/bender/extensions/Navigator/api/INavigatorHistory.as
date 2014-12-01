package robotlegs.bender.extensions.Navigator.api
{
	public interface INavigatorHistory
	{
		function set maxLength( value:int ):void;
		function get maxLength():int;
		function get history():Array;
		function getPreviousState( steps:int = 1 ):NavigationState;
		function getNextState( steps:int = 1 ):NavigationState;
		function clearHistory():void;
		function back( steps:int = 1 ):Boolean;
		function forward( steps:int = 1 ):Boolean;
		function getStateByPosition( position:int ):NavigationState;
		function getPositionByState( state:NavigationState ):int;
		
	}
}