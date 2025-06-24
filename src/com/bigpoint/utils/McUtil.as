package com.bigpoint.utils
{
   import com.adobe.utils.ArrayUtil;
   import com.bigpoint.utils.vo.McUtilPHVo;
   import com.greensock.TweenLite;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.display.Stage;
   
   public class McUtil
   {
      private static var phcallbacks:Array = new Array();
      
      private var _phcallback:Function;
      
      private var _phobject:Object;
      
      private var _phmc:MovieClip;
      
      private var stage:Stage;
      
      public function McUtil()
      {
         super();
      }
      
      public static function gotoAndWait(param1:Function, param2:MovieClip, param3:*, param4:Object = null) : void
      {
         if(param2)
         {
            safeGotoAndStop(param2,param3);
            waitForPlayhead(param1,param2,param4);
         }
      }
      
      public static function waitForPlayhead(param1:Function, param2:MovieClip, param3:Object = null) : void
      {
         phcallbacks.push(new McUtilPHVo(param1,param3,param2));
         TweenLite.delayedCall(0.05,checkPhCallbacks);
      }
      
      public static function killAllCallbacksTo(param1:Function) : void
      {
         var _loc2_:McUtilPHVo = null;
         for each(_loc2_ in phcallbacks)
         {
            if(param1 == _loc2_.callback)
            {
               ArrayUtil.removeValueFromArray(phcallbacks,_loc2_);
            }
         }
      }
      
      public static function safeGotoAndStop(param1:MovieClip, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var mc:MovieClip = param1;
         var label:String = param2;
         var func:Function = param3;
         var errorFunc:Function = param4;
         try
         {
            if(func != null)
            {
               gotoAndWait(func,mc,label);
            }
            else
            {
               mc.gotoAndStop(label);
            }
         }
         catch(e:Error)
         {
            if(errorFunc != null)
            {
               try
               {
                  errorFunc(label);
               }
               catch(e:Error)
               {
               }
            }
         }
      }
      
      public static function hasLabel(param1:MovieClip, param2:String) : Boolean
      {
         var _loc3_:FrameLabel = null;
         for each(_loc3_ in param1.currentLabels)
         {
            if(_loc3_.name == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getLabelFrame(param1:MovieClip, param2:String) : int
      {
         var _loc3_:FrameLabel = null;
         for each(_loc3_ in param1.currentLabels)
         {
            if(_loc3_.name == param2)
            {
               return _loc3_.frame;
            }
         }
         return 1;
      }
      
      private static function checkPhCallbacks() : void
      {
         var _loc1_:int = 0;
         var _loc2_:McUtilPHVo = null;
         _loc1_ = 0;
         while(_loc1_ < phcallbacks.length)
         {
            _loc2_ = phcallbacks[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.mc == null)
               {
                  ArrayUtil.removeValueFromArray(phcallbacks,phcallbacks[_loc1_]);
               }
               else if(_loc2_.mc.numChildren > 0)
               {
                  if(_loc2_.callback != null)
                  {
                     TweenLite.delayedCall(0,doCallback,[_loc2_]);
                  }
                  ArrayUtil.removeValueFromArray(phcallbacks,phcallbacks[_loc1_]);
               }
               else
               {
                  _loc2_.cnt += 1;
                  if(_loc2_.cnt > 25)
                  {
                     if(_loc2_.callback != null)
                     {
                        TweenLite.delayedCall(0,doCallback,[_loc2_]);
                     }
                     ArrayUtil.removeValueFromArray(phcallbacks,phcallbacks[_loc1_]);
                  }
               }
            }
            else
            {
               ArrayUtil.removeValueFromArray(phcallbacks,phcallbacks[_loc1_]);
            }
            _loc1_++;
         }
         if(phcallbacks.length > 0)
         {
            TweenLite.delayedCall(0.05,checkPhCallbacks);
         }
      }
      
      private static function doCallback(param1:McUtilPHVo) : void
      {
         if(param1.callback != null)
         {
            if(param1.pars == null)
            {
               param1.callback();
            }
            else
            {
               param1.callback(param1.pars);
            }
         }
      }
      
      public function stopAllMC(param1:MovieClip, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc4_:MovieClip = null;
         if(param1 != null)
         {
            if(!param2)
            {
               param1.gotoAndStop(1);
            }
            _loc3_ = 0;
            while(_loc3_ < param1.numChildren)
            {
               _loc4_ = param1.getChildAt(_loc3_) as MovieClip;
               this.stopAllMC(_loc4_);
               _loc3_++;
            }
         }
      }
      
      public function debugDisplayList(param1:*) : void
      {
         if(param1 != null)
         {
            if(param1.parent != null)
            {
               this.debugDisplayList(param1.parent);
            }
         }
      }
   }
}

