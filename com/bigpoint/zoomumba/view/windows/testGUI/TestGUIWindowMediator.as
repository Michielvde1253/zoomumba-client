package com.bigpoint.zoomumba.view.windows.testGUI
{
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.testGUI.TestGUIContent;
   import windows.custom.testGUI.TestGUIWindow;
   
   public class TestGUIWindowMediator extends WindowMediator
   {
      public static const NAME:String = "TestGUIWindowMediator";
      
      public function TestGUIWindowMediator(param1:TestGUIWindow)
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
      
      private function get window() : TestGUIWindow
      {
         return viewComponent as TestGUIWindow;
      }
      
      private function get content() : TestGUIContent
      {
         return this.window.getContent(0) as TestGUIContent;
      }
      
      override public function dispose() : void
      {
      }
   }
}

