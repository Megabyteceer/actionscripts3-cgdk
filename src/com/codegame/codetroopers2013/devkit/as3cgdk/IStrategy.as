package  com.codegame.codetroopers2013.devkit.as3cgdk
{
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Game;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Move;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Trooper;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.World;
	
	/**
	 * ...
	 * @author 
	 */
	public interface IStrategy 
	{
		
		function move(self:Trooper, world:World, game:Game, move:Move):void;
		
	}
	
}