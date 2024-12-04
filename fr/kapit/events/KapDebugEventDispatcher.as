package fr.kapit.events
{
   import flash.events.EventDispatcher;
   
   public class KapDebugEventDispatcher extends EventDispatcher
   {
      private static var _instance:KapDebugEventDispatcher;
      
      public function KapDebugEventDispatcher(param1:KapDebugEventDispatcherEnforcer)
      {
         super();
         if(!(param1 is KapDebugEventDispatcherEnforcer))
         {
            throw new Error("Use KapDebugEventDispatcher get instance implicit method.");
         }
      }
      
      public static function get instance() : KapDebugEventDispatcher
      {
         if(!_instance)
         {
            _instance = new KapDebugEventDispatcher(new KapDebugEventDispatcherEnforcer());
         }
         return _instance;
      }
   }
}

class KapDebugEventDispatcherEnforcer
{
   public function KapDebugEventDispatcherEnforcer()
   {
      super();
   }
}
