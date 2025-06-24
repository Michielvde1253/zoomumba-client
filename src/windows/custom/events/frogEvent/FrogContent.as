package windows.custom.events.frogEvent
{
   import buttons.simpleButton.InfoButtonBigSkin;
   import custom.generic.GenericCircularCounter;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   
   public class FrogContent extends Group
   {
      private var _94842565coll1:GenericCircularCounter;
      
      private var _94842566coll2:GenericCircularCounter;
      
      private var _94842567coll3:GenericCircularCounter;
      
      private var _372020745counters:VGroup;
      
      private var _1265176294fieldStep:Group;
      
      private var _3237038info:Button;
      
      private var _1100650276rewards:Group;
      
      private var _110115790table:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function FrogContent()
      {
         super();
         this.mxmlContent = [this._FrogContent_InnerGroup1_c()];
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
      
      private function _FrogContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 10;
         _loc1_.mxmlContent = [this._FrogContent_Button1_i(),this._FrogContent_VGroup1_i(),this._FrogContent_BitmapImage1_i(),this._FrogContent_Group2_i(),this._FrogContent_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _FrogContent_Button1_i() : Button
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
      
      private function _FrogContent_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.x = 50;
         _loc1_.y = 180;
         _loc1_.gap = 30;
         _loc1_.mxmlContent = [this._FrogContent_GenericCircularCounter1_i(),this._FrogContent_GenericCircularCounter2_i(),this._FrogContent_GenericCircularCounter3_i()];
         _loc1_.id = "counters";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counters = _loc1_;
         BindingManager.executeBindings(this,"counters",this.counters);
         return _loc1_;
      }
      
      private function _FrogContent_GenericCircularCounter1_i() : GenericCircularCounter
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
      
      private function _FrogContent_GenericCircularCounter2_i() : GenericCircularCounter
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
      
      private function _FrogContent_GenericCircularCounter3_i() : GenericCircularCounter
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
      
      private function _FrogContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 106;
         _loc1_.y = 56.15;
         _loc1_.initialized(this,"table");
         this.table = _loc1_;
         BindingManager.executeBindings(this,"table",this.table);
         return _loc1_;
      }
      
      private function _FrogContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.id = "fieldStep";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fieldStep = _loc1_;
         BindingManager.executeBindings(this,"fieldStep",this.fieldStep);
         return _loc1_;
      }
      
      private function _FrogContent_Group3_i() : Group
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
      public function get counters() : VGroup
      {
         return this._372020745counters;
      }
      
      public function set counters(param1:VGroup) : void
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
      public function get fieldStep() : Group
      {
         return this._1265176294fieldStep;
      }
      
      public function set fieldStep(param1:Group) : void
      {
         var _loc2_:Object = this._1265176294fieldStep;
         if(_loc2_ !== param1)
         {
            this._1265176294fieldStep = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fieldStep",_loc2_,param1));
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
      public function get table() : BitmapImage
      {
         return this._110115790table;
      }
      
      public function set table(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._110115790table;
         if(_loc2_ !== param1)
         {
            this._110115790table = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"table",_loc2_,param1));
            }
         }
      }
   }
}

