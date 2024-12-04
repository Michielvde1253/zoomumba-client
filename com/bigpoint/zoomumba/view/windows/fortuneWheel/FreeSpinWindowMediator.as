package com.bigpoint.zoomumba.view.windows.fortuneWheel
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.zooWheel.freeSpin.FreeSpinContent;
   import windows.custom.zooWheel.freeSpin.FreeSpinWindow;
   
   public class FreeSpinWindowMediator extends WindowMediator
   {
      public static const NAME:String = "FreeSpinWindowMediator";
      
      public function FreeSpinWindowMediator(param1:FreeSpinWindow)
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
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.wheel.freeturn.title");
         this.windowContent.text1.htmlText = TextResourceModule.getText("zoo.wheel.freeturn.text.1");
         this.windowContent.text2.text = TextResourceModule.getText("zoo.wheel.freeturn.text.2");
         this.windowContent.text3.text = TextResourceModule.getText("zoo.wheel.freeturn.text.3");
         this.windowContent.text2.addEventListener(MouseEvent.CLICK,this.handleTakeFreeSpin);
         super.init(param1);
      }
      
      private function handleTakeFreeSpin(param1:MouseEvent) : void
      {
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL_FREE_SPIN));
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL));
      }
      
      private function get windowContent() : FreeSpinContent
      {
         return this.freeSpinWindow.getContent(0) as FreeSpinContent;
      }
      
      private function get freeSpinWindow() : FreeSpinWindow
      {
         return this.viewComponent as FreeSpinWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

