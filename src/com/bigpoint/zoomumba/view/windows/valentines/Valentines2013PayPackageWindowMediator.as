package com.bigpoint.zoomumba.view.windows.valentines
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import windows.custom.events.valentines2013.Valentines2013PayPackageContent;
   import windows.custom.events.valentines2013.Valentines2013PayPackageWindow;
   
   public class Valentines2013PayPackageWindowMediator extends WindowMediator
   {
      public static const NAME:String = "Valentines2013PayPackageWindowMediator";
      
      private var _assets:SWFAsset;
      
      private var _payLink1:String;
      
      private var _payLink2:String;
      
      private var netHelperProxy:NetHelperProxy;
      
      public function Valentines2013PayPackageWindowMediator(param1:Valentines2013PayPackageWindow)
      {
         super(Valentines2013PayPackageWindowMediator.NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_specialOffer");
         if(param1.hasOwnProperty("pack1"))
         {
            this._payLink1 = param1.pack1;
         }
         if(param1.hasOwnProperty("pack2"))
         {
            this._payLink2 = param1.pack2;
         }
         this.window.preloaderVisibility = true;
         this.content.buttonBuy1.label = TextResourceModule.getText("zoo.window.animalbreed.button.buydirectly");
         this.content.buttonBuy1.addEventListener(MouseEvent.CLICK,this.handleBuyClicked1);
         this.content.buttonBuy1.enabled = Boolean(this._payLink1);
         this.content.buttonBuy2.label = TextResourceModule.getText("zoo.window.animalbreed.button.buydirectly");
         this.content.buttonBuy2.addEventListener(MouseEvent.CLICK,this.handleBuyClicked2);
         this.content.buttonBuy2.enabled = Boolean(this._payLink2);
         AssetLibrary.sendAssetToFunction("Valentines2013PayPackage",this.handleAssetsLoaded);
      }
      
      override public function dispose() : void
      {
         this.content.buttonBuy1.addEventListener(MouseEvent.CLICK,this.handleBuyClicked1);
         this.content.buttonBuy2.addEventListener(MouseEvent.CLICK,this.handleBuyClicked2);
         super.dispose();
      }
      
      private function handleBuyClicked1(param1:Event) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("faLoadPage(\'" + this._payLink1 + "\')");
         }
      }
      
      private function handleBuyClicked2(param1:Event) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("faLoadPage(\'" + this._payLink2 + "\')");
         }
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "Valentines2013PayPackage":
            case "Valentines2013PayPackage.swf":
               this._assets = param1;
               this.content.backgroundImage.source = param1.getEmbededBitmapData("Background");
         }
         this.window.preloaderVisibility = false;
      }
      
      private function get content() : Valentines2013PayPackageContent
      {
         return this.window.getContent() as Valentines2013PayPackageContent;
      }
      
      private function get window() : Valentines2013PayPackageWindow
      {
         return super.viewComponent as Valentines2013PayPackageWindow;
      }
   }
}

