package com.codegame.codetroopers2013.devkit.as3cgdk.model
{
	
	/**
	 * ...
	 * @author
	 */
	public class Game
	{
		private var _moveCount:int;
		
		private var _lastPlayerEliminationScore:int;
		private var _playerEliminationScore:int;
		private var _trooperEliminationScore:int;
		private var _trooperDamageScoreFactor:Number;
		
		private var _stanceChangeCost:int;
		private var _standingMoveCost:int;
		private var _kneelingMoveCost:int;
		private var _proneMoveCost:int;
		
		private var _commanderAuraBonusActionPoints:int;
		private var _commanderAuraRange:Number;
		
		private var _commanderRequestEnemyDispositionCost:int;
		private var _commanderRequestEnemyDispositionMaxOffset:int;
		
		private var _fieldMedicHealCost:int;
		private var _fieldMedicHealBonusHitpoints:int;
		private var _fieldMedicHealSelfBonusHitpoints:int;
		
		private var _sniperStandingStealthBonus:Number;
		private var _sniperKneelingStealthBonus:Number;
		private var _sniperProneStealthBonus:Number;
		
		private var _sniperStandingShootingRangeBonus:Number;
		private var _sniperKneelingShootingRangeBonus:Number;
		private var _sniperProneShootingRangeBonus:Number;
		
		private var _scoutStealthBonusNegation:Number;
		
		private var _grenadeThrowCost:int;
		private var _grenadeThrowRange:Number;
		private var _grenadeDirectDamage:int;
		private var _grenadeCollateralDamage:int;
		
		private var _medikitUseCost:int;
		private var _medikitBonusHitpoints:int;
		private var _medikitHealSelfBonusHitpoints:int;
		
		private var _fieldRationEatCost:int;
		private var _fieldRationBonusActionPoints:int;
		
		public function Game(moveCount:int, lastPlayerEliminationScore:int, playerEliminationScore:int, trooperEliminationScore:int, trooperDamageScoreFactor:Number, stanceChangeCost:int, standingMoveCost:int, kneelingMoveCost:int, proneMoveCost:int, commanderAuraBonusActionPoints:int, commanderAuraRange:Number, commanderRequestEnemyDispositionCost:int, commanderRequestEnemyDispositionMaxOffset:int, fieldMedicHealCost:int, fieldMedicHealBonusHitpoints:int, fieldMedicHealSelfBonusHitpoints:int, sniperStandingStealthBonus:Number, sniperKneelingStealthBonus:Number, sniperProneStealthBonus:Number, sniperStandingShootingRangeBonus:Number, sniperKneelingShootingRangeBonus:Number, sniperProneShootingRangeBonus:Number, scoutStealthBonusNegation:Number, grenadeThrowCost:int, grenadeThrowRange:Number, grenadeDirectDamage:int, grenadeCollateralDamage:int, medikitUseCost:int, medikitBonusHitpoints:int, medikitHealSelfBonusHitpoints:int, fieldRationEatCost:int, fieldRationBonusActionPoints:int)
		{
			_moveCount = moveCount;
			
			_lastPlayerEliminationScore = lastPlayerEliminationScore;
			_playerEliminationScore = playerEliminationScore;
			_trooperEliminationScore = trooperEliminationScore;
			_trooperDamageScoreFactor = trooperDamageScoreFactor;
			
			_stanceChangeCost = stanceChangeCost;
			_standingMoveCost = standingMoveCost;
			_kneelingMoveCost = kneelingMoveCost;
			_proneMoveCost = proneMoveCost;
			
			_commanderAuraBonusActionPoints = commanderAuraBonusActionPoints;
			_commanderAuraRange = commanderAuraRange;
			_commanderRequestEnemyDispositionCost = commanderRequestEnemyDispositionCost;
			_commanderRequestEnemyDispositionMaxOffset = commanderRequestEnemyDispositionMaxOffset;
			
			_fieldMedicHealCost = fieldMedicHealCost;
			_fieldMedicHealBonusHitpoints = fieldMedicHealBonusHitpoints;
			_fieldMedicHealSelfBonusHitpoints = fieldMedicHealSelfBonusHitpoints;
			
			_sniperStandingStealthBonus = sniperStandingStealthBonus;
			_sniperKneelingStealthBonus = sniperKneelingStealthBonus;
			_sniperProneStealthBonus = sniperProneStealthBonus;
			
			_sniperStandingShootingRangeBonus = sniperStandingShootingRangeBonus;
			_sniperKneelingShootingRangeBonus = sniperKneelingShootingRangeBonus;
			_sniperProneShootingRangeBonus = sniperProneShootingRangeBonus;
			
			_scoutStealthBonusNegation = scoutStealthBonusNegation;
			
			_grenadeThrowCost = grenadeThrowCost;
			_grenadeThrowRange = grenadeThrowRange;
			_grenadeDirectDamage = grenadeDirectDamage;
			_grenadeCollateralDamage = grenadeCollateralDamage;
			
			_medikitUseCost = medikitUseCost;
			_medikitBonusHitpoints = medikitBonusHitpoints;
			_medikitHealSelfBonusHitpoints = medikitHealSelfBonusHitpoints;
			
			_fieldRationEatCost = fieldRationEatCost;
			_fieldRationBonusActionPoints = fieldRationBonusActionPoints;
		}
		
		public function get moveCount():int
		{
			return _moveCount
		}
		
		public function get lastPlayerEliminationScore():int
		{
			return _lastPlayerEliminationScore
		}
		
		public function get playerEliminationScore():int
		{
			return _playerEliminationScore
		}
		
		public function get trooperEliminationScore():int
		{
			return _trooperEliminationScore
		}
		
		public function get trooperDamageScoreFactor():Number
		{
			return _trooperDamageScoreFactor
		}
		
		public function get stanceChangeCost():int
		{
			return _stanceChangeCost
		}
		
		public function get standingMoveCost():int
		{
			return _standingMoveCost
		}
		
		public function get kneelingMoveCost():int
		{
			return _kneelingMoveCost
		}
		
		public function get proneMoveCost():int
		{
			return _proneMoveCost
		}
		
		public function get commanderAuraBonusActionPoints():int
		{
			return _commanderAuraBonusActionPoints
		}
		
		public function get commanderAuraRange():Number
		{
			return _commanderAuraRange
		}
		
		public function get commanderRequestEnemyDispositionCost():int
		{
			return _commanderRequestEnemyDispositionCost
		}
		
		public function get commanderRequestEnemyDispositionMaxOffset():int
		{
			return _commanderRequestEnemyDispositionMaxOffset
		}
		
		public function get fieldMedicHealCost():int
		{
			return _fieldMedicHealCost
		}
		
		public function get fieldMedicHealBonusHitpoints():int
		{
			return _fieldMedicHealBonusHitpoints
		}
		
		public function get fieldMedicHealSelfBonusHitpoints():int
		{
			return _fieldMedicHealSelfBonusHitpoints
		}
		
		public function get sniperStandingStealthBonus():Number
		{
			return _sniperStandingStealthBonus
		}
		
		public function get sniperKneelingStealthBonus():Number
		{
			return _sniperKneelingStealthBonus
		}
		
		public function get sniperProneStealthBonus():Number
		{
			return _sniperProneStealthBonus
		}
		
		public function get sniperStandingShootingRangeBonus():Number
		{
			return _sniperStandingShootingRangeBonus
		}
		
		public function get sniperKneelingShootingRangeBonus():Number
		{
			return _sniperKneelingShootingRangeBonus
		}
		
		public function get sniperProneShootingRangeBonus():Number
		{
			return _sniperProneShootingRangeBonus
		}
		
		public function get scoutStealthBonusNegation():Number
		{
			return _scoutStealthBonusNegation
		}
		
		public function get grenadeThrowCost():int
		{
			return _grenadeThrowCost
		}
		
		public function get grenadeThrowRange():Number
		{
			return _grenadeThrowRange
		}
		
		public function get grenadeDirectDamage():int
		{
			return _grenadeDirectDamage
		}
		
		public function get grenadeCollateralDamage():int
		{
			return _grenadeCollateralDamage
		}
		
		public function get medikitUseCost():int
		{
			return _medikitUseCost
		}
		
		public function get medikitBonusHitpoints():int
		{
			return _medikitBonusHitpoints
		}
		
		public function get medikitHealSelfBonusHitpoints():int
		{
			return _medikitHealSelfBonusHitpoints
		}
		
		public function get fieldRationEatCost():int
		{
			return _fieldRationEatCost
		}
		
		public function get fieldRationBonusActionPoints():int
		{
			return _fieldRationBonusActionPoints
		}
	
	}

}