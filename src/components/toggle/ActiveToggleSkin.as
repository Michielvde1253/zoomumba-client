package components.toggle
{
   import components.image.BackgroundImage;
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
   
   public class ActiveToggleSkin extends SparkSkin implements IStateClient2
   {
      private var _216992530_ActiveToggleSkin_BitmapImage1:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_Components_swf_LightActive_752028733:Class = ActiveToggleSkin__embed_mxml__components_Components_swf_LightActive_752028733;
      
      private var _embed_mxml__components_Components_swf_LightInactive_475915256:Class = ActiveToggleSkin__embed_mxml__components_Components_swf_LightInactive_475915256;
      
      private var _213507019hostComponent:ToggleButton;
      
      public function ActiveToggleSkin()
      {
         super();
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._ActiveToggleSkin_BackgroundImage1_c(),this._ActiveToggleSkin_BitmapImage1_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___ActiveToggleSkin_SparkSkin1_creationComplete);
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
            "overrides":[]
         }),new State({
            "name":"upAndSelected",
            "stateGroups":["selectedStates","selectedUpStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ActiveToggleSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_LightActive_752028733
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ActiveToggleSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_LightActive_752028733
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ActiveToggleSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_LightActive_752028733
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","selectedUpStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ActiveToggleSkin_BitmapImage1",
               "name":"source",
               "value":this._embed_mxml__components_Components_swf_LightActive_752028733
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
         this.hostComponent.buttonMode = false;
         this.hostComponent.useHandCursor = false;
         this.hostComponent.enabled = false;
      }
      
      private function _ActiveToggleSkin_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.scale = 0.24;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _ActiveToggleSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__components_Components_swf_LightInactive_475915256;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"_ActiveToggleSkin_BitmapImage1");
         this._ActiveToggleSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_ActiveToggleSkin_BitmapImage1",this._ActiveToggleSkin_BitmapImage1);
         return _loc1_;
      }
      
      public function ___ActiveToggleSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _ActiveToggleSkin_BitmapImage1() : BitmapImage
      {
         return this._216992530_ActiveToggleSkin_BitmapImage1;
      }
      
      public function set _ActiveToggleSkin_BitmapImage1(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._216992530_ActiveToggleSkin_BitmapImage1;
         if(_loc2_ !== param1)
         {
            this._216992530_ActiveToggleSkin_BitmapImage1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ActiveToggleSkin_BitmapImage1",_loc2_,param1));
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

