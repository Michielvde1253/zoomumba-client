package utils
{
   import components.tooltip.IToolTipPostionable;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import mx.controls.ToolTip;
   import mx.core.FlexGlobals;
   import mx.core.IInvalidating;
   import mx.core.IToolTip;
   import mx.managers.ISystemManager;
   import mx.managers.ToolTipManager;
   
   public class ToolTipSpriteManager
   {
      private static var _registered:Dictionary = new Dictionary(true);
      
      public function ToolTipSpriteManager()
      {
         super();
      }
      
      public static function registerToolTip(param1:DisplayObject, param2:String) : void
      {
         if(_registered[param1] == undefined)
         {
            _registered[param1] = param2;
            param1.addEventListener(MouseEvent.MOUSE_OVER,showTip);
            param1.addEventListener(MouseEvent.MOUSE_MOVE,showTip);
            param1.addEventListener(MouseEvent.MOUSE_OUT,hideTip);
            param1.addEventListener(Event.REMOVED_FROM_STAGE,unregisterTip);
         }
      }
      
      public static function unregisterToolTip(param1:DisplayObject) : void
      {
         if(_registered[param1] != undefined)
         {
            param1.removeEventListener(MouseEvent.MOUSE_OVER,showTip);
            param1.removeEventListener(MouseEvent.MOUSE_MOVE,showTip);
            param1.removeEventListener(MouseEvent.MOUSE_OUT,hideTip);
            param1.removeEventListener(Event.REMOVED_FROM_STAGE,unregisterTip);
            _registered[param1] = null;
         }
      }
      
      private static function showTip(param1:MouseEvent) : void
      {
         showToolTip(param1.currentTarget as DisplayObject,_registered[param1.currentTarget],param1.stageX,param1.stageY);
      }
      
      private static function hideTip(param1:MouseEvent) : void
      {
         hideCurrentToolTip();
      }
      
      private static function unregisterTip(param1:MouseEvent) : void
      {
         unregisterToolTip(param1.currentTarget as DisplayObject);
      }
      
      private static function showToolTip(param1:DisplayObject, param2:String, param3:int, param4:int) : IToolTip
      {
         var _loc5_:ToolTip = null;
         var _loc6_:ISystemManager = null;
         if(ToolTipManager.currentToolTip != null && ToolTipManager.currentToolTip is IToolTip)
         {
            hideCurrentToolTip();
         }
         if(ToolTipManager.currentTarget != param1)
         {
            ToolTipManager.currentTarget = param1;
            _loc5_ = new ToolTipManager.toolTipClass();
            _loc6_ = FlexGlobals.topLevelApplication.systemManager as ISystemManager;
            _loc5_.moduleFactory = _loc6_;
            _loc6_.topLevelSystemManager.toolTipChildren.addChild(_loc5_ as DisplayObject);
            _loc5_.text = param2;
            if(_loc5_ is IInvalidating)
            {
               IInvalidating(_loc5_).validateNow();
            }
            _loc5_.setActualSize(_loc5_.getExplicitOrMeasuredWidth(),_loc5_.getExplicitOrMeasuredHeight());
            ToolTipManager.currentToolTip = _loc5_;
         }
         if(ToolTipManager.currentToolTip is IToolTipPostionable)
         {
            (ToolTipManager.currentToolTip as IToolTipPostionable).position(param3,param4);
         }
         else if(ToolTipManager.currentToolTip)
         {
            ToolTipManager.currentToolTip.move(param3,param4);
         }
         return ToolTipManager.currentToolTip;
      }
      
      private static function hideCurrentToolTip() : void
      {
         var _loc1_:ISystemManager = null;
         if(ToolTipManager.currentToolTip)
         {
            _loc1_ = ToolTipManager.currentToolTip.systemManager as ISystemManager;
            _loc1_.topLevelSystemManager.toolTipChildren.removeChild(ToolTipManager.currentToolTip as DisplayObject);
            ToolTipManager.currentTarget = null;
            ToolTipManager.currentToolTip = null;
         }
      }
   }
}

