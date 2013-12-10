package model 
{
	/**
	 * ...
	 * @author 
	 */
	public class World 
	{
		
		public static const STANCE_COUNT:int = 3;
		
		private var _moveIndex:int;
        private var _width:int;
        private var _height:int;
        private var _players:Vector.<Player>;
        private var _troopers:Vector.<Trooper>;
        private var _bonuses:Vector.<Bonus>;
        private var _cells:Vector.<Vector.<uint>>;
        private var _cellVisibilities:Vector.<Boolean>;
		
		
		public function World(
		 moveIndex:int,
         width:int,
         height:int,
         players:Vector.<Player>,
         troopers:Vector.<Trooper>,
         bonuses:Vector.<Bonus>,
         cells:Vector.<Vector.<uint>>,
         cellVisibilities:Vector.<Boolean>
		)
		{
			_moveIndex = moveIndex;
			_width = width;
			_height = height;
			_players = players;
			_troopers = troopers;
			_bonuses = bonuses;
			_cells = cells;
			_cellVisibilities = cellVisibilities;
		}
		
		
		
		public function get moveIndex():int
		{
		return _moveIndex;
		}
		public function get width():int
		{
		return _width;
		}
		public function get height():int
		{
		return _height;
		}
		public function get players():Vector.<Player>
		{
		return _players;
		}
		public function get troopers():Vector.<Trooper>
		{
		return _troopers;
		}
		public function get bonuses():Vector.<Bonus>
		{
		return _bonuses;
		}
		public function get cells():Vector.<Vector.<uint>>
		{
		return _cells;
		}
		public function get cellVisibilities():Vector.<Boolean>
		{
		return _cellVisibilities;
		}
		
		
		public function  isVisible(
		maxRange:Number,
		viewerX:int, viewerY:int, viewerStance:uint,
		objectX:int, objectY:int, objectStance:uint):Boolean
        {
			var minStanceIndex:int = Math.min(viewerStance, objectStance);
			var xRange:int = objectX - viewerX;
			var yRange:int = objectY - viewerY;
			
            return xRange * xRange + yRange * yRange <= maxRange * maxRange
                && cellVisibilities[
                viewerX * height * width * height * STANCE_COUNT
                + viewerY * width * height * STANCE_COUNT
                + objectX * height * STANCE_COUNT
                + objectY * STANCE_COUNT
                + minStanceIndex
                ];
        }
		
		
		
	}

}