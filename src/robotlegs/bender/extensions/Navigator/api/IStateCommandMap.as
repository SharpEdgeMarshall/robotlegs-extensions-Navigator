package robotlegs.bender.extensions.navigator.api
{
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandMapper;
	import robotlegs.bender.extensions.commandCenter.dsl.ICommandUnmapper;

	public interface IStateCommandMap
	{
		function map( stateOrPath : *, exactMatch : Boolean = false ):ICommandMapper;
		
		function unmap( stateOrPath : * ):ICommandUnmapper;
		
		function addMappingProcessor( handler:Function ):IStateCommandMap;
		
	}
}