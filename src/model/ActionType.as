package model 
{
	/**
	 * ...
	 * @author 
	 */
	public class ActionType 
	{
		
		public static const EndTurn:uint = 0;
		public static const Move:uint = 1;
		public static const Shoot:uint = 2;
		public static const RaiseStance:uint = 3;
		public static const LowerStance:uint = 4;
		public static const ThrowGrenade:uint = 5;
		public static const UseMedikit:uint = 6;
		public static const EatFieldRation:uint = 7;
		public static const Heal:uint = 8;
		public static const RequestEnemyDisposition:uint = 9;
		
		public function ActionType() 
		{
			throw new Error("Class is static enumeration.");
		}
		
	}

}