package screens
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	import world.World;
	
	public class InGameScreen extends Sprite
	{

		private var _world:World;
		
		public function InGameScreen()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function initWorld():void
		{
			_world = new World();
			addChild(_world);
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
			initWorld();
		}
	}
}