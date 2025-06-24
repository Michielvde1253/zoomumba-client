package fr.kapit.components
{
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
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
   import fr.kapit.assets.EmbeddedAssets;
   import fr.kapit.events.KapDebugEventDispatcher;
   import fr.kapit.introspection.events.InspectorActivatedEvent;
   import mx.binding.*;
   import mx.containers.HBox;
   import mx.containers.HDividedBox;
   import mx.controls.Image;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class PanelViewManager extends HBox implements IBindingClient
   {
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1733842446BothOff:Image;
      
      private var _1995593056BothOn:Image;
      
      private var _1928588983OneOff:Image;
      
      private var _76334789OneOn:Image;
      
      private var _1776833629TwoOff:Image;
      
      private var _81230123TwoOn:Image;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _firstChildWidth:int = -1;
      
      private var _currentStepInPanelView:int = 2;
      
      private var _inspectorActiveCount:int = 0;
      
      public var mainHBox:HDividedBox;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PanelViewManager()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "events":{"creationComplete":"___PanelViewManager_HBox1_creationComplete"},
            "stylesFactory":function():void
            {
               this.paddingTop = 0;
               this.horizontalGap = 3;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Image,
                  "id":"BothOn",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "buttonMode":true,
                        "useHandCursor":true,
                        "visible":false,
                        "includeInLayout":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"BothOff",
                  "events":{"click":"__BothOff_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "buttonMode":true,
                        "useHandCursor":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"OneOn",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "buttonMode":true,
                        "useHandCursor":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"OneOff",
                  "events":{"click":"__OneOff_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "buttonMode":true,
                        "useHandCursor":true,
                        "visible":false,
                        "includeInLayout":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"TwoOn",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "buttonMode":true,
                        "useHandCursor":true,
                        "visible":false,
                        "includeInLayout":false
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Image,
                  "id":"TwoOff",
                  "events":{"click":"__TwoOff_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "buttonMode":true,
                        "useHandCursor":true
                     };
                  }
               })]};
            }
         });
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._PanelViewManager_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_fr_kapit_components_PanelViewManagerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PanelViewManager[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.addEventListener("creationComplete",this.___PanelViewManager_HBox1_creationComplete);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PanelViewManager._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.paddingTop = 0;
            this.horizontalGap = 3;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function _onCreationComplete() : void
      {
         KapDebugEventDispatcher.instance.addEventListener(InspectorActivatedEvent.NAME,this._onInspectorActivated);
      }
      
      private function _onInspectorActivated(param1:InspectorActivatedEvent) : void
      {
         if(this._inspectorActiveCount == 0)
         {
            this._inspectorActiveCount = 1;
            return;
         }
         this._onClickOnBoth();
      }
      
      public function shortcutHandler(param1:KeyboardEvent) : void
      {
         if(this._firstChildWidth == -1)
         {
            return;
         }
         this._currentStepInPanelView += param1.keyCode == 123 ? -1 : 1;
         if(this._currentStepInPanelView == 4)
         {
            this._currentStepInPanelView = 1;
         }
         if(this._currentStepInPanelView == 0)
         {
            this._currentStepInPanelView = 3;
         }
         switch(this._currentStepInPanelView)
         {
            case 1:
               this._onClickOnBoth();
               break;
            case 2:
               this._onClickOnLeft();
               break;
            case 3:
               this._onClickOnRight();
         }
      }
      
      public function followResize() : void
      {
         this.mainHBox.getChildAt(0).width = this.mainHBox.parent.width - 10;
      }
      
      private function _onClickOnRight() : void
      {
         if(this.TwoOn.visible)
         {
            return;
         }
         if(this._firstChildWidth == 0)
         {
            this._firstChildWidth = this.mainHBox.getChildAt(0).width;
         }
         this._currentStepInPanelView = 3;
         this.mainHBox.getChildAt(0).width = 0;
         this.TwoOn.visible = this.TwoOn.includeInLayout = true;
         this.TwoOff.visible = this.TwoOff.includeInLayout = false;
         this.BothOn.visible = this.OneOn.visible = false;
         this.BothOn.includeInLayout = this.OneOn.includeInLayout = false;
         this.BothOff.visible = this.OneOff.visible = true;
         this.BothOff.includeInLayout = this.OneOff.includeInLayout = true;
      }
      
      private function _onClickOnLeft() : void
      {
         if(this.OneOn.visible)
         {
            return;
         }
         if(this._firstChildWidth == 0)
         {
            this._firstChildWidth = this.mainHBox.getChildAt(0).width;
         }
         this._currentStepInPanelView = 2;
         this.mainHBox.getChildAt(0).width = this.mainHBox.parent.width - 10;
         this.OneOn.visible = this.OneOn.includeInLayout = true;
         this.OneOff.visible = this.OneOff.includeInLayout = false;
         this.BothOn.visible = this.TwoOn.visible = false;
         this.BothOn.includeInLayout = this.TwoOn.includeInLayout = false;
         this.BothOff.visible = this.TwoOff.visible = true;
         this.BothOff.includeInLayout = this.TwoOff.includeInLayout = true;
      }
      
      private function _onClickOnBoth() : void
      {
         if(this.BothOn.visible)
         {
            return;
         }
         this._currentStepInPanelView = 1;
         if(this._firstChildWidth == -1)
         {
            this._firstChildWidth = 300;
         }
         this.mainHBox.getChildAt(0).width = this._firstChildWidth;
         this.mainHBox.getChildAt(1).width = this.mainHBox.parent.width - this._firstChildWidth;
         this._firstChildWidth = 0;
         this.BothOn.visible = this.BothOn.includeInLayout = true;
         this.BothOff.visible = this.BothOff.includeInLayout = false;
         this.TwoOn.visible = this.OneOn.visible = false;
         this.TwoOn.includeInLayout = this.OneOn.includeInLayout = false;
         this.TwoOff.visible = this.OneOff.visible = true;
         this.TwoOff.includeInLayout = this.OneOff.includeInLayout = true;
      }
      
      public function ___PanelViewManager_HBox1_creationComplete(param1:FlexEvent) : void
      {
         this._onCreationComplete();
      }
      
      public function __BothOff_click(param1:MouseEvent) : void
      {
         this._onClickOnBoth();
      }
      
      public function __OneOff_click(param1:MouseEvent) : void
      {
         this._onClickOnLeft();
      }
      
      public function __TwoOff_click(param1:MouseEvent) : void
      {
         this._onClickOnRight();
      }
      
      private function _PanelViewManager_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconWindowBothOn;
         },null,"BothOn.source");
         result[1] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconWindowBothOff;
         },null,"BothOff.source");
         result[2] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconWindowOneOn;
         },null,"OneOn.source");
         result[3] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconWindowOneOff;
         },null,"OneOff.source");
         result[4] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconWindowTwoOn;
         },null,"TwoOn.source");
         result[5] = new Binding(this,function():Object
         {
            return EmbeddedAssets.iconWindowTwoOff;
         },null,"TwoOff.source");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get BothOff() : Image
      {
         return this._1733842446BothOff;
      }
      
      public function set BothOff(param1:Image) : void
      {
         var _loc2_:Object = this._1733842446BothOff;
         if(_loc2_ !== param1)
         {
            this._1733842446BothOff = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"BothOff",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get BothOn() : Image
      {
         return this._1995593056BothOn;
      }
      
      public function set BothOn(param1:Image) : void
      {
         var _loc2_:Object = this._1995593056BothOn;
         if(_loc2_ !== param1)
         {
            this._1995593056BothOn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"BothOn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get OneOff() : Image
      {
         return this._1928588983OneOff;
      }
      
      public function set OneOff(param1:Image) : void
      {
         var _loc2_:Object = this._1928588983OneOff;
         if(_loc2_ !== param1)
         {
            this._1928588983OneOff = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"OneOff",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get OneOn() : Image
      {
         return this._76334789OneOn;
      }
      
      public function set OneOn(param1:Image) : void
      {
         var _loc2_:Object = this._76334789OneOn;
         if(_loc2_ !== param1)
         {
            this._76334789OneOn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"OneOn",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get TwoOff() : Image
      {
         return this._1776833629TwoOff;
      }
      
      public function set TwoOff(param1:Image) : void
      {
         var _loc2_:Object = this._1776833629TwoOff;
         if(_loc2_ !== param1)
         {
            this._1776833629TwoOff = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"TwoOff",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get TwoOn() : Image
      {
         return this._81230123TwoOn;
      }
      
      public function set TwoOn(param1:Image) : void
      {
         var _loc2_:Object = this._81230123TwoOn;
         if(_loc2_ !== param1)
         {
            this._81230123TwoOn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"TwoOn",_loc2_,param1));
            }
         }
      }
   }
}

