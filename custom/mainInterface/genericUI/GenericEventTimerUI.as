package custom.mainInterface.genericUI
{
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.List;
   import spark.layouts.VerticalLayout;
   
   public class GenericEventTimerUI extends Group
   {
      private var _1001640279eventsList:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function GenericEventTimerUI()
      {
         super();
         this.mouseEnabled = false;
         this.mxmlContent = [this._GenericEventTimerUI_List1_i()];
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
      
      private function _GenericEventTimerUI_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this._GenericEventTimerUI_ClassFactory1_c();
         _loc1_.layout = this._GenericEventTimerUI_VerticalLayout1_c();
         _loc1_.setStyle("borderAlpha",0);
         _loc1_.setStyle("contentBackgroundAlpha",0);
         _loc1_.id = "eventsList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.eventsList = _loc1_;
         BindingManager.executeBindings(this,"eventsList",this.eventsList);
         return _loc1_;
      }
      
      private function _GenericEventTimerUI_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = EventTimerItemRenderer;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericEventTimerUI_VerticalLayout1_c() : VerticalLayout
      {
         var _loc1_:VerticalLayout = new VerticalLayout();
         _loc1_.useVirtualLayout = false;
         _loc1_.requestedMinRowCount = 1;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get eventsList() : List
      {
         return this._1001640279eventsList;
      }
      
      public function set eventsList(param1:List) : void
      {
         var _loc2_:Object = this._1001640279eventsList;
         if(_loc2_ !== param1)
         {
            this._1001640279eventsList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eventsList",_loc2_,param1));
            }
         }
      }
   }
}

