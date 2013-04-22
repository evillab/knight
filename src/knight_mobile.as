package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="800", height="480", backgroundColor="0x000000")]
	public class knight_mobile extends Sprite
	{
		private var starling:Starling;
		public static var debugSprite:Sprite = new Sprite();
		
		public function knight_mobile()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			initMonsterDebugger();
			initStarling();
		}
		
		private function initStarling():void
		{
			starling = new Starling(Game , stage);
			starling.antiAliasing= 1;
			starling.start();
			
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
			
		}
		
		private function onContextCreated(e:Event):void{
			//debug mode
			//debugSprite=new Sprite();
			addChild(debugSprite);
		}
		
		private function initMonsterDebugger():void
		{
			MonsterDebugger.initialize(this);
		}
	}
}