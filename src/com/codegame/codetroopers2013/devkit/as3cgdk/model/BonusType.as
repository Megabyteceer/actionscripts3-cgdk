package com.codegame.codetroopers2013.devkit.as3cgdk.model 
{
	/**
	 * ...
	 * @author 
	 */
	public class BonusType 
	{
		
		public static const Grenade:uint = 0;
		public static const Medikit:uint = 1;
		public static const FieldRation:uint = 2;
		
		public function BonusType() 
		{
			throw new Error("Class is static enumeration.");
		}
		
	}

}