package screens
{
	import com.demonsters.debugger.MonsterDebugger;
	
	import events.NavigationEvent;
	
	import resources.Assets;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import utils.EFObserver;
	import utils.IObserver;
	

	public class WelcomeScreen extends Sprite implements IObserver
	{
		private var leftBg:Image;
		private var rightBg:Image;
		
		private var playBtn:Button;
		private var settingsBtn:Button;
		
		private var knightShadowImg:Image;
		private var knightImg:Image;
		private var frame:uint=0;
		private var efo:EFObserver = EFObserver.getInstance();
		
		private var fireAnimation:MovieClip;
		
		public function WelcomeScreen()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			MonsterDebugger.trace(this , "welcome screen initialized");
			
			drawScreen();
			createTorchAnimation();
			efo.subscribeObserver(this);
		}
		
		public function update():void
		{
			
			if(frame>=Math.ceil(Math.random()*10) + 5){	
				if (knightShadowImg.y > leftBg.y)
				{
					knightShadowImg.y = leftBg.y;
					knightShadowImg.x = leftBg.x;
					knightShadowImg.alpha=1;
				}
				else{
					knightShadowImg.y = leftBg.y+Math.random()*1.5;
					knightShadowImg.x = leftBg.x+Math.random()*1.9;
					knightShadowImg.alpha = Math.random() * .15 + .85;
				}
				frame=0;
			}
			frame++;
		}		

		
		private function drawScreen():void
		{
			// lewa strona menu
			leftBg = new Image(Assets.getTexture("LeftSideMenu"));
			leftBg.x =50;
			leftBg.scaleY = .9;
			this.addChild(leftBg);
			
			knightShadowImg = new Image(Assets.getTexture("KnightShadow"));
			knightShadowImg.y = leftBg.y;
			knightShadowImg.x = leftBg.x;
			this.addChild(knightShadowImg);
			
			knightImg = new Image(Assets.getTexture("Knight"));
			knightImg.y = knightShadowImg.y ;
			knightImg.x = knightShadowImg.x +5;
			this.addChild(knightImg);
			
			
			//prawa strona menu
			rightBg = new Image(Assets.getTexture("RightSideMenu"));
			rightBg.x = 400;
			rightBg.scaleY = .9;
			this.addChild(rightBg);
			
			playBtn = new Button(Assets.getTexture("MenuButton") , "PLAY");
			playBtn.fontSize = 20;
			playBtn.x = 450;
			playBtn.y = 150;
			this.addChild(playBtn);
			
			settingsBtn = new Button(Assets.getTexture("MenuButton") , "OPTIONS");
			settingsBtn.fontSize = 20;
			settingsBtn.x = 450;
			settingsBtn.y = 250;
			this.addChild(settingsBtn);
			
			// listener na klikniecie przycisku
			this.addEventListener(Event.TRIGGERED , onMainMenuClicked);
		}
		
		//animacja ognia 
		private function createTorchAnimation():void
		{
			fireAnimation = new MovieClip(Assets.getAtlas().getTextures("fire"),20);
			fireAnimation.x = leftBg.x + 210;
			fireAnimation.y = leftBg.y - 10;
			starling.core.Starling.juggler.add(fireAnimation);
			this.addChild(fireAnimation);
		}
		
		
		private function onMainMenuClicked(event:Event):void
		{
			if((event.target as Button) == playBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN ,{id : "play"} , true));
			}
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			efo.unsubscribeObserver(this);
		}
		
	}
}