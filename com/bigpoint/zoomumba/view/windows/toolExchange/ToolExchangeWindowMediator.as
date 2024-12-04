package com.bigpoint.zoomumba.view.windows.toolExchange
{
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.toolExchange.ToolExchangeContent;
   import windows.custom.toolExchange.ToolExchangeWindow;
   
   public class ToolExchangeWindowMediator extends WindowMediator
   {
      public static const NAME:String = "toolExchangeWindowMediator";
      
      public function ToolExchangeWindowMediator(param1:ToolExchangeWindow)
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
      }
      
      private function get window() : ToolExchangeWindow
      {
         return viewComponent as ToolExchangeWindow;
      }
      
      private function get content() : ToolExchangeContent
      {
         return this.window.getContent(0) as ToolExchangeContent;
      }
      
      override public function dispose() : void
      {
      }
   }
}

