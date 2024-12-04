package custom.info.groups
{
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.info.component.InfoDisplaySwitcher;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.VGroup;
   
   public class InfoDisplayGroupRight extends Group implements IStateClient2
   {
      public var _InfoDisplayGroupRight_VGroup1:VGroup;
      
      private var _1561747026infoCageSpecies:InfoDisplaySwitcher;
      
      private var _1468471431infoMaterialBuild:InfoDisplaySwitcher;
      
      private var _3832xp:LabelDisplay;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function InfoDisplayGroupRight()
      {
         var _loc2_:DeferredInstanceFromFunction = null;
         super();
         this.mxmlContent = [];
         this.currentState = "none";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayGroupRight_InfoDisplaySwitcher1_i);
         _loc2_ = new DeferredInstanceFromFunction(this._InfoDisplayGroupRight_InfoDisplaySwitcher2_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayGroupRight_VGroup1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"assistant",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"specie",
            "stateGroups":["specieGlobal"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"specieStatic",
            "stateGroups":["specieGlobal"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"cage",
            "overrides":[]
         }),new State({
            "name":"store",
            "overrides":[]
         }),new State({
            "name":"decoration",
            "overrides":[]
         }),new State({
            "name":"resource",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"specialDecoration",
            "overrides":[]
         }),new State({
            "name":"road",
            "overrides":[]
         }),new State({
            "name":"material",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         })];
         _loc3_.getInstance();
         _loc1_.getInstance();
         _loc2_.getInstance();
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
      
      private function _InfoDisplayGroupRight_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 0;
         _loc1_.gap = 0;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._InfoDisplayGroupRight_LabelDisplay1_i()];
         _loc1_.id = "_InfoDisplayGroupRight_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._InfoDisplayGroupRight_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_InfoDisplayGroupRight_VGroup1",this._InfoDisplayGroupRight_VGroup1);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupRight_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.right = 0;
         _loc1_.boxHeight = 30;
         _loc1_.boxWidth = 30;
         _loc1_.type = "xp";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "xp";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.xp = _loc1_;
         BindingManager.executeBindings(this,"xp",this.xp);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupRight_InfoDisplaySwitcher1_i() : InfoDisplaySwitcher
      {
         var _loc1_:InfoDisplaySwitcher = new InfoDisplaySwitcher();
         _loc1_.left = 47;
         _loc1_.bottom = 20;
         _loc1_.id = "infoCageSpecies";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoCageSpecies = _loc1_;
         BindingManager.executeBindings(this,"infoCageSpecies",this.infoCageSpecies);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupRight_InfoDisplaySwitcher2_i() : InfoDisplaySwitcher
      {
         var _loc1_:InfoDisplaySwitcher = new InfoDisplaySwitcher();
         _loc1_.left = 47;
         _loc1_.bottom = 20;
         _loc1_.id = "infoMaterialBuild";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoMaterialBuild = _loc1_;
         BindingManager.executeBindings(this,"infoMaterialBuild",this.infoMaterialBuild);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get infoCageSpecies() : InfoDisplaySwitcher
      {
         return this._1561747026infoCageSpecies;
      }
      
      public function set infoCageSpecies(param1:InfoDisplaySwitcher) : void
      {
         var _loc2_:Object = this._1561747026infoCageSpecies;
         if(_loc2_ !== param1)
         {
            this._1561747026infoCageSpecies = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoCageSpecies",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoMaterialBuild() : InfoDisplaySwitcher
      {
         return this._1468471431infoMaterialBuild;
      }
      
      public function set infoMaterialBuild(param1:InfoDisplaySwitcher) : void
      {
         var _loc2_:Object = this._1468471431infoMaterialBuild;
         if(_loc2_ !== param1)
         {
            this._1468471431infoMaterialBuild = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoMaterialBuild",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xp() : LabelDisplay
      {
         return this._3832xp;
      }
      
      public function set xp(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._3832xp;
         if(_loc2_ !== param1)
         {
            this._3832xp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xp",_loc2_,param1));
            }
         }
      }
   }
}

