package com.bigpoint.zoomumba.view.windows.confirmation.extended
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.confirmation.extended.BuyConfirmationContent;
   import windows.custom.confirmation.extended.BuyConfirmationWindow;
   
   public class BuyConfirmationWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BuyConfirmationWindowMediator";
      
      public function BuyConfirmationWindowMediator(param1:BuyConfirmationWindow)
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
         var _loc2_:BuyConfirmationInitParams = param1 as BuyConfirmationInitParams;
         var _loc3_:BuyConfirmationContent = (viewComponent as BuyConfirmationWindow).getContent(0) as BuyConfirmationContent;
         _loc3_.header.title.text = _loc2_.title;
         _loc3_.message.text = _loc2_.message;
         _loc3_.label.text = String(_loc2_.price);
         if(_loc2_.type != -1 && _loc2_.collType == -1)
         {
            _loc3_.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,_loc2_.type),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         }
         else if(_loc2_.collType != -1)
         {
            _loc3_.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,_loc2_.collType),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
         }
      }
      
      override public function dispose() : void
      {
      }
   }
}

