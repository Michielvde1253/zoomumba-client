package com.bigpoint.zoomumba.view.windows.news.events
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.news.events.advBreeding.EventNewsContent;
   import windows.custom.news.events.advBreeding.EventNewsWindow;
   
   public class CircusNewsMediator extends WindowMediator
   {
      public static const NAME:String = "CircusNewsMediator.as";
      
      public function CircusNewsMediator(param1:EventNewsWindow)
      {
         super(CircusNewsMediator.NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var netHelperProxy:NetHelperProxy;
         var initParams:Object = param1;
         this.advContent.newsMessage.text = TextResourceModule.getText("zoo.window.infoLayers.circusHelpcomic.layer1.content");
         netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.advWindow.header.filePath = netHelperProxy.getHeaderPath("header_circus");
         this.advContent.newsMessage.y -= 20;
         this.advContent.preloader.visible = true;
         this.advContent.newsMessage.visible = false;
         AssetLibrary.sendAssetToFunction("Circus",function(param1:SWFAsset):void
         {
            var asset:SWFAsset = param1;
            try
            {
               advContent.preloader.visible = false;
               advContent.newsMessage.visible = true;
               advContent.imageBack.source = asset.getEmbededBitmapData("InfoBackground");
               advContent.imageBack.x = 10;
            }
            catch(err:Error)
            {
            }
         });
      }
      
      protected function get advWindow() : EventNewsWindow
      {
         return this.viewComponent as EventNewsWindow;
      }
      
      protected function get advContent() : EventNewsContent
      {
         return this.advWindow.getContent() as EventNewsContent;
      }
   }
}

