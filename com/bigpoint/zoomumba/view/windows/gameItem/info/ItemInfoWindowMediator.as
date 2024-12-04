package com.bigpoint.zoomumba.view.windows.gameItem.info
{
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.CageUpgradeProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import general.paginator.PaginatorEvent;
   import mx.events.FlexEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gameItems.info.GameItemInfoContent;
   import windows.custom.gameItems.info.GameItemInfoPerspectives;
   import windows.custom.gameItems.info.GameItemInfoWindow;
   
   public class ItemInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemInfoWindowMediator";
      
      private var cardData:InheritedShopData;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var userProxy:UserProxy;
      
      private var cageUpgradeProxy:CageUpgradeProxy;
      
      public function ItemInfoWindowMediator(param1:GameItemInfoWindow)
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
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.cardData = param1 as InheritedShopData;
         this.setPerspective();
         this.setTitle();
         this.setInfo();
         this.setPic();
      }
      
      private function setPerspective() : void
      {
         switch(this.cardData.internalType)
         {
            case ItemInternalTypes.ASSISTANT:
               this.content.setPerspective(GameItemInfoPerspectives.PERSPECTIVE_NONE);
               §§goto(addr82);
            case ItemInternalTypes.CAGE:
               this.content.setPerspective(GameItemInfoPerspectives.PERSPECTIVE_CAGES);
               addr82:
               return;
            case ItemInternalTypes.DECORATION:
            case ItemInternalTypes.RESOURCE:
            case ItemInternalTypes.ROAD:
            case ItemInternalTypes.SPECIAL:
            case ItemInternalTypes.STORE:
            case ItemInternalTypes.SPECIE:
         }
         throw Error("Unable to set perspective, unknown object type");
      }
      
      private function setTitle() : void
      {
         this.content.header.title.text = this.cardData.localisedTitle;
      }
      
      private function setInfo() : void
      {
         this.content.setText(TextResourceModule.getText(this.cardData.localisedInfoId));
      }
      
      private function setPic() : void
      {
         var _loc1_:String = null;
         switch(this.cardData.internalType)
         {
            case ItemInternalTypes.ASSISTANT:
            case ItemInternalTypes.CAGE:
            case ItemInternalTypes.DECORATION:
            case ItemInternalTypes.RESOURCE:
            case ItemInternalTypes.ROAD:
            case ItemInternalTypes.SPECIAL:
            case ItemInternalTypes.STORE:
               _loc1_ = AssetIds.getPreviewAssetId(ShopItemData(this.cardData).categoryId,ShopItemData(this.cardData).itemId);
               break;
            case ItemInternalTypes.SPECIE:
               break;
            default:
               throw Error("Canot display item pic, undefined type");
         }
         if(_loc1_)
         {
            this.content.addContent(new WrapedSprite(_loc1_,AssetConfig.DEFAULT_INFO_SPR));
         }
      }
      
      private function updateState(... rest) : void
      {
      }
      
      private function formatTime(param1:int) : String
      {
         var _loc2_:Date = new Date(null,null,null,0,0,param1);
         return _loc2_.getHours() + ":" + _loc2_.getMinutes() + ":" + _loc2_.getSeconds();
      }
      
      private function changeCagesHandlers(param1:PaginatorEvent) : void
      {
      }
      
      private function sexChanged(param1:Boolean) : void
      {
      }
      
      private function handlePerspective() : void
      {
      }
      
      private function get content() : GameItemInfoContent
      {
         return this.window.getContent(0) as GameItemInfoContent;
      }
      
      private function get window() : GameItemInfoWindow
      {
         return this.viewComponent as GameItemInfoWindow;
      }
      
      override public function dispose() : void
      {
         this.content.removeEventListener(FlexEvent.UPDATE_COMPLETE,this.updateState);
         this.content.destroy();
      }
   }
}

