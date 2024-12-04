package com.bigpoint.zoomumba.view.windows.specialCurrencies.tabMediators
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.currencies.tabs.TrashTabContent;
   
   public class SpecialTrashTabMediator extends Mediator
   {
      public static const NAME:String = "SpecialTrashTabMediator";
      
      private var asset:SWFAsset;
      
      public function SpecialTrashTabMediator(param1:TrashTabContent, param2:SWFAsset)
      {
         this.asset = param2;
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.content.bitmapWood.source = this.asset.getEmbededBitmapData("wood");
         this.content.bitmapLine.source = this.asset.getEmbededBitmapData("line");
         this.content.mainPic.source = this.asset.getEmbededBitmapData("trashmainimage");
         this.content.secondText.htmlText = TextResourceModule.getText("zoo.inventory.trash.info");
         this.content.amountText.htmlText = TextResourceModule.getText("zoo.inventory.trash.amount");
         var _loc1_:CollectablesProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.content.currency.value = (facade.getProxy(RecyclingProxy) as RecyclingProxy).trashAmount;
         this.content.currency.setDisplaySize(80,80);
         this.content.currency.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,Resources.TRASH),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,65));
      }
      
      private function get content() : TrashTabContent
      {
         return this.viewComponent as TrashTabContent;
      }
   }
}

