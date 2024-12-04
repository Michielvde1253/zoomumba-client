package com.bigpoint.zoorama.view.windows
{
   import com.bigpoint.zoomumba.constants.PLAYFIELD;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.view.windows.events.WindowEvent;
   import com.greensock.TweenMax;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class WindowManagerNew
   {
      private static var windowContainer:DisplayObjectContainer;
      
      public static var groupRef:Group;
      
      public static var spriteVERef:SpriteVisualElement;
      
      private static var _width:int;
      
      private static var _height:int;
      
      private static var appWidth:int;
      
      private static var appHeight:int;
      
      private static var eventDispacher:EventDispatcher = new EventDispatcher();
      
      private static var openWindows:Vector.<WindowAbstract> = new Vector.<WindowAbstract>();
      
      private static var primaryWindows:Dictionary = new Dictionary();
      
      public function WindowManagerNew()
      {
         super();
      }
      
      public static function init(param1:DisplayObjectContainer) : void
      {
         WindowManagerNew.windowContainer = param1;
      }
      
      public static function setGameDims(param1:int, param2:int) : void
      {
         _width = param1;
         _height = param2;
      }
      
      public static function openWindow(param1:Class, param2:String, param3:Array = null, param4:Boolean = true, param5:int = 1, param6:int = 0, param7:String = null, param8:Vector.<String> = null) : WindowAbstract
      {
         var _loc9_:WindowAbstract = null;
         if(primaryWindows[param1])
         {
            _loc9_ = primaryWindows[param1];
         }
         else
         {
            _loc9_ = initWindow(param1,param2,param3,param4,param5,param6,param7,param8);
         }
         showWindow(_loc9_);
         return _loc9_;
      }
      
      private static function initWindow(param1:Class, param2:String, param3:Array = null, param4:Boolean = true, param5:int = 1, param6:int = 0, param7:String = null, param8:Vector.<String> = null) : WindowAbstract
      {
         var _loc9_:WindowAbstract = null;
         if(!param3 || param3.length == 0)
         {
            _loc9_ = new param1();
         }
         else
         {
            switch(param3.length)
            {
               case 1:
                  _loc9_ = new param1(param3[0]);
                  break;
               case 2:
                  _loc9_ = new param1(param3[0],param3[1]);
                  break;
               case 3:
                  _loc9_ = new param1(param3[0],param3[1],param3[2]);
                  break;
               case 4:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3]);
                  break;
               case 5:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3],param3[4]);
                  break;
               case 6:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3],param3[4],param3[5]);
                  break;
               case 7:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3],param3[4],param3[5],param3[6]);
                  break;
               case 8:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3],param3[4],param3[5],param3[6],param3[7]);
                  break;
               case 9:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3],param3[4],param3[5],param3[6],param3[7],param3[8]);
                  break;
               case 10:
                  _loc9_ = new param1(param3[0],param3[1],param3[2],param3[3],param3[4],param3[5],param3[6],param3[7],param3[8],param3[9]);
                  break;
               default:
                  throw Error("WindowmanagerNew error : cant support that meny parameters.");
            }
         }
         _loc9_.init(openWindows.length,param1,_width,_height,param2,param4,param6,param5,param7,param8);
         if(_loc9_.isPrimary)
         {
            primaryWindows[param1] = _loc9_;
         }
         _loc9_.alpha = 0;
         TweenMax.to(_loc9_,0.5,{"alpha":1});
         eventDispacher.dispatchEvent(new WindowEvent(WindowEvent.INIT,_loc9_));
         _loc9_.changeModalLayer(WindowManagerNew.appWidth,WindowManagerNew.appHeight);
         return _loc9_;
      }
      
      private static function showWindow(param1:WindowAbstract) : void
      {
         if(!param1._isOpen)
         {
            TempGetterProxy.sendNotification(PLAYFIELD.ENABLE_ANIMATION,false);
            param1._isOpen = true;
            param1.preOpen();
            windowContainer.addChild(param1);
            param1.container.x = -param1.container.width / 2 + param1.offsetX;
            param1.container.y = -param1.container.height / 2 + param1.offsetY;
            openWindows.push(param1);
            eventDispacher.dispatchEvent(new WindowEvent(WindowEvent.OPEN,param1));
         }
      }
      
      public static function closeWindow(param1:WindowAbstract) : void
      {
         var _loc2_:int = getPositionById(param1.windowId);
         if(_loc2_ >= 0)
         {
            hideWindow(_loc2_);
         }
      }
      
      public static function closeAllWindows() : void
      {
         var _loc1_:int = 0;
         while(openWindows.length > _loc1_)
         {
            if(WindowManagerNew.openWindows[_loc1_].persistent)
            {
               _loc1_++;
            }
            else
            {
               hideWindow(_loc1_);
            }
         }
      }
      
      public static function closeOtherWindows(... rest) : void
      {
      }
      
      public static function closeWindowByClassId(param1:Class) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < openWindows.length)
         {
            if(openWindows[_loc2_].classId == param1)
            {
               hideWindow(_loc2_);
               _loc2_--;
            }
            _loc2_++;
         }
      }
      
      private static function getPositionById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < openWindows.length)
         {
            if(openWindows[_loc2_]._windowId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      private static function hideWindow(param1:int) : void
      {
         WindowManagerNew.groupRef.removeAllElements();
         var _loc2_:WindowAbstract = openWindows[param1];
         _loc2_._isOpen = false;
         openWindows[0].preClose();
         if(windowContainer.contains(_loc2_))
         {
            windowContainer.removeChild(_loc2_ as Sprite);
         }
         eventDispacher.dispatchEvent(new WindowEvent(WindowEvent.CLOSE,_loc2_));
         if(!_loc2_.isPrimary)
         {
            eventDispacher.dispatchEvent(new WindowEvent(WindowEvent.DISPOSE,_loc2_));
            _loc2_.dispose();
         }
         openWindows.splice(param1,1);
         TempGetterProxy.sendNotification(PLAYFIELD.ENABLE_ANIMATION,true);
      }
      
      public static function handleNewAppSize(param1:int, param2:int) : void
      {
         var _loc4_:WindowAbstract = null;
         WindowManagerNew.appWidth = param1;
         WindowManagerNew.appHeight = param2;
         var _loc3_:int = 0;
         while(_loc3_ < openWindows.length)
         {
            _loc4_ = openWindows[_loc3_];
            _loc4_.changeModalLayer(param1,param2);
            _loc3_++;
         }
      }
      
      public static function addEventListener(param1:String, param2:Function) : void
      {
         eventDispacher.addEventListener(param1,param2);
      }
      
      public static function get openWindowCount() : int
      {
         return openWindows.length;
      }
   }
}

