package com.bigpoint.zoorama.view.gui.tooltip
{
   import com.bigpoint.zoorama.MainConfig;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TooltipNewManager
   {
      private static var _gameStage:DisplayObjectContainer;
      
      private static var _current:TooltipItem;
      
      private static var _item:DisplayObject;
      
      private static var _optionalX:int;
      
      private static var _optionalY:int;
      
      private static var _useMousePos:Boolean;
      
      private static const MAX_CROP_WORD:int = 40;
      
      private static const SPACE_LETTER:String = " ";
      
      private static const BREAK_SYMB:String = "<br>";
      
      public static var isEnable:Boolean = true;
      
      public function TooltipNewManager()
      {
         super();
      }
      
      public static function get current() : TooltipItem
      {
         return _current;
      }
      
      public static function init(param1:DisplayObjectContainer) : void
      {
         _gameStage = param1;
      }
      
      public static function setToolTip(param1:DisplayObject, param2:String, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:Boolean = false) : void
      {
         if(isEnable && param2 != null && param1 != null)
         {
            _item = null;
            _useMousePos = param3;
            _optionalX = param4;
            _optionalY = param5;
            _item = param1;
            removeToolTip();
            _current = null;
            _current = new TooltipItem(param2);
            _gameStage.addChild(_current);
            if(_useMousePos)
            {
               _gameStage.addEventListener(Event.ENTER_FRAME,setToolPosition);
            }
            else
            {
               setToolPosition();
            }
            tweenTool("in",param6);
         }
      }
      
      public static function setToolTipCrop(param1:DisplayObject, param2:String, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:Boolean = false) : void
      {
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         if(isEnable && param2 != null && param1 != null)
         {
            if(param2.length > MAX_CROP_WORD)
            {
               _loc7_ = MAX_CROP_WORD;
               param2 = param2.replace(BREAK_SYMB,SPACE_LETTER);
               _loc10_ = MAX_CROP_WORD;
               while(_loc10_ < param2.length)
               {
                  _loc9_ = param2.substr(_loc10_,1);
                  if(_loc7_ >= MAX_CROP_WORD && _loc9_ == SPACE_LETTER)
                  {
                     param2 = param2.substr(0,_loc10_) + "<br>" + param2.substr(_loc10_ + 1,param2.length - _loc10_ - 1);
                     _loc7_ = 0;
                  }
                  _loc7_ += 1;
                  _loc10_++;
               }
            }
            setToolTip(param1,param2,param3,param4,param5,param6);
         }
      }
      
      public static function setToolPosition(param1:Event = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:Point = new Point(_item.mouseX,_item.mouseY);
         if(_useMousePos)
         {
            if(int(_item.localToGlobal(_loc2_).x) > int(MainConfig.STAGE_WIDTH / 2))
            {
               _loc3_ = -_current.width - 10;
            }
            else if(int(_item.localToGlobal(_loc2_).x) < int(MainConfig.STAGE_WIDTH / 2))
            {
               _loc3_ = 10;
            }
            _loc4_ = 0;
         }
         else
         {
            if(int(_item.localToGlobal(_loc2_).x) > int(MainConfig.STAGE_WIDTH / 2))
            {
               _loc3_ = -_current.width;
            }
            else if(int(_item.localToGlobal(_loc2_).x) < int(MainConfig.STAGE_WIDTH / 2))
            {
               _loc3_ = 10;
            }
            if(int(_item.localToGlobal(_loc2_).y) > int(MainConfig.STAGE_HEIGHT / 2))
            {
               _loc4_ = -_item.height;
            }
            else if(int(_item.localToGlobal(_loc2_).y) < int(MainConfig.STAGE_HEIGHT / 2))
            {
               _loc4_ = 20;
            }
         }
         _current.x = _item.localToGlobal(_loc2_).x + _loc3_;
         _current.y = _item.localToGlobal(_loc2_).y + _loc4_;
      }
      
      private static function tweenTool(param1:String, param2:Boolean = false) : void
      {
         switch(param1)
         {
            case "in":
               _current.alpha = 0;
               if(param2)
               {
                  TweenLite.to(_current,0.3,{"alpha":1});
               }
               else
               {
                  TweenLite.to(_current,0.3,{
                     "alpha":1,
                     "delay":0.5
                  });
               }
               break;
            case "out":
               TweenLite.to(_current,0.3,{"alpha":0});
         }
      }
      
      public static function removeToolTip() : void
      {
         if(isEnable)
         {
            if(_current)
            {
               if(_current.parent)
               {
                  _gameStage.removeChild(_current);
               }
            }
            if(_useMousePos)
            {
               _gameStage.removeEventListener(Event.ENTER_FRAME,setToolPosition);
            }
         }
      }
      
      public static function enable() : void
      {
         isEnable = true;
      }
      
      public static function disable() : void
      {
         isEnable = false;
      }
   }
}

