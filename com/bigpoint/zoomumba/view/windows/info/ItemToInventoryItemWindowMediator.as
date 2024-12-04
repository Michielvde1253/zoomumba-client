package com.bigpoint.zoomumba.view.windows.info
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windows.info.ItemToInventoryInfoInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.inventoryWindow.ItemToInvontoryInfoContent;
   import windows.custom.inventoryWindow.ItemToInvontoryInfoWindow;
   
   public class ItemToInventoryItemWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemToInventoryItemWindowMediator";
      
      private var windowContent:ItemToInvontoryInfoContent;
      
      public function ItemToInventoryItemWindowMediator(param1:ItemToInvontoryInfoWindow)
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
         var _loc2_:ItemToInventoryInfoInitParams = param1 as ItemToInventoryInfoInitParams;
         this.windowContent = (viewComponent as ItemToInvontoryInfoWindow).getContent(0) as ItemToInvontoryInfoContent;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.window.infoLayers.itemInInventory.title");
         this.windowContent.info.text = TextResourceModule.getText("zoo.window.infoLayers.itemInInventory.text");
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc2_.rewardPack.category,_loc2_.rewardPack.itemId),this.handleItemAsset);
      }
      
      private function handleItemAsset(param1:SWFAsset) : void
      {
         this.windowContent.itemIconContainer.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function dispose() : void
      {
      }
   }
}

