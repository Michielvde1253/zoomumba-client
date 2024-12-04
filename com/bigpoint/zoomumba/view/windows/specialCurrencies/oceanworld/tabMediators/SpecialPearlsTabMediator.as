package com.bigpoint.zoomumba.view.windows.specialCurrencies.oceanworld.tabMediators
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.currencies.tabs.CurrencyTabContent;
   
   public class SpecialPearlsTabMediator extends Mediator
   {
      public static const NAME:String = "SpecialPearlsTabMediator";
      
      private var asset:SWFAsset;
      
      public function SpecialPearlsTabMediator(param1:CurrencyTabContent, param2:SWFAsset)
      {
         this.asset = param2;
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.content.bitmapGrass.source = this.asset.getEmbededBitmapData("waterPattern");
         this.content.bitmapWood.source = this.asset.getEmbededBitmapData("wood");
         this.content.bitmapLine.source = this.asset.getEmbededBitmapData("line");
         this.content.bitmapForest.source = this.asset.getEmbededBitmapData("oceanNormal");
         this.content.pPaw1.source = this.asset.getEmbededBitmapData("pearlConvertion");
         this.content.pPaw2.source = this.asset.getEmbededBitmapData("pearlUp");
         this.content.text.htmlText = TextResourceModule.getText("zoo.inventory.tabs.pearls.info");
         var _loc1_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         this.content.currency.value = _loc1_.pearls;
         this.content.currency.setDisplaySize(80,80);
         this.content.currency.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.PEARLS),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,65));
         this.content.cage1.source = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,66,1),AssetConfig.DEFAULT_INFO_SPR);
         this.content.cage2.source = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,66,1),AssetConfig.DEFAULT_INFO_SPR);
      }
      
      private function get content() : CurrencyTabContent
      {
         return this.viewComponent as CurrencyTabContent;
      }
   }
}

