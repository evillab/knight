package world
{	
	import flash.display.Sprite;
	
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	
	import advancedjoystick.JoyStick;
	
	import resources.Assets;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import world.Box2Properties;
	import world.objects.Box;
	import world.objects.Hero;
	import world.objects.Platform;
	
	public class World extends starling.display.Sprite
	{
		public static var b2dWorld:b2World;
		private var canDebugDraw:Boolean = true;

		private var joystick:JoyStick;
		
		public function World()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
			initBox2dWorld();
			addFloor();
			addBox();
			addHero();
			addJoystick();
		}
		
		private function initBox2dWorld():void
		{
			var gravity:b2Vec2 = new b2Vec2(0,9.81);
			var sleep:Boolean = true;
			b2dWorld = new b2World(gravity , sleep);
			initDebugDraw(knight_mobile.debugSprite);
			
			addEventListener(Event.ENTER_FRAME , updateWorld);
		}
		
		private function addFloor():void
		{
			var floor:Platform = new Platform(400 , 430 , 390 , 50);
		}
		
		private function addBox():void
		{
			var box:Box = new Box(400 , 50 , 80 , 80);
		}
		
		private function addHero():void
		{
			var hero:Hero = new Hero(10, 250 ,50 , 80)
		}
		
		private function addJoystick():void
		{
			joystick = new JoyStick(Assets.getTexture("Joystick_dh") , Assets.getTexture("Joystick_ds"));
			joystick.setPosition(50, 400);

			joystick.scaleX = joystick.scaleY = 0.4;
			addChild(joystick);
		}
		
		private function initDebugDraw(debugSprite:flash.display.Sprite):void
		{
			var debugDraw:b2DebugDraw = new b2DebugDraw();
			debugDraw.SetSprite(debugSprite);
			debugDraw.SetDrawScale(Box2Properties.WORLD_SCALE);
			debugDraw.SetFlags(b2DebugDraw.e_shapeBit);
			debugDraw.SetFillAlpha(0.5);
			b2dWorld.SetDebugDraw(debugDraw);
		}
		
		private function updateWorld(e:Event):void
		{
			b2dWorld.Step(Box2Properties.TIME_STAMP, Box2Properties.VELOCITY_ITERATIONS ,Box2Properties.POSITION_ITERATIONS);
			b2dWorld.ClearForces();
			b2dWorld.DrawDebugData();
			checkJoystickTouches();
		}
		
		private function checkJoystickTouches():void
		{
			if(joystick.touched)
			{
				trace(true);
			}
		}
	}
}