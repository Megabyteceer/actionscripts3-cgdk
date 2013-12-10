package model 
{
	/**
	 * ...
	 * @author 
	 */
	public class Unit 
	{
		private var _id:uint;
		private var _x:int;
		private var _y:int;
		
		
		public function Unit(id:uint, x:int, y:int) 
		{
			_id = id;
			_x = x;
			_y = y;
		}
		
		public function get id():uint
		{
			return _id;
		}
		
		public function get x():int
		{
			return _x;
		}
		
		public function get y():int
		{
			return _y;
		}
		
		
		public function GetDistanceTo(x:int, y:int):Number
        {
            var xRange:int = x - this._x;
            var yRange:int = y - this._y;
            return Math.sqrt(xRange*xRange + yRange*yRange);
        }

        public function GetDistanceToUnit(unit:Unit):Number
        {
            return GetDistanceTo(unit._x, unit._y);
        }
		
	}

}