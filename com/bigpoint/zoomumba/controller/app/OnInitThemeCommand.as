package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.PreloadResourcesProxy;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoorama.assets.AssetIds;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class OnInitThemeCommand extends SimpleCommand
   {
      public function OnInitThemeCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppConfigProxy = null;
         var _loc5_:PreloadResourcesProxy = null;
         _loc2_ = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         var _loc3_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         var _loc4_:Vector.<String> = new Vector.<String>();
         if(_loc2_.playfieldTheme != "")
         {
            if(AssetLibrary.haveMovieClip(_loc2_.playfieldTheme) == false)
            {
               _loc4_.push(_loc2_.playfieldTheme + ".swf");
               _loc3_.bulkLoad("preloadBGTheme",_loc4_);
            }
         }
         if(_loc2_.roadTheme != "")
         {
            AssetIds.ROAD_THEME = _loc2_.roadTheme;
            _loc5_ = facade.retrieveProxy(PreloadResourcesProxy.NAME) as PreloadResourcesProxy;
            _loc5_.addAssetsRoadTheme(_loc2_.roadTheme);
         }
      }
   }
}

