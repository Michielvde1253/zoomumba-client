package buttons.skin.fluid
{
   import mx.core.IFlexModuleFactory;
   
   public class ButtonFluidPaleSkin extends AbstractButtonFluidNormalSkin
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Patterns_swf_PatternInactive_1124960088:Class = ButtonFluidPaleSkin__embed_mxml__general_Patterns_swf_PatternInactive_1124960088;
      
      public function ButtonFluidPaleSkin()
      {
         super();
         this.texture = this._embed_mxml__general_Patterns_swf_PatternInactive_1124960088;
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
   }
}

