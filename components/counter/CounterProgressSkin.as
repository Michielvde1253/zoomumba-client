package components.counter
{
   import flash.display.MovieClip;
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
   
   public class CounterProgressSkin extends Skin
   {
      private var _1559664047extraContainer:SpriteVisualElement;
      
      private var _1110650414hitContainer:Group;
      
      private var _1814160427hitGraphic:Rect;
      
      private var _1001078227progress:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_BackgroundCounterProgress_1651971872:Class = CounterProgressSkin__embed_mxml__general_Decorations_swf_BackgroundCounterProgress_1651971872;
      
      private var _213507019hostComponent:Counter;
      
      public function CounterProgressSkin()
      {
         super();
         this.mxmlContent = [this._CounterProgressSkin_Group1_c()];
         this.addEventListener("creationComplete",this.___CounterProgressSkin_Skin1_creationComplete);
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
         this.invalidateProperties();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this.progress && this.progress.content && this.hostComponent.value >= 0)
         {
            (this.progress.content as MovieClip).gotoAndStop(this.hostComponent.value + 1);
         }
      }
      
      override public function invalidateProperties() : void
      {
         super.invalidateProperties();
         if(this.progress && this.progress.content && this.hostComponent.value >= 0)
         {
            (this.progress.content as MovieClip).gotoAndStop(this.hostComponent.value + 1);
         }
      }
      
      private function _CounterProgressSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.focusEnabled = false;
         _loc1_.width = 44;
         _loc1_.height = 17;
         _loc1_.mxmlContent = [this._CounterProgressSkin_Image1_i(),this._CounterProgressSkin_Group2_i(),this._CounterProgressSkin_SpriteVisualElement1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterProgressSkin_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_BackgroundCounterProgress_1651971872;
         _loc1_.id = "progress";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.progress = _loc1_;
         BindingManager.executeBindings(this,"progress",this.progress);
         return _loc1_;
      }
      
      private function _CounterProgressSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CounterProgressSkin_Rect1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CounterProgressSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.width = 44;
         _loc1_.height = 17;
         _loc1_.verticalCenter = -1;
         _loc1_.horizontalCenter = 0;
         _loc1_.fill = this._CounterProgressSkin_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CounterProgressSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CounterProgressSkin_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.initialized(this,"extraContainer");
         this.extraContainer = _loc1_;
         BindingManager.executeBindings(this,"extraContainer",this.extraContainer);
         return _loc1_;
      }
      
      public function ___CounterProgressSkin_Skin1_creationComplete(param1:FlexEvent) : void
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
      public function get progress() : Image
      {
         return this._1001078227progress;
      }
      
      public function set progress(param1:Image) : void
      {
         var _loc2_:Object = this._1001078227progress;
         if(_loc2_ !== param1)
         {
            this._1001078227progress = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"progress",_loc2_,param1));
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

