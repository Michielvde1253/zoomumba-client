package com.bigpoint.zoomumba.controller.user
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UserGetShopItemsCommand extends SimpleCommand
   {
      public function UserGetShopItemsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NetProxy = super.facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         if(_loc2_)
         {
            _loc2_.callServer(NET.INVENTORY_GET,[]).sendNow();
         }
      }
   }
}

