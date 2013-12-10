package model 
{
	/**
	 * ...
	 * @author 
	 */
	public class TrooperStance 
	{
		public static const Prone:int = 0;
		public static const Kneeling:int = 1;
		public static const Standing:int = 2;
		
		
		public function TrooperStance() 
		{
			throw new Error("Class is static enumeration.");
		}
		
	}

}