package windows.custom.gameItems.info
{
   import buttons.simpleButton.BuyButtonNormalSkin;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import components.textfield.StandardText;
   import components.textfield.labelDisplay.LabelDisplay;
   import components.textfield.labelDisplay.skin.LabelDisplaySkin;
   import custom.info.component.InfoDisplayAttraction;
   import custom.info.component.InfoDisplayExoticness;
   import custom.info.component.InfoDisplayExpansion;
   import custom.info.component.InfoDisplayFood;
   import custom.info.component.InfoDisplayLevelXP;
   import custom.info.component.InfoDisplayLock;
   import custom.info.component.InfoDisplayLockTo;
   import custom.info.component.InfoDisplaySwitcher;
   import custom.info.events.InfoSexChangeEvent;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.RadioButton;
   import spark.components.RadioButtonGroup;
   import spark.components.VGroup;
   import spark.core.SpriteVisualElement;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class GameItemInfoPerspectives extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static const PERSPECTIVE_NONE:String = "none";
      
      public static const PERSPECTIVE_SPECIES:String = "species";
      
      public static const PERSPECTIVE_SPECIES_JUST_INFO:String = "species_info";
      
      public static const PERSPECTIVE_CAGES:String = "cages";
      
      public static const PERSPECTIVE_STORES:String = "stores";
      
      public static const PERSPECTIVE_DECORATIONS:String = "decorations";
      
      public static const PERSPECTIVE_SPECIAL_DECORATIONS:String = "special_decorations";
      
      public static const PERSPECTIVE_RESOURCES:String = "resources";
      
      public static const PERSPECTIVE_SPECIALS:String = "specials";
      
      public static const PERSPECTIVE_ROADS:String = "roads";
      
      private var _1810610537_GameItemInfoPerspectives_Group2:Group;
      
      private var _1810610538_GameItemInfoPerspectives_Group3:Group;
      
      private var _1810610539_GameItemInfoPerspectives_Group4:Group;
      
      public var _GameItemInfoPerspectives_HGroup1:HGroup;
      
      public var _GameItemInfoPerspectives_RadioButton1:RadioButton;
      
      public var _GameItemInfoPerspectives_RadioButton2:RadioButton;
      
      public var _GameItemInfoPerspectives_VGroup1:VGroup;
      
      private var _506449773_GameItemInfoPerspectives_VGroup2:VGroup;
      
      private var _1541930571animalBitmap:BitmapImage;
      
      private var _11549172buttonBuy:Button;
      
      private var _1761030527buyableGroup:VGroup;
      
      private var _1100750517infoAttraction:InfoDisplayAttraction;
      
      private var _1561747026infoCageSpecies:InfoDisplaySwitcher;
      
      private var _740413033infoExoticness:InfoDisplayExoticness;
      
      private var _645076047infoExpansion:InfoDisplayExpansion;
      
      private var _177528364infoFood:InfoDisplayFood;
      
      private var _1213662070infoLevel:InfoDisplayLevelXP;
      
      private var _177706745infoLock:InfoDisplayLock;
      
      private var _1022507180infoLockTo:InfoDisplayLockTo;
      
      private var _1675582086labelClock:LabelDisplay;
      
      private var _1663403339labelPrice:LabelDisplay;
      
      private var _882846635labelSpecialPerc:LabelDisplay;
      
      private var _1000556740spriteContainer:SpriteVisualElement;
      
      private var _1003855738textMain:StandardText;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _radioGroupSex:RadioButtonGroup;
      
      private var _sexEvent:InfoSexChangeEvent;
      
      private var _created:Boolean = false;
      
      private var _isMale:Boolean = true;
      
      private var _buyable:Boolean = true;
      
      private var _maleSexInfo:Class;
      
      private var _femaleSexInfo:Class;
      
      private var _babySexInfo:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GameItemInfoPerspectives()
      {
         var watchers:Array;
         var _GameItemInfoPerspectives_BitmapImage1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_HGroup1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayAttraction1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayExoticness1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayExpansion1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayFood1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayLevelXP1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayLock1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplayLockTo1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_InfoDisplaySwitcher1_factory:DeferredInstanceFromFunction;
         var _GameItemInfoPerspectives_VGroup1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._maleSexInfo = GameItemInfoPerspectives__maleSexInfo;
         this._femaleSexInfo = GameItemInfoPerspectives__femaleSexInfo;
         this._babySexInfo = GameItemInfoPerspectives__babySexInfo;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._GameItemInfoPerspectives_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_windows_custom_gameItems_info_GameItemInfoPerspectivesWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GameItemInfoPerspectives[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._GameItemInfoPerspectives_Group2_i(),this._GameItemInfoPerspectives_Group3_i(),this._GameItemInfoPerspectives_Group4_i(),this._GameItemInfoPerspectives_VGroup2_i()];
         this.currentState = "none";
         this.addEventListener("creationComplete",this.___GameItemInfoPerspectives_Group1_creationComplete);
         _GameItemInfoPerspectives_BitmapImage1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_BitmapImage1_i);
         _GameItemInfoPerspectives_HGroup1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_HGroup1_i);
         _GameItemInfoPerspectives_InfoDisplayAttraction1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayAttraction1_i);
         _GameItemInfoPerspectives_InfoDisplayExoticness1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayExoticness1_i);
         _GameItemInfoPerspectives_InfoDisplayExpansion1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayExpansion1_i);
         _GameItemInfoPerspectives_InfoDisplayFood1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayFood1_i);
         _GameItemInfoPerspectives_InfoDisplayLevelXP1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayLevelXP1_i);
         _GameItemInfoPerspectives_InfoDisplayLock1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayLock1_i);
         _GameItemInfoPerspectives_InfoDisplayLockTo1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplayLockTo1_i);
         _GameItemInfoPerspectives_InfoDisplaySwitcher1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_InfoDisplaySwitcher1_i);
         _GameItemInfoPerspectives_VGroup1_factory = new DeferredInstanceFromFunction(this._GameItemInfoPerspectives_VGroup1_i);
         states = [new State({
            "name":"none",
            "overrides":[]
         }),new State({
            "name":"species",
            "stateGroups":["species_display"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_HGroup1_factory,
               "destination":"_GameItemInfoPerspectives_VGroup2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayAttraction1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplaySwitcher1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayFood1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLock1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayExoticness1_factory,
               "destination":"_GameItemInfoPerspectives_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"infoLock",
               "name":"verticalCenter",
               "value":-50
            }),new SetProperty().initializeFromObject({
               "target":"infoLock",
               "name":"horizontalCenter",
               "value":-100
            })]
         }),new State({
            "name":"species_info",
            "stateGroups":["species_display"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_BitmapImage1_factory,
               "destination":"_GameItemInfoPerspectives_VGroup2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayAttraction1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplaySwitcher1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayFood1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLock1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayExoticness1_factory,
               "destination":"_GameItemInfoPerspectives_Group2",
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"infoLock",
               "name":"verticalCenter",
               "value":-50
            }),new SetProperty().initializeFromObject({
               "target":"infoLock",
               "name":"horizontalCenter",
               "value":-100
            })]
         }),new State({
            "name":"cages",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayAttraction1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLevelXP1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLock1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"stores",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLock1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"decorations",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayAttraction1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLock1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"special_decorations",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayAttraction1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLockTo1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayExpansion1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         }),new State({
            "name":"resources",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplaySwitcher1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new SetProperty().initializeFromObject({
               "target":"infoCageSpecies",
               "name":"verticalCenter",
               "value":-100
            }),new SetProperty().initializeFromObject({
               "target":"infoCageSpecies",
               "name":"horizontalCenter",
               "value":0
            })]
         }),new State({
            "name":"specials",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_VGroup1_factory,
               "destination":"_GameItemInfoPerspectives_Group3",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["textMain"]
            })]
         }),new State({
            "name":"roads",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayAttraction1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GameItemInfoPerspectives_InfoDisplayLock1_factory,
               "destination":"_GameItemInfoPerspectives_Group4",
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["spriteContainer"]
            })]
         })];
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         GameItemInfoPerspectives._watcherSetupUtil = param1;
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
      
      public function set buyable(param1:Boolean) : void
      {
         this._buyable = param1;
         if(!param1 && this._created)
         {
            this.buyableGroup.removeAllElements();
         }
      }
      
      public function get created() : Boolean
      {
         return this._created;
      }
      
      private function init(param1:FlexEvent) : void
      {
         this._radioGroupSex = new RadioButtonGroup();
         this._radioGroupSex.selectedValue = 1;
         this._radioGroupSex.addEventListener(Event.CHANGE,this.sexChanged);
         this._sexEvent = new InfoSexChangeEvent(InfoSexChangeEvent.CHANGED);
         this._created = true;
         dispatchEvent(new Event("sexGroupSetted"));
         this.setSex(this._isMale);
         this.buyable = this._buyable;
      }
      
      [Bindable(event="sexGroupSetted")]
      public function get sexGroup() : RadioButtonGroup
      {
         return this._radioGroupSex;
      }
      
      public function displayTypeAnimal(param1:int) : void
      {
         if(currentState == "species_info")
         {
            switch(param1)
            {
               case 1:
                  this.animalBitmap.source = this._femaleSexInfo;
                  break;
               case 2:
                  this.animalBitmap.source = this._babySexInfo;
                  break;
               default:
                  this.animalBitmap.source = this._maleSexInfo;
            }
         }
      }
      
      public function setSex(param1:Boolean) : void
      {
         this._isMale = param1;
         if(this._created && currentState == "species")
         {
            this._radioGroupSex.selectedValue = this._isMale;
         }
      }
      
      private function sexChanged(param1:Event) : void
      {
         this._sexEvent.isMale = this._radioGroupSex.selectedValue == 1;
         dispatchEvent(this._sexEvent);
      }
      
      private function _GameItemInfoPerspectives_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 70;
         _loc1_.top = 50;
         _loc1_.mxmlContent = [];
         _loc1_.id = "_GameItemInfoPerspectives_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_Group2",this._GameItemInfoPerspectives_Group2);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayExoticness1_i() : InfoDisplayExoticness
      {
         var _loc1_:InfoDisplayExoticness = new InfoDisplayExoticness();
         _loc1_.right = 3;
         _loc1_.top = 17;
         _loc1_.id = "infoExoticness";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoExoticness = _loc1_;
         BindingManager.executeBindings(this,"infoExoticness",this.infoExoticness);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.right = 65;
         _loc1_.top = 140;
         _loc1_.bottom = 90;
         _loc1_.mxmlContent = [this._GameItemInfoPerspectives_StandardText1_i()];
         _loc1_.id = "_GameItemInfoPerspectives_Group3";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_Group3 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_Group3",this._GameItemInfoPerspectives_Group3);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_StandardText1_i() : StandardText
      {
         var _loc1_:StandardText = new StandardText();
         _loc1_.width = 240;
         _loc1_.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur convallis velit vitae magna consequat nec interdum felis sagittis. Donec id mauris a ipsum blandit fringilla eget vitae massa. Proin ac ante orci, quis varius nibh. Fusce accumsan, lectus ac blandit pharetra, turpis nibh mattis leo, ut scelerisque purus purus sed.";
         _loc1_.setStyle("fontSize",13);
         _loc1_.id = "textMain";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textMain = _loc1_;
         BindingManager.executeBindings(this,"textMain",this.textMain);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_VGroup1_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "right";
         _loc1_.horizontalCenter = -20;
         _loc1_.gap = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._GameItemInfoPerspectives_LabelDisplay1_i(),this._GameItemInfoPerspectives_LabelDisplay2_i()];
         _loc1_.id = "_GameItemInfoPerspectives_VGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_VGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_VGroup1",this._GameItemInfoPerspectives_VGroup1);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_LabelDisplay1_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.text = "00:00:00";
         _loc1_.type = "clock_red";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "labelClock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelClock = _loc1_;
         BindingManager.executeBindings(this,"labelClock",this.labelClock);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_LabelDisplay2_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.text = "+0%";
         _loc1_.type = "xp";
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "labelSpecialPerc";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelSpecialPerc = _loc1_;
         BindingManager.executeBindings(this,"labelSpecialPerc",this.labelSpecialPerc);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 70;
         _loc1_.top = 140;
         _loc1_.width = 300;
         _loc1_.maxWidth = 300;
         _loc1_.height = 280;
         _loc1_.maxHeight = 280;
         _loc1_.mxmlContent = [this._GameItemInfoPerspectives_SpriteVisualElement1_i()];
         _loc1_.id = "_GameItemInfoPerspectives_Group4";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_Group4 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_Group4",this._GameItemInfoPerspectives_Group4);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_SpriteVisualElement1_i() : SpriteVisualElement
      {
         var _loc1_:SpriteVisualElement = new SpriteVisualElement();
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"spriteContainer");
         this.spriteContainer = _loc1_;
         BindingManager.executeBindings(this,"spriteContainer",this.spriteContainer);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayLock1_i() : InfoDisplayLock
      {
         var _loc1_:InfoDisplayLock = new InfoDisplayLock();
         _loc1_.verticalCenter = 50;
         _loc1_.horizontalCenter = -100;
         _loc1_.id = "infoLock";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoLock = _loc1_;
         BindingManager.executeBindings(this,"infoLock",this.infoLock);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayExpansion1_i() : InfoDisplayExpansion
      {
         var _loc1_:InfoDisplayExpansion = new InfoDisplayExpansion();
         _loc1_.verticalCenter = 50;
         _loc1_.visible = false;
         _loc1_.horizontalCenter = -100;
         _loc1_.id = "infoExpansion";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoExpansion = _loc1_;
         BindingManager.executeBindings(this,"infoExpansion",this.infoExpansion);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayFood1_i() : InfoDisplayFood
      {
         var _loc1_:InfoDisplayFood = new InfoDisplayFood();
         _loc1_.verticalCenter = -100;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "infoFood";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoFood = _loc1_;
         BindingManager.executeBindings(this,"infoFood",this.infoFood);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplaySwitcher1_i() : InfoDisplaySwitcher
      {
         var _loc1_:InfoDisplaySwitcher = new InfoDisplaySwitcher();
         _loc1_.currentState = "speciesMatches";
         _loc1_.verticalCenter = -50;
         _loc1_.horizontalCenter = 100;
         _loc1_.id = "infoCageSpecies";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoCageSpecies = _loc1_;
         BindingManager.executeBindings(this,"infoCageSpecies",this.infoCageSpecies);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayLevelXP1_i() : InfoDisplayLevelXP
      {
         var _loc1_:InfoDisplayLevelXP = new InfoDisplayLevelXP();
         _loc1_.verticalCenter = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "infoLevel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoLevel = _loc1_;
         BindingManager.executeBindings(this,"infoLevel",this.infoLevel);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayLockTo1_i() : InfoDisplayLockTo
      {
         var _loc1_:InfoDisplayLockTo = new InfoDisplayLockTo();
         _loc1_.visible = false;
         _loc1_.verticalCenter = 100;
         _loc1_.horizontalCenter = 0;
         _loc1_.id = "infoLockTo";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoLockTo = _loc1_;
         BindingManager.executeBindings(this,"infoLockTo",this.infoLockTo);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_InfoDisplayAttraction1_i() : InfoDisplayAttraction
      {
         var _loc1_:InfoDisplayAttraction = new InfoDisplayAttraction();
         _loc1_.verticalCenter = 50;
         _loc1_.horizontalCenter = 100;
         _loc1_.id = "infoAttraction";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoAttraction = _loc1_;
         BindingManager.executeBindings(this,"infoAttraction",this.infoAttraction);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_VGroup2_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.bottom = 55;
         _loc1_.mxmlContent = [this._GameItemInfoPerspectives_VGroup3_i()];
         _loc1_.id = "_GameItemInfoPerspectives_VGroup2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_VGroup2 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_VGroup2",this._GameItemInfoPerspectives_VGroup2);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = -5;
         _loc1_.mxmlContent = [this._GameItemInfoPerspectives_RadioButton1_i(),this._GameItemInfoPerspectives_RadioButton2_i()];
         _loc1_.id = "_GameItemInfoPerspectives_HGroup1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_HGroup1 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_HGroup1",this._GameItemInfoPerspectives_HGroup1);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_RadioButton1_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 0;
         _loc1_.setStyle("skinClass",RadioButtonSexFemaleSkin);
         _loc1_.id = "_GameItemInfoPerspectives_RadioButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_RadioButton1 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_RadioButton1",this._GameItemInfoPerspectives_RadioButton1);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_RadioButton2_i() : RadioButton
      {
         var _loc1_:RadioButton = new RadioButton();
         _loc1_.value = 1;
         _loc1_.setStyle("skinClass",RadioButtonSexMaleSkin);
         _loc1_.id = "_GameItemInfoPerspectives_RadioButton2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GameItemInfoPerspectives_RadioButton2 = _loc1_;
         BindingManager.executeBindings(this,"_GameItemInfoPerspectives_RadioButton2",this._GameItemInfoPerspectives_RadioButton2);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.initialized(this,"animalBitmap");
         this.animalBitmap = _loc1_;
         BindingManager.executeBindings(this,"animalBitmap",this.animalBitmap);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_VGroup3_i() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._GameItemInfoPerspectives_LabelDisplay3_i(),this._GameItemInfoPerspectives_Button1_i()];
         _loc1_.id = "buyableGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buyableGroup = _loc1_;
         BindingManager.executeBindings(this,"buyableGroup",this.buyableGroup);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_LabelDisplay3_i() : LabelDisplay
      {
         var _loc1_:LabelDisplay = new LabelDisplay();
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",LabelDisplaySkin);
         _loc1_.id = "labelPrice";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelPrice = _loc1_;
         BindingManager.executeBindings(this,"labelPrice",this.labelPrice);
         return _loc1_;
      }
      
      private function _GameItemInfoPerspectives_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.visible = false;
         _loc1_.setStyle("skinClass",BuyButtonNormalSkin);
         _loc1_.id = "buttonBuy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonBuy = _loc1_;
         BindingManager.executeBindings(this,"buttonBuy",this.buttonBuy);
         return _loc1_;
      }
      
      public function ___GameItemInfoPerspectives_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init(param1);
      }
      
      private function _GameItemInfoPerspectives_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_GameItemInfoPerspectives_RadioButton1.group","sexGroup");
         _loc1_[1] = new Binding(this,null,null,"_GameItemInfoPerspectives_RadioButton2.group","sexGroup");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _GameItemInfoPerspectives_Group2() : Group
      {
         return this._1810610537_GameItemInfoPerspectives_Group2;
      }
      
      public function set _GameItemInfoPerspectives_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1810610537_GameItemInfoPerspectives_Group2;
         if(_loc2_ !== param1)
         {
            this._1810610537_GameItemInfoPerspectives_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GameItemInfoPerspectives_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GameItemInfoPerspectives_Group3() : Group
      {
         return this._1810610538_GameItemInfoPerspectives_Group3;
      }
      
      public function set _GameItemInfoPerspectives_Group3(param1:Group) : void
      {
         var _loc2_:Object = this._1810610538_GameItemInfoPerspectives_Group3;
         if(_loc2_ !== param1)
         {
            this._1810610538_GameItemInfoPerspectives_Group3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GameItemInfoPerspectives_Group3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GameItemInfoPerspectives_Group4() : Group
      {
         return this._1810610539_GameItemInfoPerspectives_Group4;
      }
      
      public function set _GameItemInfoPerspectives_Group4(param1:Group) : void
      {
         var _loc2_:Object = this._1810610539_GameItemInfoPerspectives_Group4;
         if(_loc2_ !== param1)
         {
            this._1810610539_GameItemInfoPerspectives_Group4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GameItemInfoPerspectives_Group4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GameItemInfoPerspectives_VGroup2() : VGroup
      {
         return this._506449773_GameItemInfoPerspectives_VGroup2;
      }
      
      public function set _GameItemInfoPerspectives_VGroup2(param1:VGroup) : void
      {
         var _loc2_:Object = this._506449773_GameItemInfoPerspectives_VGroup2;
         if(_loc2_ !== param1)
         {
            this._506449773_GameItemInfoPerspectives_VGroup2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GameItemInfoPerspectives_VGroup2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get animalBitmap() : BitmapImage
      {
         return this._1541930571animalBitmap;
      }
      
      public function set animalBitmap(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1541930571animalBitmap;
         if(_loc2_ !== param1)
         {
            this._1541930571animalBitmap = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"animalBitmap",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonBuy() : Button
      {
         return this._11549172buttonBuy;
      }
      
      public function set buttonBuy(param1:Button) : void
      {
         var _loc2_:Object = this._11549172buttonBuy;
         if(_loc2_ !== param1)
         {
            this._11549172buttonBuy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonBuy",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buyableGroup() : VGroup
      {
         return this._1761030527buyableGroup;
      }
      
      public function set buyableGroup(param1:VGroup) : void
      {
         var _loc2_:Object = this._1761030527buyableGroup;
         if(_loc2_ !== param1)
         {
            this._1761030527buyableGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buyableGroup",_loc2_,param1));
            }
         }
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
      public function get infoExoticness() : InfoDisplayExoticness
      {
         return this._740413033infoExoticness;
      }
      
      public function set infoExoticness(param1:InfoDisplayExoticness) : void
      {
         var _loc2_:Object = this._740413033infoExoticness;
         if(_loc2_ !== param1)
         {
            this._740413033infoExoticness = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoExoticness",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get labelClock() : LabelDisplay
      {
         return this._1675582086labelClock;
      }
      
      public function set labelClock(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1675582086labelClock;
         if(_loc2_ !== param1)
         {
            this._1675582086labelClock = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelClock",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelPrice() : LabelDisplay
      {
         return this._1663403339labelPrice;
      }
      
      public function set labelPrice(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._1663403339labelPrice;
         if(_loc2_ !== param1)
         {
            this._1663403339labelPrice = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelPrice",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelSpecialPerc() : LabelDisplay
      {
         return this._882846635labelSpecialPerc;
      }
      
      public function set labelSpecialPerc(param1:LabelDisplay) : void
      {
         var _loc2_:Object = this._882846635labelSpecialPerc;
         if(_loc2_ !== param1)
         {
            this._882846635labelSpecialPerc = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelSpecialPerc",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spriteContainer() : SpriteVisualElement
      {
         return this._1000556740spriteContainer;
      }
      
      public function set spriteContainer(param1:SpriteVisualElement) : void
      {
         var _loc2_:Object = this._1000556740spriteContainer;
         if(_loc2_ !== param1)
         {
            this._1000556740spriteContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spriteContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textMain() : StandardText
      {
         return this._1003855738textMain;
      }
      
      public function set textMain(param1:StandardText) : void
      {
         var _loc2_:Object = this._1003855738textMain;
         if(_loc2_ !== param1)
         {
            this._1003855738textMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textMain",_loc2_,param1));
            }
         }
      }
   }
}

