package model
{
	
	/**
	 * ...
	 * @author
	 */
	public class Player
	{
		private var _id:uint;
		private var _name:String;
		private var _score:int;
		private var _isStrategyCrashed:Boolean;
		private var _approximateX:int;
		private var _approximateY:int;
		
		public function Player(id:uint, name:String, score:int, isStrategyCrashed:Boolean, approximateX:int, approximateY:int)
		{
			_id = id;
			_name = name;
			_score = score;
			_isStrategyCrashed = isStrategyCrashed;
			_approximateX = approximateX;
			_approximateY = approximateY;
		}
		
		public function get id():uint
		{
			return _id
		}
		
		public function get name():String
		{
			return _name
		}
		
		public function get score():int
		{
			return _score
		}
		
		public function get isStrategyCrashed():Boolean
		{
			return _isStrategyCrashed
		}
		
		public function get approximateX():int
		{
			return _approximateX
		}
		
		public function get approximateY():int
		{
			return _approximateY
		}
	
	}

}