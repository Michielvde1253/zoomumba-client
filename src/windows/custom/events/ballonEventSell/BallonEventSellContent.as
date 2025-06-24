package windows.custom.events.ballonEventSell
{
   import buttons.extended.ButtonBuy;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class BallonEventSellContent extends Group
   {
      private var _764570151buyButton1:ButtonBuy;
      
      private var _764570150buyButton2:ButtonBuy;
      
      private var _764570149buyButton3:ButtonBuy;
      
      private var _2030561337fron1Group:Group;
      
      private var _1266096344front1:UIComponent;
      
      private var _7423010mainview:Group;
      
      private var _1065581767sellContent:UIComponent;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function BallonEventSellContent()
      {
         super();
         this.mxmlContent = [this._BallonEventSellContent_InnerGroup1_c(),this._BallonEventSellContent_OuterGroup1_c()];
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
      
      private function _BallonEventSellContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BallonEventSellContent_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._BallonEventSellContent_UIComponent1_i(),this._BallonEventSellContent_ButtonBuy1_i(),this._BallonEventSellContent_ButtonBuy2_i(),this._BallonEventSellContent_ButtonBuy3_i()];
         _loc1_.id = "mainview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mainview = _loc1_;
         BindingManager.executeBindings(this,"mainview",this.mainview);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "sellContent";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sellContent = _loc1_;
         BindingManager.executeBindings(this,"sellContent",this.sellContent);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_ButtonBuy1_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.width = 100;
         _loc1_.x = 115;
         _loc1_.y = 230;
         _loc1_.id = "buyButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton1 = _loc1_;
         BindingManager.executeBindings(this,"buyButton1",this.buyButton1);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_ButtonBuy2_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.width = 100;
         _loc1_.x = 236;
         _loc1_.y = 230;
         _loc1_.id = "buyButton2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton2 = _loc1_;
         BindingManager.executeBindings(this,"buyButton2",this.buyButton2);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_ButtonBuy3_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.width = 100;
         _loc1_.x = 352;
         _loc1_.y = 230;
         _loc1_.id = "buyButton3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton3 = _loc1_;
         BindingManager.executeBindings(this,"buyButton3",this.buyButton3);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._BallonEventSellContent_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.mxmlContent = [this._BallonEventSellContent_UIComponent2_i()];
         _loc1_.id = "fron1Group";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fron1Group = _loc1_;
         BindingManager.executeBindings(this,"fron1Group",this.fron1Group);
         return _loc1_;
      }
      
      private function _BallonEventSellContent_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "front1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.front1 = _loc1_;
         BindingManager.executeBindings(this,"front1",this.front1);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton1() : ButtonBuy
      {
         return this._764570151buyButton1;
      }
      
      public function set buyButton1(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._764570151buyButton1;
         if(_loc2_ !== param1)
         {
            this._764570151buyButton1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton2() : ButtonBuy
      {
         return this._764570150buyButton2;
      }
      
      public function set buyButton2(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._764570150buyButton2;
         if(_loc2_ !== param1)
         {
            this._764570150buyButton2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton3() : ButtonBuy
      {
         return this._764570149buyButton3;
      }
      
      public function set buyButton3(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._764570149buyButton3;
         if(_loc2_ !== param1)
         {
            this._764570149buyButton3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fron1Group() : Group
      {
         return this._2030561337fron1Group;
      }
      
      public function set fron1Group(param1:Group) : void
      {
         var _loc2_:Object = this._2030561337fron1Group;
         if(_loc2_ !== param1)
         {
            this._2030561337fron1Group = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fron1Group",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get front1() : UIComponent
      {
         return this._1266096344front1;
      }
      
      public function set front1(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1266096344front1;
         if(_loc2_ !== param1)
         {
            this._1266096344front1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"front1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainview() : Group
      {
         return this._7423010mainview;
      }
      
      public function set mainview(param1:Group) : void
      {
         var _loc2_:Object = this._7423010mainview;
         if(_loc2_ !== param1)
         {
            this._7423010mainview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sellContent() : UIComponent
      {
         return this._1065581767sellContent;
      }
      
      public function set sellContent(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1065581767sellContent;
         if(_loc2_ !== param1)
         {
            this._1065581767sellContent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sellContent",_loc2_,param1));
            }
         }
      }
   }
}

