package buttons.skin.sign
{
   import buttons.skin.master.AbstractButtonBrightEffectSkin;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   
   public class ButtonArrowSkin extends AbstractButtonBrightEffectSkin
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_ArrowRight_460786940:Class = ButtonArrowSkin__embed_mxml__components_ComponentIcons_swf_ArrowRight_460786940;
      
      public function ButtonArrowSkin()
      {
         super();
         this.mxmlContent = [this._ButtonArrowSkin_Image1_c()];
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
      
      override protected function init() : void
      {
         hostComponent.buttonMode = true;
         hostComponent.useHandCursor = true;
      }
      
      override protected function dispose() : void
      {
      }
      
      private function _ButtonArrowSkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_ArrowRight_460786940;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
   }
}

