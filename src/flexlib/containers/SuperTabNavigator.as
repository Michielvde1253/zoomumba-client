package flexlib.containers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flexlib.controls.SuperTabBar;
   import flexlib.controls.tabBarClasses.SuperTab;
   import flexlib.events.SuperTabEvent;
   import flexlib.events.TabReorderEvent;
   import flexlib.skins.TabPopUpButtonSkin;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.containers.Box;
   import mx.containers.BoxDirection;
   import mx.containers.Canvas;
   import mx.containers.TabNavigator;
   import mx.containers.ViewStack;
   import mx.controls.Menu;
   import mx.controls.PopUpButton;
   import mx.core.Container;
   import mx.core.EdgeMetrics;
   import mx.core.ScrollPolicy;
   import mx.effects.Tween;
   import mx.events.ChildExistenceChangedEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.MenuEvent;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class SuperTabNavigator extends TabNavigator
   {
      public static var POPUPPOLICY_AUTO:String = "auto";
      
      public static var POPUPPOLICY_ON:String = "on";
      
      public static var POPUPPOLICY_OFF:String = "off";
      
      private static var DEFAULT_INDICATOR:Class = SuperTabNavigator_DEFAULT_INDICATOR;
      
      private static var DEFAULT_CLOSE_UP:Class = SuperTabNavigator_DEFAULT_CLOSE_UP;
      
      private static var DEFAULT_CLOSE_OVER:Class = SuperTabNavigator_DEFAULT_CLOSE_OVER;
      
      private static var DEFAULT_CLOSE_DOWN:Class = SuperTabNavigator_DEFAULT_CLOSE_DOWN;
      
      private static var DEFAULT_CLOSE_DISABLED:Class = SuperTabNavigator_DEFAULT_CLOSE_DISABLED;
      
      private static var DEFAULT_LEFT_BUTTON:Class = SuperTabNavigator_DEFAULT_LEFT_BUTTON;
      
      private static var DEFAULT_RIGHT_BUTTON:Class = SuperTabNavigator_DEFAULT_RIGHT_BUTTON;
      
      initializeStyles();
      
      private var stopIndexChangeEvent:Boolean = false;
      
      protected var holder:Box;
      
      protected var canvas:ButtonScrollingCanvas;
      
      protected var popupButton:PopUpButton;
      
      protected var menu:Menu;
      
      private var forcedTabWidth:Number = -1;
      
      private var originalTabWidthStyle:Number = -1;
      
      private var _minTabWidth:Number = 60;
      
      private var _popUpButtonPolicy:String;
      
      private var _startScrollingEvent:String = "mouseDown";
      
      private var _stopScrollingEvent:String = "mouseUp";
      
      private var _scrollSpeed:Number = 100;
      
      private var _dragEnabled:Boolean = true;
      
      private var _dropEnabled:Boolean = true;
      
      private var _editableTabLabels:Boolean = false;
      
      private var _allowTabSqueezing:Boolean = true;
      
      private var _closePolicy:String = "close_rollover";
      
      public function SuperTabNavigator()
      {
         super();
      }
      
      private static function initializeStyles() : void
      {
         var popupButtonStyleName:String;
         var pSelector:CSSStyleDeclaration;
         var tabStyleName:String;
         var tSelector:CSSStyleDeclaration;
         var tabCloseStyleName:String;
         var cSelector:CSSStyleDeclaration;
         var leftStyleName:String;
         var lSelector:CSSStyleDeclaration;
         var rightStyleName:String;
         var rSelector:CSSStyleDeclaration;
         var selector:CSSStyleDeclaration = StyleManager.getStyleManager(null).getStyleDeclaration("SuperTabNavigator");
         if(!selector)
         {
            selector = new CSSStyleDeclaration();
         }
         selector.defaultFactory = function():void
         {
            this.popupButtonStyleName = "popupButton";
            this.tabStyleName = "superTab";
            this.leftButtonStyleName = "leftButton";
            this.rightButtonStyleName = "rightButton";
            this.buttonWidth = 20;
         };
         popupButtonStyleName = selector.getStyle("popupButtonStyleName");
         pSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + popupButtonStyleName);
         if(!pSelector)
         {
            pSelector = new CSSStyleDeclaration();
         }
         pSelector.defaultFactory = function():void
         {
            this.upSkin = TabPopUpButtonSkin;
            this.popUpDownSkin = TabPopUpButtonSkin;
            this.popUpOverSkin = TabPopUpButtonSkin;
            this.disabledSkin = TabPopUpButtonSkin;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + popupButtonStyleName,pSelector,false);
         tabStyleName = selector.getStyle("tabStyleName");
         tSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + tabStyleName);
         if(!tSelector)
         {
            tSelector = new CSSStyleDeclaration();
         }
         tSelector.defaultFactory = function():void
         {
            this.textAlign = "left";
            this.indicatorClass = DEFAULT_INDICATOR;
            this.tabCloseButtonStyleName = "tabCloseButton";
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + tabStyleName,tSelector,false);
         tabCloseStyleName = tSelector.getStyle("tabCloseButtonStyleName");
         cSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + tabCloseStyleName);
         if(!cSelector)
         {
            cSelector = new CSSStyleDeclaration();
         }
         cSelector.defaultFactory = function():void
         {
            this.upSkin = DEFAULT_CLOSE_UP;
            this.overSkin = DEFAULT_CLOSE_OVER;
            this.downSkin = DEFAULT_CLOSE_DOWN;
            this.disabledSkin = DEFAULT_CLOSE_DISABLED;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + tabCloseStyleName,cSelector,false);
         leftStyleName = selector.getStyle("leftButtonStyleName");
         lSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + leftStyleName);
         if(!lSelector)
         {
            lSelector = new CSSStyleDeclaration();
         }
         lSelector.defaultFactory = function():void
         {
            this.icon = DEFAULT_LEFT_BUTTON;
            this.fillAlphas = [1,1,1,1];
            this.cornerRadius = 0;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + leftStyleName,lSelector,false);
         rightStyleName = selector.getStyle("rightButtonStyleName");
         rSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + rightStyleName);
         if(!rSelector)
         {
            rSelector = new CSSStyleDeclaration();
         }
         rSelector.defaultFactory = function():void
         {
            this.icon = DEFAULT_RIGHT_BUTTON;
            this.fillAlphas = [1,1,1,1];
            this.cornerRadius = 0;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + rightStyleName,rSelector,false);
         StyleManager.getStyleManager(null).setStyleDeclaration("SuperTabNavigator",selector,false);
      }
      
      public function get popUpButtonPolicy() : String
      {
         return this._popUpButtonPolicy;
      }
      
      public function set popUpButtonPolicy(param1:String) : void
      {
         var _loc2_:String = this._popUpButtonPolicy;
         this._popUpButtonPolicy = param1;
         if(_loc2_ != param1)
         {
            this.invalidateDisplayList();
         }
      }
      
      public function get startScrollingEvent() : String
      {
         if(this.canvas)
         {
            return this.canvas.startScrollingEvent;
         }
         return this._startScrollingEvent;
      }
      
      public function set startScrollingEvent(param1:String) : void
      {
         this._startScrollingEvent = param1;
         if(this.canvas)
         {
            this.canvas.startScrollingEvent = param1;
         }
      }
      
      public function get stopScrollingEvent() : String
      {
         if(this.canvas)
         {
            return this.canvas.stopScrollingEvent;
         }
         return this._stopScrollingEvent;
      }
      
      public function set stopScrollingEvent(param1:String) : void
      {
         this._stopScrollingEvent = param1;
         this.canvas.stopScrollingEvent = param1;
      }
      
      public function set scrollSpeed(param1:Number) : void
      {
         if(this.canvas)
         {
            this.canvas.scrollSpeed = param1;
         }
         this._scrollSpeed = param1;
      }
      
      public function get scrollSpeed() : Number
      {
         if(this.canvas)
         {
            return this.canvas.scrollSpeed;
         }
         return this._scrollSpeed;
      }
      
      public function get dragEnabled() : Boolean
      {
         if(tabBar)
         {
            return (tabBar as SuperTabBar).dragEnabled;
         }
         return this._dragEnabled;
      }
      
      public function set dragEnabled(param1:Boolean) : void
      {
         this._dragEnabled = param1;
         if(tabBar)
         {
            (tabBar as SuperTabBar).dragEnabled = param1;
         }
      }
      
      public function get dropEnabled() : Boolean
      {
         if(tabBar)
         {
            return (tabBar as SuperTabBar).dropEnabled;
         }
         return this._dropEnabled;
      }
      
      public function set dropEnabled(param1:Boolean) : void
      {
         this._dropEnabled = param1;
         if(tabBar)
         {
            (tabBar as SuperTabBar).dropEnabled = param1;
         }
      }
      
      public function get minTabWidth() : Number
      {
         return this._minTabWidth;
      }
      
      public function set minTabWidth(param1:Number) : void
      {
         this._minTabWidth = param1;
         this.invalidateDisplayList();
      }
      
      public function get editableTabLabels() : Boolean
      {
         return this._editableTabLabels;
      }
      
      public function set editableTabLabels(param1:Boolean) : void
      {
         this._editableTabLabels = param1;
         if(tabBar)
         {
            (tabBar as SuperTabBar).editableTabLabels = param1;
         }
      }
      
      public function get allowTabSqueezing() : Boolean
      {
         return this._allowTabSqueezing;
      }
      
      public function set allowTabSqueezing(param1:Boolean) : void
      {
         this._allowTabSqueezing = param1;
         invalidateDisplayList();
      }
      
      override public function initialize() : void
      {
         super.initialize();
         SuperTabNavigator.initializeStyles();
      }
      
      override protected function createChildren() : void
      {
         if(!tabBar)
         {
            tabBar = this.createTabBar();
            tabBar.name = "tabBar";
            tabBar.focusEnabled = false;
            tabBar.styleName = this;
            (tabBar as SuperTabBar).dragEnabled = this._dragEnabled;
            (tabBar as SuperTabBar).dropEnabled = this._dropEnabled;
            (tabBar as SuperTabBar).editableTabLabels = this._editableTabLabels;
            (tabBar as SuperTabBar).closePolicy = this._closePolicy;
            tabBar.setStyle("borderStyle","none");
            tabBar.setStyle("paddingTop",0);
            tabBar.setStyle("paddingBottom",0);
            tabBar.setStyle("left",NaN);
            tabBar.setStyle("right",NaN);
            tabBar.setStyle("top",NaN);
            tabBar.setStyle("bottom",NaN);
            tabBar.setStyle("horizontalCenter",NaN);
            (tabBar as SuperTabBar).addEventListener(SuperTabEvent.TAB_CLOSE,this.handleTabClose);
         }
         super.createChildren();
         if(!this.holder)
         {
            this.holder = new Box();
            this.holder.direction = BoxDirection.HORIZONTAL;
            this.holder.setStyle("horizontalGap",0);
            this.holder.setStyle("borderStyle","none");
            this.holder.setStyle("paddingTop",0);
            this.holder.setStyle("paddingBottom",0);
            this.holder.horizontalScrollPolicy = "off";
            rawChildren.addChild(this.holder);
         }
         if(!this.canvas)
         {
            this.canvas = new ButtonScrollingCanvas();
            this.canvas.styleName = this;
            this.canvas.setStyle("borderStyle","none");
            this.canvas.setStyle("backgroundAlpha",0);
            this.canvas.setStyle("paddingTop",0);
            this.canvas.setStyle("paddingBottom",0);
            this.canvas.startScrollingEvent = this._startScrollingEvent;
            this.canvas.stopScrollingEvent = this._stopScrollingEvent;
            this.canvas.scrollSpeed = this._scrollSpeed;
            this.canvas.addChild(tabBar);
            this.holder.addChild(this.canvas);
         }
         if(!this.menu)
         {
            this.menu = new Menu();
            this.menu.setStyle("textAlign","left");
            this.menu.addEventListener(MenuEvent.ITEM_CLICK,this.changeTabs);
         }
         if(!this.popupButton)
         {
            this.popupButton = new PopUpButton();
            this.popupButton.popUp = this.menu;
            this.popupButton.width = 18;
            this.popupButton.styleName = getStyle("popupButtonStyleName");
            this.holder.addChild(this.popupButton);
         }
         tabBar.addEventListener(ChildExistenceChangedEvent.CHILD_ADD,this.tabsChanged);
         tabBar.addEventListener(ChildExistenceChangedEvent.CHILD_REMOVE,this.tabsChanged);
         SuperTabBar(tabBar).addEventListener(SuperTabEvent.TAB_UPDATED,this.tabsChanged);
         tabBar.addEventListener(SuperTabBar.TABS_REORDERED,this.tabsReordered);
         this.addEventListener(IndexChangedEvent.CHANGE,this.tabChangedEvent);
         invalidateSize();
         this.addEventListener(IndexChangedEvent.CHILD_INDEX_CHANGE,this.indexChangeListener);
      }
      
      protected function createTabBar() : SuperTabBar
      {
         return new SuperTabBar();
      }
      
      private function indexChangeListener(param1:IndexChangedEvent) : void
      {
         if(this.stopIndexChangeEvent)
         {
            this.stopIndexChangeEvent = false;
            param1.stopImmediatePropagation();
         }
      }
      
      private function handleTabClose(param1:SuperTabEvent) : void
      {
         var _loc2_:SuperTabEvent = param1.clone() as SuperTabEvent;
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            param1.preventDefault();
         }
      }
      
      public function get closePolicy() : String
      {
         return this._closePolicy;
      }
      
      public function set closePolicy(param1:String) : void
      {
         if(this._closePolicy != param1)
         {
            this._closePolicy = param1;
            if(tabBar != null)
            {
               (tabBar as SuperTabBar).closePolicy = param1;
            }
            invalidateDisplayList();
         }
      }
      
      public function setClosePolicyForTab(param1:int, param2:String) : void
      {
         (tabBar as SuperTabBar).setClosePolicyForTab(param1,param2);
      }
      
      private function tabsReordered(param1:TabReorderEvent) : void
      {
         var _loc5_:Object = null;
         var _loc9_:Canvas = null;
         var _loc10_:IndexChangedEvent = null;
         var _loc2_:Event = param1.clone();
         dispatchEvent(_loc2_);
         if(_loc2_.isDefaultPrevented())
         {
            return;
         }
         var _loc3_:SuperTabBar = param1.relatedObject as SuperTabBar;
         var _loc4_:SuperTab = _loc3_.getChildAt(param1.oldIndex) as SuperTab;
         var _loc6_:Object = _loc3_.dataProvider;
         var _loc7_:String = _loc3_.getClosePolicyForTab(param1.oldIndex);
         var _loc8_:Object = _loc4_.styleName;
         if(_loc3_ != tabBar)
         {
            if(_loc6_ is IList)
            {
               _loc5_ = (_loc6_ as IList).getItemAt(param1.oldIndex);
               _loc6_.removeItemAt(param1.oldIndex);
               _loc9_ = new Canvas();
               if(_loc5_.hasOwnProperty("label"))
               {
                  _loc9_.label = _loc5_.label;
               }
               else
               {
                  _loc9_.label = _loc5_.toString();
               }
               if(_loc5_.hasOwnProperty("icon"))
               {
                  _loc9_.icon = _loc5_.icon;
               }
               _loc5_ = _loc9_;
            }
            else if(_loc6_ is ViewStack)
            {
               _loc5_ = (_loc6_ as ViewStack).getChildAt(param1.oldIndex);
               _loc6_.removeChildAt(param1.oldIndex);
            }
            if(_loc5_ is DisplayObject)
            {
               this.addChildAt(_loc5_ as DisplayObject,param1.newIndex);
            }
            this.setClosePolicyForTab(param1.newIndex,_loc7_);
            _loc4_ = this.getTabAt(param1.newIndex) as SuperTab;
            _loc4_.styleName = _loc8_;
         }
         else
         {
            if(param1.oldIndex < param1.newIndex)
            {
               --param1.newIndex;
            }
            _loc10_ = new IndexChangedEvent(IndexChangedEvent.CHILD_INDEX_CHANGE);
            _loc10_.oldIndex = param1.oldIndex;
            _loc10_.newIndex = param1.newIndex;
            _loc10_.relatedObject = getChildAt(param1.newIndex);
            dispatchEvent(_loc10_);
            this.stopIndexChangeEvent = true;
            this.setChildIndex(getChildAt(param1.oldIndex),param1.newIndex);
         }
         this.validateNow();
         this.selectedIndex = param1.newIndex;
         this.reorderTabList();
      }
      
      protected function get tabBarHeight() : Number
      {
         var _loc1_:Number = Number(getStyle("tabHeight"));
         if(isNaN(_loc1_))
         {
            _loc1_ = Number(tabBar.getExplicitOrMeasuredHeight());
         }
         return _loc1_ - 1;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc11_:Number = NaN;
         if(this._popUpButtonPolicy == SuperTabNavigator.POPUPPOLICY_AUTO)
         {
            this.popupButton.includeInLayout = this.popupButton.visible = this.numChildren > 1;
         }
         else if(this._popUpButtonPolicy == SuperTabNavigator.POPUPPOLICY_ON)
         {
            this.popupButton.includeInLayout = this.popupButton.visible = true;
         }
         else if(this._popUpButtonPolicy == SuperTabNavigator.POPUPPOLICY_OFF)
         {
            this.popupButton.includeInLayout = this.popupButton.visible = false;
         }
         var _loc3_:EdgeMetrics = viewMetrics;
         var _loc4_:Number = param1 - _loc3_.left - _loc3_.right;
         var _loc5_:Number = this.tabBarHeight + 1;
         var _loc6_:Number = _loc4_;
         if(this.popupButton.includeInLayout)
         {
            _loc6_ -= this.popupButton.width;
         }
         var _loc7_:Number = Number(tabBar.getStyle("tabWidth"));
         tabBar.clearStyle("tabWidth");
         tabBar.setStyle("tabWidth",NaN);
         tabBar.validateNow();
         var _loc8_:Number = Math.max(tabBar.getExplicitOrMeasuredWidth(),_loc6_);
         tabBar.setStyle("tabWidth",_loc7_);
         var _loc9_:Number = Number(tabBar.measuredWidth);
         this.holder.move(0,1);
         this.holder.setActualSize(param1,_loc5_);
         var _loc10_:Number = param1;
         if(this.popupButton.includeInLayout)
         {
            _loc10_ -= this.popupButton.width;
         }
         this.canvas.width = _loc10_;
         this.canvas.height = _loc5_;
         this.canvas.explicitButtonHeight = _loc5_ - 1;
         this.canvas.verticalScrollPolicy = ScrollPolicy.OFF;
         if(_loc8_ <= _loc10_)
         {
            this.canvas.horizontalScrollPosition = 0;
         }
         super.updateDisplayList(param1,param2);
         if(_loc9_ >= _loc10_)
         {
            if(this._allowTabSqueezing)
            {
               _loc11_ = tabBar.numChildren * this._minTabWidth + (tabBar.numChildren - 1) * getStyle("horizontalGap");
               tabBar.width = Math.max(_loc10_,_loc11_);
            }
            else
            {
               tabBar.width = _loc9_;
            }
         }
         else
         {
            tabBar.width = _loc9_;
         }
         if(_loc9_ < _loc10_)
         {
            switch(getStyle("horizontalAlign"))
            {
               case "left":
                  tabBar.move(0,tabBar.y);
                  break;
               case "right":
                  tabBar.move(param1 - tabBar.width,tabBar.y);
                  break;
               case "center":
                  tabBar.move((param1 - tabBar.width) / 2,tabBar.y);
            }
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == "tabWidth" && this.forcedTabWidth == -1)
         {
            this.originalTabWidthStyle = this.getStyle(param1);
         }
      }
      
      private function changeTabs(param1:MenuEvent) : void
      {
         if(this.selectedIndex == param1.index)
         {
            this.ensureTabIsVisible();
         }
         this.selectedIndex = param1.index;
      }
      
      private function tabChangedEvent(param1:IndexChangedEvent) : void
      {
         callLater(this.ensureTabIsVisible);
      }
      
      private function ensureTabIsVisible() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Tween = null;
         var _loc1_:DisplayObject = this.tabBar.getChildAt(this.selectedIndex);
         if(_loc1_.x + _loc1_.width > this.canvas.horizontalScrollPosition + this.canvas.width)
         {
            _loc2_ = _loc1_.x - this.canvas.width + _loc1_.width + this.canvas.getStyle("buttonWidth");
         }
         else if(this.canvas.horizontalScrollPosition > _loc1_.x)
         {
            _loc2_ = _loc1_.x - this.canvas.getStyle("buttonWidth");
         }
         else
         {
            _loc2_ = this.canvas.horizontalScrollPosition;
         }
         if(_loc2_)
         {
            _loc3_ = new Tween(this,this.canvas.horizontalScrollPosition,_loc2_,500);
         }
      }
      
      public function onTweenUpdate(param1:Object) : void
      {
         this.canvas.horizontalScrollPosition = param1 as Number;
      }
      
      public function onTweenEnd(param1:Object) : void
      {
         this.canvas.horizontalScrollPosition = param1 as Number;
      }
      
      private function tabsChanged(param1:Event) : void
      {
         callLater(this.reorderTabList);
      }
      
      public function reorderTabList() : void
      {
         var _loc3_:Container = null;
         var _loc4_:Object = null;
         var _loc1_:ArrayCollection = new ArrayCollection();
         var _loc2_:int = 0;
         while(_loc2_ < this.numChildren)
         {
            _loc3_ = this.getChildAt(_loc2_) as Container;
            _loc4_ = new Object();
            _loc4_.type = "";
            _loc4_.label = _loc3_.label != "" ? _loc3_.label : "Untitled Tab";
            _loc4_.icon = _loc3_.icon;
            _loc1_.addItem(_loc4_);
            _loc2_++;
         }
         this.menu.iconField = "icon";
         this.menu.dataProvider = _loc1_;
         this.popupButton.popUp = this.menu;
      }
   }
}

