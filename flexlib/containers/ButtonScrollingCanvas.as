package flexlib.containers
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.core.ScrollPolicy;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   
   public class ButtonScrollingCanvas extends Canvas
   {
      private static var DEFAULT_UP_BUTTON:Class = ButtonScrollingCanvas_DEFAULT_UP_BUTTON;
      
      private static var DEFAULT_DOWN_BUTTON:Class = ButtonScrollingCanvas_DEFAULT_DOWN_BUTTON;
      
      private static var DEFAULT_LEFT_BUTTON:Class = ButtonScrollingCanvas_DEFAULT_LEFT_BUTTON;
      
      private static var DEFAULT_RIGHT_BUTTON:Class = ButtonScrollingCanvas_DEFAULT_RIGHT_BUTTON;
      
      public static var DEFAULT_BUTTON_WIDTH:Number = 15;
      
      initializeStyles();
      
      private var leftButton:Button;
      
      private var rightButton:Button;
      
      private var upButton:Button;
      
      private var downButton:Button;
      
      private var _explicitButtonHeight:Number;
      
      private var innerCanvas:Canvas;
      
      private var timer:Timer;
      
      public var scrollSpeed:Number = 10;
      
      public var scrollJump:Number = 10;
      
      private var _childrenCreated:Boolean = false;
      
      private var _startScrollingEvent:String = "mouseDown";
      
      private var _stopScrollingEvent:String = "mouseUp";
      
      public function ButtonScrollingCanvas()
      {
         super();
      }
      
      private static function initializeStyles() : void
      {
         var upStyleName:String;
         var upSelector:CSSStyleDeclaration;
         var downStyleName:String;
         var downSelector:CSSStyleDeclaration;
         var leftStyleName:String;
         var leftSelector:CSSStyleDeclaration;
         var rightStyleName:String;
         var rightSelector:CSSStyleDeclaration;
         var selector:CSSStyleDeclaration = StyleManager.getStyleManager(null).getStyleDeclaration("flexlib.containers.ButtonScrollingCanvas");
         if(!selector)
         {
            selector = new CSSStyleDeclaration();
         }
         selector.defaultFactory = function():void
         {
            this.upButtonStyleName = "upButton";
            this.downButtonStyleName = "downButton";
            this.leftButtonStyleName = "leftButton";
            this.rightButtonStyleName = "rightButton";
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("flexlib.containers.ButtonScrollingCanvas",selector,false);
         upStyleName = selector.getStyle("upButtonStyleName");
         upSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + upStyleName);
         if(!upSelector)
         {
            upSelector = new CSSStyleDeclaration();
         }
         upSelector.defaultFactory = function():void
         {
            this.icon = DEFAULT_UP_BUTTON;
            this.fillAlphas = [1,1,1,1];
            this.cornerRadius = 0;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + upStyleName,upSelector,false);
         downStyleName = selector.getStyle("downButtonStyleName");
         downSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + downStyleName);
         if(!downSelector)
         {
            downSelector = new CSSStyleDeclaration();
         }
         downSelector.defaultFactory = function():void
         {
            this.icon = DEFAULT_DOWN_BUTTON;
            this.fillAlphas = [1,1,1,1];
            this.cornerRadius = 0;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + downStyleName,downSelector,false);
         leftStyleName = selector.getStyle("leftButtonStyleName");
         leftSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + leftStyleName);
         if(!leftSelector)
         {
            leftSelector = new CSSStyleDeclaration();
         }
         leftSelector.defaultFactory = function():void
         {
            this.icon = DEFAULT_LEFT_BUTTON;
            this.fillAlphas = [1,1,1,1];
            this.cornerRadius = 0;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + leftStyleName,leftSelector,false);
         rightStyleName = selector.getStyle("rightButtonStyleName");
         rightSelector = StyleManager.getStyleManager(null).getStyleDeclaration("." + rightStyleName);
         if(!rightSelector)
         {
            rightSelector = new CSSStyleDeclaration();
         }
         rightSelector.defaultFactory = function():void
         {
            this.icon = DEFAULT_RIGHT_BUTTON;
            this.fillAlphas = [1,1,1,1];
            this.cornerRadius = 0;
         };
         StyleManager.getStyleManager(null).setStyleDeclaration("." + rightStyleName,rightSelector,false);
      }
      
      public function get startScrollingEvent() : String
      {
         return this._startScrollingEvent;
      }
      
      public function set startScrollingEvent(param1:String) : void
      {
         if(this._childrenCreated)
         {
            this.removeListeners(this._startScrollingEvent);
            this.addListeners(param1);
         }
         this._startScrollingEvent = param1;
      }
      
      public function get stopScrollingEvent() : String
      {
         return this._stopScrollingEvent;
      }
      
      public function set stopScrollingEvent(param1:String) : void
      {
         this._stopScrollingEvent = param1;
      }
      
      override public function initialize() : void
      {
         super.initialize();
         ButtonScrollingCanvas.initializeStyles();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.timer = new Timer(this.scrollSpeed);
         this.leftButton = new Button();
         this.rightButton = new Button();
         this.upButton = new Button();
         this.downButton = new Button();
         this.leftButton.styleName = getStyle("leftButtonStyleName");
         this.rightButton.styleName = getStyle("rightButtonStyleName");
         this.upButton.styleName = getStyle("upButtonStyleName");
         this.downButton.styleName = getStyle("downButtonStyleName");
         this.innerCanvas = new Canvas();
         this.innerCanvas.document = this.document;
         this.innerCanvas.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.innerCanvas.verticalScrollPolicy = ScrollPolicy.OFF;
         this.innerCanvas.clipContent = true;
         while(this.numChildren > 0)
         {
            this.innerCanvas.addChild(this.removeChildAt(0));
         }
         rawChildren.addChild(this.innerCanvas);
         rawChildren.addChild(this.leftButton);
         rawChildren.addChild(this.rightButton);
         rawChildren.addChild(this.upButton);
         rawChildren.addChild(this.downButton);
         this._childrenCreated = true;
         this.addListeners(this._startScrollingEvent);
      }
      
      private function addListeners(param1:String) : void
      {
         this.leftButton.addEventListener(param1,this.startScrollingLeft,false,0,true);
         this.rightButton.addEventListener(param1,this.startScrollingRight,false,0,true);
         this.upButton.addEventListener(param1,this.startScrollingUp,false,0,true);
         this.downButton.addEventListener(param1,this.startScrollingDown,false,0,true);
      }
      
      private function removeListeners(param1:String) : void
      {
         this.leftButton.removeEventListener(param1,this.startScrollingLeft);
         this.rightButton.removeEventListener(param1,this.startScrollingRight);
         this.upButton.removeEventListener(param1,this.startScrollingUp);
         this.downButton.removeEventListener(param1,this.startScrollingDown);
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         if(this._childrenCreated)
         {
            return this.innerCanvas.addChild(param1);
         }
         return super.addChild(param1);
      }
      
      override public function get horizontalScrollPosition() : Number
      {
         return this.innerCanvas.horizontalScrollPosition;
      }
      
      override public function set horizontalScrollPosition(param1:Number) : void
      {
         this.innerCanvas.horizontalScrollPosition = param1;
         callLater(this.enableOrDisableButtons);
      }
      
      override public function get verticalScrollPosition() : Number
      {
         return this.innerCanvas.verticalScrollPosition;
      }
      
      override public function set verticalScrollPosition(param1:Number) : void
      {
         this.innerCanvas.verticalScrollPosition = param1;
         callLater(this.enableOrDisableButtons);
      }
      
      override public function get maxHorizontalScrollPosition() : Number
      {
         return this.innerCanvas.maxHorizontalScrollPosition;
      }
      
      override public function get maxVerticalScrollPosition() : Number
      {
         return this.innerCanvas.maxVerticalScrollPosition;
      }
      
      public function get buttonWidth() : Number
      {
         var _loc1_:Number = Number(getStyle("flexlib.containers.buttonWidth"));
         if(_loc1_)
         {
            return _loc1_;
         }
         return ButtonScrollingCanvas.DEFAULT_BUTTON_WIDTH;
      }
      
      public function set buttonWidth(param1:Number) : void
      {
         this.setStyle("flexlib.containers.buttonWidth",param1);
         invalidateDisplayList();
      }
      
      public function set explicitButtonHeight(param1:Number) : void
      {
         this._explicitButtonHeight = param1;
         invalidateDisplayList();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.innerCanvas.setActualSize(param1,param2);
         this.positionButtons(param1,param2);
         callLater(this.enableOrDisableButtons);
      }
      
      private function positionButtons(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = this.buttonWidth;
         var _loc4_:Number = !!this._explicitButtonHeight ? this._explicitButtonHeight : param2;
         this.leftButton.move(0,0);
         this.leftButton.setActualSize(_loc3_,_loc4_);
         this.rightButton.move(param1 - _loc3_,0);
         this.rightButton.setActualSize(_loc3_,_loc4_);
         this.upButton.move(_loc3_,0);
         this.downButton.move(_loc3_,param2 - _loc3_);
         this.upButton.setActualSize(param1 - _loc3_ * 2,_loc3_);
         this.downButton.setActualSize(param1 - _loc3_ * 2,_loc3_);
      }
      
      private function startScrollingLeft(param1:Event) : void
      {
         if(!(param1.currentTarget as Button).enabled)
         {
            return;
         }
         this.startScrolling(this.scrollLeft,param1.currentTarget as Button);
      }
      
      private function startScrollingRight(param1:Event) : void
      {
         if(!(param1.currentTarget as Button).enabled)
         {
            return;
         }
         this.startScrolling(this.scrollRight,param1.currentTarget as Button);
      }
      
      private function startScrollingUp(param1:Event) : void
      {
         if(!(param1.currentTarget as Button).enabled)
         {
            return;
         }
         this.startScrolling(this.scrollUp,param1.currentTarget as Button);
      }
      
      private function startScrollingDown(param1:Event) : void
      {
         if(!(param1.currentTarget as Button).enabled)
         {
            return;
         }
         this.startScrolling(this.scrollDown,param1.currentTarget as Button);
      }
      
      private function startScrolling(param1:Function, param2:Button) : void
      {
         if(this._stopScrollingEvent == MouseEvent.MOUSE_UP)
         {
            stage.addEventListener(this._stopScrollingEvent,this.stopScrolling);
         }
         else
         {
            param2.addEventListener(this._stopScrollingEvent,this.stopScrolling);
         }
         if(this.timer.running)
         {
            this.timer.stop();
         }
         this.timer = new Timer(this.scrollSpeed);
         this.timer.addEventListener(TimerEvent.TIMER,param1);
         this.timer.start();
      }
      
      private function stopScrolling(param1:Event) : void
      {
         if(this.timer.running)
         {
            this.timer.stop();
         }
      }
      
      private function scrollLeft(param1:TimerEvent) : void
      {
         this.innerCanvas.horizontalScrollPosition -= this.scrollJump;
         this.enableOrDisableButtons();
      }
      
      private function scrollRight(param1:TimerEvent) : void
      {
         this.innerCanvas.horizontalScrollPosition += this.scrollJump;
         this.enableOrDisableButtons();
      }
      
      private function scrollUp(param1:TimerEvent) : void
      {
         this.innerCanvas.verticalScrollPosition -= this.scrollJump;
         this.enableOrDisableButtons();
      }
      
      private function scrollDown(param1:TimerEvent) : void
      {
         this.innerCanvas.verticalScrollPosition += this.scrollJump;
         this.enableOrDisableButtons();
      }
      
      protected function enableOrDisableButtons() : void
      {
         if(this.horizontalScrollPolicy == ScrollPolicy.OFF)
         {
            this.leftButton.visible = this.rightButton.visible = this.leftButton.includeInLayout = this.rightButton.includeInLayout = false;
         }
         else
         {
            this.leftButton.visible = this.leftButton.enabled = this.innerCanvas.horizontalScrollPosition > 0;
            this.rightButton.visible = this.rightButton.enabled = this.innerCanvas.horizontalScrollPosition < this.innerCanvas.maxHorizontalScrollPosition;
         }
         if(this.verticalScrollPolicy == ScrollPolicy.OFF)
         {
            this.upButton.visible = this.downButton.visible = this.upButton.includeInLayout = this.downButton.includeInLayout = false;
         }
         else
         {
            this.upButton.visible = this.upButton.enabled = this.upButton.includeInLayout = this.innerCanvas.verticalScrollPosition > 0;
            this.downButton.visible = this.downButton.enabled = this.downButton.includeInLayout = this.innerCanvas.verticalScrollPosition < this.innerCanvas.maxVerticalScrollPosition;
         }
         this.positionButtons(this.width,this.height);
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return this._childrenCreated ? this.innerCanvas.getChildAt(param1) : super.getChildAt(param1);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(this._childrenCreated)
         {
            return this.innerCanvas.addChildAt(param1,param2);
         }
         return super.addChildAt(param1,param2);
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         return this._childrenCreated ? this.innerCanvas.getChildByName(param1) : super.getChildByName(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return this._childrenCreated ? int(this.innerCanvas.getChildIndex(param1)) : super.getChildIndex(param1);
      }
      
      override public function getChildren() : Array
      {
         return this._childrenCreated ? this.innerCanvas.getChildren() : super.getChildren();
      }
   }
}

