package flexlib.controls
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flexlib.containers.SuperTabNavigator;
   import flexlib.controls.tabBarClasses.SuperTab;
   import flexlib.events.SuperTabEvent;
   import flexlib.events.TabReorderEvent;
   import mx.collections.IList;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.TabBar;
   import mx.core.ClassFactory;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IUIComponent;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.DragEvent;
   import mx.managers.DragManager;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   use namespace mx_internal;
   
   public class SuperTabBar extends TabBar
   {
      private static var DEFAULT_CLOSE_UP:Class = SuperTabBar_DEFAULT_CLOSE_UP;
      
      private static var DEFAULT_CLOSE_OVER:Class = SuperTabBar_DEFAULT_CLOSE_OVER;
      
      private static var DEFAULT_CLOSE_DOWN:Class = SuperTabBar_DEFAULT_CLOSE_DOWN;
      
      private static var DEFAULT_CLOSE_DISABLED:Class = SuperTabBar_DEFAULT_CLOSE_DISABLED;
      
      private static var DEFAULT_INDICATOR:Class = SuperTabBar_DEFAULT_INDICATOR;
      
      public static const TABS_REORDERED:String = "tabsReordered";
      
      initializeStyles();
      
      private var _dragEnabled:Boolean = true;
      
      private var _dropEnabled:Boolean = true;
      
      private var _closePolicy:String = "close_rollover";
      
      private var _editableTabLabels:Boolean = false;
      
      public function SuperTabBar()
      {
         super();
         mx_internal::navItemFactory = new ClassFactory(this.getTabClass());
      }
      
      private static function initializeStyles() : void
      {
         var tabStyleName:String;
         var tSelector:CSSStyleDeclaration;
         var tabCloseStyleName:String;
         var cSelector:CSSStyleDeclaration;
         var selector:CSSStyleDeclaration = StyleManager.getStyleManager(null).getStyleDeclaration("flexlib.controls.SuperTabBar");
         if(!selector)
         {
            selector = new CSSStyleDeclaration();
         }
         selector.defaultFactory = function():void
         {
            this.tabStyleName = "superTab";
         };
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
            this.tabCloseButtonStyleName = "flexlib.controls.tabCloseButton";
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
         StyleManager.getStyleManager(null).setStyleDeclaration("flexlib.controls.SuperTabBar",selector,false);
      }
      
      override public function initialize() : void
      {
         super.initialize();
         SuperTabBar.initializeStyles();
      }
      
      public function get dragEnabled() : Boolean
      {
         return this._dragEnabled;
      }
      
      public function set dragEnabled(param1:Boolean) : void
      {
         var _loc4_:SuperTab = null;
         this._dragEnabled = param1;
         var _loc2_:int = int(numChildren);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = SuperTab(getChildAt(_loc3_));
            if(param1)
            {
               this.addDragListeners(_loc4_);
            }
            else
            {
               this.removeDragListeners(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function get dropEnabled() : Boolean
      {
         return this._dropEnabled;
      }
      
      public function set dropEnabled(param1:Boolean) : void
      {
         var _loc4_:SuperTab = null;
         this._dropEnabled = param1;
         var _loc2_:int = int(numChildren);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = SuperTab(getChildAt(_loc3_));
            if(param1)
            {
               this.addDropListeners(_loc4_);
            }
            else
            {
               this.removeDropListeners(_loc4_);
            }
            _loc3_++;
         }
      }
      
      public function get closePolicy() : String
      {
         return this._closePolicy;
      }
      
      public function set closePolicy(param1:String) : void
      {
         var _loc4_:SuperTab = null;
         this._closePolicy = param1;
         this.invalidateDisplayList();
         var _loc2_:int = int(numChildren);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = SuperTab(getChildAt(_loc3_));
            _loc4_.closePolicy = param1;
            _loc3_++;
         }
      }
      
      public function setClosePolicyForTab(param1:int, param2:String) : void
      {
         if(this.numChildren >= param1 + 1)
         {
            (getChildAt(param1) as SuperTab).closePolicy = param2;
         }
      }
      
      public function getClosePolicyForTab(param1:int) : String
      {
         return (getChildAt(param1) as SuperTab).closePolicy;
      }
      
      public function get editableTabLabels() : Boolean
      {
         return this._editableTabLabels;
      }
      
      public function set editableTabLabels(param1:Boolean) : void
      {
         var _loc4_:SuperTab = null;
         this._editableTabLabels = param1;
         var _loc2_:int = int(numChildren);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = SuperTab(getChildAt(_loc3_));
            _loc4_.doubleClickToEdit = param1;
            _loc3_++;
         }
      }
      
      protected function getTabClass() : Class
      {
         return SuperTab;
      }
      
      override protected function createNavItem(param1:String, param2:Class = null) : IFlexDisplayObject
      {
         var _loc3_:SuperTab = super.createNavItem(param1,param2) as SuperTab;
         _loc3_.closePolicy = this.closePolicy;
         _loc3_.doubleClickToEdit = this.editableTabLabels;
         if(this.dragEnabled)
         {
            this.addDragListeners(_loc3_);
         }
         if(this.dropEnabled)
         {
            this.addDropListeners(_loc3_);
         }
         _loc3_.addEventListener(SuperTab.CLOSE_TAB_EVENT,this.onCloseTabClicked,false,0,true);
         _loc3_.addEventListener(SuperTabEvent.TAB_UPDATED,this.onTabUpdated);
         return _loc3_;
      }
      
      private function onTabUpdated(param1:SuperTabEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:SuperTab = param1.currentTarget as SuperTab;
         var _loc3_:Number = Number(this.getChildIndex(_loc2_));
         if(dataProvider is IList)
         {
            _loc4_ = dataProvider.getItemAt(_loc3_);
         }
         else if(dataProvider is ViewStack)
         {
            _loc4_ = dataProvider.getChildAt(_loc3_);
         }
         if(labelField)
         {
            _loc4_[labelField] = _loc2_.label;
         }
         else if(_loc4_.hasOwnProperty("label"))
         {
            _loc4_.label = _loc2_.label;
         }
      }
      
      private function addDragListeners(param1:SuperTab) : void
      {
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.tryDrag,false,0,true);
         param1.addEventListener(MouseEvent.MOUSE_UP,this.removeDrag,false,0,true);
      }
      
      private function removeDragListeners(param1:SuperTab) : void
      {
         param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.tryDrag);
         param1.removeEventListener(MouseEvent.MOUSE_UP,this.removeDrag);
      }
      
      private function addDropListeners(param1:SuperTab) : void
      {
         param1.addEventListener(DragEvent.DRAG_ENTER,this.tabDragEnter,false,0,true);
         param1.addEventListener(DragEvent.DRAG_OVER,this.tabDragOver,false,0,true);
         param1.addEventListener(DragEvent.DRAG_DROP,this.tabDragDrop,false,0,true);
         param1.addEventListener(DragEvent.DRAG_EXIT,this.tabDragExit,false,0,true);
      }
      
      private function removeDropListeners(param1:SuperTab) : void
      {
         param1.removeEventListener(DragEvent.DRAG_ENTER,this.tabDragEnter);
         param1.removeEventListener(DragEvent.DRAG_OVER,this.tabDragOver);
         param1.removeEventListener(DragEvent.DRAG_DROP,this.tabDragDrop);
         param1.removeEventListener(DragEvent.DRAG_EXIT,this.tabDragExit);
      }
      
      private function tryDrag(param1:MouseEvent) : void
      {
         param1.target.addEventListener(MouseEvent.MOUSE_MOVE,this.doDrag);
      }
      
      private function removeDrag(param1:MouseEvent) : void
      {
         param1.target.removeEventListener(MouseEvent.MOUSE_MOVE,this.doDrag);
      }
      
      public function onCloseTabClicked(param1:Event) : void
      {
         var _loc2_:int = int(getChildIndex(DisplayObject(param1.currentTarget)));
         var _loc3_:SuperTabEvent = new SuperTabEvent(SuperTabEvent.TAB_CLOSE,_loc2_,false,true);
         dispatchEvent(_loc3_);
         if(!_loc3_.isDefaultPrevented())
         {
            if(dataProvider is IList)
            {
               dataProvider.removeItemAt(_loc2_);
            }
            else if(dataProvider is ViewStack)
            {
               dataProvider.removeChildAt(_loc2_);
            }
         }
      }
      
      private function doDrag(param1:MouseEvent) : void
      {
         var _loc2_:SuperTab = null;
         var _loc3_:DragSource = null;
         var _loc4_:BitmapData = null;
         var _loc5_:Bitmap = null;
         var _loc6_:UIComponent = null;
         if(param1.target is IUIComponent && (IUIComponent(param1.target) is SuperTab || IUIComponent(param1.target).parent is SuperTab && !(IUIComponent(param1.target) is Button)))
         {
            if(IUIComponent(param1.target) is SuperTab)
            {
               _loc2_ = IUIComponent(param1.target) as SuperTab;
            }
            if(IUIComponent(param1.target).parent is SuperTab)
            {
               _loc2_ = IUIComponent(param1.target).parent as SuperTab;
            }
            _loc3_ = new DragSource();
            _loc3_.addData(param1.currentTarget,"tabDrag");
            if(dataProvider is IList)
            {
               _loc3_.addData(param1.currentTarget,"listDP");
            }
            if(dataProvider is ViewStack)
            {
               _loc3_.addData(param1.currentTarget,"stackDP");
            }
            _loc4_ = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc4_.draw(_loc2_);
            _loc5_ = new Bitmap(_loc4_);
            _loc6_ = new UIComponent();
            _loc6_.addChild(_loc5_);
            param1.target.removeEventListener(MouseEvent.MOUSE_MOVE,this.doDrag);
            DragManager.doDrag(IUIComponent(param1.target),_loc3_,param1,_loc6_);
         }
      }
      
      private function tabDragEnter(param1:DragEvent) : void
      {
         if(Boolean(param1.dragSource.hasFormat("tabDrag")) && param1.draggedItem != param1.dragInitiator)
         {
            if(this.dataProvider is ViewStack)
            {
               if(param1.dragSource.hasFormat("stackDP"))
               {
                  DragManager.acceptDragDrop(IUIComponent(param1.target));
               }
            }
            else if(this.dataProvider is IList)
            {
               if(param1.dragSource.hasFormat("listDP"))
               {
                  DragManager.acceptDragDrop(IUIComponent(param1.target));
               }
            }
         }
      }
      
      private function tabDragOver(param1:DragEvent) : void
      {
         var _loc2_:SuperTab = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = false;
         if(Boolean(param1.dragSource.hasFormat("tabDrag")) && param1.dragInitiator != param1.currentTarget)
         {
            _loc2_ = param1.currentTarget as SuperTab;
            _loc3_ = Number(this.getChildIndex(_loc2_));
            _loc4_ = 0;
            _loc5_ = param1.localX < _loc2_.width / 2;
            if((_loc5_) && _loc3_ > 0 || _loc3_ < this.numChildren - 1)
            {
               _loc4_ = this.getStyle("horizontalGap") / 2;
            }
            _loc4_ = _loc5_ ? -_loc4_ : _loc2_.width + _loc4_;
            _loc2_.showIndicatorAt(_loc4_);
            DragManager.showFeedback(DragManager.LINK);
         }
      }
      
      private function tabDragExit(param1:DragEvent) : void
      {
         var _loc2_:SuperTab = param1.currentTarget as SuperTab;
         _loc2_.showIndicator = false;
      }
      
      private function tabDragDrop(param1:DragEvent) : void
      {
         var _loc2_:SuperTab = null;
         var _loc3_:SuperTab = null;
         var _loc4_:* = false;
         var _loc5_:SuperTabBar = null;
         var _loc6_:* = undefined;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(Boolean(param1.dragSource.hasFormat("tabDrag")) && param1.draggedItem != param1.dragInitiator)
         {
            _loc2_ = param1.currentTarget as SuperTab;
            _loc3_ = param1.dragInitiator as SuperTab;
            _loc4_ = param1.localX < _loc2_.width / 2;
            _loc6_ = param1.dragInitiator;
            while(_loc6_ && Boolean(_loc6_.parent))
            {
               _loc6_ = _loc6_.parent;
               if(_loc6_ is SuperTab)
               {
                  _loc3_ = _loc6_;
               }
               else if(_loc6_ is SuperTabBar)
               {
                  _loc5_ = _loc6_;
                  break;
               }
            }
            _loc2_.showIndicator = false;
            _loc7_ = Number(_loc5_.getChildIndex(_loc3_));
            _loc8_ = Number(this.getChildIndex(_loc2_));
            if(!_loc4_)
            {
               _loc8_ += 1;
            }
            this.dispatchEvent(new TabReorderEvent(SuperTabBar.TABS_REORDERED,false,true,_loc5_,_loc7_,_loc8_));
         }
      }
      
      public function resetTabs() : void
      {
         this.resetNavItems();
      }
      
      override protected function updateNavItemLabel(param1:int, param2:String) : void
      {
         super.updateNavItemLabel(param1,param2);
         if(dataProvider is SuperTabNavigator)
         {
            SuperTabNavigator(dataProvider).invalidateDisplayList();
         }
         dispatchEvent(new SuperTabEvent(SuperTabEvent.TAB_UPDATED,param1));
      }
      
      override protected function updateNavItemIcon(param1:int, param2:Class) : void
      {
         super.updateNavItemIcon(param1,param2);
         dispatchEvent(new SuperTabEvent(SuperTabEvent.TAB_UPDATED,param1));
      }
   }
}

