package com.bigpoint.zoomumba.view.itemAnimations
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.view.itemAnimations.vo.ShopItemAnimationVo;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import flash.display.Sprite;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class ItemAnimationMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "ItemAnimationMediator";
      
      public function ItemAnimationMediator(param1:Sprite)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ANIMATE_SHOP_ITEM_TO_INVENTORY];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.ANIMATE_SHOP_ITEM_TO_INVENTORY:
               this.animateShopItemToInvotory(param1.getBody() as ShopItemAnimationVo);
         }
      }
      
      private function animateShopItemToInvotory(param1:ShopItemAnimationVo) : void
      {
         var _loc2_:ShopItemData = param1.shopItem;
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc2_.categoryId,_loc2_.itemId,1),this.handleItemPreviewAsset);
      }
      
      private function handleItemPreviewAsset(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         this.itemAnimationHolder.addChild(_loc2_);
         _loc2_.x = 200;
         _loc2_.y = 200;
         TweenLite.to(_loc2_,1,{
            "x":400,
            "y":400,
            "ease":Strong.easeOut,
            "onComplete":this.reduceItem,
            "onCompleteParams":[_loc2_]
         });
      }
      
      private function reduceItem(param1:Sprite) : void
      {
         TweenLite.to(param1,0.3,{
            "scaleX":0.1,
            "scaleY":0.1,
            "ease":Strong.easeOut,
            "onComplete":this.removeItem,
            "onCompleteParams":[param1]
         });
      }
      
      private function removeItem(param1:Sprite) : void
      {
         this.itemAnimationHolder.removeChild(param1);
      }
      
      private function get itemAnimationHolder() : Sprite
      {
         return this.viewComponent as Sprite;
      }
   }
}

