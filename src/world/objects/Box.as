package world.objects
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	
	import world.Box2Properties;
	import world.World;
	
	public class Box
	{
		private var bodyDef:b2BodyDef;
		private var polygonShape:b2PolygonShape;
		private var fixtureDef:b2FixtureDef;
		private var body:b2Body;
		
		private var _x:Number;
		private var _y:Number;
		private var _width:Number;
		private var _height:Number;
		
		public function Box(x:Number , y:Number , width:Number , height:Number)
		{
			_x = x;
			_y = y;
			_width = width;
			_height = height;
			
			setBodyDef();
			setPolygonShape();
			setFixtureDef();
			setBody();
		}
		
		private function setBodyDef():void
		{
			bodyDef = new b2BodyDef();
			bodyDef.position.Set(_x/Box2Properties.WORLD_SCALE , _y/Box2Properties.WORLD_SCALE);
			bodyDef.type = b2Body.b2_dynamicBody;
		}
		
		private function setPolygonShape():void
		{
			polygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(_width/Box2Properties.WORLD_SCALE , _height/ Box2Properties.WORLD_SCALE);
		}
		
		private function setFixtureDef():void
		{
			fixtureDef = new b2FixtureDef();
			fixtureDef.shape = polygonShape;
		}
		
		private function setBody():void
		{
			body = World.b2dWorld.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
		}
		
	}
}