package 
{
	import adobe.utils.CustomActions;
	import flash.desktop.NativeApplication;
	import flash.display.NativeWindow;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.GameInputEvent;
	import flash.events.InvokeEvent;
	import flash.system.Worker;
	import flash.utils.ByteArray;
	import model.Game;
	import model.Move;
	import model.PlayerContext;
	import model.Trooper;
	
	/**
	 * ...
	 * @author 
	 */
	public class Runner extends Sprite 
	{
		
		private var strategy:MyStrategy;
		private var remoteProcessClient:RemoteProcessClient;
        private var token:String;
		
		private var strategies:Vector.<IStrategy>
		
		private var game:Game;
		
		public function Runner() 
		{
			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE, invokeHandler);
		}
		
		private function invokeHandler(event:InvokeEvent):void
		{
			try
			{
				if (event.arguments[3])
				{
					run(event.arguments);
				}
				else
				{
					var o:Object = new Object();
					o[1] = "127.0.0.1";
					o[2] = "31001";
					o[3] = "0000000000000000";
					run(o);
				}
			}
			catch (e:Error)
			{
				NativeApplication.nativeApplication.exit();
			}
		}
		
		
		
		private function run(args:Object):void
		{
			remoteProcessClient = new RemoteProcessClient(args[1], parseInt(args[2]), onConnect, stage);
            token = args[3];
		}
		
		private function onConnect(e:Event):void
		{
            remoteProcessClient.writeToken(token);
			remoteProcessClient.readTeamSize(onTeamSize);
		}
		
		private var teamSize:int;
		
		private function onTeamSize(i:int):void
		{
			try
			{
                teamSize = i;
                remoteProcessClient.writeProtocolVersion();
				
                remoteProcessClient.readGameContext(onGame);
			}
			catch (e:Error)
			{
				
			}
		}
		
		private function onGame(game:Game):void
		{
			this.game = game;
			
            strategies = new Vector.<IStrategy>(teamSize,true);
			
            for (var strategyIndex:int = 0; strategyIndex < teamSize; strategyIndex++)
            {
                strategies[strategyIndex] = new MyStrategy();
            }
			
			if (game)
			{
				readPlayerContext();
			}
			
		}
		
		private function readPlayerContext():void
		{
			remoteProcessClient.readPlayerContext(onContext);
		}
		
		
		private function onContext(playerContext:PlayerContext):void
		{
			
			if (playerContext)
			{
				
				var playerTrooper:Trooper = playerContext.trooper;
				var move:Move = new Move();
				strategies[playerTrooper.teammateIndex].move(playerTrooper, playerContext.world, game, move);
				remoteProcessClient.writeMove(move);
				
				readPlayerContext();
				
			}
			else
			{
				remoteProcessClient.close();
			}
		}

		
		
	}
	
}