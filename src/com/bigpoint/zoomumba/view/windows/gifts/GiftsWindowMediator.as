package com.bigpoint.zoomumba.view.windows.gifts
{
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gifts.GiftsWindow;
   import windows.custom.gifts.SendGiftContent;
   
   public class GiftsWindowMediator extends WindowMediator
   {
      public static const NAME:String = "GiftsWindowMediator";
      
      public function GiftsWindowMediator(param1:GiftsWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:* = undefined;
         _loc2_ = SendGiftContent(this.giftsWindow.getContent(0));
         facade.registerMediator(new SendGiftContentMediator(_loc2_));
         var _loc3_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.giftsWindow.header.filePath = _loc3_.getHeaderPath("header_gifts");
         super.init(param1);
      }
      
      private function get giftsWindow() : GiftsWindow
      {
         return this.viewComponent as GiftsWindow;
      }
      
      override public function dispose() : void
      {
         facade.removeMediator(SendGiftContentMediator.NAME);
      }
   }
}

