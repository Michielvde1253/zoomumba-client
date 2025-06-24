package com.bigpoint.zoomumba.view.windows.events.community
{
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.utils.Dictionary;
   import windows.custom.events.community.GenericCommunityEventHelpContent;
   import windows.custom.events.community.GenericCommunityEventHelpWindow;
   
   public class GenericCommunityEventHelpWindowMediator extends WindowMediator
   {
      public static const NAME:String = "GenericCommunityEventHelpWindowMediator.as";
      
      private var _eventId:int;
      
      private var _eventName:String;
      
      public function GenericCommunityEventHelpWindowMediator(param1:GenericCommunityEventHelpWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:NetHelperProxy = facade.getProxy(NetHelperProxy) as NetHelperProxy;
         var _loc3_:ResourceLoaderProxy = facade.getProxy(ResourceLoaderProxy) as ResourceLoaderProxy;
         var _loc4_:GlobalEventProxy = facade.getProxy(GlobalEventProxy) as GlobalEventProxy;
         this._eventId = int(param1);
         this._eventName = _loc4_.getGlobalEvent(this._eventId).eventName;
         this.content.textBubble.htmlText = "";
         this.window.preloaderVisibility = true;
         this.window.header.filePath = _loc2_.getHeaderPath("multi_headerevent" + this._eventId);
         _loc3_.bulkLoad("communityeventhelpwindowassets",new <String>["CommunityEventHelpWindow" + this._eventId + ".swf"],this.handleResourcesLoaded);
      }
      
      private function handleResourcesLoaded(param1:Dictionary) : void
      {
         var _loc2_:SWFAsset = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.id)
            {
               case "BubbleSpeech.swf":
                  this.content.imageBubble.left = 130;
                  this.content.imageBubble.top = 25;
                  this.content.imageBubble.source = _loc2_.getEmbededBitmapData("BubbleSpeech");
                  break;
               case "CommunityEventHelpWindow" + this._eventId + ".swf":
                  this.content.imageBack.source = _loc2_.getEmbededBitmapData("Background");
                  this.content.imageFront.source = _loc2_.getEmbededBitmapData("Foreground");
                  break;
            }
         }
         this.content.textBubble.htmlText = TextResourceModule.getText("zoo.window.infoLayers." + this._eventName + "Comic.multiplayer.bubble");
         this.window.preloaderVisibility = false;
      }
      
      protected function get window() : GenericCommunityEventHelpWindow
      {
         return viewComponent as GenericCommunityEventHelpWindow;
      }
      
      protected function get content() : GenericCommunityEventHelpContent
      {
         return this.window.getContent() as GenericCommunityEventHelpContent;
      }
   }
}

