package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.GameInputEvent;
	import flash.system.Worker;
	import model.ActionType;
	import model.Direction;
	import model.Game;
	import model.Move;
	import model.Trooper;
	import model.World;
	
	/**
	 * ...
	 * @author 
	 */
	public class MyStrategy implements IStrategy 
	{
		
		public function MyStrategy()
		{
			
		}
		
		public function move(self:Trooper, world:World, game:Game, move:Move):void 
		{
			
			if (self.actionPoints < game.standingMoveCost)
            {
                return;
            }
			
			move.action = ActionType.Move;
			
			if (Math.random() >= 0.5)
			{
				if (Math.random() >= 0.5)
				{
					move.direction = Direction.East;
				}
				else
				{
					move.direction = Direction.West;
				}
			}
			else
			{
				if (Math.random() >= 0.5)
				{
					move.direction = Direction.North;
				}
				else
				{
					move.direction = Direction.South;
				}
			}
			return;
		}
		
	}
	
}