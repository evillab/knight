package resources
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		//menu
		[Embed(source="../../assets/graphics/book/left_side_menu.png")]
		public static const LeftSideMenu:Class;
		
		[Embed(source="../../assets/graphics/book/right_side_menu.png")]
		public static const RightSideMenu:Class;
		
		[Embed(source="../../assets/graphics/book/button.png")]
		public static const MenuButton:Class;
		
		[Embed(source="../../assets/graphics/book/knight.png")]
		public static const Knight:Class;
		
		[Embed(source="../../assets/graphics/book/knight_shadow.png")]
		public static const KnightShadow:Class;
		
		[Embed(source="../../assets/graphics/spriteSheets/img/animationsSpriteSheet.png")]
		public static const TextureGameAtlas : Class;
		
		[Embed(source="../../assets/graphics/spriteSheets/xml/animationsSpriteSheet.xml" , mimeType="application/octet-stream")]
		public static const AtlasXML: Class;
		
		// joystick
		[Embed( source="../../assets/graphics/joystick/default_stick.png" )] 
		private static const Joystick_ds:Class;
		
		[Embed( source="../../assets/graphics/joystick/default_holder.png" )] 
		private static const Joystick_dh:Class;

		private static var gameTexture:Dictionary = new Dictionary();
		private static var gameTextureAtlas : TextureAtlas;
		
		public static function getTexture(name:String):Texture
		{
			if(gameTexture[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
			
			return gameTexture[name];
		}
		
		public static function getAtlas():TextureAtlas
		{
			if(gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("TextureGameAtlas");
				var xml:XML = XML(new AtlasXML());
				gameTextureAtlas = new TextureAtlas(texture , xml);
			}
			
			return gameTextureAtlas; 
		}
	}
}