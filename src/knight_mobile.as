package
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	[SWF(frameRate="60", width="800", height="480", backgroundColor="0x0072bc")]
	public class knight_mobile extends Sprite
	{
		public function knight_mobile()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			initMonsterDebugger();
		}
		
		private function initMonsterDebugger():void
		{
			MonsterDebugger.initialize(this);
		}
	}
}