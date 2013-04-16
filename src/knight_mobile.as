package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="800", height="480", backgroundColor="0x0072bc")]
	public class knight_mobile extends Sprite
	{
		private var starling:Starling;
		
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
			
		}
		
		private function initMonsterDebugger():void
		{
			MonsterDebugger.initialize(this);
		}
	}
}