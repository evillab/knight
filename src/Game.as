package
{
	import events.NavigationEvent;
	
	import screens.InGame;
	import screens.Welcome;
	import screens.WelcomeScreen;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var screenWelcome:WelcomeScreen;
		//private var screenInGame : InGame;
		private var _debugMode:Boolean = false;
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			//this.addEventListener(NavigationEvent.CHANGE_SCREEN , onScreenChanged);
		
			//screenInGame = new InGame(_debugMode);
			//screenInGame.disposeTemporarily();
			//this.addChild(screenInGame);
		
			screenWelcome = new WelcomeScreen();
			this.addChild(screenWelcome);
		}
	
		/*private function onScreenChanged(event:NavigationEvent):void
		{
			switch(event.params.id)
			{
				case "play" :
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
			}
		}*/
	}
}