package com.bigpoint.zoomumba.view.windows.superPack
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import windows.custom.superPack.SuperPackContent;
   import windows.custom.superPack.SuperPackWindow;
   
   public class SuperPackWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SuperPackWindowMediator";
      
      private var windowContent:SuperPackContent;
      
      private var netHelperProxy:NetHelperProxy;
      
      private var resourceProxy:ResourcesProxy;
      
      public function SuperPackWindowMediator(param1:SuperPackWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.resourceProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.RESOURCES_UPDATED,DataNote.REAL_MONEY_UPDATED];
      }
      
      private function get viewComponentTyped() : SuperPackWindow
      {
         return viewComponent as SuperPackWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

