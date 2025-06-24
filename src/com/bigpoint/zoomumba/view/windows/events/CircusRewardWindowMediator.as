package com.bigpoint.zoomumba.view.windows.events
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.circus.reward.CircusRewardContent;
   import windows.custom.events.circus.reward.CircusRewardWindow;
   
   public class CircusRewardWindowMediator extends WindowMediator
   {
      public static const NAME:String = "CircusRewardWindowMediator";
      
      private var circusProxy:CircusProxy;
      
      private var shopItemData:ShopItemData;
      
      private var dataArrived:Boolean = false;
      
      private var assetsArrived:Boolean = false;
      
      public function CircusRewardWindowMediator(param1:CircusRewardWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.CIRCUS_REWARD_ARRIVED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.CIRCUS_REWARD_ARRIVED:
         }
      }
      
      override public function onRegister() : void
      {
         this.circusProxy = facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.dataArrived = false;
         this.assetsArrived = false;
         this.window.preloaderVisibility = true;
         this.shopItemData = AssetIds.getShopItemData(this.circusProxy.rewardType,this.circusProxy.rewardId,1);
         this.content.header.title.text = TextResourceModule.getText("zoo.event.circus.infoTitle");
         var _loc2_:int = this.shopItemData.itemId;
         var _loc3_:int = this.shopItemData.categoryId;
         if(this.shopItemData.categoryId == Categories.ANIMAL)
         {
            _loc3_ = Categories.SPECIES;
            _loc2_ = AnimalShopData(this.shopItemData).speciesId;
         }
         this.content.text.text = TextResourceModule.getTextReplaced("zoo.event.circus.infoText",Vector.<TextReplace>([new TextReplace("%animal%",TextIdHelper.getCardName(_loc3_,_loc2_))]));
         AssetLibrary.sendAssetToFunction("Circus",this.assetsLoaded);
      }
      
      private function assetsLoaded(param1:SWFAsset) : void
      {
         this.assetsArrived = true;
         this.content.bitmapBGImage.source = param1.getEmbededBitmapData("Reward");
         this.content.wonItem.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.circusProxy.rewardId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.toggleSexAnimal();
         this.showContent();
      }
      
      private function showContent() : void
      {
         if(this.assetsArrived)
         {
            this.window.preloaderVisibility = false;
         }
      }
      
      private function toggleSexAnimal() : void
      {
         if(Boolean((this.shopItemData as AnimalShopData).male))
         {
            this.content.animalSexContainer.addChild(new WrapedSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"MaleIconSPR",PreloaderTypes.MINI));
         }
         else
         {
            this.content.animalSexContainer.addChild(new WrapedSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,"FemaleIconSPR",PreloaderTypes.MINI));
         }
      }
      
      private function get content() : CircusRewardContent
      {
         return this.window.getContent() as CircusRewardContent;
      }
      
      private function get window() : CircusRewardWindow
      {
         return this.viewComponent as CircusRewardWindow;
      }
      
      override public function dispose() : void
      {
      }
   }
}

