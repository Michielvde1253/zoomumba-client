package buttons.simpleButton
{
   import com.greensock.TweenMax;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.primitives.Ellipse;
   import spark.skins.SparkSkin;
   
   public class CloseButtonSkin extends SparkSkin implements IStateClient2
   {
      private var _1110650414hitContainer:HGroup;
      
      private var _1814160427hitGraphic:Ellipse;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__removeFromHere_ButtonsBackgrounds_swf_CloseButton_1774090203:Class = CloseButtonSkin__embed_mxml__removeFromHere_ButtonsBackgrounds_swf_CloseButton_1774090203;
      
      private var _213507019hostComponent:Button;
      
      public function CloseButtonSkin()
      {
         super();
         this.width = 45;
         this.height = 46;
         this.mxmlContent = [this._CloseButtonSkin_HGroup1_c(),this._CloseButtonSkin_HGroup2_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___CloseButtonSkin_SparkSkin1_creationComplete);
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
      
      private function _CloseButtonSkin_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mouseEnabled = false;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.focusEnabled = false;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CloseButtonSkin_Image1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CloseButtonSkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__removeFromHere_ButtonsBackgrounds_swf_CloseButton_1774090203;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _CloseButtonSkin_HGroup2_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CloseButtonSkin_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _CloseButtonSkin_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 40;
         _loc1_.height = 40;
         _loc1_.fill = this._CloseButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,"hitGraphic");
         this.hitGraphic = _loc1_;
         BindingManager.executeBindings(this,"hitGraphic",this.hitGraphic);
         return _loc1_;
      }
      
      private function _CloseButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 14540253;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___CloseButtonSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
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

