package fr.kapit.event
{
   import flash.events.Event;
   import fr.kapit.components.KapDebugShortcut;
   
   public class ComponentAddedInDockBarEvent extends Event
   {
      public static const NAME:String = "ComponentAddedInDockBarEvent";
      
      private var _shortcut:KapDebugShortcut;
      
      public function ComponentAddedInDockBarEvent(param1:KapDebugShortcut)
      {
         super(NAME);
         this._shortcut = param1;
      }
      
      public function get shortcut() : KapDebugShortcut
      {
         return this._shortcut;
      }
      
      override public function clone() : Event
      {
         return new ComponentAddedInDockBarEvent(this.shortcut);
      }
   }
}

