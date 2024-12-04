package custom.mainInterface.genericUI
{
   import buttons.simpleButton.MinimizeButtonSkin;
   import com.greensock.TweenMax;
   import components.image.BackgroundImage;
   import components.image.CircularDisplayImage;
   import custom.generic.GenericCircularCounter;
   import custom.mainInterface.genericUI.events.GenericGUIEvent;
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
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetEventHandler;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.Ellipse;
   
   use namespace mx_internal;
   
   public class GenericEventUI extends Group implements IBindingClient, IStateClient2
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public var _GenericEventUI_Button1:Button;
      
      private var _651102404_GenericEventUI_Ellipse1:Ellipse;
      
      private var _1791829756_GenericEventUI_Group2:Group;
      
      private var _264312477_GenericEventUI_SetProperty1:SetProperty;
      
      private var _264312476_GenericEventUI_SetProperty2:SetProperty;
      
      private var _264312475_GenericEventUI_SetProperty3:SetProperty;
      
      private var _264312474_GenericEventUI_SetProperty4:SetProperty;
      
      private var _264312473_GenericEventUI_SetProperty5:SetProperty;
      
      private var _264312472_GenericEventUI_SetProperty6:SetProperty;
      
      private var _264312471_GenericEventUI_SetProperty7:SetProperty;
      
      private var _264312470_GenericEventUI_SetProperty8:SetProperty;
      
      private var _914540639displayImg:CircularDisplayImage;
      
      private var _1312743506extraButtonsGroup:Group;
      
      private var _1110650414hitContainer:Group;
      
      private var _701444433imgBackground:BackgroundImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _746987914mainButtonEnabled:Boolean = true;
      
      private var _706354361imgScale:Number = 1;
      
      private var _2042260126minimizedXPos:int = 75;
      
      private var _2042230335minimizedYPos:int = -7;
      
      private var _810915913bitmapDisplayPosX:int = 0;
      
      private var _810915912bitmapDisplayPosY:int = 0;
      
      private var _dicButtons:Dictionary;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function GenericEventUI()
      {
         var bindings:Array;
         var watchers:Array;
         var _GenericEventUI_Button1_factory:DeferredInstanceFromFunction;
         var i:uint;
         var target:Object = null;
         var _GenericEventUI_Group4_factory:DeferredInstanceFromFunction = null;
         var watcherSetupUtilClass:Object = null;
         this._dicButtons = new Dictionary();
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         bindings = this._GenericEventUI_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_custom_mainInterface_genericUI_GenericEventUIWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return GenericEventUI[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseEnabled = false;
         this.maxWidth = 100;
         this.maxHeight = 100;
         this.mxmlContent = [this._GenericEventUI_Group2_i(),this._GenericEventUI_Group3_i()];
         this.currentState = "up";
         this.addEventListener("creationComplete",this.___GenericEventUI_Group1_creationComplete);
         _GenericEventUI_Button1_factory = new DeferredInstanceFromFunction(this._GenericEventUI_Button1_i);
         _GenericEventUI_Group4_factory = new DeferredInstanceFromFunction(this._GenericEventUI_Group4_i);
         states = [new State({
            "name":"up",
            "stateGroups":["big"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Group4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseOver",
               "handlerFunction":this.__hitContainer_mouseOver_big
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseOut",
               "handlerFunction":this.__hitContainer_mouseOut_big
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"click",
               "handlerFunction":this.__hitContainer_click_big
            })]
         }),new State({
            "name":"over",
            "stateGroups":["big"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Group4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseOver",
               "handlerFunction":this.__hitContainer_mouseOver_big
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseOut",
               "handlerFunction":this.__hitContainer_mouseOut_big
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"click",
               "handlerFunction":this.__hitContainer_click_big
            })]
         }),new State({
            "name":"down",
            "stateGroups":["big"],
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Group4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseOver",
               "handlerFunction":this.__hitContainer_mouseOver_big
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseOut",
               "handlerFunction":this.__hitContainer_mouseOut_big
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"click",
               "handlerFunction":this.__hitContainer_click_big
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Group4_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_GenericEventUI_Button1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["hitContainer"]
            })]
         }),new State({
            "name":"minimized",
            "overrides":[this._GenericEventUI_SetProperty1 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_GenericEventUI_Group2",
               "name":"scaleX",
               "value":undefined
            })),this._GenericEventUI_SetProperty2 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_GenericEventUI_Group2",
               "name":"scaleY",
               "value":undefined
            })),this._GenericEventUI_SetProperty3 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_GenericEventUI_Group2",
               "name":"x",
               "value":undefined
            })),this._GenericEventUI_SetProperty4 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_GenericEventUI_Group2",
               "name":"y",
               "value":undefined
            })),this._GenericEventUI_SetProperty5 = SetProperty(new SetProperty().initializeFromObject({
               "target":"hitContainer",
               "name":"x",
               "value":undefined
            })),this._GenericEventUI_SetProperty6 = SetProperty(new SetProperty().initializeFromObject({
               "target":"hitContainer",
               "name":"y",
               "value":undefined
            })),new SetProperty().initializeFromObject({
               "target":"hitContainer",
               "name":"mouseEnabled",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"hitContainer",
               "name":"buttonMode",
               "value":true
            }),new SetEventHandler().initializeFromObject({
               "target":"hitContainer",
               "name":"click",
               "handlerFunction":this.__hitContainer_click_minimized
            }),this._GenericEventUI_SetProperty7 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_GenericEventUI_Ellipse1",
               "name":"scaleX",
               "value":undefined
            })),this._GenericEventUI_SetProperty8 = SetProperty(new SetProperty().initializeFromObject({
               "target":"_GenericEventUI_Ellipse1",
               "name":"scaleY",
               "value":undefined
            }))]
         })];
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty1",this._GenericEventUI_SetProperty1);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty2",this._GenericEventUI_SetProperty2);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty3",this._GenericEventUI_SetProperty3);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty4",this._GenericEventUI_SetProperty4);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty5",this._GenericEventUI_SetProperty5);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty6",this._GenericEventUI_SetProperty6);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty7",this._GenericEventUI_SetProperty7);
         BindingManager.executeBindings(this,"_GenericEventUI_SetProperty8",this._GenericEventUI_SetProperty8);
         _GenericEventUI_Group4_factory.getInstance();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         GenericEventUI._watcherSetupUtil = param1;
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
      }
      
      protected function mouseHandler(param1:MouseEvent) : void
      {
         if(currentState != "minimized" && currentState != "disabled" && this.mainButtonEnabled)
         {
            switch(param1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  TweenMax.to(this.displayImg,0.2,{"bitmapDisplayScale":1.1});
                  currentState = "over";
                  break;
               case MouseEvent.MOUSE_OUT:
                  TweenMax.to(this.displayImg,0.2,{"bitmapDisplayScale":1});
                  currentState = "up";
                  break;
               case MouseEvent.CLICK:
                  currentState = "down";
                  dispatchEvent(new GenericGUIEvent(GenericGUIEvent.MAIN_CLICKED));
            }
         }
      }
      
      public function minimize() : void
      {
         this.imgScale = 0.34;
         currentState = "minimized";
         dispatchEvent(new GenericGUIEvent(GenericGUIEvent.MINIMIZED));
      }
      
      public function maximize() : void
      {
         this.imgScale = 1;
         currentState = "up";
         dispatchEvent(new GenericGUIEvent(GenericGUIEvent.MAXIMIZED));
      }
      
      protected function minimizeArea_clickHandler(param1:MouseEvent) : void
      {
         if(currentState == "minimized")
         {
            this.maximize();
         }
         else
         {
            this.minimize();
         }
      }
      
      public function getButton(param1:String) : GenericCircularCounter
      {
         if(param1 in this._dicButtons)
         {
            return this._dicButtons[param1];
         }
         return null;
      }
      
      public function addButton(param1:String) : GenericCircularCounter
      {
         this._dicButtons[param1] = new GenericCircularCounter();
         (this._dicButtons[param1] as GenericCircularCounter).id = param1;
         (this._dicButtons[param1] as GenericCircularCounter).addEventListener(MouseEvent.CLICK,this.buttonClicked);
         this.extraButtonsGroup.addElement(this._dicButtons[param1]);
         return this._dicButtons[param1];
      }
      
      private function buttonClicked(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         dispatchEvent(new GenericGUIEvent(GenericGUIEvent.BUTTON_CLICKED,(param1.currentTarget as GenericCircularCounter).id));
      }
      
      public function removeButton(param1:String) : void
      {
         if(param1 != null)
         {
            if(param1 in this._dicButtons)
            {
               this.getButton(param1).removeEventListener(MouseEvent.CLICK,this.buttonClicked);
               this.extraButtonsGroup.removeElement(this.getButton(param1));
               this._dicButtons[param1] = null;
            }
         }
      }
      
      public function __hitContainer_mouseOver_big(param1:MouseEvent) : void
      {
         this.mouseHandler(param1);
      }
      
      public function __hitContainer_mouseOut_big(param1:MouseEvent) : void
      {
         this.mouseHandler(param1);
      }
      
      public function __hitContainer_click_big(param1:MouseEvent) : void
      {
         this.mouseHandler(param1);
      }
      
      public function __hitContainer_click_minimized(param1:MouseEvent) : void
      {
         this.minimizeArea_clickHandler(param1);
      }
      
      private function _GenericEventUI_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 4;
         _loc1_.y = 4;
         _loc1_.mxmlContent = [this._GenericEventUI_BackgroundImage1_i(),this._GenericEventUI_CircularDisplayImage1_i()];
         _loc1_.id = "_GenericEventUI_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GenericEventUI_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_GenericEventUI_Group2",this._GenericEventUI_Group2);
         return _loc1_;
      }
      
      private function _GenericEventUI_BackgroundImage1_i() : BackgroundImage
      {
         var _loc1_:BackgroundImage = new BackgroundImage();
         _loc1_.id = "imgBackground";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imgBackground = _loc1_;
         BindingManager.executeBindings(this,"imgBackground",this.imgBackground);
         return _loc1_;
      }
      
      private function _GenericEventUI_CircularDisplayImage1_i() : CircularDisplayImage
      {
         var _loc1_:CircularDisplayImage = new CircularDisplayImage();
         _loc1_.currentState = "maskCombined";
         _loc1_.id = "displayImg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.displayImg = _loc1_;
         BindingManager.executeBindings(this,"displayImg",this.displayImg);
         return _loc1_;
      }
      
      private function _GenericEventUI_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._GenericEventUI_Ellipse1_i()];
         _loc1_.id = "hitContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hitContainer = _loc1_;
         BindingManager.executeBindings(this,"hitContainer",this.hitContainer);
         return _loc1_;
      }
      
      private function _GenericEventUI_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.fill = this._GenericEventUI_SolidColor1_c();
         _loc1_.initialized(this,"_GenericEventUI_Ellipse1");
         this._GenericEventUI_Ellipse1 = _loc1_;
         BindingManager.executeBindings(this,"_GenericEventUI_Ellipse1",this._GenericEventUI_Ellipse1);
         return _loc1_;
      }
      
      private function _GenericEventUI_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711680;
         _loc1_.alpha = 0;
         BindingManager.executeBindings(this,"temp",_loc1_);
         return _loc1_;
      }
      
      private function _GenericEventUI_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",MinimizeButtonSkin);
         _loc1_.addEventListener("click",this.___GenericEventUI_Button1_click);
         _loc1_.id = "_GenericEventUI_Button1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._GenericEventUI_Button1 = _loc1_;
         BindingManager.executeBindings(this,"_GenericEventUI_Button1",this._GenericEventUI_Button1);
         return _loc1_;
      }
      
      public function ___GenericEventUI_Button1_click(param1:MouseEvent) : void
      {
         this.minimizeArea_clickHandler(param1);
      }
      
      private function _GenericEventUI_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.x = 52;
         _loc1_.y = 52;
         _loc1_.id = "extraButtonsGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.extraButtonsGroup = _loc1_;
         BindingManager.executeBindings(this,"extraButtonsGroup",this.extraButtonsGroup);
         return _loc1_;
      }
      
      public function ___GenericEventUI_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.config(param1);
      }
      
      private function _GenericEventUI_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():*
         {
            return imgScale;
         },null,"_GenericEventUI_SetProperty1.value");
         result[1] = new Binding(this,function():*
         {
            return imgScale;
         },null,"_GenericEventUI_SetProperty2.value");
         result[2] = new Binding(this,function():*
         {
            return minimizedXPos - 4;
         },null,"_GenericEventUI_SetProperty3.value");
         result[3] = new Binding(this,function():*
         {
            return minimizedYPos - 4;
         },null,"_GenericEventUI_SetProperty4.value");
         result[4] = new Binding(this,null,null,"displayImg.paddingDisplayX","bitmapDisplayPosX");
         result[5] = new Binding(this,null,null,"displayImg.paddingDisplayY","bitmapDisplayPosY");
         result[6] = new Binding(this,function():*
         {
            return minimizedXPos + 2;
         },null,"_GenericEventUI_SetProperty5.value");
         result[7] = new Binding(this,function():*
         {
            return minimizedYPos;
         },null,"_GenericEventUI_SetProperty6.value");
         result[8] = new Binding(this,null,null,"hitContainer.mouseEnabled","mainButtonEnabled");
         result[9] = new Binding(this,null,null,"hitContainer.buttonMode","mainButtonEnabled");
         result[10] = new Binding(this,function():Number
         {
            return imgBackground.width;
         },null,"_GenericEventUI_Ellipse1.width");
         result[11] = new Binding(this,function():Number
         {
            return imgBackground.height;
         },null,"_GenericEventUI_Ellipse1.height");
         result[12] = new Binding(this,function():*
         {
            return imgScale;
         },null,"_GenericEventUI_SetProperty7.value");
         result[13] = new Binding(this,function():*
         {
            return imgScale;
         },null,"_GenericEventUI_SetProperty8.value");
         result[14] = new Binding(this,function():Number
         {
            return minimizedXPos;
         },null,"_GenericEventUI_Button1.x");
         result[15] = new Binding(this,function():Number
         {
            return minimizedYPos;
         },null,"_GenericEventUI_Button1.y");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_Ellipse1() : Ellipse
      {
         return this._651102404_GenericEventUI_Ellipse1;
      }
      
      public function set _GenericEventUI_Ellipse1(param1:Ellipse) : void
      {
         var _loc2_:Object = this._651102404_GenericEventUI_Ellipse1;
         if(_loc2_ !== param1)
         {
            this._651102404_GenericEventUI_Ellipse1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_Ellipse1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_Group2() : Group
      {
         return this._1791829756_GenericEventUI_Group2;
      }
      
      public function set _GenericEventUI_Group2(param1:Group) : void
      {
         var _loc2_:Object = this._1791829756_GenericEventUI_Group2;
         if(_loc2_ !== param1)
         {
            this._1791829756_GenericEventUI_Group2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_Group2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty1() : SetProperty
      {
         return this._264312477_GenericEventUI_SetProperty1;
      }
      
      public function set _GenericEventUI_SetProperty1(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312477_GenericEventUI_SetProperty1;
         if(_loc2_ !== param1)
         {
            this._264312477_GenericEventUI_SetProperty1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty2() : SetProperty
      {
         return this._264312476_GenericEventUI_SetProperty2;
      }
      
      public function set _GenericEventUI_SetProperty2(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312476_GenericEventUI_SetProperty2;
         if(_loc2_ !== param1)
         {
            this._264312476_GenericEventUI_SetProperty2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty3() : SetProperty
      {
         return this._264312475_GenericEventUI_SetProperty3;
      }
      
      public function set _GenericEventUI_SetProperty3(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312475_GenericEventUI_SetProperty3;
         if(_loc2_ !== param1)
         {
            this._264312475_GenericEventUI_SetProperty3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty4() : SetProperty
      {
         return this._264312474_GenericEventUI_SetProperty4;
      }
      
      public function set _GenericEventUI_SetProperty4(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312474_GenericEventUI_SetProperty4;
         if(_loc2_ !== param1)
         {
            this._264312474_GenericEventUI_SetProperty4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty5() : SetProperty
      {
         return this._264312473_GenericEventUI_SetProperty5;
      }
      
      public function set _GenericEventUI_SetProperty5(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312473_GenericEventUI_SetProperty5;
         if(_loc2_ !== param1)
         {
            this._264312473_GenericEventUI_SetProperty5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty6() : SetProperty
      {
         return this._264312472_GenericEventUI_SetProperty6;
      }
      
      public function set _GenericEventUI_SetProperty6(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312472_GenericEventUI_SetProperty6;
         if(_loc2_ !== param1)
         {
            this._264312472_GenericEventUI_SetProperty6 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty6",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty7() : SetProperty
      {
         return this._264312471_GenericEventUI_SetProperty7;
      }
      
      public function set _GenericEventUI_SetProperty7(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312471_GenericEventUI_SetProperty7;
         if(_loc2_ !== param1)
         {
            this._264312471_GenericEventUI_SetProperty7 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty7",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _GenericEventUI_SetProperty8() : SetProperty
      {
         return this._264312470_GenericEventUI_SetProperty8;
      }
      
      public function set _GenericEventUI_SetProperty8(param1:SetProperty) : void
      {
         var _loc2_:Object = this._264312470_GenericEventUI_SetProperty8;
         if(_loc2_ !== param1)
         {
            this._264312470_GenericEventUI_SetProperty8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_GenericEventUI_SetProperty8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get displayImg() : CircularDisplayImage
      {
         return this._914540639displayImg;
      }
      
      public function set displayImg(param1:CircularDisplayImage) : void
      {
         var _loc2_:Object = this._914540639displayImg;
         if(_loc2_ !== param1)
         {
            this._914540639displayImg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayImg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get extraButtonsGroup() : Group
      {
         return this._1312743506extraButtonsGroup;
      }
      
      public function set extraButtonsGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1312743506extraButtonsGroup;
         if(_loc2_ !== param1)
         {
            this._1312743506extraButtonsGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"extraButtonsGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hitContainer() : Group
      {
         return this._1110650414hitContainer;
      }
      
      public function set hitContainer(param1:Group) : void
      {
         var _loc2_:Object = this._1110650414hitContainer;
         if(_loc2_ !== param1)
         {
            this._1110650414hitContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hitContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imgBackground() : BackgroundImage
      {
         return this._701444433imgBackground;
      }
      
      public function set imgBackground(param1:BackgroundImage) : void
      {
         var _loc2_:Object = this._701444433imgBackground;
         if(_loc2_ !== param1)
         {
            this._701444433imgBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imgBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainButtonEnabled() : Boolean
      {
         return this._746987914mainButtonEnabled;
      }
      
      public function set mainButtonEnabled(param1:Boolean) : void
      {
         var _loc2_:Object = this._746987914mainButtonEnabled;
         if(_loc2_ !== param1)
         {
            this._746987914mainButtonEnabled = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainButtonEnabled",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get imgScale() : Number
      {
         return this._706354361imgScale;
      }
      
      private function set imgScale(param1:Number) : void
      {
         var _loc2_:Object = this._706354361imgScale;
         if(_loc2_ !== param1)
         {
            this._706354361imgScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imgScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get minimizedXPos() : int
      {
         return this._2042260126minimizedXPos;
      }
      
      private function set minimizedXPos(param1:int) : void
      {
         var _loc2_:Object = this._2042260126minimizedXPos;
         if(_loc2_ !== param1)
         {
            this._2042260126minimizedXPos = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"minimizedXPos",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get minimizedYPos() : int
      {
         return this._2042230335minimizedYPos;
      }
      
      private function set minimizedYPos(param1:int) : void
      {
         var _loc2_:Object = this._2042230335minimizedYPos;
         if(_loc2_ !== param1)
         {
            this._2042230335minimizedYPos = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"minimizedYPos",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapDisplayPosX() : int
      {
         return this._810915913bitmapDisplayPosX;
      }
      
      public function set bitmapDisplayPosX(param1:int) : void
      {
         var _loc2_:Object = this._810915913bitmapDisplayPosX;
         if(_loc2_ !== param1)
         {
            this._810915913bitmapDisplayPosX = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapDisplayPosX",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bitmapDisplayPosY() : int
      {
         return this._810915912bitmapDisplayPosY;
      }
      
      public function set bitmapDisplayPosY(param1:int) : void
      {
         var _loc2_:Object = this._810915912bitmapDisplayPosY;
         if(_loc2_ !== param1)
         {
            this._810915912bitmapDisplayPosY = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bitmapDisplayPosY",_loc2_,param1));
            }
         }
      }
   }
}

