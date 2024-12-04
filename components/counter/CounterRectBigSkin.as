package components.counter
{
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.core.SpriteVisualElement;
   import spark.primitives.Rect;
   
   public class CounterRectBigSkin extends Skin
   {
      private var _1559664047extraContainer:SpriteVisualElement;
      
      private var _1110650414hitContainer:Group;
      
      private var _1814160427hitGraphic:Rect;
      
      private var _3556653text:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectBig_1534971643:Class = CounterRectBigSkin__embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectBig_1534971643;
      
      private var _213507019hostComponent:Counter;
      
      public function CounterRectBigSkin()
      {
         super();
         this.mxmlContent = [this._CounterRectBigSkin_Group1_c()];
         this.addEventListener("creationComplete",this.___CounterRectBigSkin_Skin1_creationComplete);
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
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this.hostComponent.usePoints)
         {
            this.text.text = this.hostComponent.value.toString() + "...";
         }
         else
         {
            this.text.text = this.hostComponent.value.toString();
         }
      }
      
      private function _CounterRectBigSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.focusEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._CounterRectBigSkin_Image1_c(),this._CounterRectBigSkin_GradientText1_i(),this._CounterRectBigSkin_Group2_i(),this._CounterRectBigSkin_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterRectBigSkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.verticalCenter = 1;
         _loc1_.horizontalCenter = 1;
         _loc1_.source = this._embed_mxml__components_ComponentsBackgrounds_swf_BackgroundRectBig_1534971643;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterRectBigSkin_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.fontSize = 14;
         _loc1_.fontWeight = "bold";
         _loc1_.textAlign = "center";
         _loc1_.mouseEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.verticalCenter = -1;
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      private function _CounterRectBigSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CounterRectBigSkin_Rect1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CounterRectBigSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 50;
         _loc1_.height = 24;
         _loc1_.verticalCenter = -1;
         _loc1_.horizontalCenter = 0;
         _loc1_.fill = this._CounterRectBigSkin_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CounterRectBigSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterRectBigSkin_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"extraContainer");
         this.extraContainer = _loc1_;
         BindingManager.executeBindings(this,"extraContainer",this.extraContainer);
         return _loc1_;
      }
      
      public function ___CounterRectBigSkin_Skin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get extraContainer() : SpriteVisualElement
      {
         return this._1559664047extraContainer;
      }
      
      public function set extraContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1559664047extraContainer;
         if(_loc2_ !== param1)
         {
            this._1559664047extraContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitContainer() : Group
      {
         return this._1110650414hitContainer;
      }
      
      public function set hitContainer(param1:Group) : void
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
      public function get text() : GradientText
      {
         return this._3556653text;
      }
      
      public function set text(param1:GradientText) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Counter
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Counter) : void
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

