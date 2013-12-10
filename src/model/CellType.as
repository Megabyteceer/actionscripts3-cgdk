package model 
{
	/**
	 * ...
	 * @author 
	 */
	public class CellType 
	{
		
		public static const Free:uint = 0;
		public static const LowCover:uint = 1;
		public static const MediumCover:uint = 2;
		public static const HighCover:uint = 3;
		
		public function CellType() 
		{
			throw new Error("Class is static enumeration.");
		}
		
	}

}