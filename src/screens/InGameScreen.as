package screens
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InGameScreen extends Sprite
	{
		public function InGameScreen()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
	}
}