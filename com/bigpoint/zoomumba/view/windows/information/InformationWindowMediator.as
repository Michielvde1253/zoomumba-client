package com.bigpoint.zoomumba.view.windows.information
{
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.information.InformationContent;
   import windows.custom.information.InformationWindow;
   
   public class InformationWindowMediator extends WindowMediator
   {
      public static const NAME:String = "InformationWindowMediator";
      
      public function InformationWindowMediator(param1:InformationWindow)
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
         var _loc2_:InformationInitParams = param1 as InformationInitParams;
         var _loc3_:InformationContent = (viewComponent as InformationWindow).getContent(0) as InformationContent;
         _loc3_.header.title.text = _loc2_.title;
         _loc3_.message.htmlText = _loc2_.message;
      }
      
      override public function dispose() : void
      {
      }
   }
}

