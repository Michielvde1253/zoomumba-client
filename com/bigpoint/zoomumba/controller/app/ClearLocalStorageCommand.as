package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ClearLocalStorageCommand extends SimpleCommand
   {
      public function ClearLocalStorageCommand()
      {
         super();
         var _loc1_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         _loc1_.clearStoredResources();
      }
   }
}

