package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.model.app.resources.PreloadResourcesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class PreloadResourcesCommand extends SimpleCommand
   {
      public function PreloadResourcesCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PreloadResourcesProxy = facade.retrieveProxy(PreloadResourcesProxy.NAME) as PreloadResourcesProxy;
         _loc2_.load();
      }
   }
}

