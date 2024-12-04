package custom.mainInterface
{
   import components.textfield.gradientText.GradientText;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.BitmapFill;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.Path;
   
   public class UsernamePanel extends Group implements IStateClient2
   {
      public var _UsernamePanel_Group2:Group;
      
      private var _1779086222usernameBitmapText:GradientText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var dataText:String;
      
      private var _embed_mxml__general_Patterns_swf_PatternNormal_213163820:Class = UsernamePanel__embed_mxml__general_Patterns_swf_PatternNormal_213163820;
      
      private var _embed_mxml__custom_HUD_swf_UserNameForeground_1712936312:Class = UsernamePanel__embed_mxml__custom_HUD_swf_UserNameForeground_1712936312;
      
      public function UsernamePanel()
      {
         super();
         this.width = 373;
         this.height = 32;
         this.mxmlContent = [this._UsernamePanel_GradientText1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._UsernamePanel_Group2_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"background",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
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
      
      public function set userPanelData(param1:String) : void
      {
         this.dataText = param1;
         this.usernameBitmapText.text = param1;
      }
      
      public function hideBackground() : void
      {
         currentState = "normal";
      }
      
      public function showBackground() : void
      {
         currentState = "background";
      }
      
      private function _UsernamePanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.cacheAsBitmap = true;
         _loc1_.mxmlContent = [this._UsernamePanel_Path1_c(),this._UsernamePanel_Image1_c()];
         _loc1_.id = "_UsernamePanel_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UsernamePanel_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_UsernamePanel_Group2",this._UsernamePanel_Group2);
         return _loc1_;
      }
      
      private function _UsernamePanel_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.x = 5;
         _loc1_.y = 4;
         _loc1_.data = "M353.6 11.7Q349.95 16 344.65 17.25L344.65 17.2Q342.7 17.6 338.05 17.6L20.05 17.6Q16.6 17.6 13.4 16.7 7.9 15.1 4.5 11.3 1 7.35 0.2 4.7 -0.5 2.4 1.1 1.2 2.2 0.35 4.2 0.15 5.2 0 6.05 0.05L354.1 0Q356.2 0.15 357.35 0.9 358.95 2.05 358.2 4.55 357.3     7.35 353.6 11.7";
         _loc1_.scaleX = 1.01;
         _loc1_.scaleY = 1.01;
         _loc1_.fill = this._UsernamePanel_BitmapFill1_c();
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _UsernamePanel_BitmapFill1_c() : BitmapFill
      {
         var _loc1_:BitmapFill = new BitmapFill();
         _loc1_.source = this._embed_mxml__general_Patterns_swf_PatternNormal_213163820;
         _loc1_.fillMode = "repeat";
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _UsernamePanel_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__custom_HUD_swf_UserNameForeground_1712936312;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _UsernamePanel_GradientText1_i() : GradientText
      {
         var _loc1_:GradientText = new GradientText();
         _loc1_.top = -1;
         _loc1_.horizontalCenter = 0;
         _loc1_.fontSize = 12;
         _loc1_.text = "...";
         _loc1_.align = "center";
         _loc1_.id = "usernameBitmapText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.usernameBitmapText = _loc1_;
         BindingManager.executeBindings(this,"usernameBitmapText",this.usernameBitmapText);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get usernameBitmapText() : GradientText
      {
         return this._1779086222usernameBitmapText;
      }
      
      public function set usernameBitmapText(param1:GradientText) : void
      {
         var _loc2_:Object = this._1779086222usernameBitmapText;
         if(_loc2_ !== param1)
         {
            this._1779086222usernameBitmapText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"usernameBitmapText",_loc2_,param1));
            }
         }
      }
   }
}

