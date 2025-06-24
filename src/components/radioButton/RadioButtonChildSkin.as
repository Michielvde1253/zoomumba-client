package components.radioButton
{
   import components.image.BackgroundImage;
   import mx.binding.BindingManager;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.RadioButton;
   import spark.skins.SparkSkin;
   
   public class RadioButtonChildSkin extends SparkSkin implements IStateClient2
   {
      private static const exclusions:Array = ["labelDisplay","textLabel"];
      
      private static const focusExclusions:Array = ["labelDisplay","textLabel"];
      
      private var _692060858_RadioButtonChildSkin_Group1:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__components_ComponentIcons_swf_Baby_471081401:Class = RadioButtonChildSkin__embed_mxml__components_ComponentIcons_swf_Baby_471081401;
      
      private var _213507019hostComponent:RadioButton;
      
      public function RadioButtonChildSkin()
      {
         super();
         this.width = 35;
         this.height = 35;
         this.mxmlContent = [this._RadioButtonChildSkin_Group1_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___RadioButtonChildSkin_SparkSkin1_creationComplete);
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
            "stateGroups":["selectedStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleX",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleY",
               "value":1
            })]
         }),new State({
            "name":"overAndSelected",
            "stateGroups":["selectedStates","overStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleX",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleY",
               "value":1
            })]
         }),new State({
            "name":"downAndSelected",
            "stateGroups":["selectedStates","downStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleX",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleY",
               "value":1
            })]
         }),new State({
            "name":"disabledAndSelected",
            "stateGroups":["selectedStates","disabledStates"],
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleX",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_RadioButtonChildSkin_Group1",
               "name":"scaleY",
               "value":1
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override public function get focusSkinExclusions() : Array
      {
         return focusExclusions;
      }
      
      protected function config(param1:FlexEvent) : void
      {
         this.hostComponent.buttonMode = true;
         this.hostComponent.useHandCursor = true;
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         if(param1 != param2)
         {
            switch(param2)
            {
               case "upAndSelected":
               case "overAndSelected":
               case "downAndSelected":
               case "disabledAndSelected":
                  this.hostComponent.buttonMode = false;
                  this.hostComponent.useHandCursor = false;
                  break;
               default:
                  this.hostComponent.buttonMode = true;
                  this.hostComponent.useHandCursor = true;
            }
         }
      }
      
      private function _RadioButtonChildSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 32;
         _loc1_.height = 32;
         _loc1_.scaleX = 0.8;
         _loc1_.scaleY = 0.8;
         _loc1_.mxmlContent = [this._RadioButtonChildSkin_BackgroundImage1_c(),this._RadioButtonChildSkin_Image1_c()];
         _loc1_.id = "_RadioButtonChildSkin_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._RadioButtonChildSkin_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_RadioButtonChildSkin_Group1",this._RadioButtonChildSkin_Group1);
         return _loc1_;
      }
      
      private function _RadioButtonChildSkin_BackgroundImage1_c() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.scale = 0.32;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _RadioButtonChildSkin_Image1_c() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.source = this._embed_mxml__components_ComponentIcons_swf_Baby_471081401;
         _loc1_.verticalCenter = -3;
         _loc1_.horizontalCenter = 1;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      public function ___RadioButtonChildSkin_SparkSkin1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get _RadioButtonChildSkin_Group1() : Group
      {
         return this._692060858_RadioButtonChildSkin_Group1;
      }
      
      public function set _RadioButtonChildSkin_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._692060858_RadioButtonChildSkin_Group1;
         if(_loc2_ !== param1)
         {
            this._692060858_RadioButtonChildSkin_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_RadioButtonChildSkin_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : RadioButton
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:RadioButton) : void
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

