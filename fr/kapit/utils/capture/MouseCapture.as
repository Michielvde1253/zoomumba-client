package fr.kapit.utils.capture
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import fr.kapit.utils.ApplicationUtils;
   import fr.kapit.utils.KapDebugConstants;
   import mx.core.Container;
   import mx.core.IFlexDisplayObject;
   import mx.core.UIComponent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.PopUpManager;
   
   public class MouseCapture extends EventDispatcher
   {
      private static var _instance:MouseCapture;
      
      private static var _isInitialized:Boolean = false;
      
      public var captureApp:Boolean = false;
      
      public var captureOnlyVisible:Boolean = true;
      
      public var captureSwfLoader:Boolean = true;
      
      private var _app:UIComponent;
      
      private var _arrSelectedRect:Array = null;
      
      private var _isInCapture:Boolean = false;
      
      private var _isPopupOpened:Boolean = false;
      
      private var _overObj:ObjectCaptured;
      
      private var _previewObject:ObjectCaptured;
      
      private var _root:DisplayObject;
      
      private var _selectLayer:Sprite;
      
      private var _selectedObject:ObjectCaptured;
      
      public function MouseCapture(param1:MouseCaptureEnforcer, param2:DisplayObject, param3:UIComponent, param4:Class = null)
      {
         var _loc7_:Object = null;
         var _loc8_:uint = 0;
         var _loc9_:int = 0;
         var _loc10_:DisplayObject = null;
         var _loc11_:IFlexDisplayObject = null;
         this._selectLayer = new Sprite();
         if(param1 is MouseCaptureEnforcer)
         {
            super();
            this._root = param2;
            this._app = param3;
            var _loc5_:int = 0;
            var _loc6_:int = 0;
            while(_loc6_ < this._app.systemManager.rawChildren.numChildren)
            {
               _loc7_ = this._app.systemManager.rawChildren.getChildAt(_loc6_);
               if(_loc7_ is DisplayObject)
               {
                  _loc5_++;
               }
               _loc6_++;
            }
            this._selectLayer.mouseEnabled = false;
            this._app.systemManager.addChild(this._selectLayer);
            if(param4 is Class)
            {
               _loc8_ = uint(this._app.systemManager.rawChildren.numChildren);
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc10_ = this._app.systemManager.rawChildren.getChildAt(_loc9_);
                  if(_loc10_ is param4)
                  {
                     this._app.systemManager.removeChild(_loc10_);
                     _loc11_ = _loc10_ as IFlexDisplayObject;
                     PopUpManager.addPopUp(_loc11_,this._app);
                  }
                  _loc9_++;
               }
            }
            param3.stage.addEventListener(MouseEvent.CLICK,this.onClickOnSprite);
            this._selectLayer.addEventListener(Event.ENTER_FRAME,this.onEnterSpriteFrame);
            this._selectLayer.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyBoard);
            this._overObj = new ObjectCaptured(KapDebugConstants.TYPE_OBJ_OVER);
            return;
         }
         throw new Error("Use MouseCapture.instance");
      }
      
      public static function initialize(param1:DisplayObject, param2:UIComponent, param3:Class = null) : MouseCapture
      {
         if(!_isInitialized)
         {
            _instance = new MouseCapture(new MouseCaptureEnforcer(),param1,param2,param3);
            _isInitialized = true;
         }
         return _instance;
      }
      
      public static function get initialized() : Boolean
      {
         return _isInitialized;
      }
      
      public static function get instance() : MouseCapture
      {
         if(!_isInitialized)
         {
            throw new Error("Use initialize method to create the instance.");
         }
         return _instance;
      }
      
      public function set arrSelectedRect(param1:Array) : void
      {
         this._arrSelectedRect = param1;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._selectLayer.graphics.clear();
         if(this._overObj)
         {
            this._overObj.cleanUp();
         }
         if(this._selectedObject)
         {
            this._selectedObject.cleanUp();
         }
         if(this._previewObject)
         {
            this._previewObject.cleanUp();
         }
         this._overObj = null;
         this._selectedObject = null;
         this._previewObject = null;
         this._arrSelectedRect = null;
         this.isInCapture = param1;
      }
      
      public function get isInCapture() : Boolean
      {
         return this._isInCapture;
      }
      
      private function set _1027108951isInCapture(param1:Boolean) : void
      {
         this._isInCapture = param1;
         if(this._isInCapture)
         {
            this._root.stage.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseMove,true);
            this._root.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyBoard,true,Number.MAX_VALUE);
            if(this._previewObject)
            {
               this._selectedObject = new ObjectCaptured(KapDebugConstants.TYPE_OBJ_SELECTED);
               this._selectedObject.dObject = this._previewObject.dObject;
               this._previewObject.cleanUp();
               this._previewObject = null;
            }
         }
         else
         {
            this._root.stage.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseMove);
            this._root.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyBoard);
            this._makeAPreview();
         }
      }
      
      public function set isPopupOpened(param1:Boolean) : void
      {
         this._isPopupOpened = param1;
      }
      
      public function set objectPreview(param1:DisplayObject) : void
      {
         if(this._selectedObject)
         {
            this._selectedObject.dObject = param1;
            return;
         }
         if(!this._previewObject)
         {
            this._previewObject = new ObjectCaptured(KapDebugConstants.TYPE_OBJ_PREVIEW);
         }
         this._previewObject.dObject = param1;
      }
      
      public function overPopup() : void
      {
         if(this._overObj)
         {
            this._overObj.cleanUp();
         }
         this._overObj = null;
      }
      
      public function get previewObject() : ObjectCaptured
      {
         return this._previewObject;
      }
      
      public function get selectedObject() : DisplayObject
      {
         if(this._selectedObject)
         {
            return this._selectedObject.dObject;
         }
         if(this._previewObject)
         {
            return this._previewObject.dObject;
         }
         return null;
      }
      
      private function _makeAPreview() : void
      {
         if(this._selectedObject)
         {
            this._previewObject = new ObjectCaptured(KapDebugConstants.TYPE_OBJ_PREVIEW);
            this._previewObject.dObject = this._selectedObject.dObject;
         }
         if(this._overObj)
         {
            this._overObj.cleanUp();
         }
         if(this._selectedObject)
         {
            this._selectedObject.cleanUp();
         }
         this._overObj = this._selectedObject = null;
      }
      
      private function getLastObject(param1:DisplayObjectContainer, param2:int, param3:int, param4:int, param5:MouseEvent) : DisplayObject
      {
         var _loc7_:int = 0;
         var _loc11_:DisplayObject = null;
         var _loc6_:DisplayObject = null;
         if(param1 is Container)
         {
            _loc7_ = int(Container(param1).rawChildren.numChildren);
         }
         else
         {
            _loc7_ = param1.numChildren;
         }
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc11_ = param1 is Container ? Container(param1).rawChildren.getChildAt(_loc8_) : param1.getChildAt(_loc8_);
            if(_loc11_.hitTestPoint(param2,param3))
            {
               if(!(!_loc11_.visible && !param5.altKey))
               {
                  if(_loc11_ is DisplayObjectContainer)
                  {
                     param4 += 1;
                     _loc6_ = this.getLastObject(_loc11_ as DisplayObjectContainer,param2,param3,param4,param5);
                  }
                  else
                  {
                     _loc6_ = _loc11_;
                  }
               }
            }
            _loc8_++;
         }
         var _loc9_:Boolean = param5.ctrlKey;
         var _loc10_:Boolean = true;
         while(_loc6_ != null && !_loc10_ && Boolean(_loc6_.parent))
         {
            _loc6_ = _loc6_.parent;
            _loc10_ = _loc6_ is UIComponent || _loc6_ is DisplayObject && _loc9_;
         }
         if(!_loc6_ && param1 is DisplayObject)
         {
            _loc6_ = param1 as DisplayObject;
         }
         return _loc6_;
      }
      
      private function onClickOnSprite(param1:MouseEvent) : void
      {
         if(!this._isInCapture)
         {
            return;
         }
         if(!this._overObj)
         {
            return;
         }
         if(!this._selectedObject)
         {
            this._selectedObject = new ObjectCaptured(KapDebugConstants.TYPE_OBJ_SELECTED);
         }
         this._selectedObject.cleanUp();
         this._selectedObject.dObject = this._overObj.dObject;
         this._overObj.cleanUp();
         this._arrSelectedRect = null;
         this._previewObject = null;
         param1.preventDefault();
         param1.stopPropagation();
         param1.stopImmediatePropagation();
         dispatchEvent(new ObjectCapturedEvent(this._selectedObject.dObject));
      }
      
      private function onEnterSpriteFrame(param1:Event) : void
      {
         var _loc3_:Point = null;
         var _loc4_:DisplayObject = null;
         var _loc5_:Rectangle = null;
         var _loc2_:Graphics = this._selectLayer.graphics;
         _loc2_.clear();
         if(this._arrSelectedRect)
         {
            _loc3_ = new Point(0,0);
            _loc2_.lineStyle(2,KapDebugConstants.COLOR_OBJ_MULTIPLE,1);
            _loc2_.beginFill(KapDebugConstants.COLOR_OBJ_MULTIPLE,0.1);
            for each(_loc4_ in this._arrSelectedRect)
            {
               _loc5_ = new Rectangle();
               _loc5_.x = _loc4_.localToGlobal(_loc3_).x;
               _loc5_.y = _loc4_.localToGlobal(_loc3_).y;
               _loc5_.width = _loc4_.width;
               _loc5_.height = _loc4_.height;
               _loc2_.drawRect(_loc5_.x,_loc5_.y,_loc5_.width,_loc5_.height);
            }
            _loc2_.endFill();
         }
         if(this._selectedObject)
         {
            this._selectedObject.draw(_loc2_);
         }
         if(Boolean(this._overObj) && this._isInCapture)
         {
            this._overObj.draw(_loc2_);
         }
         if(this._previewObject)
         {
            this._previewObject.draw(_loc2_);
         }
      }
      
      private function onKeyBoard(param1:KeyboardEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:ObjectCaptured = !!this._selectedObject ? this._selectedObject : (!!this._previewObject ? this._previewObject : null);
         if(!_loc2_)
         {
            return;
         }
         if(param1.keyCode == Keyboard.LEFT)
         {
            _loc3_ = -1;
         }
         else if(param1.keyCode == Keyboard.RIGHT)
         {
            _loc3_ = 1;
         }
         else if(param1.keyCode == Keyboard.UP)
         {
            _loc4_ = -1;
         }
         else if(param1.keyCode == Keyboard.DOWN)
         {
            _loc4_ = 1;
         }
         if(param1.shiftKey)
         {
            _loc3_ *= 10;
            _loc4_ *= 10;
         }
         if(_loc2_.dObject)
         {
            if(param1.ctrlKey)
            {
               _loc2_.dObject.width += _loc3_;
               _loc2_.dObject.height += _loc4_;
            }
            else
            {
               _loc2_.dObject.x += _loc3_;
               _loc2_.dObject.y += _loc4_;
            }
            if(_loc3_ != 0 || _loc4_ != 0)
            {
               param1.preventDefault();
               param1.stopImmediatePropagation();
               param1.stopPropagation();
               _loc2_.update(_loc2_.dObject);
               _loc2_.refreshTooltip();
            }
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         param1.preventDefault();
         if(!this._overObj)
         {
            this._overObj = new ObjectCaptured(KapDebugConstants.TYPE_OBJ_OVER);
         }
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         if(!this.captureApp && _loc2_ == ApplicationUtils.application)
         {
            this._overObj.cleanUp();
            this._overObj = null;
            return;
         }
         if(this._selectedObject)
         {
            if(_loc2_ != this._selectedObject.dObject)
            {
               this._overObj.dObject = _loc2_;
            }
            else
            {
               this._overObj.cleanUp();
               this._overObj = null;
            }
         }
         else
         {
            this._overObj.dObject = _loc2_;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function set isInCapture(param1:Boolean) : void
      {
         var _loc2_:Object = this.isInCapture;
         if(_loc2_ !== param1)
         {
            this._1027108951isInCapture = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isInCapture",_loc2_,param1));
            }
         }
      }
   }
}

class MouseCaptureEnforcer
{
   public function MouseCaptureEnforcer()
   {
      super();
   }
}
