package model 
{
	import flash.events.DRMCustomProperties;
	/**
	 * ...
	 * @author 
	 */
	public class PlayerContext 
	{
		
		private var _trooper:Trooper;
        private var _world:World;
		
		
		public function PlayerContext(trooper:Trooper, world:World) 
		{
			_trooper = trooper;
			_world = world;
		}
		
		public function get trooper():Trooper
		{
			return _trooper;
		}
		
		public function get world():World
		{
			return _world;
		}
	}

}