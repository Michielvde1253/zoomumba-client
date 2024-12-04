package windows.custom.news
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class NewsTabContent extends Group
   {
      private var _100355670inner:InnerGroup;
      
      private var _106111099outer:OuterGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function NewsTabContent()
      {
         super();
         this.mxmlContent = [this._NewsTabContent_InnerGroup1_i(),this._NewsTabContent_OuterGroup1_i()];
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
      
      private function _NewsTabContent_InnerGroup1_i() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.y = 140;
         _loc1_.x = 50;
         _loc1_.maxWidth = 340;
         _loc1_.maxHeight = 335;
         _loc1_.id = "inner";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.inner = _loc1_;
         BindingManager.executeBindings(this,"inner",this.inner);
         return _loc1_;
      }
      
      private function _NewsTabContent_OuterGroup1_i() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.y = 140;
         _loc1_.x = 50;
         _loc1_.maxWidth = 340;
         _loc1_.maxHeight = 335;
         _loc1_.id = "outer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.outer = _loc1_;
         BindingManager.executeBindings(this,"outer",this.outer);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get inner() : InnerGroup
      {
         return this._100355670inner;
      }
      
      public function set inner(param1:InnerGroup) : void
      {
         var _loc2_:Object = this._100355670inner;
         if(_loc2_ !== param1)
         {
            this._100355670inner = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"inner",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get outer() : OuterGroup
      {
         return this._106111099outer;
      }
      
      public function set outer(param1:OuterGroup) : void
      {
         var _loc2_:Object = this._106111099outer;
         if(_loc2_ !== param1)
         {
            this._106111099outer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outer",_loc2_,param1));
            }
         }
      }
   }
}

