package windows.custom.valentines
{
   import buttons.extended.ButtonCircularZoomable;
   import buttons.simpleButton.InfoButtonBigSkin;
   import buttons.skin.circularZoomable.ButtonCustomCircularSkin;
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
   import windows.core.OuterGroup;
   
   public class ValentinesContent extends Group
   {
      private var _1332194002background:BitmapImage;
      
      private var _94842565coll1:GenericCircularCounter;
      
      private var _94842566coll2:GenericCircularCounter;
      
      private var _94842567coll3:GenericCircularCounter;
      
      private var _372020745counters:HGroup;
      
      private var _3237038info:Button;
      
      private var _1085444827refresh:ButtonCircularZoomable;
      
      private var _1674107763rewardsLayer:Group;
      
      private var _109761319steps:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_Refresh_2120242164:Class = ValentinesContent__embed_mxml__components_ComponentIcons_swf_Refresh_2120242164;
      
      public function ValentinesContent()
      {
         super();
         this.mxmlContent = [this._ValentinesContent_InnerGroup1_c(),this._ValentinesContent_OuterGroup1_c()];
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
      
      private function _ValentinesContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.x = 10;
         _loc1_.mxmlContent = [this._ValentinesContent_BitmapImage1_i(),this._ValentinesContent_Group2_i(),this._ValentinesContent_Group3_i(),this._ValentinesContent_ButtonCircularZoomable1_i(),this._ValentinesContent_Button1_i(),this._ValentinesContent_HGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ValentinesContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.x = 115;
         _loc1_.y = 38;
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _ValentinesContent_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.id = "steps";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.steps = _loc1_;
         BindingManager.executeBindings(this,"steps",this.steps);
         return _loc1_;
      }
      
      private function _ValentinesContent_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.id = "rewardsLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.rewardsLayer = _loc1_;
         BindingManager.executeBindings(this,"rewardsLayer",this.rewardsLayer);
         return _loc1_;
      }
      
      private function _ValentinesContent_ButtonCircularZoomable1_i() : ButtonCircularZoomable
      {
         var _loc1_:ButtonCircularZoomable = new ButtonCircularZoomable();
         _loc1_.x = 100;
         _loc1_.y = 74;
         _loc1_.bgScale = 0.4;
         _loc1_.iconClass = this._embed_mxml__components_ComponentIcons_swf_Refresh_2120242164;
         _loc1_.setStyle("skinClass",ButtonCustomCircularSkin);
         _loc1_.addEventListener("click",this.__refresh_click);
         _loc1_.id = "refresh";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.refresh = _loc1_;
         BindingManager.executeBindings(this,"refresh",this.refresh);
         return _loc1_;
      }
      
      public function __refresh_click(param1:MouseEvent) : void
      {
         dispatchEvent(new Event("refreshGame"));
      }
      
      private function _ValentinesContent_Button1_i() : Button
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
      
      private function _ValentinesContent_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 428;
         _loc1_.y = 395;
         _loc1_.gap = 30;
         _loc1_.mxmlContent = [this._ValentinesContent_GenericCircularCounter1_i(),this._ValentinesContent_GenericCircularCounter2_i(),this._ValentinesContent_GenericCircularCounter3_i()];
         _loc1_.id = "counters";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.counters = _loc1_;
         BindingManager.executeBindings(this,"counters",this.counters);
         return _loc1_;
      }
      
      private function _ValentinesContent_GenericCircularCounter1_i() : GenericCircularCounter
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
      
      private function _ValentinesContent_GenericCircularCounter2_i() : GenericCircularCounter
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
      
      private function _ValentinesContent_GenericCircularCounter3_i() : GenericCircularCounter
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
      
      private function _ValentinesContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
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
      public function get refresh() : ButtonCircularZoomable
      {
         return this._1085444827refresh;
      }
      
      public function set refresh(param1:ButtonCircularZoomable) : void
      {
         var _loc2_:Object = this._1085444827refresh;
         if(_loc2_ !== param1)
         {
            this._1085444827refresh = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"refresh",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rewardsLayer() : Group
      {
         return this._1674107763rewardsLayer;
      }
      
      public function set rewardsLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1674107763rewardsLayer;
         if(_loc2_ !== param1)
         {
            this._1674107763rewardsLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rewardsLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get steps() : Group
      {
         return this._109761319steps;
      }
      
      public function set steps(param1:Group) : void
      {
         var _loc2_:Object = this._109761319steps;
         if(_loc2_ !== param1)
         {
            this._109761319steps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"steps",_loc2_,param1));
            }
         }
      }
   }
}

