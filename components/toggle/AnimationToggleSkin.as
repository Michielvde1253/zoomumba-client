package components.toggle
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.ToggleButton;
   import spark.primitives.BitmapImage;
   import spark.skins.SparkSkin;
   
   public class AnimationToggleSkin extends SparkSkin implements IStateClient2
   {
      private var _1275473073_AnimationToggleSkin_BitmapImage2:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_Components_swf_SwitchPin_2021681768:Class = AnimationToggleSkin__embed_mxml__components_Components_swf_SwitchPin_2021681768;
      
      private var _embed_mxml__components_Components_swf_SwitchBG_1572250944:Class = AnimationToggleSkin__embed_mxml__components_Components_swf_SwitchBG_1572250944;
      
      private var _213507019hostComponent:ToggleButton;
      
      public function AnimationToggleSkin()
      {
         super();
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._AnimationToggleSkin_BitmapImage1_c(),this._AnimationToggleSkin_BitmapImage2_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___AnimationToggleSkin_SparkSkin1_creationComplete);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "stateGroups":["overStates"],
            "overrides":[]
         }),new State({
            "name":"down",
            "stateGroups":["downStates"],
            "overrides":[]
         }),new State({
            "name":"disabled",
            "stateGroups":["disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"scaleY",
               "value":-1
            }),new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"verticalCenter",
               "value":-13
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"scaleY",
               "value":-1
            }),new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"verticalCenter",
               "value":-13
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"scaleY",
               "value":-1
            }),new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"verticalCenter",
               "value":-13
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"scaleY",
               "value":-1
            }),new SetProperty().initializeFromObject({
               "target":"_AnimationToggleSkin_BitmapImage2",
               "name":"verticalCenter",
               "value":-13
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
      
      private function config(param1:FlexEvent) : void
      {
         this.hostComponent.buttonMode = true;
         this.hostComponent.useHandCursor = true;
      }
      
      private function _AnimationToggleSkin_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Components_swf_SwitchBG_1572250944;
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.initialized(this,null);
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _AnimationToggleSkin_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Components_swf_SwitchPin_2021681768;
         _loc1_.verticalCenter = 10;
         _loc1_.horizontalCenter = 1;
         _loc1_.initialized(this,"_AnimationToggleSkin_BitmapImage2");
         this._AnimationToggleSkin_BitmapImage2 = _loc1_;
         BindingManager.executeBindings(this,"_AnimationToggleSkin_BitmapImage2",this._AnimationToggleSkin_BitmapImage2);
         return _loc1_;
      }
      
      public function ___AnimationToggleSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _AnimationToggleSkin_BitmapImage2() : BitmapImage
      {
         return this._1275473073_AnimationToggleSkin_BitmapImage2;
      }
      
      public function set _AnimationToggleSkin_BitmapImage2(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1275473073_AnimationToggleSkin_BitmapImage2;
         if(_loc2_ !== param1)
         {
            this._1275473073_AnimationToggleSkin_BitmapImage2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_AnimationToggleSkin_BitmapImage2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : ToggleButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}

