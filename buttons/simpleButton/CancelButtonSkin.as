package buttons.simpleButton
{
   import com.greensock.TweenMax;
   import components.image.BackgroundImage;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.BitmapFill;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.primitives.Ellipse;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class CancelButtonSkin extends SparkSkin implements IStateClient2
   {
      private var _835193660bitmapBounds:Rect;
      
      private var _1110650414hitContainer:HGroup;
      
      private var _1814160427hitGraphic:Ellipse;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__removeFromHere_ButtonsBackgrounds_swf_CancelButton_635301219:Class = CancelButtonSkin__embed_mxml__removeFromHere_ButtonsBackgrounds_swf_CancelButton_635301219;
      
      private var _213507019hostComponent:Button;
      
      public function CancelButtonSkin()
      {
         super();
         this.width = 75;
         this.height = 74;
         this.mxmlContent = [this._CancelButtonSkin_BackgroundImage1_c(),this._CancelButtonSkin_HGroup1_c(),this._CancelButtonSkin_HGroup2_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___CancelButtonSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      protected function config(param1:FlexEvent) : void
      {
         this.hitContainer.mouseEnabled = false;
         hitArea = this.hitContainer;
         this.hostComponent.hitArea = this.hitContainer;
         this.hostComponent.buttonMode = true;
         this.hostComponent.useHandCursor = true;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2)
         {
            switch(param2)
            {
               case "over":
                  TweenMax.to(this.bitmapBounds,0.2,{
                     "scaleX":1.2,
                     "scaleY":1.2
                  });
                  break;
               case "up":
                  TweenMax.to(this.bitmapBounds,0.2,{
                     "scaleX":1,
                     "scaleY":1
                  });
            }
         }
      }
      
      private function _CancelButtonSkin_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = null;
         _loc1_ = new BackgroundImage();
         _loc1_.currentState = "innerWood";
         _loc1_.scale = 0.57;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CancelButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mouseEnabled = false;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.focusEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CancelButtonSkin_Rect1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CancelButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 53;
         _loc1_.height = 52;
         _loc1_.fill = this._CancelButtonSkin_BitmapFill1_c();
         _loc1_.initialized(this,"bitmapBounds");
         this.bitmapBounds = _loc1_;
         BindingManager.executeBindings(this,"bitmapBounds",this.bitmapBounds);
         return _loc1_;
      }
      
      private function _CancelButtonSkin_BitmapFill1_c() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.smooth = true;
         _loc1_.x = 2;
         _loc1_.y = 2;
         _loc1_.source = this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_CancelButton_635301219;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CancelButtonSkin_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CancelButtonSkin_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CancelButtonSkin_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 60;
         _loc1_.height = 60;
         _loc1_.fill = this._CancelButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CancelButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___CancelButtonSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapBounds() : Rect
      {
         return this._835193660bitmapBounds;
      }
      
      public function set bitmapBounds(param1:Rect) : void
      {
         var _loc2_:Object = this._835193660bitmapBounds;
         if(_loc2_ !== param1)
         {
            this._835193660bitmapBounds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapBounds",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitContainer() : HGroup
      {
         return this._1110650414hitContainer;
      }
      
      public function set hitContainer(param1:HGroup) : void
      {
         var _loc2_:Object = this._1110650414hitContainer;
         if(_loc2_ !== param1)
         {
            this._1110650414hitContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitGraphic() : Ellipse
      {
         return this._1814160427hitGraphic;
      }
      
      public function set hitGraphic(param1:Ellipse) : void
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
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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

