package com.bigpoint.zoomumba.view.windows.cacheResources
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.app.resources.events.ResourceCachedEvent;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.cacheResources.CacheResourcesContent;
   import windows.custom.cacheResources.CacheResourcesWindow;
   
   public class CacheResourcesWindowMediator extends WindowMediator
   {
      public static const NAME:String = "CacheResourcesMediator";
      
      public function CacheResourcesWindowMediator(param1:CacheResourcesWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         _loc2_.singleLoad("CacheResources.swf",this.handleAssetLoaded);
         this.content.header.text = TextResourceModule.getText("zoo.window.general.attention");
         this.content.text1.text = TextResourceModule.getText("zoo.window.infoLayers.saveAssets.text1");
         this.content.text2.text = TextResourceModule.getText("zoo.window.infoLayers.saveAssets.text2");
         this.content.text3.text = TextResourceModule.getText("zoo.window.infoLayers.saveAssets.text3");
         this.content.acceptButton.iconClass = this.content.okClass;
         this.content.declineButton.iconClass = this.content.xClass;
         this.content.acceptButton.label = TextResourceModule.getText("zoo.window.infoLayers.saveAssets.yes");
         this.content.declineButton.label = TextResourceModule.getText("zoo.window.infoLayers.saveAssets.no");
         this.content.addEventListener(ResourceCachedEvent.CHANGE_CACHE_STATUS,this.handleCacheRequest);
      }
      
      override public function dispose() : void
      {
         this.content.removeEventListener(ResourceCachedEvent.CHANGE_CACHE_STATUS,this.handleCacheRequest);
         super.dispose();
      }
      
      private function handleCacheRequest(param1:ResourceCachedEvent) : void
      {
         var _loc2_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         _loc2_.hasUserPermissionForLocalCache = param1.enabled;
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.CACHE_RESOURCES_WINDOW));
      }
      
      private function handleAssetLoaded(param1:SWFAsset) : void
      {
         this.content.settingsPanel.displayClass = param1.getEmbededBitmapData("FlashStorageSettingsPanel");
      }
      
      private function get content() : CacheResourcesContent
      {
         return this.window.getContent(0) as CacheResourcesContent;
      }
      
      private function get window() : CacheResourcesWindow
      {
         return this.viewComponent as CacheResourcesWindow;
      }
   }
}

