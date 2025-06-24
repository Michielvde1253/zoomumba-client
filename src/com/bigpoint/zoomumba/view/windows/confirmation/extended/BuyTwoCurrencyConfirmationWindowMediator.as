package com.bigpoint.zoomumba.view.windows.confirmation.extended
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyTwoCurrencyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.confirmation.extended.BuyTwoCurrencyConfirmationContent;
   import windows.custom.confirmation.extended.BuyTwoCurrencyConfirmationWindow;
   
   public class BuyTwoCurrencyConfirmationWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BuyTwoCurrencyConfirmationWindowMediator";
      
      public function BuyTwoCurrencyConfirmationWindowMediator(param1:BuyTwoCurrencyConfirmationWindow)
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
         var _loc2_:BuyTwoCurrencyConfirmationInitParams = param1 as BuyTwoCurrencyConfirmationInitParams;
         var _loc3_:BuyTwoCurrencyConfirmationContent = (viewComponent as BuyTwoCurrencyConfirmationWindow).getContent(0) as BuyTwoCurrencyConfirmationContent;
         _loc3_.header.title.text = _loc2_.title;
         _loc3_.message.text = _loc2_.message;
         _loc3_.label.text = String(_loc2_.price);
         _loc3_.label2.text = String(_loc2_.price2);
         if(_loc2_.type != -1 && _loc2_.collType == -1)
         {
            _loc3_.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,_loc2_.type),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         }
         else if(_loc2_.collType != -1)
         {
            _loc3_.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,_loc2_.collType),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         }
         if(_loc2_.type2 != -1 && _loc2_.collType2 == -1)
         {
            _loc3_.label2.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,_loc2_.type2),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         }
         else if(_loc2_.collType != -1)
         {
            _loc3_.label2.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,_loc2_.collType2),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         }
      }
      
      override public function dispose() : void
      {
      }
   }
}

