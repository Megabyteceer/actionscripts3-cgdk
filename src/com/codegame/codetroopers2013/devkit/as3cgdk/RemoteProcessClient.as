package com.codegame.codetroopers2013.devkit.as3cgdk
{
	CONFIG::air
	{
	import flash.desktop.NativeApplication;
	}
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.net.Socket;
	import flash.system.Worker;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Bonus;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Game;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Move;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Player;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.PlayerContext;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.Trooper;
	import com.codegame.codetroopers2013.devkit.as3cgdk.model.World;
	
	/**
	 * ...
	 * @author Megabyte
	 */
	public class RemoteProcessClient
	{
		
		private var client:StructSocket;
		
		private static var cells:Vector.<Vector.<uint>>;
		private static var cellVisibilities:Vector.<Boolean>;
		
		public static const ENUM:Point = new Point(); //объекты как уникальные идентификаторы
		public static const VISIBILITY_ARRAY:Point = new Point();
		public static const LONG:Point = new Point();
		
		
		public function RemoteProcessClient(host:String, port:int, onConnect:Function, stage:Stage)
		{
			client = new StructSocket(host, port,stage);
			client.addEventListener(Event.CONNECT, onConnect);
			client.timeout = 50000;
			client.endian = Endian.LITTLE_ENDIAN;
			client.addEventListener(Event.CLOSE, onClose);
			client.connect(host, port);
		}
		
		public function writeToken(string:String):void
		{
			try
            {
				writeEnum(MessageType.AuthenticationToken);
				writeString(string);
				client.flush();
			}
			catch (e:Error)
			{
				close();
			}
		}
		
		private var callback:Function;
		
		public function readTeamSize(callback:Function):void
		{
			this.callback = callback;
			client.readStruct(new Array(ENUM, int), onTeamSize);
		}
		
		private function onTeamSize(a:Array):void
		{
			try
			{
				ensureMessageType(a.shift(), MessageType.TeamSize);
				callback(a.shift());
				return;
			}
			catch (e:Error)
			{
				close();
			}
			callback(-1);
		}
		
		public function writeProtocolVersion():void
		{
			try
			{
				client.writeByte(MessageType.ProtocolVersion);
				client.writeInt(2);
				client.flush();
			}
			catch (e:Error)
			{
				close();
			}
		}
		
		public function readGameContext(callback:Function):void
		{
			this.callback = callback;
			client.readStruct(new Array(ENUM,Boolean,int, int, int, int, Number, int, int, int, int, int, Number, int, int, int, int, int, Number, Number, Number, Number, Number, Number, Number,
			int, Number, int, int, int, int, int, int, int), onGame);
		}
		
		private function onGame(a:Array):void
		{
			try
			{
				ensureMessageType(a.shift(), MessageType.GameContext);
				if (!a.shift())
				{
					callback(null);
					return;
				}
				callback( new Game(a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), 
				a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(),
				a.shift(), a.shift(), a.shift(), a.shift(), a.shift()));
				return;
			}
			catch (e:Error)
			{
				close();
			}
			callback (null);
		}
		
		private var world:World;
		private var trooper:Trooper;
		private var players:Vector.<Player>;
		private var troopers:Vector.<Trooper>;
		private var bonuses:Vector.<Bonus>;
		
		
		private var contextCallback:Function;
		public function readPlayerContext(callback:Function):void
		{
			world = null;
			players = null;
			troopers = null;
			bonuses = null;
			
			
			contextCallback = callback;
			client.readStruct(new Array(ENUM), onContextHeader)
		}
			
		private function onContextHeader(a:Array):void
		{
			var messageType:int = a.shift();
			if (messageType == MessageType.GameOver)
			{
				contextCallback(null);
				return;
			}
			else
			{
				ensureMessageType(messageType, MessageType.PlayerContext);
				client.readStruct(new Array(Boolean), onContext);
			}
			
		}
		
		private function onContext(a:Array):void
		{
			if (a.shift())
			{
				readTrooper(selfReaded);
			}
			else
			{
				contextCallback(null);
			}
		}
		
		private var self:Trooper;
		
		private function selfReaded(t:Trooper):void
		{
			self = t;
			client.readStruct(new Array(Boolean), onWorldHeader);
		}
		
		
		
		private function onWorldHeader(a:Array):void
        {
            if (!a.shift())
            {
                world = null;
            }
			else
			{
				client.readStruct(new Array(int, int, int, int), onWorld);
			}
		}
		
		private var playerCount:int;
		private var w1:int;
		private var w2:int;
		private var w3:int;
		private function onWorld(a:Array):void
		{
			w1 = a.shift();
			w2 = a.shift();
			w3 = a.shift();
			
			players = null;
			
			playerCount = a.shift();
			
			if (playerCount > 0)
			{
				readPlayer();
			}
			else
			{
				client.readStruct(new Array(int), onTroopersCount);
			}
		}
		
		private function worldReady():void
		{
			
			var c:PlayerContext = new PlayerContext(self,
			new World(w1, w2, w3, players, troopers, bonuses, cells,
                cellVisibilities)
				);
				
			contextCallback(c);
        }

		
		
		private function readPlayer():void
		{
			client.readStruct(new Array(Boolean), onPlayerHeader); 
		}
		
		private function onPlayerHeader(a:Array):void
		{
			if (a.shift())
			{
				client.readStruct(new Array(LONG, String, int, Boolean, int, int), onPlayer);
			}
		}
		
		
		private function onPlayer(a:Array):void
        {
			if (!players)
			{
				players = new Vector.<Player>(playerCount, true);
			}
			
			var i:int = 0;
			
			while (players[i])
			{
				i++;
			}
			
			players[i] = new Player(a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift());
			
			if (i < (players.length-1))
			{
				readPlayer();
			}
			else
			{
				client.readStruct(new Array(int), onTroopersCount);
			}
			
        }
		
		private var trooperCount:int
		
		private function onTroopersCount(a:Array):void
		{
			trooperCount = a.shift();
			if (trooperCount > 0)
			{
				readTrooper(trooperItemReady);
			}
			else
			{
				client.readStruct(new Array(int), onBonusCount);
			}
		}
		
		
		private var trooperCallback:Function;
		
		private function readTrooper(callback:Function):void
		{
			trooperCallback = callback;
			client.readStruct(new Array(Boolean), onTrooperHeader);

		}
		
		private function onTrooperHeader(a:Array):void
		{
			if (a.shift())
			{
				client.readStruct(new Array(LONG, int, int, LONG,
				int, Boolean, ENUM, ENUM,
				int, int, int, int,
				Number, Number, int,
				int, int, int, int,
				Boolean,Boolean,Boolean
				), onTrooper);
				
			}
			else
			{
				trooperCallback(null);
			}
		}
		
		
		private function onTrooper(a:Array):void
        {
			
			var t:Trooper = new Trooper(a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift(), a.shift());
			
			trooperCallback(t);
			
		}
		
		private function trooperItemReady(trooper:Trooper):void
		{
			if (!troopers)
			{
				troopers = new Vector.<Trooper>(trooperCount, true);
			}
			
			var i:int = 0;
			
			while (troopers[i])
			{
				i++;
			}
			
			troopers[i] = trooper;			
			
			if (i < (troopers.length-1))
			{
				readTrooper(trooperItemReady);
			}
			else
			{
				client.readStruct(new Array(int), onBonusCount);
			}
        }
		
		
		
		
		
		
		private var bonusCount:int
		
		private function onBonusCount(a:Array):void
		{
			bonusCount = a.shift();
			if (bonusCount > 0)
			{
				readBonus();
			}
			else
			{
				readCells();
			}
		}
		
		private function readBonus():void
		{
			client.readStruct(new Array(Boolean), onBonusHeader); 
		}
		
		private function onBonusHeader(a:Array):void
		{
			if (a.shift())
			{
				client.readStruct(new Array(LONG, int, int, ENUM), onBonus);
			}
			else
			{
				readCells();
			}
		}
		
		private function onBonus(a:Array):void
        {
			if (!bonuses)
			{
				bonuses = new Vector.<Bonus>(bonusCount, true);
			}
			
			var i:int = 0;
			
			while (bonuses[i])
			{
				i++;
			}
			
			bonuses[i] = new Bonus(a.shift(), a.shift(), a.shift(), a.shift());
			
			
			if (i < (bonuses.length-1))
			{
				readBonus();
			}
			else
			{
				readCells();
			}
        }
		
        private function readCells():void
        {
            if (cells != null)
            {
                readCellVisibilities();
            }
			else
			{
				client.readStruct(new Array(int), onCellsW);
			}
		}
		
		private var cellsW:int;
		private var readedCells:int = -1;
		private function onCellsW(a:Array):void
		{
			cellsW = a.shift();
			
			if (cellsW > 0)
			{
				cells = new Vector.<Vector.<uint>>(cellsW, true);
			}
			
			readCellsLine();
			
        }
		
		private function readCellsLine():void
		{
			readedCells++;
			
			if (readedCells >= cellsW)
			{
				readCellVisibilities();
			}
			else
			{
				client.readStruct(new Array(int), onCellsLineHeader);
			}
		}
		
		private var cellsHeight:int;
		private function onCellsLineHeader(a:Array):void
		{
			
			cellsHeight = a.shift();
			if (cellsHeight <= 0)
			{
				readCellsLine();
			}
			else
			{
				a = new Array();
				
				
				while (a.length < cellsHeight)
				{
					a.push(ENUM);
				}
				
				client.readStruct(a, onCellsLine);
			}
		}
		
		private function onCellsLine(a:Array):void
		{
			cells[readedCells] = new Vector.<uint>(cellsHeight, true);
			
			for (var y:int = 0; y < cellsHeight; y++)
			{
				cells[readedCells][y] = a.shift();
			}
			readCellsLine();
		}
		

        private function readCellVisibilities():void
        {
            if (cellVisibilities != null)
            {
                worldReady();
            }
			
			else
			{
				client.readStruct(new Array(int, int, int), onVisionSizes);
			}
		}
		
		
		public static var rawVisibilityCount:int;
		private function onVisionSizes(a:Array):void
		{
			
			
            var worldWidth:int = a.shift();
            if (worldWidth < 0)
            {
                worldReady();
				return;
            }

            var worldHeight:int = a.shift();
            if (worldHeight < 0)
            {
                worldReady();
				return;
            }

            var stanceCount:int = a.shift();
            if (stanceCount < 0)
            {
               worldReady();
			   return;
            }
			
            rawVisibilityCount = worldWidth * worldHeight * worldWidth * worldHeight * stanceCount;
            cellVisibilities = new Vector.<Boolean>(rawVisibilityCount, true);
			
			client.readStruct(new Array(VISIBILITY_ARRAY), onVisibilites);
        }
		
		private function onVisibilites(a:Array):void
		{
			var ba:ByteArray = a.shift();
			
			
			for (var rawVisibilityIndex:int = 0; rawVisibilityIndex < rawVisibilityCount; rawVisibilityIndex++)
            {
                cellVisibilities[rawVisibilityIndex] = (ba.readByte() != 0);
            }
			
			worldReady();
		}
		
		
		
		
		
		public function writeMove(move:Move):void
		{
			writeEnum(MessageType.Move);
			
			if (move == null)
			{
				client.writeBoolean(false);
			}
			else
			{
				client.writeBoolean(true);
				
				writeEnum(move.action);
				writeEnum(move.direction);
				client.writeInt(move.x);
				client.writeInt(move.y);
			}
			
			client.flush();
		}
		
		public function close():void
		{
			client.close();
	CONFIG::air
	{
			NativeApplication.nativeApplication.exit();
	}
		}
		
		private function onClose(e:Event):void
		{
	CONFIG::air
	{
			NativeApplication.nativeApplication.exit();
	}
		}
		
		public function readEnum():int
		{
			return client.readByte();
		}
		
		public function writeEnum(enum:uint):void
		{
			client.writeByte(enum);
		}
		
		
		public function writeString(s:String):void
		{
			client.writeUnsignedInt(s.length);
			client.writeUTFBytes(s);
		}
		
		public function readString():String
		{
			var l:uint = client.readUnsignedInt();
			return client.readUTFBytes(l);
		}
		
		private static function ensureMessageType(actualType:uint, expectedType:uint):void
		{
			if (actualType != expectedType)
			{
				throw new Error("Received wrong message [actual:" + actualType + ", expected=" + expectedType + "].")
			}
		}
	
	}
}


class MessageType
{
	
	public static const Unknown:int = 0;
	public static const GameOver:int = 1;
	public static const AuthenticationToken:int = 2;
	public static const TeamSize:int = 3;
	public static const ProtocolVersion:int = 4;
	public static const GameContext:int = 5;
	public static const PlayerContext:int = 6;
	public static const Move:int = 7;
	
	public function MessageType()
	{
		throw new Error("Class is static enumeration.");
	}

}