package custom.mainInterface.collectables
{
   import components.counter.Counter;
   import components.counter.CounterCircleSkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   public class CollectablesPanel extends Group
   {
      private var _1332194002background:BitmapImage;
      
      private var _1810742139bookButton:HGroup;
      
      private var _1814160427hitGraphic:Rect;
      
      private var _256411112itemCounter1:Counter;
      
      private var _256411113itemCounter2:Counter;
      
      private var _256411114itemCounter3:Counter;
      
      private var _256411115itemCounter4:Counter;
      
      private var _256411116itemCounter5:Counter;
      
      private var _557840754itemHolder1:SpriteVisualElement;
      
      private var _557840755itemHolder2:SpriteVisualElement;
      
      private var _557840756itemHolder3:SpriteVisualElement;
      
      private var _557840757itemHolder4:SpriteVisualElement;
      
      private var _557840758itemHolder5:SpriteVisualElement;
      
      private var _2138021727setItemHolder:SpriteVisualElement;
      
      private var _1619339235unknownIcon:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__removeFromHere_CollectablesPanelAssets_swf_CollectionSetBook_1977655832:Class = CollectablesPanel__embed_mxml__removeFromHere_CollectablesPanelAssets_swf_CollectionSetBook_1977655832;
      
      private var _embed_mxml__removeFromHere_CollectablesPanelAssets_swf_CollectablePanelBG_176607136:Class = CollectablesPanel__embed_mxml__removeFromHere_CollectablesPanelAssets_swf_CollectablePanelBG_176607136;
      
      private var _embed_mxml__removeFromHere_CollectablesPanelAssets_swf_UnknownItemBD_1887181802:Class = CollectablesPanel__embed_mxml__removeFromHere_CollectablesPanelAssets_swf_UnknownItemBD_1887181802;
      
      public function CollectablesPanel()
      {
         super();
         this.right = 0;
         this.verticalCenter = 0;
         this.mxmlContent = [this._CollectablesPanel_BitmapImage1_i(),this._CollectablesPanel_SpriteVisualElement1_i(),this._CollectablesPanel_SpriteVisualElement2_i(),this._CollectablesPanel_SpriteVisualElement3_i(),this._CollectablesPanel_SpriteVisualElement4_i(),this._CollectablesPanel_SpriteVisualElement5_i(),this._CollectablesPanel_SpriteVisualElement6_i(),this._CollectablesPanel_Counter1_i(),this._CollectablesPanel_Counter2_i(),this._CollectablesPanel_Counter3_i(),this._CollectablesPanel_Counter4_i(),this._CollectablesPanel_Counter5_i(),this._CollectablesPanel_BitmapImage2_i(),this._CollectablesPanel_BitmapImage3_c(),this._CollectablesPanel_HGroup1_i()];
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
      
      private function _CollectablesPanel_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__removeFromHere_CollectablesPanelAssets_swf_CollectablePanelBG_176607136;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 36;
         _loc1_.y = 26;
         _loc1_.initialized(this,"setItemHolder");
         this.setItemHolder = _loc1_;
         BindingManager.executeBindings(this,"setItemHolder",this.setItemHolder);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 36;
         _loc1_.y = 85;
         _loc1_.initialized(this,"itemHolder1");
         this.itemHolder1 = _loc1_;
         BindingManager.executeBindings(this,"itemHolder1",this.itemHolder1);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 36;
         _loc1_.y = 143;
         _loc1_.initialized(this,"itemHolder2");
         this.itemHolder2 = _loc1_;
         BindingManager.executeBindings(this,"itemHolder2",this.itemHolder2);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SpriteVisualElement4_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 36;
         _loc1_.y = 201;
         _loc1_.initialized(this,"itemHolder3");
         this.itemHolder3 = _loc1_;
         BindingManager.executeBindings(this,"itemHolder3",this.itemHolder3);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SpriteVisualElement5_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 36;
         _loc1_.y = 259;
         _loc1_.initialized(this,"itemHolder4");
         this.itemHolder4 = _loc1_;
         BindingManager.executeBindings(this,"itemHolder4",this.itemHolder4);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SpriteVisualElement6_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.x = 36;
         _loc1_.y = 316;
         _loc1_.initialized(this,"itemHolder5");
         this.itemHolder5 = _loc1_;
         BindingManager.executeBindings(this,"itemHolder5",this.itemHolder5);
         return _loc1_;
      }
      
      private function _CollectablesPanel_Counter1_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 55;
         _loc1_.y = 92;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "itemCounter1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemCounter1 = _loc1_;
         BindingManager.executeBindings(this,"itemCounter1",this.itemCounter1);
         return _loc1_;
      }
      
      private function _CollectablesPanel_Counter2_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 55;
         _loc1_.y = 151;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "itemCounter2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemCounter2 = _loc1_;
         BindingManager.executeBindings(this,"itemCounter2",this.itemCounter2);
         return _loc1_;
      }
      
      private function _CollectablesPanel_Counter3_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 55;
         _loc1_.y = 209;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "itemCounter3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemCounter3 = _loc1_;
         BindingManager.executeBindings(this,"itemCounter3",this.itemCounter3);
         return _loc1_;
      }
      
      private function _CollectablesPanel_Counter4_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 55;
         _loc1_.y = 267;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "itemCounter4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemCounter4 = _loc1_;
         BindingManager.executeBindings(this,"itemCounter4",this.itemCounter4);
         return _loc1_;
      }
      
      private function _CollectablesPanel_Counter5_i() : Counter
      {
         var _loc1_:Counter = new Counter();
         _loc1_.x = 55;
         _loc1_.y = 325;
         _loc1_.setStyle("skinClass",CounterCircleSkin);
         _loc1_.id = "itemCounter5";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.itemCounter5 = _loc1_;
         BindingManager.executeBindings(this,"itemCounter5",this.itemCounter5);
         return _loc1_;
      }
      
      private function _CollectablesPanel_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__removeFromHere_CollectablesPanelAssets_swf_UnknownItemBD_1887181802;
         _loc1_.x = 23;
         _loc1_.y = 298;
         _loc1_.initialized(this,"unknownIcon");
         this.unknownIcon = _loc1_;
         BindingManager.executeBindings(this,"unknownIcon",this.unknownIcon);
         return _loc1_;
      }
      
      private function _CollectablesPanel_BitmapImage3_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__removeFromHere_CollectablesPanelAssets_swf_CollectionSetBook_1977655832;
         _loc1_.x = 15;
         _loc1_.y = 348;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CollectablesPanel_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 5;
         _loc1_.y = 348;
         _loc1_.mxmlContent = [this._CollectablesPanel_Rect1_i()];
         _loc1_.id = "bookButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bookButton = _loc1_;
         BindingManager.executeBindings(this,"bookButton",this.bookButton);
         return _loc1_;
      }
      
      private function _CollectablesPanel_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.radiusX = 30;
         _loc1_.radiusY = 30;
         _loc1_.fill = this._CollectablesPanel_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CollectablesPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
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
      public function get bookButton() : HGroup
      {
         return this._1810742139bookButton;
      }
      
      public function set bookButton(param1:HGroup) : void
      {
         var _loc2_:Object = this._1810742139bookButton;
         if(_loc2_ !== param1)
         {
            this._1810742139bookButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bookButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitGraphic() : Rect
      {
         return this._1814160427hitGraphic;
      }
      
      public function set hitGraphic(param1:Rect) : void
      {
         var _loc2_:Object = this._1814160427hitGraphic;
         if(_loc2_ !== param1)
         {
            this._1814160427hitGraphic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitGraphic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemCounter1() : Counter
      {
         return this._256411112itemCounter1;
      }
      
      public function set itemCounter1(param1:Counter) : void
      {
         var _loc2_:Object = this._256411112itemCounter1;
         if(_loc2_ !== param1)
         {
            this._256411112itemCounter1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemCounter1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemCounter2() : Counter
      {
         return this._256411113itemCounter2;
      }
      
      public function set itemCounter2(param1:Counter) : void
      {
         var _loc2_:Object = this._256411113itemCounter2;
         if(_loc2_ !== param1)
         {
            this._256411113itemCounter2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemCounter2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemCounter3() : Counter
      {
         return this._256411114itemCounter3;
      }
      
      public function set itemCounter3(param1:Counter) : void
      {
         var _loc2_:Object = this._256411114itemCounter3;
         if(_loc2_ !== param1)
         {
            this._256411114itemCounter3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemCounter3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemCounter4() : Counter
      {
         return this._256411115itemCounter4;
      }
      
      public function set itemCounter4(param1:Counter) : void
      {
         var _loc2_:Object = this._256411115itemCounter4;
         if(_loc2_ !== param1)
         {
            this._256411115itemCounter4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemCounter4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemCounter5() : Counter
      {
         return this._256411116itemCounter5;
      }
      
      public function set itemCounter5(param1:Counter) : void
      {
         var _loc2_:Object = this._256411116itemCounter5;
         if(_loc2_ !== param1)
         {
            this._256411116itemCounter5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemCounter5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemHolder1() : SpriteVisualElement
      {
         return this._557840754itemHolder1;
      }
      
      public function set itemHolder1(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._557840754itemHolder1;
         if(_loc2_ !== param1)
         {
            this._557840754itemHolder1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemHolder1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemHolder2() : SpriteVisualElement
      {
         return this._557840755itemHolder2;
      }
      
      public function set itemHolder2(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._557840755itemHolder2;
         if(_loc2_ !== param1)
         {
            this._557840755itemHolder2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemHolder2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemHolder3() : SpriteVisualElement
      {
         return this._557840756itemHolder3;
      }
      
      public function set itemHolder3(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._557840756itemHolder3;
         if(_loc2_ !== param1)
         {
            this._557840756itemHolder3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemHolder3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemHolder4() : SpriteVisualElement
      {
         return this._557840757itemHolder4;
      }
      
      public function set itemHolder4(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._557840757itemHolder4;
         if(_loc2_ !== param1)
         {
            this._557840757itemHolder4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemHolder4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get itemHolder5() : SpriteVisualElement
      {
         return this._557840758itemHolder5;
      }
      
      public function set itemHolder5(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._557840758itemHolder5;
         if(_loc2_ !== param1)
         {
            this._557840758itemHolder5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"itemHolder5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get setItemHolder() : SpriteVisualElement
      {
         return this._2138021727setItemHolder;
      }
      
      public function set setItemHolder(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._2138021727setItemHolder;
         if(_loc2_ !== param1)
         {
            this._2138021727setItemHolder = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"setItemHolder",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get unknownIcon() : BitmapImage
      {
         return this._1619339235unknownIcon;
      }
      
      public function set unknownIcon(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1619339235unknownIcon;
         if(_loc2_ !== param1)
         {
            this._1619339235unknownIcon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"unknownIcon",_loc2_,param1));
            }
         }
      }
   }
}

