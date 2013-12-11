package com.codegame.codetroopers2013.devkit.as3cgdk.model
{
	
	/**
	 * ...
	 * @author
	 */
	public class Trooper extends Unit
	{
		
		private var _playerId:uint;
		private var _teammateIndex:int;
		private var _isTeammate:Boolean;
		
		private var _type:uint;
		private var _stance:uint;
		
		private var _hitpoints:int;
		private var _maximalHitpoints:int;
		
		private var _actionPoints:int;
		private var _initialActionPoints:int;
		
		private var _visionRange:Number;
		private var _shootingRange:Number;
		
		private var _shootCost:int;
		private var _standingDamage:int;
		private var _kneelingDamage:int;
		private var _proneDamage:int;
		private var _damage:int;
		
		private var _isHoldingGrenade:Boolean;
		private var _isHoldingMedikit:Boolean;
		private var _isHoldingFieldRation:Boolean;
		
		public function Trooper(id:uint, x:int, y:int,
			
			playerId:uint, teammateIndex:int, isTeammate:Boolean,
			
			type:uint, stance:uint,
			
			hitpoints:int, maximalHitpoints:int,
			
			actionPoints:int, initialActionPoints:int,
			
			visionRange:Number, shootingRange:Number,
			
			shootCost:int, standingDamage:int, kneelingDamage:int, proneDamage:int, damage:int,
			
			isHoldingGrenade:Boolean, isHoldingMedikit:Boolean, isHoldingFieldRation:Boolean
			
			)
		{
			super(id, x, y);
			
		_playerId = playerId;
		_teammateIndex = teammateIndex;
		_isTeammate = isTeammate;

		_type = type;
		_stance = stance;

		_hitpoints = hitpoints;
		_maximalHitpoints = maximalHitpoints;

		_actionPoints = actionPoints;
		_initialActionPoints = initialActionPoints;
		
		_visionRange = visionRange;
		_shootingRange = shootingRange;

		_shootCost = shootCost;
		_standingDamage = standingDamage;
		_kneelingDamage = kneelingDamage;
		_proneDamage = proneDamage;
		_damage = damage;

		_isHoldingGrenade = isHoldingGrenade;
		_isHoldingMedikit = isHoldingMedikit;
		_isHoldingFieldRation = isHoldingFieldRation
		
		}
		
		public function get playerId():uint
		{
			return _playerId;
		}
		
		public function get teammateIndex():int
		{
			return _teammateIndex;
		}
		
		public function get isTeammate():Boolean
		{
			return _isTeammate;
		}
		
		public function get type():uint
		{
			return _type;
		}
		
		public function get stance():uint
		{
			return _stance;
		}
		
		public function get hitpoints():int
		{
			return _hitpoints;
		}
		
		public function get maximalHitpoints():int
		{
			return _maximalHitpoints;
		}
		
		public function get actionPoints():int
		{
			return _actionPoints;
		}
		
		public function get initialActionPoints():int
		{
			return _initialActionPoints;
		}
		
		public function get visionRange():Number
		{
			return _visionRange;
		}
		
		public function get shootingRange():Number
		{
			return _shootingRange;
		}
		
		public function get shootCost():int
		{
			return _shootCost;
		}
		
		public function get standingDamage():int
		{
			return _standingDamage;
		}
		
		public function get kneelingDamage():int
		{
			return _kneelingDamage;
		}
		
		public function get proneDamage():int
		{
			return _proneDamage;
		}
		
		public function get damage():int
		{
			return _damage;
		}
		
		public function get isHoldingGrenade():Boolean
		{
			return _isHoldingGrenade;
		}
		
		public function get isHoldingMedikit():Boolean
		{
			return _isHoldingMedikit;
		}
		
		public function get isHoldingFieldRation():Boolean
		{
			return _isHoldingFieldRation;
		}
		
		public function getDamage(stance:uint):int
		{
			switch (stance)
			{
				case TrooperStance.Prone: 
					return proneDamage;
				case TrooperStance.Kneeling: 
					return kneelingDamage;
				case TrooperStance.Standing: 
					return standingDamage;
				default: 
					throw new Error("Unsupported stance: " + stance + '.');
			}
		}
	
	}

}