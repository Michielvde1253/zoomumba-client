package com.bigpoint.zoomumba.controller.net.handlers
{
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.MaterialData;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleMaterialDataCommand extends SimpleCommand
   {
      public function HandleMaterialDataCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:MaterialData = null;
         var _loc5_:MaterialProxy = null;
         var _loc2_:Vector.<MaterialData> = param1.getBody() as Vector.<MaterialData>;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = facade.retrieveProxy(MaterialProxy.NAME) as MaterialProxy;
            _loc5_.setMaterial(_loc4_.materialId,_loc4_.count);
            _loc5_.setMaterialMax(_loc4_.materialId,_loc4_.maxCount);
            _loc3_++;
         }
         sendNotification(SHOP.REFRESH_RESOURCES);
      }
   }
}

