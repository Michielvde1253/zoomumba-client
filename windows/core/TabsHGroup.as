package windows.core
{
   import mx.core.IFlexModuleFactory;
   import spark.components.HGroup;
   import windows.core.tabs.ITabsGroup;
   import windows.core.tabs.events.TabsGroupEvent;
   
   public class TabsHGroup extends HGroup implements ITabsGroup
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _selectedIndex:int;
      
      private var _event:TabsGroupEvent = new TabsGroupEvent(TabsGroupEvent.INDEX_CHANGED);
      
      public function TabsHGroup()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(this._selectedIndex != param1)
         {
            this._event.index = this._selectedIndex = param1;
            dispatchEvent(this._event);
         }
      }
      
      public function get selectedIndex() : int
      {
         return this._selectedIndex;
      }
   }
}

