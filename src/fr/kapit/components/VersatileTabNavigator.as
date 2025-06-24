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
   import flexlib.containers.SuperTabNavigator;
   import flexlib.events.SuperTabEvent;
   import fr.kapit.event.SuperTabNavigatorTabChangeEvent;
   import mx.binding.*;
   import mx.containers.VBox;
   import mx.core.Container;
   import mx.core.IFlexModuleFactory;
   import mx.core.INavigatorContent;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.FlexEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class VersatileTabNavigator extends VBox
   {
      private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({"type":VBox});
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _nav:SuperTabNavigator;
      
      private var _navigatorChildren:Array = [];
      
      private var reparentedChild:Container;
      
      mx_internal var _VersatileTabNavigator_StylesInit_done:Boolean = false;
      
      public function VersatileTabNavigator()
      {
         super();
         mx_internal::_document = this;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         mx_internal::_VersatileTabNavigator_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set selectedChild(param1:Object) : void
      {
         if(Boolean(this._nav) && param1.parent == this._nav)
         {
            this._nav.selectedChild = param1 as INavigatorContent;
         }
      }
      
      public function get selectedChild() : Object
      {
         if(this._nav)
         {
            return this._nav.selectedChild;
         }
         return Container(getChildAt(0));
      }
      
      public function getNavigatorChildAt(param1:int) : DisplayObject
      {
         var _loc2_:Array = null;
         if(this._nav)
         {
            _loc2_ = this._nav.getChildren();
            return this._nav.getChildAt(param1);
         }
         return null;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(this._nav)
         {
            this._nav.selectedIndex = param1;
         }
      }
      
      public function get selectedIndex() : int
      {
         if(this._nav)
         {
            return this._nav.selectedIndex;
         }
         return 0;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return this._doAddChild(param1);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         return this._removeChild(param1);
      }
      
      public function get allChildren() : Array
      {
         if(this._nav)
         {
            return this._nav.getChildren();
         }
         if(getChildren().length != 0)
         {
            return [getChildAt(0)];
         }
         return [];
      }
      
      public function get childCount() : int
      {
         return this.allChildren.length;
      }
      
      private function _createNavigator(param1:UIComponent) : void
      {
         var _loc2_:UIComponent = getChildAt(0) as UIComponent;
         super.removeChildAt(0);
         this._navigatorChildren.push(_loc2_);
         this._navigatorChildren.push(param1);
         this._nav = new SuperTabNavigator();
         this._nav.percentHeight = 100;
         this._nav.percentWidth = 100;
         this._nav.allowTabSqueezing = false;
         this._nav.scrollSpeed = 20;
         this._nav.dragEnabled = true;
         this._nav.dropEnabled = true;
         this._nav.addEventListener(SuperTabEvent.TAB_CLOSE,this.onTabClose);
         this._nav.addEventListener(Event.CHANGE,this.onTabChange);
         this._nav.addEventListener(FlexEvent.CREATION_COMPLETE,this.onNavComplete);
         this._nav.styleName = "kapInspectTabNavigator";
         super.addChild(this._nav);
      }
      
      private function _doAddChild(param1:DisplayObject, param2:int = -1) : DisplayObject
      {
         var _loc3_:DisplayObject = param1;
         var _loc4_:Array = getChildren();
         var _loc5_:UIComponent = UIComponent(param1);
         _loc5_.percentHeight = 100;
         _loc5_.percentWidth = 100;
         if(_loc4_ == null || _loc4_.length == 0)
         {
            super.addChild(param1);
         }
         else if(_loc4_.length == 1)
         {
            if(!this._nav)
            {
               this._createNavigator(_loc5_);
               _loc3_ = this._nav;
            }
            else
            {
               this._nav.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,this.onTabAdded);
               if(param2 == -1)
               {
                  this._nav.addChild(_loc5_);
               }
               else
               {
                  this._nav.addChildAt(_loc5_,param2);
               }
            }
         }
         _loc4_ = getChildren();
         return _loc3_;
      }
      
      private function _removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = null;
         if(this._nav == null)
         {
            _loc2_ = super.removeChild(param1);
         }
         else
         {
            this._nav.removeChild(param1);
            if(this._nav.getChildren().length == 1)
            {
               this.reparentedChild = Container(this._nav.getChildAt(0));
               this._nav.removeChildAt(0);
               super.removeChild(this._nav);
               this._nav = null;
               this.addChild(this.reparentedChild);
               this.reparentedChild.visible = true;
               this.reparentedChild = null;
               visible = true;
            }
         }
         var _loc3_:Array = getChildren();
         return _loc2_;
      }
      
      private function onNavComplete(param1:Event) : void
      {
         this._nav.removeEventListener(FlexEvent.CREATION_COMPLETE,this.onNavComplete);
         this._nav.addChild(Container(this._navigatorChildren[0]));
         this._nav.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,this.onTabAdded);
         this._nav.addChild(Container(this._navigatorChildren[1]));
         this._navigatorChildren.splice(0,2);
      }
      
      private function onTabClose(param1:SuperTabEvent) : void
      {
         this._removeChild(this._nav.getChildAt(param1.tabIndex));
         param1.preventDefault();
      }
      
      private function onTabChange(param1:Event) : void
      {
         var _loc2_:IKapDebugComponent = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:SuperTabNavigatorTabChangeEvent = null;
         var _loc5_:InspectorTabs = null;
         if(this._nav.selectedChild is InspectorTabs)
         {
            if(this._nav.selectedChild)
            {
               _loc5_ = InspectorTabs(this._nav.selectedChild);
               if(_loc5_.selectedChild)
               {
                  _loc2_ = IKapDebugComponent(_loc5_.selectedChild);
               }
            }
            _loc3_ = (this._nav.selectedChild as InspectorTabs).target as DisplayObject;
            _loc4_ = new SuperTabNavigatorTabChangeEvent(_loc3_,_loc2_);
            dispatchEvent(_loc4_);
         }
      }
      
      private function onTabAdded(param1:ChildExistenceChangedEvent) : void
      {
         this._nav.removeEventListener(ChildExistenceChangedEvent.CHILD_ADD,this.onTabAdded);
         this._nav.selectedChild = Container(param1.relatedObject);
         commitProperties();
         invalidateDisplayList();
         callLater(this._selectLastTab);
      }
      
      private function _selectLastTab() : void
      {
         this._nav.selectedIndex = this._nav.getChildren().length - 1;
      }
      
      mx_internal function _VersatileTabNavigator_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_VersatileTabNavigator_StylesInit_done)
         {
            return;
         }
         mx_internal::_VersatileTabNavigator_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","kapInspectTabNavigator");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".kapInspectTabNavigator");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 11187123;
               this.backgroundColor = 16777215;
               this.cornerRadius = 0;
               this.tabHeight = 22;
               this.horizontalAlign = "left";
               this.textIndent = 0;
               this.paddingLeft = 0;
               this.backgroundAlpha = 1;
               this.paddingRight = 0;
               this.dropShadowEnabled = false;
               this.color = 734012;
               this.borderThickness = 1;
               this.horizontalGap = -1;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","myTabs");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".myTabs");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderColor = 12172478;
               this.letterSpacing = 0;
               this.backgroundColor = 16777215;
               this.cornerRadius = 4;
               this.textRollOverColor = 734012;
               this.fontSize = 11;
               this.fillAlphas = [0.6,0.4];
               this.backgroundAlpha = 1;
               this.themeColor = 40447;
               this.fontWeight = "normal";
               this.color = 734012;
               this.highlightAlphas = [0.3,0];
               this.textAlign = "center";
               this.fontFamily = "Verdana";
               this.fillColors = [16777215,13421772];
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","mySelectedTabs");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".mySelectedTabs");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontWeight = "normal";
               this.color = 734012;
               this.letterSpacing = 0;
               this.textAlign = "center";
               this.textRollOverColor = 734012;
               this.fontFamily = "Verdana";
               this.fontSize = 11;
            };
         }
      }
   }
}

