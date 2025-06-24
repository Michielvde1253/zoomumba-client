package custom.info.groups
{
   import custom.info.component.InfoDisplayAttraction;
   import custom.info.component.InfoDisplayExpansion;
   import custom.info.component.InfoDisplayFood;
   import custom.info.component.InfoDisplayLevelXP;
   import custom.info.component.InfoDisplayLock;
   import custom.info.component.InfoDisplayLockTo;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   
   public class InfoDisplayGroupPreview extends Group implements IStateClient2
   {
      private var _1100750517infoAttraction:InfoDisplayAttraction;
      
      private var _645076047infoExpansion:InfoDisplayExpansion;
      
      private var _177528364infoFood:InfoDisplayFood;
      
      private var _1213662070infoLevel:InfoDisplayLevelXP;
      
      private var _177706745infoLock:InfoDisplayLock;
      
      private var _1022507180infoLockTo:InfoDisplayLockTo;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function InfoDisplayGroupPreview()
      {
         var _loc2_:DeferredInstanceFromFunction = null;
         var _loc4_:DeferredInstanceFromFunction = null;
         var _loc5_:DeferredInstanceFromFunction = null;
         var _loc6_:DeferredInstanceFromFunction = null;
         super();
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [];
         this.currentState = "none";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayGroupPreview_InfoDisplayAttraction1_i);
         _loc2_ = new DeferredInstanceFromFunction(this._InfoDisplayGroupPreview_InfoDisplayExpansion1_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._InfoDisplayGroupPreview_InfoDisplayFood1_i);
         _loc4_ = new DeferredInstanceFromFunction(this._InfoDisplayGroupPreview_InfoDisplayLevelXP1_i);
         _loc5_ = new DeferredInstanceFromFunction(this._InfoDisplayGroupPreview_InfoDisplayLock1_i);
         _loc6_ = new DeferredInstanceFromFunction(this._InfoDisplayGroupPreview_InfoDisplayLockTo1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"assistant",
            "overrides":[]
         }),new State({
            "name":"specie",
            "stateGroups":["specieGlobal"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"specieStatic",
            "stateGroups":["specieGlobal"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"cage",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"store",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"decoration",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"resource",
            "overrides":[]
         }),new State({
            "name":"specialDecoration",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc6_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"road",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"material",
            "overrides":[]
         })];
         _loc5_.getInstance();
         _loc1_.getInstance();
         _loc4_.getInstance();
         _loc6_.getInstance();
         _loc2_.getInstance();
         _loc3_.getInstance();
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
      
      private function _InfoDisplayGroupPreview_InfoDisplayLock1_i() : InfoDisplayLock
      {
         var _loc1_:InfoDisplayLock = new InfoDisplayLock();
         _loc1_.horizontalCenter = -90;
         _loc1_.verticalCenter = 60;
         _loc1_.id = "infoLock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoLock = _loc1_;
         BindingManager.executeBindings(this,"infoLock",this.infoLock);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupPreview_InfoDisplayAttraction1_i() : InfoDisplayAttraction
      {
         var _loc1_:InfoDisplayAttraction = new InfoDisplayAttraction();
         _loc1_.horizontalCenter = 90;
         _loc1_.verticalCenter = 60;
         _loc1_.id = "infoAttraction";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoAttraction = _loc1_;
         BindingManager.executeBindings(this,"infoAttraction",this.infoAttraction);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupPreview_InfoDisplayLevelXP1_i() : InfoDisplayLevelXP
      {
         var _loc1_:InfoDisplayLevelXP = new InfoDisplayLevelXP();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 90;
         _loc1_.id = "infoLevel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoLevel = _loc1_;
         BindingManager.executeBindings(this,"infoLevel",this.infoLevel);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupPreview_InfoDisplayLockTo1_i() : InfoDisplayLockTo
      {
         var _loc1_:InfoDisplayLockTo = new InfoDisplayLockTo();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 90;
         _loc1_.id = "infoLockTo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoLockTo = _loc1_;
         BindingManager.executeBindings(this,"infoLockTo",this.infoLockTo);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupPreview_InfoDisplayExpansion1_i() : InfoDisplayExpansion
      {
         var _loc1_:InfoDisplayExpansion = new InfoDisplayExpansion();
         _loc1_.horizontalCenter = -90;
         _loc1_.verticalCenter = 60;
         _loc1_.id = "infoExpansion";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoExpansion = _loc1_;
         BindingManager.executeBindings(this,"infoExpansion",this.infoExpansion);
         return _loc1_;
      }
      
      private function _InfoDisplayGroupPreview_InfoDisplayFood1_i() : InfoDisplayFood
      {
         var _loc1_:InfoDisplayFood = new InfoDisplayFood();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 90;
         _loc1_.id = "infoFood";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoFood = _loc1_;
         BindingManager.executeBindings(this,"infoFood",this.infoFood);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get infoAttraction() : InfoDisplayAttraction
      {
         return this._1100750517infoAttraction;
      }
      
      public function set infoAttraction(param1:InfoDisplayAttraction) : void
      {
         var _loc2_:Object = this._1100750517infoAttraction;
         if(_loc2_ !== param1)
         {
            this._1100750517infoAttraction = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoAttraction",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoExpansion() : InfoDisplayExpansion
      {
         return this._645076047infoExpansion;
      }
      
      public function set infoExpansion(param1:InfoDisplayExpansion) : void
      {
         var _loc2_:Object = this._645076047infoExpansion;
         if(_loc2_ !== param1)
         {
            this._645076047infoExpansion = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoExpansion",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoFood() : InfoDisplayFood
      {
         return this._177528364infoFood;
      }
      
      public function set infoFood(param1:InfoDisplayFood) : void
      {
         var _loc2_:Object = this._177528364infoFood;
         if(_loc2_ !== param1)
         {
            this._177528364infoFood = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoFood",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoLevel() : InfoDisplayLevelXP
      {
         return this._1213662070infoLevel;
      }
      
      public function set infoLevel(param1:InfoDisplayLevelXP) : void
      {
         var _loc2_:Object = this._1213662070infoLevel;
         if(_loc2_ !== param1)
         {
            this._1213662070infoLevel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoLevel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoLock() : InfoDisplayLock
      {
         return this._177706745infoLock;
      }
      
      public function set infoLock(param1:InfoDisplayLock) : void
      {
         var _loc2_:Object = this._177706745infoLock;
         if(_loc2_ !== param1)
         {
            this._177706745infoLock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoLock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoLockTo() : InfoDisplayLockTo
      {
         return this._1022507180infoLockTo;
      }
      
      public function set infoLockTo(param1:InfoDisplayLockTo) : void
      {
         var _loc2_:Object = this._1022507180infoLockTo;
         if(_loc2_ !== param1)
         {
            this._1022507180infoLockTo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoLockTo",_loc2_,param1));
            }
         }
      }
   }
}

