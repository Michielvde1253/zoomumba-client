package windows.custom.events.circus
{
   import buttons.extended.ButtonBuy;
   import buttons.extended.ButtonZoomable;
   import buttons.extended.events.ButtonGUIGenericEvent;
   import components.textfield.StandardText;
   import components.textfield.gradientText.GradientText;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.layouts.TileLayout;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class CircusContent extends Group
   {
      private var _3055a0:ButtonZoomable;
      
      private var _3056a1:ButtonZoomable;
      
      private var _3057a2:ButtonZoomable;
      
      private var _3058a3:ButtonZoomable;
      
      private var _3059a4:ButtonZoomable;
      
      private var _3060a5:ButtonZoomable;
      
      private var _3061a6:ButtonZoomable;
      
      private var _3062a7:ButtonZoomable;
      
      private var _3063a8:ButtonZoomable;
      
      private var _3064a9:ButtonZoomable;
      
      private var _1332194002background:BitmapImage;
      
      private var _163334105bubbleText:StandardText;
      
      private var _1271589544buyButton:ButtonBuy;
      
      private var _2144702175gradientRewardsText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function CircusContent()
      {
         super();
         this.mxmlContent = [this._CircusContent_InnerGroup1_c(),this._CircusContent_OuterGroup1_c()];
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
      
      private function _CircusContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._CircusContent_BitmapImage1_i(),this._CircusContent_StandardText1_i(),this._CircusContent_GradientText1_i(),this._CircusContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircusContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.left = 20;
         _loc1_.top = 30;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _CircusContent_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 330;
         _loc1_.top = 95;
         _loc1_.left = 190;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "bubbleText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bubbleText = _loc1_;
         BindingManager.executeBindings(this,"bubbleText",this.bubbleText);
         return _loc1_;
      }
      
      private function _CircusContent_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.textAlign = "center";
         _loc1_.width = 100;
         _loc1_.right = 42;
         _loc1_.top = 142;
         _loc1_.id = "gradientRewardsText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gradientRewardsText = _loc1_;
         BindingManager.executeBindings(this,"gradientRewardsText",this.gradientRewardsText);
         return _loc1_;
      }
      
      private function _CircusContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 37;
         _loc1_.bottom = 100;
         _loc1_.layout = this._CircusContent_TileLayout1_c();
         _loc1_.mxmlContent = [this._CircusContent_ButtonZoomable1_i(),this._CircusContent_ButtonZoomable2_i(),this._CircusContent_ButtonZoomable3_i(),this._CircusContent_ButtonZoomable4_i(),this._CircusContent_ButtonZoomable5_i(),this._CircusContent_ButtonZoomable6_i(),this._CircusContent_ButtonZoomable7_i(),this._CircusContent_ButtonZoomable8_i(),this._CircusContent_ButtonZoomable9_i(),this._CircusContent_ButtonZoomable10_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircusContent_TileLayout1_c() : TileLayout
      {
         var _loc1_:TileLayout = new TileLayout();
         _loc1_.requestedColumnCount = 2;
         _loc1_.horizontalGap = -12;
         _loc1_.verticalGap = -10;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircusContent_ButtonZoomable1_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a0_click);
         _loc1_.id = "a0";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a0 = _loc1_;
         BindingManager.executeBindings(this,"a0",this.a0);
         return _loc1_;
      }
      
      public function __a0_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":0},true));
      }
      
      private function _CircusContent_ButtonZoomable2_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a1_click);
         _loc1_.id = "a1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a1 = _loc1_;
         BindingManager.executeBindings(this,"a1",this.a1);
         return _loc1_;
      }
      
      public function __a1_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":1},true));
      }
      
      private function _CircusContent_ButtonZoomable3_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a2_click);
         _loc1_.id = "a2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a2 = _loc1_;
         BindingManager.executeBindings(this,"a2",this.a2);
         return _loc1_;
      }
      
      public function __a2_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":2},true));
      }
      
      private function _CircusContent_ButtonZoomable4_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a3_click);
         _loc1_.id = "a3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a3 = _loc1_;
         BindingManager.executeBindings(this,"a3",this.a3);
         return _loc1_;
      }
      
      public function __a3_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":3},true));
      }
      
      private function _CircusContent_ButtonZoomable5_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a4_click);
         _loc1_.id = "a4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a4 = _loc1_;
         BindingManager.executeBindings(this,"a4",this.a4);
         return _loc1_;
      }
      
      public function __a4_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":4},true));
      }
      
      private function _CircusContent_ButtonZoomable6_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a5_click);
         _loc1_.id = "a5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a5 = _loc1_;
         BindingManager.executeBindings(this,"a5",this.a5);
         return _loc1_;
      }
      
      public function __a5_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":5},true));
      }
      
      private function _CircusContent_ButtonZoomable7_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a6_click);
         _loc1_.id = "a6";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a6 = _loc1_;
         BindingManager.executeBindings(this,"a6",this.a6);
         return _loc1_;
      }
      
      public function __a6_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":6},true));
      }
      
      private function _CircusContent_ButtonZoomable8_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a7_click);
         _loc1_.id = "a7";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a7 = _loc1_;
         BindingManager.executeBindings(this,"a7",this.a7);
         return _loc1_;
      }
      
      public function __a7_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":7},true));
      }
      
      private function _CircusContent_ButtonZoomable9_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a8_click);
         _loc1_.id = "a8";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a8 = _loc1_;
         BindingManager.executeBindings(this,"a8",this.a8);
         return _loc1_;
      }
      
      public function __a8_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":8},true));
      }
      
      private function _CircusContent_ButtonZoomable10_i() : ButtonZoomable
      {
         var _loc1_:ButtonZoomable = new ButtonZoomable();
         _loc1_.bgScale = 0.42;
         _loc1_.addEventListener("click",this.__a9_click);
         _loc1_.id = "a9";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.a9 = _loc1_;
         BindingManager.executeBindings(this,"a9",this.a9);
         return _loc1_;
      }
      
      public function __a9_click(param1:MouseEvent) : void
      {
         dispatchEvent(new ButtonGUIGenericEvent(ButtonGUIGenericEvent.CLICK,{"id":9},true));
      }
      
      private function _CircusContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._CircusContent_ButtonBuy1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CircusContent_ButtonBuy1_i() : ButtonBuy
      {
         var _loc1_:ButtonBuy = new ButtonBuy();
         _loc1_.bottom = 30;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "buyButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyButton = _loc1_;
         BindingManager.executeBindings(this,"buyButton",this.buyButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get a0() : ButtonZoomable
      {
         return this._3055a0;
      }
      
      public function set a0(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3055a0;
         if(_loc2_ !== param1)
         {
            this._3055a0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a1() : ButtonZoomable
      {
         return this._3056a1;
      }
      
      public function set a1(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3056a1;
         if(_loc2_ !== param1)
         {
            this._3056a1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a2() : ButtonZoomable
      {
         return this._3057a2;
      }
      
      public function set a2(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3057a2;
         if(_loc2_ !== param1)
         {
            this._3057a2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a3() : ButtonZoomable
      {
         return this._3058a3;
      }
      
      public function set a3(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3058a3;
         if(_loc2_ !== param1)
         {
            this._3058a3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a4() : ButtonZoomable
      {
         return this._3059a4;
      }
      
      public function set a4(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3059a4;
         if(_loc2_ !== param1)
         {
            this._3059a4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a5() : ButtonZoomable
      {
         return this._3060a5;
      }
      
      public function set a5(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3060a5;
         if(_loc2_ !== param1)
         {
            this._3060a5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a6() : ButtonZoomable
      {
         return this._3061a6;
      }
      
      public function set a6(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3061a6;
         if(_loc2_ !== param1)
         {
            this._3061a6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a7() : ButtonZoomable
      {
         return this._3062a7;
      }
      
      public function set a7(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3062a7;
         if(_loc2_ !== param1)
         {
            this._3062a7 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a8() : ButtonZoomable
      {
         return this._3063a8;
      }
      
      public function set a8(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3063a8;
         if(_loc2_ !== param1)
         {
            this._3063a8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get a9() : ButtonZoomable
      {
         return this._3064a9;
      }
      
      public function set a9(param1:ButtonZoomable) : void
      {
         var _loc2_:Object = this._3064a9;
         if(_loc2_ !== param1)
         {
            this._3064a9 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"a9",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : BitmapImage
      {
         return this._1332194002background;
      }
      
      public function set background(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bubbleText() : StandardText
      {
         return this._163334105bubbleText;
      }
      
      public function set bubbleText(param1:StandardText) : void
      {
         var _loc2_:Object = this._163334105bubbleText;
         if(_loc2_ !== param1)
         {
            this._163334105bubbleText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bubbleText",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyButton() : ButtonBuy
      {
         return this._1271589544buyButton;
      }
      
      public function set buyButton(param1:ButtonBuy) : void
      {
         var _loc2_:Object = this._1271589544buyButton;
         if(_loc2_ !== param1)
         {
            this._1271589544buyButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gradientRewardsText() : GradientText
      {
         return this._2144702175gradientRewardsText;
      }
      
      public function set gradientRewardsText(param1:GradientText) : void
      {
         var _loc2_:Object = this._2144702175gradientRewardsText;
         if(_loc2_ !== param1)
         {
            this._2144702175gradientRewardsText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gradientRewardsText",_loc2_,param1));
            }
         }
      }
   }
}

