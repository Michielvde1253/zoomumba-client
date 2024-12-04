package fr.kapit.events
{
   import flash.events.Event;
   
   public class PluginLoadedEvent extends Event
   {
      public static const MODULE_LOADED:String = "moduleLoaded";
      
      public static const VIEW_LOADED:String = "viewLoaded";
      
      private var _console:String;
      
      private var _pluginName:String;
      
      public function PluginLoadedEvent(param1:String, param2:String, param3:String)
      {
         super(param1);
         this._pluginName = param2;
         this._console = param3;
      }
      
      override public function clone() : Event
      {
         return new PluginLoadedEvent(type,this._pluginName,this._console);
      }
      
      public function get console() : String
      {
         return this._console;
      }
      
      public function get pluginName() : String
      {
         return this._pluginName;
      }
   }
}

