package com.codegame.codetroopers2013.devkit.as3cgdk.model 
{
	/**
	 * ...
	 * @author 
	 */
	public class TrooperType 
	{
		
		public static const Commander:uint = 0;
        public static const FieldMedic:uint = 1;
		public static const Soldier:uint = 2;
		public static const  Sniper:uint = 3;
        public static const Scout:uint = 4;
		
		public function TrooperType() 
		{
			throw new Error("Class is static enumeration.");
		}
		
	}

}