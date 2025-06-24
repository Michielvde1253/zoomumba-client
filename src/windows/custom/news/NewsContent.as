package windows.custom.news
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.TabsHGroup;
   
   public class NewsContent extends Group
   {
      private var _929186838tabGroup:TabsHGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function NewsContent()
      {
         super();
         this.mxmlContent = [this._NewsContent_TabsHGroup1_i()];
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
      
      private function _NewsContent_TabsHGroup1_i() : TabsHGroup
      {
         var _loc1_:TabsHGroup = new TabsHGroup();
         _loc1_.gap = 4;
         _loc1_.left = -15;
         _loc1_.selectedIndex = 0;
         _loc1_.id = "tabGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabGroup = _loc1_;
         BindingManager.executeBindings(this,"tabGroup",this.tabGroup);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get tabGroup() : TabsHGroup
      {
         return this._929186838tabGroup;
      }
      
      public function set tabGroup(param1:TabsHGroup) : void
      {
         var _loc2_:Object = this._929186838tabGroup;
         if(_loc2_ !== param1)
         {
            this._929186838tabGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabGroup",_loc2_,param1));
            }
         }
      }
   }
}

