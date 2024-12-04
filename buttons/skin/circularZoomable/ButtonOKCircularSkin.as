package buttons.skin.circularZoomable
{
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   
   public class ButtonOKCircularSkin extends ButtonCustomCircularSkin
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var SpriteClass:Class = ButtonOKCircularSkin_SpriteClass;
      
      public function ButtonOKCircularSkin()
      {
         super();
         this.addEventListener("creationComplete",this.___ButtonOKCircularSkin_ButtonCustomCircularSkin1_creationComplete);
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
      
      private function config(param1:FlexEvent) : void
      {
         hostComponent.bgScale = hostComponent.bgScale == -1 ? 0.57 : hostComponent.bgScale;
         hostComponent.iconScales = hostComponent.iconScales == null ? [0.6,0.75] : hostComponent.iconScales;
         hostComponent.backgroundState = hostComponent.backgroundState == null ? "innerWood" : hostComponent.backgroundState;
         hostComponent.iconClass = this.SpriteClass;
      }
      
      public function ___ButtonOKCircularSkin_ButtonCustomCircularSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
   }
}

