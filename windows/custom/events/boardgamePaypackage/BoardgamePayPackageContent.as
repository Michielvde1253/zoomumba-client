package windows.custom.events.boardgamePaypackage
{
   import buttons.skin.fluid.ButtonFluidGradientNormalSkin;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.primitives.BitmapImage;
   import windows.core.InnerGroup;
   import windows.core.OuterGroup;
   
   public class BoardgamePayPackageContent extends Group
   {
      private var _1292595405backgroundImage:BitmapImage;
      
      private var _358024381buttonBuy1:Button;
      
      private var _358024382buttonBuy2:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function BoardgamePayPackageContent()
      {
         super();
         this.mxmlContent = [this._BoardgamePayPackageContent_InnerGroup1_c(),this._BoardgamePayPackageContent_OuterGroup1_c()];
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
      
      private function _BoardgamePayPackageContent_InnerGroup1_c() : InnerGroup
      {
         var _loc1_:InnerGroup = new InnerGroup();
         _loc1_.mxmlContent = [this._BoardgamePayPackageContent_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 40;
         _loc1_.y = 40;
         _loc1_.mxmlContent = [this._BoardgamePayPackageContent_BitmapImage1_i(),this._BoardgamePayPackageContent_Group3_c(),this._BoardgamePayPackageContent_Group4_c(),this._BoardgamePayPackageContent_HGroup1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"backgroundImage");
         this.backgroundImage = _loc1_;
         BindingManager.executeBindings(this,"backgroundImage",this.backgroundImage);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.x = 100;
         _loc1_.y = 350;
         _loc1_.gap = 200;
         _loc1_.mxmlContent = [this._BoardgamePayPackageContent_Button1_i(),this._BoardgamePayPackageContent_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "buttonBuy1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonBuy1 = _loc1_;
         BindingManager.executeBindings(this,"buttonBuy1",this.buttonBuy1);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.height = 30;
         _loc1_.setStyle("skinClass",ButtonFluidGradientNormalSkin);
         _loc1_.id = "buttonBuy2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonBuy2 = _loc1_;
         BindingManager.executeBindings(this,"buttonBuy2",this.buttonBuy2);
         return _loc1_;
      }
      
      private function _BoardgamePayPackageContent_OuterGroup1_c() : OuterGroup
      {
         var _loc1_:OuterGroup = new OuterGroup();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundImage() : BitmapImage
      {
         return this._1292595405backgroundImage;
      }
      
      public function set backgroundImage(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1292595405backgroundImage;
         if(_loc2_ !== param1)
         {
            this._1292595405backgroundImage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundImage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBuy1() : Button
      {
         return this._358024381buttonBuy1;
      }
      
      public function set buttonBuy1(param1:Button) : void
      {
         var _loc2_:Object = this._358024381buttonBuy1;
         if(_loc2_ !== param1)
         {
            this._358024381buttonBuy1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBuy1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBuy2() : Button
      {
         return this._358024382buttonBuy2;
      }
      
      public function set buttonBuy2(param1:Button) : void
      {
         var _loc2_:Object = this._358024382buttonBuy2;
         if(_loc2_ !== param1)
         {
            this._358024382buttonBuy2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBuy2",_loc2_,param1));
            }
         }
      }
   }
}

