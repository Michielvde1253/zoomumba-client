package com.bigpoint.zoorama.view.dragItem
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class DragCancelButton extends Sprite
   {
      private var notifier:Notifier;
      
      private var bgSkin:Sprite;
      
      private var mOutSkin:Sprite;
      
      private var mOverSkin:Sprite;
      
      public function DragCancelButton(param1:Notifier)
      {
         super();
         this.notifier = new Notifier(param1);
         this.bgSkin = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,AssetConfig.FIELD_ELEMENT_CANCEL_BUY_BG_SKIN);
         this.addChild(this.bgSkin);
         this.mOutSkin = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,AssetConfig.FIELD_ELEMENT_CANCEL_BUY_MOUT_SKIN);
         this.addChild(this.mOutSkin);
         this.mOutSkin.mouseEnabled = false;
         this.mOverSkin = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,AssetConfig.FIELD_ELEMENT_CANCEL_BUY_MOVER_SKIN);
         this.addChild(this.mOverSkin);
         this.mOverSkin.visible = false;
         this.mOverSkin.mouseEnabled = false;
         this.bgSkin.addEventListener(MouseEvent.ROLL_OVER,this.handleMouseOver);
         this.bgSkin.addEventListener(MouseEvent.ROLL_OUT,this.handleMouseOut);
         this.bgSkin.addEventListener(MouseEvent.CLICK,this.handleMouseClick,false,10000);
      }
      
      private function handleMouseClick(param1:MouseEvent) : void
      {
         TempGetterProxy.sendNotification(SHOP.CANCEL_SHOP_ITEM_DRAG);
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_CONFIRMATION_CANCEL);
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         TweenLite.to(this.mOverSkin,0.15,{
            "width":this.mOutSkin.width,
            "height":this.mOutSkin.height,
            "onComplete":this.hideMOverSkin
         });
      }
      
      private function hideMOverSkin() : void
      {
         this.mOverSkin.visible = false;
      }
      
      private function handleMouseOver(param1:MouseEvent) : void
      {
         this.mOverSkin.visible = true;
         this.mOverSkin.width = this.mOutSkin.width;
         this.mOverSkin.height = this.mOutSkin.height;
         TweenLite.to(this.mOverSkin,0.15,{
            "scaleX":1,
            "scaleY":1
         });
      }
   }
}

