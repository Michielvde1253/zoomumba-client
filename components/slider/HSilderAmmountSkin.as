package components.slider
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HSlider;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   import spark.skins.spark.HSliderTrackSkin;
   
   public class HSilderAmmountSkin extends SparkSkin implements IStateClient2
   {
      private static const exclusions:Array = ["track","thumb"];
      
      private var _2123520462snapsInterval:Group;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var snapIntervalBitmap:Class = HSilderAmmountSkin_snapIntervalBitmap;
      
      private var _embed_mxml__components_Components_swf_HAmmountBar_1283824565:Class = HSilderAmmountSkin__embed_mxml__components_Components_swf_HAmmountBar_1283824565;
      
      private var _213507019hostComponent:HSlider;
      
      public function HSilderAmmountSkin()
      {
         super();
         this.minHeight = 11;
         this.mxmlContent = [this._HSilderAmmountSkin_BitmapImage1_c(),this._HSilderAmmountSkin_Group1_i(),this._HSilderAmmountSkin_Button1_i(),this._HSilderAmmountSkin_Button2_i()];
         this.currentState = "normal";
         this.addEventListener("creationComplete",this.___HSilderAmmountSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      private function config(param1:FlexEvent) : void
      {
         var _loc2_:BitmapImage = new BitmapImage();
         _loc2_.source = this.snapIntervalBitmap;
         var _loc3_:int = this.hostComponent.maximum / this.hostComponent.snapInterval;
         var _loc4_:int = 1;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = new BitmapImage();
            _loc2_.source = this.snapIntervalBitmap;
            _loc2_.x = 7 + (width - 23) * (_loc4_ / _loc3_);
            this.snapsInterval.addElement(_loc2_);
            _loc4_++;
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = Number(this.thumb.getLayoutBoundsX());
         this.thumb.setLayoutBoundsPosition(0,this.thumb.getLayoutBoundsY());
         super.measure();
         this.thumb.setLayoutBoundsPosition(_loc1_,this.thumb.getLayoutBoundsY());
      }
      
      private function _HSilderAmmountSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Components_swf_HAmmountBar_1283824565;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _HSilderAmmountSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = -3;
         _loc1_.id = "snapsInterval";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.snapsInterval = _loc1_;
         BindingManager.executeBindings(this,"snapsInterval",this.snapsInterval);
         return _loc1_;
      }
      
      private function _HSilderAmmountSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.alpha = 0.1;
         _loc1_.setStyle("skinClass",HSliderTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _HSilderAmmountSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",HSliderAmmountThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      public function ___HSilderAmmountSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get snapsInterval() : Group
      {
         return this._2123520462snapsInterval;
      }
      
      public function set snapsInterval(param1:Group) : void
      {
         var _loc2_:Object = this._2123520462snapsInterval;
         if(_loc2_ !== param1)
         {
            this._2123520462snapsInterval = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"snapsInterval",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : HSlider
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:HSlider) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

