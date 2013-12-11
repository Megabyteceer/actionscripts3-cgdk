package com.codegame.codetroopers2013.devkit.as3cgdk.model 
{
	/**
	 * ...
	 * @author 
	 */
	public class Bonus extends Unit
	{
		
		private var _bonusType:uint;
		
		public function Bonus(id:uint, x:int, y:int, bonusType:uint) 
		{
			super(id, x, y);
			_bonusType = bonusType;
		}
		
		public function get bonusType():uint 
		{
			return _bonusType;
		}
		
	}

}