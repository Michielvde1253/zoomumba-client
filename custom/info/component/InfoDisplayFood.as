package custom.info.component
{
   import components.image.BackgroundImage;
   import flash.display.DisplayObject;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class InfoDisplayFood extends Group
   {
      private var _1812791268_sprite:SpriteVisualElement;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function InfoDisplayFood()
      {
         super();
         this.maxHeight = 60;
         this.maxWidth = 60;
         this.mxmlContent = [this._InfoDisplayFood_BackgroundImage1_c(),this._InfoDisplayFood_SpriteVisualElement1_i()];
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
      
      public function addContent(param1:DisplayObject) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(this._sprite != null && param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this._sprite.numChildren)
            {
               _loc3_ = this._sprite.getChildAt(_loc2_);
               this._sprite.removeChild(_loc3_);
               _loc2_++;
            }
            this._sprite.addChild(param1);
         }
      }
      
      private function _InfoDisplayFood_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.62;
         _loc1_.verticalCenter = 1;
         _loc1_.horizontalCenter = 1;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _InfoDisplayFood_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_sprite");
         this._sprite = _loc1_;
         BindingManager.executeBindings(this,"_sprite",this._sprite);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _sprite() : SpriteVisualElement
      {
         return this._1812791268_sprite;
      }
      
      public function set _sprite(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1812791268_sprite;
         if(_loc2_ !== param1)
         {
            this._1812791268_sprite = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sprite",_loc2_,param1));
            }
         }
      }
   }
}

