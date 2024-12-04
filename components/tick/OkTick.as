package components.tick
{
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   
   public class OkTick extends Image
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_OK_473544339:Class = OkTick__embed_mxml__components_ComponentIcons_swf_OK_473544339;
      
      public function OkTick()
      {
         super();
         this.source = this._embed_mxml__components_ComponentIcons_swf_OK_473544339;
         this.scaleX = 0.7;
         this.scaleY = 0.7;
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

