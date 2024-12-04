package com.bigpoint.zoomumba.view.windows.info
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windows.info.SingleitemPackInfoInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gifts.SingleItemPackInfoContent;
   import windows.custom.gifts.SingleItemPackInfoWindow;
   
   public class SingleItemPackInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SingleItemPackInfoWindowMediator";
      
      private var windowContent:SingleItemPackInfoContent;
      
      public function SingleItemPackInfoWindowMediator(param1:SingleItemPackInfoWindow)
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
         var _loc2_:SingleitemPackInfoInitParams = param1 as SingleitemPackInfoInitParams;
         this.windowContent = (viewComponent as SingleItemPackInfoWindow).getContent(0) as SingleItemPackInfoContent;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.window.gift.unwrapped.title");
         this.windowContent.infoStart.text = TextResourceModule.getText("zoo.window.gift.unwrapped.text.1");
         this.windowContent.infoEnd.text = TextResourceModule.getText("zoo.window.gift.unwrapped.text.2");
         this.windowContent.giftName.text = "x" + _loc2_.itemPack.count + " " + TextIdHelper.getCardName(_loc2_.itemPack.category,_loc2_.itemPack.itemId);
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc2_.itemPack.category,_loc2_.itemPack.itemId),this.handleItemPic);
         AssetLibrary.sendAssetToFunction("item_pack_info",this.handleItemPackPic);
      }
      
      private function handleItemPackPic(param1:SWFAsset) : void
      {
         this.windowContent.giftBoxContainer.addChild(param1.getEmbededSprite("GiftBoxSPR"));
      }
      
      private function handleItemPic(param1:SWFAsset) : void
      {
         this.windowContent.itemPicContainer.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      override public function dispose() : void
      {
      }
   }
}

