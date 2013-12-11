package com.codegame.codetroopers2013.devkit.as3cgdk.model 
{
	/**
	 * ...
	 * @author 
	 */
	public class Direction 
	{
		
		public static const CurrentPoint:uint = 0;
		public static const North:uint = 1;
		public static const East:uint = 2;
		public static const South:uint = 3;
		public static const West:uint = 4;

		
		public function Direction() 
		{
			throw new Error("Class is static enumeration.");
		}
		
	}

}