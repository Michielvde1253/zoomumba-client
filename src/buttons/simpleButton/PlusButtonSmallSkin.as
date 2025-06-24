package buttons.simpleButton
{
   import com.greensock.TweenMax;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Ellipse;
   import spark.skins.SparkSkin;
   
   public class PlusButtonSmallSkin extends SparkSkin implements IStateClient2
   {
      private var _1248806571_PlusButtonSmallSkin_BitmapImage1:BitmapImage;
      
      private var _1110650414hitContainer:HGroup;
      
      private var _1814160427hitGraphic:Ellipse;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_PlusSmall_342500318:Class = PlusButtonSmallSkin__embed_mxml__components_ComponentIcons_swf_PlusSmall_342500318;
      
      private var _213507019hostComponent:Button;
      
      public function PlusButtonSmallSkin()
      {
         super();
         this.width = 25;
         this.height = 26;
         this.mxmlContent = [this._PlusButtonSmallSkin_HGroup1_c(),this._PlusButtonSmallSkin_HGroup2_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___PlusButtonSmallSkin_SparkSkin1_creationComplete);
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
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_PlusButtonSmallSkin_BitmapImage1",
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
                  TweenMax.to(this,0.3,{"colorMatrixFilter":{
                     "contrast":1.4,
                     "brightness":1.2
                  }});
                  break;
               case "up":
                  TweenMax.to(this,0.3,{"colorMatrixFilter":{
                     "contrast":1,
                     "brightness":1,
                     "remove":true
                  }});
            }
         }
      }
      
      private function _PlusButtonSmallSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mouseEnabled = false;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.focusEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._PlusButtonSmallSkin_BitmapImage1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _PlusButtonSmallSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_PlusSmall_342500318;
         _loc1_.initialized(this,"_PlusButtonSmallSkin_BitmapImage1");
         this._PlusButtonSmallSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_PlusButtonSmallSkin_BitmapImage1",this._PlusButtonSmallSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _PlusButtonSmallSkin_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalCenter = -2;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._PlusButtonSmallSkin_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _PlusButtonSmallSkin_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 21;
         _loc1_.height = 21;
         _loc1_.fill = this._PlusButtonSmallSkin_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _PlusButtonSmallSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___PlusButtonSmallSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _PlusButtonSmallSkin_BitmapImage1() : BitmapImage
      {
         return this._1248806571_PlusButtonSmallSkin_BitmapImage1;
      }
      
      public function set _PlusButtonSmallSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1248806571_PlusButtonSmallSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._1248806571_PlusButtonSmallSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_PlusButtonSmallSkin_BitmapImage1",_loc2_,param1));
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

