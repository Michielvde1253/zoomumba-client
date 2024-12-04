package custom.features.collectable.book.content
{
   import custom.features.collectable.book.component.CollBookPageItem;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.VGroup;
   
   public class CollBookContPageSec extends Group
   {
      private var _100525953item4:CollBookPageItem;
      
      private var _100525954item5:CollBookPageItem;
      
      private var _100525955item6:CollBookPageItem;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CollBookContPageSec()
      {
         super();
         this.width = 240;
         this.height = 280;
         this.mxmlContent = [this._CollBookContPageSec_VGroup1_c()];
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
      
      private function _CollBookContPageSec_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.top = 10;
         _loc1_.mxmlContent = [this._CollBookContPageSec_CollBookPageItem1_i(),this._CollBookContPageSec_CollBookPageItem2_i(),this._CollBookContPageSec_CollBookPageItem3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollBookContPageSec_CollBookPageItem1_i() : CollBookPageItem
      {
         var _loc1_:CollBookPageItem = null;
         _loc1_ = new CollBookPageItem();
         _loc1_.type = "type3";
         _loc1_.currentState = "right";
         _loc1_.pageRefId = 4;
         _loc1_.id = "item4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item4 = _loc1_;
         BindingManager.executeBindings(this,"item4",this.item4);
         return _loc1_;
      }
      
      private function _CollBookContPageSec_CollBookPageItem2_i() : CollBookPageItem
      {
         var _loc1_:CollBookPageItem = null;
         _loc1_ = new CollBookPageItem();
         _loc1_.type = "type4";
         _loc1_.currentState = "right";
         _loc1_.pageRefId = 5;
         _loc1_.id = "item5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item5 = _loc1_;
         BindingManager.executeBindings(this,"item5",this.item5);
         return _loc1_;
      }
      
      private function _CollBookContPageSec_CollBookPageItem3_i() : CollBookPageItem
      {
         var _loc1_:CollBookPageItem = new CollBookPageItem();
         _loc1_.type = "type5";
         _loc1_.currentState = "right";
         _loc1_.pageRefId = 6;
         _loc1_.showBottomRow = false;
         _loc1_.id = "item6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.item6 = _loc1_;
         BindingManager.executeBindings(this,"item6",this.item6);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get item4() : CollBookPageItem
      {
         return this._100525953item4;
      }
      
      public function set item4(param1:CollBookPageItem) : void
      {
         var _loc2_:Object = this._100525953item4;
         if(_loc2_ !== param1)
         {
            this._100525953item4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item5() : CollBookPageItem
      {
         return this._100525954item5;
      }
      
      public function set item5(param1:CollBookPageItem) : void
      {
         var _loc2_:Object = this._100525954item5;
         if(_loc2_ !== param1)
         {
            this._100525954item5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get item6() : CollBookPageItem
      {
         return this._100525955item6;
      }
      
      public function set item6(param1:CollBookPageItem) : void
      {
         var _loc2_:Object = this._100525955item6;
         if(_loc2_ !== param1)
         {
            this._100525955item6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"item6",_loc2_,param1));
            }
         }
      }
   }
}

