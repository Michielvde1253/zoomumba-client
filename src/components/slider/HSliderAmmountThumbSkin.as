package components.slider
{
   import com.greensock.TweenMax;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import spark.components.Button;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   
   public class HSliderAmmountThumbSkin extends SparkSkin implements IStateClient2
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_Components_swf_HAmmountThumb_433424760:Class = HSliderAmmountThumbSkin__embed_mxml__components_Components_swf_HAmmountThumb_433424760;
      
      private var _213507019hostComponent:Button;
      
      public function HSliderAmmountThumbSkin()
      {
         super();
         this.width = 20;
         this.height = 33;
         this.mxmlContent = [this._HSliderAmmountThumbSkin_BitmapImage1_c()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___HSliderAmmountThumbSkin_SparkSkin1_creationComplete);
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
         this.hostComponent.buttonMode = true;
         this.hostComponent.useHandCursor = true;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2 && Boolean(this.hostComponent.enabled))
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
      
      private function _HSliderAmmountThumbSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.y = -2.5;
         _loc1_.source = this._embed_mxml__components_Components_swf_HAmmountThumb_433424760;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___HSliderAmmountThumbSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
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

