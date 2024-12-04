package com.bigpoint.zoomumba.view.windows.collectionSets
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windows.collectienSets.CollectionSetRewordInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.collectionSets.CollectionSetRewordContent;
   import windows.custom.collectionSets.CollectionSetRewordWindow;
   
   public class CollectionSetRewordWindowMediator extends WindowMediator
   {
      public static const NAME:String = "CollectionSetRewordWindowMediator";
      
      private var windowContent:CollectionSetRewordContent;
      
      public function CollectionSetRewordWindowMediator(param1:CollectionSetRewordWindow)
      {
         super(NAME,param1);
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
      
      override public function init(param1:Object) : void
      {
         var _loc2_:CollectionSetRewordInitParams = param1 as CollectionSetRewordInitParams;
         this.windowContent = (viewComponent as CollectionSetRewordWindow).getContent(0) as CollectionSetRewordContent;
         if(_loc2_.canPickReword)
         {
            this.windowContent.header.title.text = TextResourceModule.getText("zoo.collectableItems.book.rewards.unlocked.title");
            this.windowContent.info.text = TextResourceModule.getText("zoo.collectableItems.book.rewards.unlocked.text");
         }
         else
         {
            this.windowContent.header.title.text = TextResourceModule.getText("zoo.collectableItems.book.rewards.locked.title");
            this.windowContent.info.text = TextResourceModule.getText("zoo.collectableItems.book.rewards.locked.text");
         }
         this.windowContent.pickReword1.label = TextResourceModule.getText("zoo.collectableItems.book.rewards.button");
         this.windowContent.pickReword2.label = TextResourceModule.getText("zoo.collectableItems.book.rewards.button");
         this.windowContent.pickReword1.enabled = _loc2_.canPickReword;
         this.windowContent.pickReword2.enabled = _loc2_.canPickReword;
         this.windowContent.pickReword1.addEventListener(MouseEvent.CLICK,_loc2_.handlePickReward1);
         this.windowContent.pickReword2.addEventListener(MouseEvent.CLICK,_loc2_.handlePickReward2);
         if(_loc2_.rewordItomPacks[0].category == Categories.ASSISTANCE)
         {
            this.windowContent.rewordAmmount1.text = TimeFormat.secondsToTimeString(_loc2_.rewordItomPacks[0].count * 3600);
         }
         else
         {
            this.windowContent.rewordAmmount1.text = String(_loc2_.rewordItomPacks[0].count) + " x";
         }
         if(_loc2_.rewordItomPacks[1].category == Categories.ASSISTANCE)
         {
            this.windowContent.rewordAmmount2.text = TimeFormat.secondsToTimeString(_loc2_.rewordItomPacks[1].count * 3600);
         }
         else
         {
            this.windowContent.rewordAmmount2.text = String(_loc2_.rewordItomPacks[1].count) + " x";
         }
         AssetLibrary.sendAssetToFunction("collection_set_reword",this.handleRewordAssets);
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc2_.rewordItomPacks[0].category,_loc2_.rewordItomPacks[0].itemId,_loc2_.rewordItomPacks[0].level),this.handleRewordAssets1);
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc2_.rewordItomPacks[1].category,_loc2_.rewordItomPacks[1].itemId,_loc2_.rewordItomPacks[1].level),this.handleRewordAssets2);
      }
      
      private function handleRewordAssets1(param1:SWFAsset) : void
      {
         this.windowContent.rewordPic1.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      private function handleRewordAssets2(param1:SWFAsset) : void
      {
         this.windowContent.rewordPic2.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      private function handleRewordAssets(param1:SWFAsset) : void
      {
         this.windowContent.windowLogo.addChild(param1.getEmbededSprite("WindowLogoSPR"));
      }
      
      override public function dispose() : void
      {
      }
   }
}

