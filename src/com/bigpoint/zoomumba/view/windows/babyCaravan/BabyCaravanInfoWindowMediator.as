package com.bigpoint.zoomumba.view.windows.babyCaravan
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import org.puremvc.as3.interfaces.INotification;
   import windows.core.AbstractWindow;
   import windows.custom.babyCaravan.BabyCaravanInfoContent;
   import windows.custom.babyCaravan.BabyCaravanInfoWindow;
   
   public class BabyCaravanInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BabyCaravanInfoWindowMediator";
      
      private var caravanProxy:BabyCaravanProxy;
      
      private const ASSET_BUNDLE_LOAD:int = 2;
      
      private var currentAssetsLoaded:int = 0;
      
      public function BabyCaravanInfoWindowMediator(param1:AbstractWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         this.currentAssetsLoaded = 0;
         var _loc2_:InformationInitParams = param1 as InformationInitParams;
         this.caravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         AssetLibrary.sendAssetToFunction("PatternBabyCaravanWood",this.handleAssets);
         AssetLibrary.sendAssetToFunction("BabyCaravanComponents",this.handleAssets);
         this.content.header.text = _loc2_.title;
         this.content.message.text = _loc2_.message;
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
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "PatternBabyCaravanWood":
            case "PatternBabyCaravanWood.swf":
               this.window.backgroundPattern = param1.getEmbededObject("PatternBabyCaravanWood").constructor;
               break;
            case "BabyCaravanComponents":
            case "BabyCaravanComponents.swf":
               if(this.content)
               {
                  this.content.soniaPic.source = param1.getEmbededBitmapData("BubblePic_" + this.caravanProxy.caravanId.toString());
               }
         }
         if(++this.currentAssetsLoaded >= this.ASSET_BUNDLE_LOAD)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      private function get content() : BabyCaravanInfoContent
      {
         return this.window.getContent() as BabyCaravanInfoContent;
      }
      
      private function get window() : BabyCaravanInfoWindow
      {
         return viewComponent as BabyCaravanInfoWindow;
      }
   }
}

