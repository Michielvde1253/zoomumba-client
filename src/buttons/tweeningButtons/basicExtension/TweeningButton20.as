package buttons.tweeningButtons.basicExtension
{
   import buttons.tweeningButtons.BasicTweeningStateableButton;
   import flash.display.Sprite;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class TweeningButton20 extends BasicTweeningStateableButton
   {
      private static const HIT_AREA_RADIUS:int = 19;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1943497895ButtonBack:Class = TweeningButton20_ButtonBack;
      
      public function TweeningButton20()
      {
         super();
         this.addEventListener("creationComplete",this.___TweeningButton20_BasicTweeningStateableButton1_creationComplete);
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
      
      protected function buttonCreationComplete(param1:FlexEvent) : void
      {
         drawHitArea(HIT_AREA_RADIUS);
         var _loc2_:Sprite = new this.ButtonBack();
         _loc2_.scaleX = 0.35;
         _loc2_.scaleY = 0.35;
         _loc2_.x = -19;
         _loc2_.y = -21;
         backgroundSkin = _loc2_;
      }
      
      public function ___TweeningButton20_BasicTweeningStateableButton1_creationComplete(param1:FlexEvent) : void
      {
         this.buttonCreationComplete(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get ButtonBack() : Class
      {
         return this._1943497895ButtonBack;
      }
      
      public function set ButtonBack(param1:Class) : void
      {
         var _loc2_:Object = this._1943497895ButtonBack;
         if(_loc2_ !== param1)
         {
            this._1943497895ButtonBack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ButtonBack",_loc2_,param1));
            }
         }
      }
   }
}

