package fr.kapit.components
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.containers.TitleWindow;
   import mx.controls.Button;
   import mx.core.Application;
   import mx.core.EdgeMetrics;
   import mx.core.IUIComponent;
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.effects.Move;
   import mx.effects.Parallel;
   import mx.effects.Resize;
   import mx.effects.Sequence;
   import mx.effects.easing.Bounce;
   import mx.effects.easing.Linear;
   import mx.managers.CursorManager;
   import mx.managers.CursorManagerPriority;
   import mx.managers.ISystemManager;
   import mx.states.SetProperty;
   import mx.states.State;
   import mx.states.Transition;
   
   use namespace mx_internal;
   
   public class ResizableTitleWindow extends TitleWindow
   {
      private static var EDGE_NONE:Number = 0;
      
      private static var EDGE_BOTTOM:Number = 1;
      
      private static var EDGE_RIGHT:Number = 2;
      
      private static var EDGE_LEFT:Number = 3;
      
      private static var EDGE_TOP:Number = 4;
      
      private static var EDGE_CORNER:Number = 5;
      
      private static var EDGE_LEFT_BOTTOM:Number = 6;
      
      private static var EDGE_LEFT_TOP:Number = 7;
      
      private static var EDGE_RIGHT_TOP:Number = 8;
      
      protected static var MIN_HEIGHT:int = 30;
      
      protected static var MAX_HEIGHT:int = 10000;
      
      private static const MAXIMIZE_BUTTON:Class = ResizableTitleWindow_MAXIMIZE_BUTTON;
      
      private static const ABOUT_BUTTON:Class = ResizableTitleWindow_ABOUT_BUTTON;
      
      private static const ROLL_DOWN_BUTTON:Class = ResizableTitleWindow_ROLL_DOWN_BUTTON;
      
      private static const ROLL_UP_BUTTON:Class = ResizableTitleWindow_ROLL_UP_BUTTON;
      
      private static const MINIMIZE_BUTTON:Class = ResizableTitleWindow_MINIMIZE_BUTTON;
      
      private static const RESTORE_BUTTON:Class = ResizableTitleWindow_RESTORE_BUTTON;
      
      private var stateNormal:State;
      
      private var stateMin:State;
      
      private var stateMax:State;
      
      private var statePseudoMax:State;
      
      private var vCursorSymbol:Class = ResizableTitleWindow_vCursorSymbol;
      
      private var hCursorSymbol:Class = ResizableTitleWindow_hCursorSymbol;
      
      private var dCursorSymbol:Class = ResizableTitleWindow_dCursorSymbol;
      
      private var rdCursorSymbol:Class = ResizableTitleWindow_rdCursorSymbol;
      
      private var fullTitle:String = "";
      
      private var isHandleDragging:Boolean = false;
      
      private var handleEdge:Number = EDGE_NONE;
      
      private var cursorId:Number = 0;
      
      private var lastEdge:Number = 0;
      
      private var maximizeButton:Button;
      
      private var aboutButton:Button;
      
      private var rollButton:Button;
      
      private var origPosition:Point;
      
      private var origDimensions:Point;
      
      private var origPerDimensions:Point;
      
      private var origDimensionsCached:Boolean = false;
      
      private var _maximizable:Boolean = true;
      
      public var applicationName:String = "KapInspect";
      
      private var _aboutable:Boolean = true;
      
      private var _rollupable:Boolean = true;
      
      private var _closeable:Boolean = true;
      
      private var _lastHeight:int;
      
      public var isRolled:Boolean = false;
      
      public function ResizableTitleWindow()
      {
         super();
         isPopUp = true;
         doubleClickEnabled = true;
         setStyle("headerHeight",21);
         setStyle("cornerRadius",4);
         setStyle("borderAlpha",1);
         setStyle("dropShadowEnabled",true);
         setStyle("resizeAffordance",6);
         addEventListener(Event.CLOSE,this.closeHandler);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler,false);
         addEventListener(MouseEvent.MOUSE_MOVE,this.systemManager_mouseMoveHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.systemManager_mouseMoveHandler);
      }
      
      public function get maximizable() : Boolean
      {
         return this._maximizable;
      }
      
      public function set maximizable(param1:Boolean) : void
      {
         this._maximizable = param1;
         invalidateDisplayList();
      }
      
      public function get aboutable() : Boolean
      {
         return this._aboutable;
      }
      
      public function set aboutable(param1:Boolean) : void
      {
         this._aboutable = param1;
         invalidateDisplayList();
      }
      
      public function get rollupable() : Boolean
      {
         return this._rollupable;
      }
      
      public function set rollupable(param1:Boolean) : void
      {
         this._rollupable = param1;
         invalidateDisplayList();
      }
      
      public function get closeable() : Boolean
      {
         return this._closeable;
      }
      
      public function set closeable(param1:Boolean) : void
      {
         this._closeable = param1;
         invalidateDisplayList();
      }
      
      override protected function createChildren() : void
      {
         var _loc1_:ISystemManager = null;
         super.createChildren();
         if(parent is ISystemManager)
         {
            _loc1_ = ISystemManager(parent);
         }
         else if(parent is IUIComponent)
         {
            _loc1_ = IUIComponent(parent).systemManager;
         }
         if(_loc1_)
         {
            _loc1_.addEventListener(Event.RESIZE,this.resizeHandler,false,-5);
         }
         this.setEffects();
         this.fullTitle = title;
         this.storeOrigDimensions();
         if(titleBar)
         {
            titleBar.height = getHeaderHeight();
            titleBar.addEventListener(MouseEvent.DOUBLE_CLICK,this.titleBar_mouseClickHandler);
            if(this.closeable)
            {
               showCloseButton = true;
            }
            if(!this.aboutButton && this._aboutable)
            {
               this.aboutButton = new Button();
               this.aboutButton.toolTip = "About " + this.applicationName;
               this.aboutButton.setStyle("upIcon",ABOUT_BUTTON);
               this.aboutButton.setStyle("overIcon",ABOUT_BUTTON);
               this.aboutButton.setStyle("downIcon",ABOUT_BUTTON);
               this.aboutButton.setStyle("disabledIcon",ABOUT_BUTTON);
               this.aboutButton.explicitWidth = 16;
               this.aboutButton.explicitHeight = 16;
               this.aboutButton.visible = false;
               this.aboutButton.enabled = enabled;
               this.aboutButton.focusEnabled = false;
               this.aboutButton.addEventListener(MouseEvent.CLICK,this.titleBar_mouseClickHandler);
               titleBar.addChild(this.aboutButton);
               this.aboutButton.owner = this;
            }
            if(!this.rollButton && this._rollupable)
            {
               this.rollButton = new Button();
               this.rollButton.toolTip = "Roll";
               this.rollButton.setStyle("upIcon",ROLL_UP_BUTTON);
               this.rollButton.setStyle("overIcon",ROLL_UP_BUTTON);
               this.rollButton.setStyle("downIcon",ROLL_UP_BUTTON);
               this.rollButton.setStyle("disabledIcon",ROLL_UP_BUTTON);
               this.rollButton.explicitWidth = 16;
               this.rollButton.explicitHeight = 16;
               this.rollButton.visible = false;
               this.rollButton.enabled = enabled;
               this.rollButton.focusEnabled = false;
               this.rollButton.uid = "0";
               this.rollButton.addEventListener(MouseEvent.CLICK,this.titleBar_mouseClickHandler);
               titleBar.addChild(this.rollButton);
               this.rollButton.owner = this;
            }
            if(!this.maximizeButton)
            {
               this.maximizeButton = new Button();
               this.maximizeButton.setStyle("upIcon",MAXIMIZE_BUTTON);
               this.maximizeButton.setStyle("overIcon",MAXIMIZE_BUTTON);
               this.maximizeButton.setStyle("downIcon",MAXIMIZE_BUTTON);
               this.maximizeButton.setStyle("disabledIcon",MAXIMIZE_BUTTON);
               this.maximizeButton.explicitWidth = 16;
               this.maximizeButton.explicitHeight = 16;
               this.maximizeButton.visible = false;
               this.maximizeButton.enabled = enabled;
               this.maximizeButton.focusEnabled = false;
               this.maximizeButton.addEventListener(MouseEvent.CLICK,this.titleBar_mouseClickHandler);
               titleBar.addChild(this.maximizeButton);
               this.maximizeButton.owner = this;
            }
         }
      }
      
      override protected function layoutChrome(param1:Number, param2:Number) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc13_:Number = NaN;
         super.layoutChrome(param1,param2);
         var _loc3_:uint = 0;
         var _loc4_:Number = Number(getHeaderHeight());
         var _loc5_:EdgeMetrics = borderMetrics;
         var _loc6_:uint = uint(_loc5_.right);
         var _loc7_:uint = 0;
         _loc6_ = 3;
         this.maximizeButton.visible = this.maximizable;
         if(this.maximizable)
         {
            _loc3_ = Math.max(_loc3_,this.maximizeButton.getExplicitOrMeasuredHeight());
         }
         if(this.closeable)
         {
            _loc3_ = Math.max(_loc3_,mx_internal::closeButton.getExplicitOrMeasuredHeight());
         }
         var _loc8_:uint = Math.round((_loc4_ - _loc3_) / 2);
         _loc7_ = param1 - _loc5_.right;
         if(this.closeable)
         {
            _loc9_ = Number(mx_internal::closeButton.getExplicitOrMeasuredWidth());
            _loc10_ = Number(mx_internal::closeButton.getExplicitOrMeasuredHeight());
            mx_internal::closeButton.setActualSize(_loc9_,_loc10_);
            _loc7_ -= _loc9_ + _loc6_;
            mx_internal::closeButton.move(_loc7_,_loc8_);
         }
         if(this._rollupable)
         {
            _loc9_ = Number(this.rollButton.getExplicitOrMeasuredWidth());
            _loc10_ = Number(this.rollButton.getExplicitOrMeasuredHeight());
            this.rollButton.setActualSize(_loc9_,_loc10_);
            _loc7_ -= _loc9_ + _loc6_;
            this.rollButton.move(_loc7_,_loc8_);
         }
         if(this._aboutable)
         {
            _loc9_ = Number(this.aboutButton.getExplicitOrMeasuredWidth());
            _loc10_ = Number(this.aboutButton.getExplicitOrMeasuredHeight());
            this.aboutButton.setActualSize(_loc9_,_loc10_);
            _loc7_ -= _loc9_ + _loc6_;
            this.aboutButton.move(_loc7_,_loc8_);
         }
         if(this.maximizable)
         {
            _loc9_ = Number(this.maximizeButton.getExplicitOrMeasuredWidth());
            _loc10_ = Number(this.maximizeButton.getExplicitOrMeasuredHeight());
            this.maximizeButton.setActualSize(_loc9_,_loc10_);
            _loc7_ -= _loc9_ + _loc6_;
            this.maximizeButton.move(_loc7_,_loc8_);
         }
         var _loc11_:Number = 10;
         var _loc12_:Number = param1 - _loc5_.right - _loc7_;
         if(mx_internal::titleIconObject)
         {
            _loc10_ = Number(mx_internal::titleIconObject.height);
            _loc13_ = (_loc4_ - _loc10_) / 2;
            mx_internal::titleIconObject.move(_loc11_,_loc13_);
            _loc11_ += mx_internal::titleIconObject.width + 4;
         }
         _loc10_ = Number(titleTextField.textHeight);
         _loc13_ = (_loc4_ - _loc10_) / 2;
         var _loc14_:Number = _loc5_.left + _loc5_.right;
         titleTextField.move(_loc11_,_loc13_ - 1);
         titleTextField.setActualSize(Math.max(0,param1 - _loc11_ - _loc12_ - _loc14_),_loc10_ + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
         _loc10_ = Number(statusTextField.textHeight);
         _loc13_ = (_loc4_ - _loc10_) / 2;
         var _loc15_:Number = param1 - _loc12_ - 4 - _loc14_ - statusTextField.textWidth;
         if(mx_internal::_showCloseButton)
         {
            _loc15_ -= mx_internal::closeButton.getExplicitOrMeasuredWidth() + 4;
         }
         statusTextField.move(_loc15_,_loc13_ - 1);
         statusTextField.setActualSize(statusTextField.textWidth + 8,statusTextField.textHeight + UITextField.mx_internal::TEXT_HEIGHT_PADDING);
         var _loc16_:Number = titleTextField.x + titleTextField.textWidth + 8;
         if(statusTextField.x < _loc16_)
         {
            statusTextField.width = Math.max(statusTextField.width - (_loc16_ - statusTextField.x),0);
            statusTextField.x = _loc16_;
         }
      }
      
      override protected function measure() : void
      {
         super.measure();
         var _loc1_:Rectangle = this.measureHeaderText();
         var _loc2_:Number = _loc1_.width;
         var _loc3_:Number = _loc1_.height;
         var _loc4_:EdgeMetrics = borderMetrics;
         _loc2_ += _loc4_.left + _loc4_.right;
         var _loc5_:Number = 5;
         _loc2_ += _loc5_ * 2;
         measuredMinWidth = Math.max(_loc2_,measuredMinWidth);
         measuredWidth = Math.max(_loc2_,measuredWidth);
         if(this.maximizable)
         {
            measuredWidth += this.maximizeButton.getExplicitOrMeasuredWidth() + 6;
            measuredMinWidth += this.maximizeButton.getExplicitOrMeasuredWidth() + 6;
            measuredHeight = Math.max(measuredHeight,this.maximizeButton.getExplicitOrMeasuredHeight());
         }
      }
      
      private function measureHeaderText() : Rectangle
      {
         var _loc1_:Number = 20;
         var _loc2_:Number = 14;
         if(Boolean(titleTextField) && Boolean(titleTextField.text))
         {
            titleTextField.validateNow();
            _loc1_ = Number(titleTextField.textWidth);
            _loc2_ = Number(titleTextField.textHeight);
         }
         if(statusTextField)
         {
            statusTextField.validateNow();
            _loc1_ = Math.max(_loc1_,statusTextField.textWidth);
            _loc2_ = Math.max(_loc2_,statusTextField.textHeight);
         }
         return new Rectangle(0,0,Math.round(_loc1_),Math.round(_loc2_));
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(!this.origDimensionsCached)
         {
            this.storeOrigDimensions();
            this.origDimensionsCached = true;
         }
      }
      
      protected function setState(param1:String) : void
      {
         if(param1 == "maximized" && currentState != "maximized")
         {
            this.toMaximized();
         }
         else if(param1 == "normal" && currentState != "normal")
         {
            this.toNormal();
         }
      }
      
      private function bringToFront(param1:MouseEvent) : void
      {
         if(param1.currentTarget == this && Boolean(parent))
         {
            parent.setChildIndex(this,parent.numChildren - 1);
         }
      }
      
      private function closeHandler(param1:Event) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         param1.stopPropagation();
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         systemManager.addEventListener(MouseEvent.MOUSE_MOVE,this.systemManager_mouseMoveHandler,true);
         systemManager.addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
         this.systemManager_mouseDownHandler(param1);
      }
      
      private function systemManager_mouseDownHandler(param1:MouseEvent) : void
      {
         if(this.handleEdge != EDGE_NONE)
         {
            this.isHandleDragging = true;
            param1.stopPropagation();
         }
      }
      
      private function systemManager_mouseMoveHandler(param1:MouseEvent) : void
      {
         if(this.parent != null)
         {
            if(this.isHandleDragging)
            {
               this.resize(param1);
            }
            else
            {
               this.setResizeCursor(param1);
            }
         }
      }
      
      private function systemManager_mouseUpHandler(param1:MouseEvent) : void
      {
         systemManager.removeEventListener(MouseEvent.MOUSE_MOVE,this.systemManager_mouseMoveHandler,true);
         systemManager.removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
         systemManager.removeEventListener(MouseEvent.MOUSE_DOWN,this.systemManager_mouseDownHandler,true);
         this.isHandleDragging = false;
      }
      
      private function titleBar_mouseClickHandler(param1:MouseEvent) : void
      {
         if(this.parent != null && param1 is MouseEvent)
         {
            if(param1.type == MouseEvent.DOUBLE_CLICK && param1.currentTarget == titleBar)
            {
               if(currentState == "normal")
               {
                  this.toMaximized();
               }
               else if(currentState == "maximized")
               {
                  this.toNormal();
               }
            }
            else if(param1.type == MouseEvent.CLICK)
            {
               if(param1.target == this.maximizeButton)
               {
                  if(currentState == "maximized")
                  {
                     this.toNormal();
                  }
                  else if(currentState == "normal")
                  {
                     this.toMaximized();
                  }
               }
               else if(param1.target == this.aboutButton)
               {
                  this.showAbout();
               }
               else if(param1.target == this.rollButton)
               {
                  if(!this.isRolled)
                  {
                     this._lastHeight = this.height;
                     this.height = MIN_HEIGHT;
                     this.isRolled = true;
                     this.rollButton.setStyle("upIcon",ROLL_DOWN_BUTTON);
                     this.rollButton.setStyle("overIcon",ROLL_DOWN_BUTTON);
                     this.rollButton.setStyle("downIcon",ROLL_DOWN_BUTTON);
                     this.rollButton.setStyle("disabledIcon",ROLL_DOWN_BUTTON);
                  }
                  else
                  {
                     this.height = this._lastHeight;
                     this.maxHeight = MAX_HEIGHT;
                     this.isRolled = false;
                     this.rollButton.setStyle("upIcon",ROLL_UP_BUTTON);
                     this.rollButton.setStyle("overIcon",ROLL_UP_BUTTON);
                     this.rollButton.setStyle("downIcon",ROLL_UP_BUTTON);
                     this.rollButton.setStyle("disabledIcon",ROLL_UP_BUTTON);
                  }
               }
               param1.preventDefault();
            }
         }
      }
      
      protected function showAbout() : void
      {
      }
      
      private function isCursorOnEdge(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Point = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = getStyle("resizeAffordance") as Number;
         _loc2_ = new Point(x,y);
         _loc2_ = this.parent.localToGlobal(_loc2_);
         _loc3_ = new Point(param1.stageX,param1.stageY);
         _loc4_ = _loc3_.x - this.width - _loc2_.x;
         _loc5_ = _loc3_.x - _loc2_.x;
         _loc6_ = _loc3_.y - this.height - _loc2_.y;
         _loc7_ = _loc3_.y - _loc2_.y;
         if(param1.type == "rollOut")
         {
            this.handleEdge = EDGE_NONE;
         }
         else
         {
            this.handleEdge = EDGE_NONE;
            if(this.handleEdge == EDGE_NONE)
            {
               if(Math.abs(_loc4_) < _loc8_ && Math.abs(_loc6_) < _loc8_)
               {
                  this.handleEdge = EDGE_CORNER;
               }
               else if(Math.abs(_loc4_) < _loc8_ && Math.abs(_loc7_) < _loc8_)
               {
                  this.handleEdge = EDGE_RIGHT_TOP;
               }
               else if(Math.abs(_loc5_) < _loc8_ && Math.abs(_loc7_) < _loc8_)
               {
                  this.handleEdge = EDGE_LEFT_TOP;
               }
               else if(Math.abs(_loc5_) < _loc8_ && Math.abs(_loc6_) < _loc8_)
               {
                  this.handleEdge = EDGE_LEFT_BOTTOM;
               }
               else if(Math.abs(_loc6_) < _loc8_)
               {
                  this.handleEdge = EDGE_BOTTOM;
               }
               else if(Math.abs(_loc4_) < _loc8_)
               {
                  this.handleEdge = EDGE_RIGHT;
               }
               else if(Math.abs(_loc5_) < _loc8_)
               {
                  this.handleEdge = EDGE_LEFT;
               }
               else if(Math.abs(_loc7_) < _loc8_)
               {
                  this.handleEdge = EDGE_TOP;
               }
            }
         }
      }
      
      private function populateProperty(param1:DisplayObject, param2:String, param3:Number) : SetProperty
      {
         var _loc4_:SetProperty = new SetProperty();
         _loc4_.target = param1;
         _loc4_.name = param2;
         _loc4_.value = param3;
         return _loc4_;
      }
      
      private function pushStateProperties(param1:State, param2:int, param3:int, param4:uint, param5:uint, param6:uint, param7:uint) : void
      {
         var _loc8_:SetProperty = null;
         _loc8_ = this.populateProperty(this,"x",param2);
         param1.overrides.push(_loc8_);
         _loc8_ = this.populateProperty(this,"y",param3);
         param1.overrides.push(_loc8_);
         if(param6)
         {
            _loc8_ = this.populateProperty(this,"percentWidth",param6);
         }
         else
         {
            _loc8_ = this.populateProperty(this,"width",param4);
         }
         param1.overrides.push(_loc8_);
         if(param7)
         {
            _loc8_ = this.populateProperty(this,"percentHeight",param7);
         }
         else
         {
            _loc8_ = this.populateProperty(this,"height",param5);
         }
         param1.overrides.push(_loc8_);
         setCurrentState(param1.name);
      }
      
      private function resize(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Point = new Point(x,y);
         _loc4_ = this.parent.localToGlobal(_loc4_);
         var _loc5_:Point = new Point(param1.stageX,param1.stageY);
         if(this.handleEdge == EDGE_BOTTOM)
         {
            this.setSize(_loc4_.x,_loc4_.y,width,_loc5_.y - _loc4_.y);
         }
         else if(this.handleEdge == EDGE_RIGHT)
         {
            this.setSize(_loc4_.x,_loc4_.y,_loc5_.x - _loc4_.x,height);
         }
         else if(this.handleEdge == EDGE_LEFT)
         {
            this.setSize(_loc5_.x,_loc4_.y,_loc4_.x - _loc5_.x + width,height);
         }
         else if(this.handleEdge == EDGE_TOP)
         {
            this.setSize(_loc4_.x,_loc5_.y,width,_loc4_.y - _loc5_.y + height);
         }
         else if(this.handleEdge == EDGE_CORNER)
         {
            this.setSize(_loc4_.x,_loc4_.y,_loc5_.x - _loc4_.x,_loc5_.y - _loc4_.y);
         }
         else if(this.handleEdge == EDGE_LEFT_TOP)
         {
            this.setSize(_loc5_.x,_loc5_.y,_loc4_.x - _loc5_.x + width,_loc4_.y - _loc5_.y + height);
         }
         else if(this.handleEdge == EDGE_LEFT_BOTTOM)
         {
            this.setSize(_loc5_.x,_loc4_.y,_loc4_.x - _loc5_.x + width,_loc5_.y - _loc4_.y);
         }
         else if(this.handleEdge == EDGE_RIGHT_TOP)
         {
            this.setSize(_loc4_.x,_loc5_.y,_loc5_.x - _loc4_.x,_loc4_.y - _loc5_.y + height);
         }
      }
      
      private function resizeHandler(param1:Event) : void
      {
         if(currentState == "maximized")
         {
            this.toPseudoMax();
            this.toMaximized();
         }
      }
      
      override public function move(param1:Number, param2:Number) : void
      {
         super.move(param1,param2);
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
      }
      
      private function setEffects() : void
      {
         this.stateNormal = new State();
         this.stateNormal.name = "normal";
         states.push(this.stateNormal);
         this.stateMax = new State();
         this.stateMax.name = "maximized";
         states.push(this.stateMax);
         this.statePseudoMax = new State();
         this.statePseudoMax.name = "pseudoMax";
         states.push(this.statePseudoMax);
         var _loc1_:Move = new Move();
         _loc1_.duration = 200;
         _loc1_.easingFunction = Bounce.easeInOut;
         var _loc2_:Resize = new Resize();
         _loc2_.duration = 200;
         _loc2_.easingFunction = Linear.easeIn;
         var _loc3_:Parallel = new Parallel();
         _loc3_.children.push(_loc1_);
         _loc3_.children.push(_loc2_);
         _loc3_.target = this;
         var _loc4_:Sequence = new Sequence();
         _loc4_.children.push(_loc3_);
         var _loc5_:Transition = new Transition();
         _loc5_.effect = _loc4_;
         _loc5_.fromState = "normal";
         _loc5_.toState = "maximized";
         transitions.push(_loc5_);
         _loc5_ = new Transition();
         _loc5_.effect = _loc4_;
         _loc5_.fromState = "maximized";
         _loc5_.toState = "normal";
         transitions.push(_loc5_);
         currentState = "normal";
      }
      
      private function setResizeCursor(param1:MouseEvent) : void
      {
         var _loc2_:Class = null;
         this.isCursorOnEdge(param1);
         if(this.handleEdge != EDGE_NONE && currentState == "normal")
         {
            if(this.cursorId == 0 || this.lastEdge != this.handleEdge)
            {
               if(this.lastEdge != this.handleEdge)
               {
                  CursorManager.removeCursor(this.cursorId);
                  this.cursorId = 0;
               }
               _loc2_ = null;
               if(this.handleEdge == EDGE_CORNER || this.handleEdge == EDGE_LEFT_TOP)
               {
                  _loc2_ = this.dCursorSymbol;
               }
               else if(this.handleEdge == EDGE_LEFT_BOTTOM || this.handleEdge == EDGE_RIGHT_TOP)
               {
                  _loc2_ = this.rdCursorSymbol;
               }
               else if(this.handleEdge == EDGE_RIGHT || this.handleEdge == EDGE_LEFT)
               {
                  _loc2_ = this.hCursorSymbol;
               }
               else if(this.handleEdge == EDGE_BOTTOM || this.handleEdge == EDGE_TOP)
               {
                  _loc2_ = this.vCursorSymbol;
               }
               if(_loc2_ != null)
               {
                  this.cursorId = CursorManager.setCursor(_loc2_,CursorManagerPriority.HIGH,-16,-16);
               }
               this.lastEdge = this.handleEdge;
            }
         }
         else if(this.cursorId != 0)
         {
            CursorManager.removeCursor(this.cursorId);
            this.cursorId = 0;
            this.lastEdge = EDGE_NONE;
         }
      }
      
      private function setSize(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = Number(explicitMinWidth);
         if(isNaN(_loc5_))
         {
            _loc5_ = 100;
         }
         var _loc6_:Number = Number(explicitMinHeight);
         if(isNaN(_loc6_))
         {
            _loc6_ = 35;
         }
         param3 = Math.max(_loc5_,param3);
         param4 = Math.max(_loc6_,param4);
         var _loc7_:Point = new Point(param1,param2);
         _loc7_ = this.parent.globalToLocal(_loc7_);
         this.x = _loc7_.x;
         y = _loc7_.y;
         width = param3;
         height = param4;
         this.storeOrigDimensions();
      }
      
      private function storeOrigDimensions() : void
      {
         this.origPosition = new Point();
         this.origDimensions = new Point();
         this.origPerDimensions = new Point();
         if(parent is ISystemManager)
         {
            this.origPosition.x = parent.x;
            this.origPosition.y = parent.y;
            this.origPosition = this.localToGlobal(this.origPosition);
         }
         else
         {
            this.origPosition.x = x;
            this.origPosition.y = y;
         }
         if(percentWidth)
         {
            this.origPerDimensions.x = percentWidth;
         }
         else
         {
            this.origDimensions.x = getExplicitOrMeasuredWidth();
         }
         if(percentHeight)
         {
            this.origPerDimensions.y = percentHeight;
         }
         else
         {
            this.origDimensions.y = getExplicitOrMeasuredHeight();
         }
      }
      
      private function toMaximized() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc5_:Rectangle = null;
         this.storeOrigDimensions();
         var _loc1_:Point = new Point(0,0);
         var _loc4_:EdgeMetrics = new EdgeMetrics(0,0,6,8);
         if(parent is Application)
         {
            _loc5_ = ISystemManager(root).screen;
            _loc2_ = _loc5_.width + 4;
            _loc3_ = _loc5_.height + 4;
         }
         else
         {
            _loc2_ = parent.width + 4;
            _loc3_ = parent.height + 4;
            _loc1_ = parent.localToGlobal(_loc1_);
            _loc1_ = parent.globalToLocal(_loc1_);
         }
         this.pushStateProperties(this.stateMax,_loc1_.x,_loc1_.y,_loc2_ - _loc4_.right,_loc3_ - _loc4_.bottom,NaN,NaN);
         this.maximizeButton.setStyle("upIcon",RESTORE_BUTTON);
         this.maximizeButton.setStyle("overIcon",RESTORE_BUTTON);
         this.maximizeButton.setStyle("downIcon",RESTORE_BUTTON);
         this.maximizeButton.setStyle("disabledIcon",RESTORE_BUTTON);
         dispatchEvent(new Event("maximize"));
      }
      
      private function toNormal() : void
      {
         this.pushStateProperties(this.stateNormal,this.origPosition.x,this.origPosition.y,this.origDimensions.x,this.origDimensions.y,this.origPerDimensions.x,this.origPerDimensions.y);
         this.maximizeButton.setStyle("upIcon",MAXIMIZE_BUTTON);
         this.maximizeButton.setStyle("overIcon",MAXIMIZE_BUTTON);
         this.maximizeButton.setStyle("downIcon",MAXIMIZE_BUTTON);
         this.maximizeButton.setStyle("disabledIcon",MAXIMIZE_BUTTON);
         dispatchEvent(new Event("restore"));
      }
      
      private function toPseudoMax() : void
      {
         if(currentState == "maximized")
         {
            this.pushStateProperties(this.statePseudoMax,x,y,width,height,NaN,NaN);
         }
      }
   }
}

