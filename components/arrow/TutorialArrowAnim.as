package components.arrow
{
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   
   public class TutorialArrowAnim extends Image
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_TutorialArrow_swf_ArrowMC_1506212052:Class = TutorialArrowAnim__embed_mxml__components_TutorialArrow_swf_ArrowMC_1506212052;
      
      public function TutorialArrowAnim()
      {
         super();
         this.source = this._embed_mxml__components_TutorialArrow_swf_ArrowMC_1506212052;
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

