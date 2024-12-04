package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.notices.view.field.RoadItemNotice;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class RoadGlow extends Sprite
   {
      private var notifier:Notifier;
      
      private var skin:Sprite;
      
      public var uniqueId:int = -1;
      
      public var typeId:int = -1;
      
      public function RoadGlow(param1:Notifier)
      {
         super();
         this.notifier = new Notifier(param1);
         this.skin = AssetLibrary.getSprite(AssetConfig.ASSET_FIELD_ELEMENTS,"TileGlowSPR");
         this.addChild(this.skin);
         TweenLite.to(this.skin,0.3,{"glowFilter":{
            "color":16750848,
            "blurX":10,
            "blurY":10,
            "strength":3,
            "alpha":1,
            "quality":1,
            "knockout":true
         }});
         this.skin.addEventListener(MouseEvent.CLICK,this.handleClick);
         this.buttonMode = true;
         this.useHandCursor = true;
      }
      
      private function handleClick(param1:MouseEvent) : void
      {
         this.notifier.dispatchNotice(new RoadItemNotice(RoadItemNotice.CLICK,this.typeId,this.uniqueId));
      }
   }
}

