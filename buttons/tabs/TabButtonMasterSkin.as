package buttons.tabs
{
   import com.greensock.TweenMax;
   import flash.events.MouseEvent;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.State;
   import spark.skins.SparkSkin;
   
   public class TabButtonMasterSkin extends SparkSkin implements IStateClient2
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:TabButton;
      
      public function TabButtonMasterSkin()
      {
         super();
         this.minWidth = 21;
         this.minHeight = 21;
         this.currentState = "up";
         this.addEventListener("mouseOver",this.___TabButtonMasterSkin_SparkSkin1_mouseOver);
         this.addEventListener("mouseUp",this.___TabButtonMasterSkin_SparkSkin1_mouseUp);
         this.addEventListener("mouseOut",this.___TabButtonMasterSkin_SparkSkin1_mouseOut);
         this.addEventListener("click",this.___TabButtonMasterSkin_SparkSkin1_click);
         this.addEventListener("creationComplete",this.___TabButtonMasterSkin_SparkSkin1_creationComplete);
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
         }),new State({
            "name":"active",
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
         if(param1 != param2 && !this.hostComponent.active)
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
                  TweenMax.killTweensOf(this);
                  TweenMax.to(this,0.3,{"colorMatrixFilter":{
                     "contrast":1,
                     "brightness":1,
                     "remove":true
                  }});
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(this.hostComponent.active)
         {
            TweenMax.killTweensOf(this);
            TweenMax.to(this,0,{"colorMatrixFilter":{
               "contrast":1,
               "brightness":1,
               "remove":true
            }});
         }
         super.updateDisplayList(param1,param2);
      }
      
      public function ___TabButtonMasterSkin_SparkSkin1_mouseOver(param1:MouseEvent) : void
      {
         currentState = this.hostComponent.active ? currentState : "over";
      }
      
      public function ___TabButtonMasterSkin_SparkSkin1_mouseUp(param1:MouseEvent) : void
      {
         currentState = this.hostComponent.active ? currentState : "up";
      }
      
      public function ___TabButtonMasterSkin_SparkSkin1_mouseOut(param1:MouseEvent) : void
      {
         currentState = this.hostComponent.active ? currentState : "up";
      }
      
      public function ___TabButtonMasterSkin_SparkSkin1_click(param1:MouseEvent) : void
      {
         currentState = this.hostComponent.active ? currentState : "down";
      }
      
      public function ___TabButtonMasterSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : TabButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:TabButton) : void
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

