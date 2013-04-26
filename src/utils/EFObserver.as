package utils
{
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class EFObserver extends EventDispatcher
	{
		private static var _instance:EFObserver;
		private var observers:Array
		public function EFObserver(pvt:PrivateClass)
		{								
			observers = new Array();			
		}
		
		public function notifyObservers():void
		{
			for (var notify in observers)
			{
				observers[notify].update();				
			}			
		}
		public static function getInstance():EFObserver
		{
			if(EFObserver._instance==null)
			{
				EFObserver._instance = new EFObserver(new PrivateClass());
			}
			return EFObserver._instance;
		}
		public function subscribeObserver(obserNow:IObserver):void
		{			
			observers.push(obserNow);
		}
		public function unsubscribeObserver(obserNow:IObserver):void
		{
			for (var ob:int=0; ob<observers.length; ob++)
			{
				if (observers[ob]==obserNow)
				{
					observers.splice (ob,1);
					break;
				}
			}
		}
	}
}
class PrivateClass
{
	public function PrivateClass()
	{
		
	}
}