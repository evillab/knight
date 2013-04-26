package
{
	import events.NavigationEvent;
	
	import screens.InGameScreen;
	import screens.WelcomeScreen;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import utils.EFObserver;
	
	public class Game extends Sprite
	{
		private var screenWelcome:WelcomeScreen;
		private var screenInGame : InGameScreen;
		private var efo:EFObserver = EFObserver.getInstance();
		private var _debugMode:Boolean = false;
		
		
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);			
		}
		
		private function onAddedToStage():void
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN , onScreenChanged);
			this.addEventListener(starling.events.Event.ENTER_FRAME, onEnterFrame);	//EnterFrame nie moze byc w singletonie!	
			screenInGame = new InGameScreen();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
		
			screenWelcome = new WelcomeScreen();
			this.addChild(screenWelcome);
		}
		
		private function onEnterFrame():void
		{
			efo.notifyObservers();			
		}
		
		private function onScreenChanged(event:NavigationEvent):void
		{
			switch(event.params.id)
			{
				case "play" :
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
			}
		}
	}
}