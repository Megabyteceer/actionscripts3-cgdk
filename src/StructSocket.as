package  
{
	import flash.desktop.NativeApplication;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author 
	 */
	
public class StructSocket extends flash.net.Socket
{

	private var request:Array = new Array();
	private var answer:Array = new Array();
	
	private var waitStringLen:uint = 0;
	
	
	
	public function StructSocket(host:String, port:int, stage:Stage)
	{
		super(host, port);
		addEventListener(IOErrorEvent.IO_ERROR, onError);
		addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		
		stage.addEventListener(Event.ENTER_FRAME, process);
	}
	
	public function readStruct(a:Array, callback:Function):void
	{
		request = request.concat(a);
		request.push(callback);
	}
	
	private function onError(e:Event):void
	{
		NativeApplication.nativeApplication.exit();
	}

	
	public function process(e:Event):void
	{
		while (((bytesAvailable > 0) || (request[0] is Function)) && request && (request.length > 0))
		{
			if (waitStringLen > 0)
			{
				if (bytesAvailable >= waitStringLen)
				{
					answer.push(readUTFBytes(waitStringLen));
					waitStringLen = 0;
				}
				else
				{
					return;
				}
			}
			
			
			if (request[0] is Function)
			{
				request[0](answer);
				answer = new Array();
			}
			else
			switch(request[0])
			{
				case int:
					if (bytesAvailable >= 4)
					{
						answer.push(readInt());
					}
					else
					{
						return;
					}
					break;
					
				case uint:
					if (bytesAvailable >= 4)
					{
						answer.push(readUnsignedInt());
					}
					else
					{
						return;
					}
					break;
					
				case Boolean:
					if (bytesAvailable >= 4)
					{
						answer.push(readBoolean());
					}
					else
					{
						return;
					}
					break;
					
				case Number:
					if (bytesAvailable >= 8)
					{
						answer.push(readDouble());
					}
					else
					{
						return;
					}
					break;
					
				case RemoteProcessClient.ENUM:
					if (bytesAvailable >= 1)
					{
						answer.push(readByte());
					}
					else
					{
						return;
					}
					break;
					
				case RemoteProcessClient.VISIBILITY_ARRAY:
					if (bytesAvailable >= RemoteProcessClient.rawVisibilityCount)
					{
						var ba:ByteArray = new ByteArray();
						readBytes(ba, 0, RemoteProcessClient.rawVisibilityCount);
						answer.push(ba);
					}
					else
					{
						return;
					}
					break;				
				
				case RemoteProcessClient.LONG:
					if (bytesAvailable >= 8)
					{
						answer.push(readUnsignedInt());
						readUnsignedInt();
					}
					else
					{
						return;
					}
					break;
					
				case String:
					if (bytesAvailable >= 4)
					{
						waitStringLen = readUnsignedInt();
					}
					else
					{
						return;
					}
					break;
					
				default:
					throw new Error("unknown type");
				
			}
			request.shift();
		}
	}
	
	
	
	
	
}



}