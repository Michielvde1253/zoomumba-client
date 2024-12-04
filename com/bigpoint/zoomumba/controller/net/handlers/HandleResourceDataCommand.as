package com.bigpoint.zoomumba.controller.net.handlers
{
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.ResourceData;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleResourceDataCommand extends SimpleCommand
   {
      public function HandleResourceDataCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:ResourceData = null;
         var _loc5_:ResourcesProxy = null;
         var _loc2_:Vector.<ResourceData> = param1.getBody() as Vector.<ResourceData>;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
            _loc5_.setResource(_loc4_.resourceId,_loc4_.count);
            _loc5_.setResourceMax(_loc4_.resourceId,_loc4_.maxCount);
            _loc3_++;
         }
         sendNotification(SHOP.REFRESH_RESOURCES);
      }
   }
}

