package custom.info.component
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   public class InfoDisplayLockTo extends Group
   {
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__general_Decorations_swf_LockedJustHere_1390330437:Class = InfoDisplayLockTo__embed_mxml__general_Decorations_swf_LockedJustHere_1390330437;
      
      public function InfoDisplayLockTo()
      {
         super();
         this.width = 60;
         this.height = 60;
         this.mxmlContent = [this._InfoDisplayLockTo_BitmapImage1_c()];
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
      
      private function _InfoDisplayLockTo_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__general_Decorations_swf_LockedJustHere_1390330437;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
   }
}

