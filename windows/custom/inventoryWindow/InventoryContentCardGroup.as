package windows.custom.inventoryWindow
{
   import components.textfield.textInput.StandardTextInput;
   import components.textfield.textInput.StandardTextInputWoodSkin;
   import custom.card.component.CardGroupHolder;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.InnerGroup;
   
   public class InventoryContentCardGroup extends Group
   {
      private var _171849691cardGroupHolder:CardGroupHolder;
      
      private var _1562602472txtsearch:StandardTextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function InventoryContentCardGroup()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._InventoryContentCardGroup_InnerGroup1_c()];
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
      
      private function _InventoryContentCardGroup_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._InventoryContentCardGroup_StandardTextInput1_i(),this._InventoryContentCardGroup_CardGroupHolder1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InventoryContentCardGroup_StandardTextInput1_i() : StandardTextInput
      {
         var _loc1_:StandardTextInput = new StandardTextInput();
         _loc1_.width = 125;
         _loc1_.x = 505;
         _loc1_.y = 65;
         _loc1_.promptColor = 9590288;
         _loc1_.setStyle("skinClass",StandardTextInputWoodSkin);
         _loc1_.id = "txtsearch";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.txtsearch = _loc1_;
         BindingManager.executeBindings(this,"txtsearch",this.txtsearch);
         return _loc1_;
      }
      
      private function _InventoryContentCardGroup_CardGroupHolder1_i() : CardGroupHolder
      {
         var _loc1_:CardGroupHolder = new CardGroupHolder();
         _loc1_.width = 526;
         _loc1_.horizontalCenter = 6;
         _loc1_.height = 332;
         _loc1_.top = 133;
         _loc1_.id = "cardGroupHolder";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardGroupHolder = _loc1_;
         BindingManager.executeBindings(this,"cardGroupHolder",this.cardGroupHolder);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get cardGroupHolder() : CardGroupHolder
      {
         return this._171849691cardGroupHolder;
      }
      
      public function set cardGroupHolder(param1:CardGroupHolder) : void
      {
         var _loc2_:Object = this._171849691cardGroupHolder;
         if(_loc2_ !== param1)
         {
            this._171849691cardGroupHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardGroupHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get txtsearch() : StandardTextInput
      {
         return this._1562602472txtsearch;
      }
      
      public function set txtsearch(param1:StandardTextInput) : void
      {
         var _loc2_:Object = this._1562602472txtsearch;
         if(_loc2_ !== param1)
         {
            this._1562602472txtsearch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"txtsearch",_loc2_,param1));
            }
         }
      }
   }
}

