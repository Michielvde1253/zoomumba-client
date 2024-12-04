package com.bigpoint.zoomumba.view.windows.info
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windows.info.ItemBigInfoInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.collectionSets.ItemBigInfoContent;
   import windows.custom.collectionSets.ItemBigInfoWindow;
   
   public class ItemBigInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemBigInfoWindowMediator";
      
      private var windowContent:ItemBigInfoContent;
      
      private var infoInitParams:ItemBigInfoInitParams;
      
      public function ItemBigInfoWindowMediator(param1:ItemBigInfoWindow)
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
         this.infoInitParams = param1 as ItemBigInfoInitParams;
         this.windowContent = (viewComponent as ItemBigInfoWindow).getContent(0) as ItemBigInfoContent;
         this.windowContent.header.title.text = TextResourceModule.getText(TextIdHelper.getSetName(this.infoInitParams.item.category,this.infoInitParams.item.itemId));
         this.windowContent.info.htmlText = TextResourceModule.getText(TextIdHelper.getSetInfo(this.infoInitParams.item.category,this.infoInitParams.item.itemId));
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetForItemVO(this.infoInitParams.item.category,this.infoInitParams.item.itemId),this.handleItemPic);
      }
      
      private function handleItemPic(param1:SWFAsset) : void
      {
         DisplayObjectHelper.removeChildren(this.windowContent.itemPicContainer);
         this.windowContent.itemPicContainer.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_INFO_SPR));
         this.windowContent.signText.visible = false;
         if(this.infoInitParams.pageId == 0 && this.infoInitParams.setCategory != Categories.EVENTS)
         {
            this.windowContent.signText.text = TextResourceModule.getText(TextIdHelper.getSetName(this.infoInitParams.setCategory,this.infoInitParams.setItemId));
            this.windowContent.signText.visible = true;
            this.windowContent.signText.x = 118;
         }
      }
      
      override public function dispose() : void
      {
      }
   }
}

