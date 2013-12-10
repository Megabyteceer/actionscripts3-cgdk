package  
{
	import model.Game;
	import model.Move;
	import model.Trooper;
	import model.World;
	
	/**
	 * ...
	 * @author 
	 */
	public interface IStrategy 
	{
		
		function move(self:Trooper, world:World, game:Game, move:Move):void;
		
	}
	
}