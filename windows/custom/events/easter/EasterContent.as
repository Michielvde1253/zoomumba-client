package windows.custom.events.easter
{
   import buttons.simpleButton.InfoButtonBigSkin;
   import custom.generic.GenericCircularBuyItem;
   import custom.generic.GenericCircularCounter;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   
   public class EasterContent extends Group
   {
      private var _1290098708buyBasket:GenericCircularBuyItem;
      
      private var _94842565coll1:GenericCircularCounter;
      
      private var _94842566coll2:GenericCircularCounter;
      
      private var _94842567coll3:GenericCircularCounter;
      
      private var _372020745counters:HGroup;
      
      private var _1594208291easterSteps:Group;
      
      private var _100357egg:BitmapImage;
      
      private var _3237038info:Button;
      
      private var _1100650276rewards:Group;
      
      private var _1881583301strokes:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function EasterContent()
      {
         super();
         this.mxmlContent = [this._EasterContent_InnerGroup1_c()];
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
      
      private function _EasterContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 10;
         _loc1_.mxmlContent = [this._EasterContent_Button1_i(),this._EasterContent_GenericCircularBuyItem1_i(),this._EasterContent_HGroup1_i(),this._EasterContent_BitmapImage1_i(),this._EasterContent_Group2_i(),this._EasterContent_BitmapImage2_i(),this._EasterContent_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _EasterContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 53;
         _loc1_.y = 71;
         _loc1_.setStyle("skinClass",InfoButtonBigSkin);
         _loc1_.addEventListener("click",this.__info_click);
         _loc1_.id = "info";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.info = _loc1_;
         BindingManager.executeBindings(this,"info",this.info);
         return _loc1_;
      }
      
      public function __info_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("infoComicClick"));
      }
      
      private function _EasterContent_GenericCircularBuyItem1_i() : GenericCircularBuyItem
      {
         var _loc1_:GenericCircularBuyItem = new GenericCircularBuyItem();
         _loc1_.x = 488;
         _loc1_.y = 295;
         _loc1_.id = "buyBasket";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyBasket = _loc1_;
         BindingManager.executeBindings(this,"buyBasket",this.buyBasket);
         return _loc1_;
      }
      
      private function _EasterContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 428;
         _loc1_.y = 395;
         _loc1_.gap = 30;
         _loc1_.mxmlContent = [this._EasterContent_GenericCircularCounter1_i(),this._EasterContent_GenericCircularCounter2_i(),this._EasterContent_GenericCircularCounter3_i()];
         _loc1_.id = "counters";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counters = _loc1_;
         BindingManager.executeBindings(this,"counters",this.counters);
         return _loc1_;
      }
      
      private function _EasterContent_GenericCircularCounter1_i() : GenericCircularCounter
      {
         var _loc1_:GenericCircularCounter = new GenericCircularCounter();
         _loc1_.id = "coll1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.coll1 = _loc1_;
         BindingManager.executeBindings(this,"coll1",this.coll1);
         return _loc1_;
      }
      
      private function _EasterContent_GenericCircularCounter2_i() : GenericCircularCounter
      {
         var _loc1_:GenericCircularCounter = new GenericCircularCounter();
         _loc1_.id = "coll2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.coll2 = _loc1_;
         BindingManager.executeBindings(this,"coll2",this.coll2);
         return _loc1_;
      }
      
      private function _EasterContent_GenericCircularCounter3_i() : GenericCircularCounter
      {
         var _loc1_:GenericCircularCounter = new GenericCircularCounter();
         _loc1_.id = "coll3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.coll3 = _loc1_;
         BindingManager.executeBindings(this,"coll3",this.coll3);
         return _loc1_;
      }
      
      private function _EasterContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 144;
         _loc1_.y = 83;
         _loc1_.initialized(this,"egg");
         this.egg = _loc1_;
         BindingManager.executeBindings(this,"egg",this.egg);
         return _loc1_;
      }
      
      private function _EasterContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.id = "easterSteps";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.easterSteps = _loc1_;
         BindingManager.executeBindings(this,"easterSteps",this.easterSteps);
         return _loc1_;
      }
      
      private function _EasterContent_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 114;
         _loc1_.y = 91.05;
         _loc1_.initialized(this,"strokes");
         this.strokes = _loc1_;
         BindingManager.executeBindings(this,"strokes",this.strokes);
         return _loc1_;
      }
      
      private function _EasterContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.id = "rewards";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewards = _loc1_;
         BindingManager.executeBindings(this,"rewards",this.rewards);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get buyBasket() : GenericCircularBuyItem
      {
         return this._1290098708buyBasket;
      }
      
      public function set buyBasket(param1:GenericCircularBuyItem) : void
      {
         var _loc2_:Object = this._1290098708buyBasket;
         if(_loc2_ !== param1)
         {
            this._1290098708buyBasket = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyBasket",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get coll1() : GenericCircularCounter
      {
         return this._94842565coll1;
      }
      
      public function set coll1(param1:GenericCircularCounter) : void
      {
         var _loc2_:Object = this._94842565coll1;
         if(_loc2_ !== param1)
         {
            this._94842565coll1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"coll1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get coll2() : GenericCircularCounter
      {
         return this._94842566coll2;
      }
      
      public function set coll2(param1:GenericCircularCounter) : void
      {
         var _loc2_:Object = this._94842566coll2;
         if(_loc2_ !== param1)
         {
            this._94842566coll2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"coll2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get coll3() : GenericCircularCounter
      {
         return this._94842567coll3;
      }
      
      public function set coll3(param1:GenericCircularCounter) : void
      {
         var _loc2_:Object = this._94842567coll3;
         if(_loc2_ !== param1)
         {
            this._94842567coll3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"coll3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get counters() : HGroup
      {
         return this._372020745counters;
      }
      
      public function set counters(param1:HGroup) : void
      {
         var _loc2_:Object = this._372020745counters;
         if(_loc2_ !== param1)
         {
            this._372020745counters = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"counters",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get easterSteps() : Group
      {
         return this._1594208291easterSteps;
      }
      
      public function set easterSteps(param1:Group) : void
      {
         var _loc2_:Object = this._1594208291easterSteps;
         if(_loc2_ !== param1)
         {
            this._1594208291easterSteps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"easterSteps",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get egg() : BitmapImage
      {
         return this._100357egg;
      }
      
      public function set egg(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._100357egg;
         if(_loc2_ !== param1)
         {
            this._100357egg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"egg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get info() : Button
      {
         return this._3237038info;
      }
      
      public function set info(param1:Button) : void
      {
         var _loc2_:Object = this._3237038info;
         if(_loc2_ !== param1)
         {
            this._3237038info = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"info",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewards() : Group
      {
         return this._1100650276rewards;
      }
      
      public function set rewards(param1:Group) : void
      {
         var _loc2_:Object = this._1100650276rewards;
         if(_loc2_ !== param1)
         {
            this._1100650276rewards = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewards",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get strokes() : BitmapImage
      {
         return this._1881583301strokes;
      }
      
      public function set strokes(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1881583301strokes;
         if(_loc2_ !== param1)
         {
            this._1881583301strokes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"strokes",_loc2_,param1));
            }
         }
      }
   }
}

