package windows.custom.zooWheel
{
   import com.bigpoint.utils.AngleUtils;
   import custom.features.zooWheel.ZooWheelBirdArrow;
   import custom.features.zooWheel.ZooWheelStartButton;
   import custom.features.zooWheel.ZooWheelTriesPanel;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class ZooWheelContent extends Group
   {
      private var _1332194002background:BitmapImage;
      
      private var _393387844birdPointer:ZooWheelBirdArrow;
      
      private var _1965271699blueprint:Group;
      
      private var _1888023824blueprintEdge:BitmapImage;
      
      private var _1097557894playButton:ZooWheelStartButton;
      
      private var _315060550price_0:SpriteVisualElement;
      
      private var _315060549price_1:SpriteVisualElement;
      
      private var _315060548price_2:SpriteVisualElement;
      
      private var _315060547price_3:SpriteVisualElement;
      
      private var _315060546price_4:SpriteVisualElement;
      
      private var _315060545price_5:SpriteVisualElement;
      
      private var _315060544price_6:SpriteVisualElement;
      
      private var _315060543price_7:SpriteVisualElement;
      
      private var _315060542price_8:SpriteVisualElement;
      
      private var _87825941triesPanel:ZooWheelTriesPanel;
      
      private var _820514939wheelPrices:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ZooWheelContent()
      {
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._ZooWheelContent_InnerGroup1_c(),this._ZooWheelContent_OuterGroup1_c()];
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
      
      private function config(param1:FlexEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            this["price_" + _loc2_].x = AngleUtils.getCirclePosition(_loc2_,-Math.PI / 8,125,Math.PI / 4).x;
            this["price_" + _loc2_].y = AngleUtils.getCirclePosition(_loc2_,-Math.PI / 8,125,Math.PI / 4).y;
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         this.birdPointer.dispose();
         this.playButton.dispose();
      }
      
      private function _ZooWheelContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._ZooWheelContent_BitmapImage1_i(),this._ZooWheelContent_Group2_i(),this._ZooWheelContent_ZooWheelTriesPanel1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 20;
         _loc1_.y = 40;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ZooWheelContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 172.5;
         _loc1_.y = 269.5;
         _loc1_.mxmlContent = [this._ZooWheelContent_BitmapImage2_i()];
         _loc1_.id = "blueprint";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.blueprint = _loc1_;
         BindingManager.executeBindings(this,"blueprint",this.blueprint);
         return _loc1_;
      }
      
      private function _ZooWheelContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"blueprintEdge");
         this.blueprintEdge = _loc1_;
         BindingManager.executeBindings(this,"blueprintEdge",this.blueprintEdge);
         return _loc1_;
      }
      
      private function _ZooWheelContent_ZooWheelTriesPanel1_i() : ZooWheelTriesPanel
      {
         var _loc1_:ZooWheelTriesPanel = new ZooWheelTriesPanel();
         _loc1_.x = 28;
         _loc1_.y = 100;
         _loc1_.id = "triesPanel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.triesPanel = _loc1_;
         BindingManager.executeBindings(this,"triesPanel",this.triesPanel);
         return _loc1_;
      }
      
      private function _ZooWheelContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         _loc1_.mxmlContent = [this._ZooWheelContent_Group3_i(),this._ZooWheelContent_ZooWheelBirdArrow1_i(),this._ZooWheelContent_ZooWheelStartButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ZooWheelContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 350;
         _loc1_.y = 280;
         _loc1_.mxmlContent = [this._ZooWheelContent_SpriteVisualElement1_i(),this._ZooWheelContent_SpriteVisualElement2_i(),this._ZooWheelContent_SpriteVisualElement3_i(),this._ZooWheelContent_SpriteVisualElement4_i(),this._ZooWheelContent_SpriteVisualElement5_i(),this._ZooWheelContent_SpriteVisualElement6_i(),this._ZooWheelContent_SpriteVisualElement7_i(),this._ZooWheelContent_SpriteVisualElement8_i(),this._ZooWheelContent_SpriteVisualElement9_i()];
         _loc1_.addEventListener("initialize",this.__wheelPrices_initialize);
         _loc1_.id = "wheelPrices";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.wheelPrices = _loc1_;
         BindingManager.executeBindings(this,"wheelPrices",this.wheelPrices);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_0");
         this.price_0 = _loc1_;
         BindingManager.executeBindings(this,"price_0",this.price_0);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement2_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_1");
         this.price_1 = _loc1_;
         BindingManager.executeBindings(this,"price_1",this.price_1);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement3_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_2");
         this.price_2 = _loc1_;
         BindingManager.executeBindings(this,"price_2",this.price_2);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement4_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_3");
         this.price_3 = _loc1_;
         BindingManager.executeBindings(this,"price_3",this.price_3);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement5_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_4");
         this.price_4 = _loc1_;
         BindingManager.executeBindings(this,"price_4",this.price_4);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement6_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_5");
         this.price_5 = _loc1_;
         BindingManager.executeBindings(this,"price_5",this.price_5);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement7_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_6");
         this.price_6 = _loc1_;
         BindingManager.executeBindings(this,"price_6",this.price_6);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement8_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_7");
         this.price_7 = _loc1_;
         BindingManager.executeBindings(this,"price_7",this.price_7);
         return _loc1_;
      }
      
      private function _ZooWheelContent_SpriteVisualElement9_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.initialized(this,"price_8");
         this.price_8 = _loc1_;
         BindingManager.executeBindings(this,"price_8",this.price_8);
         return _loc1_;
      }
      
      public function __wheelPrices_initialize(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _ZooWheelContent_ZooWheelBirdArrow1_i() : ZooWheelBirdArrow
      {
         var _loc1_:ZooWheelBirdArrow = new ZooWheelBirdArrow();
         _loc1_.x = 350;
         _loc1_.y = 280;
         _loc1_.id = "birdPointer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.birdPointer = _loc1_;
         BindingManager.executeBindings(this,"birdPointer",this.birdPointer);
         return _loc1_;
      }
      
      private function _ZooWheelContent_ZooWheelStartButton1_i() : ZooWheelStartButton
      {
         var _loc1_:ZooWheelStartButton = new ZooWheelStartButton();
         _loc1_.right = 15;
         _loc1_.bottom = 140;
         _loc1_.id = "playButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.playButton = _loc1_;
         BindingManager.executeBindings(this,"playButton",this.playButton);
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
      public function get birdPointer() : ZooWheelBirdArrow
      {
         return this._393387844birdPointer;
      }
      
      public function set birdPointer(param1:ZooWheelBirdArrow) : void
      {
         var _loc2_:Object = this._393387844birdPointer;
         if(_loc2_ !== param1)
         {
            this._393387844birdPointer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"birdPointer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get blueprint() : Group
      {
         return this._1965271699blueprint;
      }
      
      public function set blueprint(param1:Group) : void
      {
         var _loc2_:Object = this._1965271699blueprint;
         if(_loc2_ !== param1)
         {
            this._1965271699blueprint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blueprint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get blueprintEdge() : BitmapImage
      {
         return this._1888023824blueprintEdge;
      }
      
      public function set blueprintEdge(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1888023824blueprintEdge;
         if(_loc2_ !== param1)
         {
            this._1888023824blueprintEdge = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"blueprintEdge",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get playButton() : ZooWheelStartButton
      {
         return this._1097557894playButton;
      }
      
      public function set playButton(param1:ZooWheelStartButton) : void
      {
         var _loc2_:Object = this._1097557894playButton;
         if(_loc2_ !== param1)
         {
            this._1097557894playButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"playButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_0() : SpriteVisualElement
      {
         return this._315060550price_0;
      }
      
      public function set price_0(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060550price_0;
         if(_loc2_ !== param1)
         {
            this._315060550price_0 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_0",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_1() : SpriteVisualElement
      {
         return this._315060549price_1;
      }
      
      public function set price_1(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060549price_1;
         if(_loc2_ !== param1)
         {
            this._315060549price_1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_2() : SpriteVisualElement
      {
         return this._315060548price_2;
      }
      
      public function set price_2(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060548price_2;
         if(_loc2_ !== param1)
         {
            this._315060548price_2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_3() : SpriteVisualElement
      {
         return this._315060547price_3;
      }
      
      public function set price_3(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060547price_3;
         if(_loc2_ !== param1)
         {
            this._315060547price_3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_4() : SpriteVisualElement
      {
         return this._315060546price_4;
      }
      
      public function set price_4(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060546price_4;
         if(_loc2_ !== param1)
         {
            this._315060546price_4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_5() : SpriteVisualElement
      {
         return this._315060545price_5;
      }
      
      public function set price_5(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060545price_5;
         if(_loc2_ !== param1)
         {
            this._315060545price_5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_6() : SpriteVisualElement
      {
         return this._315060544price_6;
      }
      
      public function set price_6(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060544price_6;
         if(_loc2_ !== param1)
         {
            this._315060544price_6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_7() : SpriteVisualElement
      {
         return this._315060543price_7;
      }
      
      public function set price_7(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060543price_7;
         if(_loc2_ !== param1)
         {
            this._315060543price_7 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get price_8() : SpriteVisualElement
      {
         return this._315060542price_8;
      }
      
      public function set price_8(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._315060542price_8;
         if(_loc2_ !== param1)
         {
            this._315060542price_8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"price_8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get triesPanel() : ZooWheelTriesPanel
      {
         return this._87825941triesPanel;
      }
      
      public function set triesPanel(param1:ZooWheelTriesPanel) : void
      {
         var _loc2_:Object = this._87825941triesPanel;
         if(_loc2_ !== param1)
         {
            this._87825941triesPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"triesPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get wheelPrices() : Group
      {
         return this._820514939wheelPrices;
      }
      
      public function set wheelPrices(param1:Group) : void
      {
         var _loc2_:Object = this._820514939wheelPrices;
         if(_loc2_ !== param1)
         {
            this._820514939wheelPrices = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"wheelPrices",_loc2_,param1));
            }
         }
      }
   }
}

