package fr.kapit.menu
{
   import flash.events.ContextMenuEvent;
   import flash.ui.ContextMenuItem;
   import fr.kapit.components.KapDebugComponentFactory;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.events.OpenInspectorCommandEvent;
   
   public class ContextMenuHandler
   {
      public var factory:KapDebugComponentFactory;
      
      public var target:Object;
      
      public function ContextMenuHandler(param1:ContextMenuItem, param2:Object, param3:KapDebugComponentFactory)
      {
         super();
         this.target = param2;
         this.factory = param3;
         param1.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this._handleAction);
      }
      
      private function _handleAction(param1:ContextMenuEvent) : void
      {
         KapDebugEventDispatcher.instance.dispatchEvent(new OpenInspectorCommandEvent(this.factory.name,this.target));
      }
   }
}

