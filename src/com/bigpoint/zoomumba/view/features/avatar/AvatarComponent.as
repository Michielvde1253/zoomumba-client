package com.bigpoint.zoomumba.view.features.avatar
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Sprite;
   
   public class AvatarComponent extends Sprite
   {
      public var background:Sprite = new Sprite();
      
      public var hatBehind:Sprite = new Sprite();
      
      public var hairBehind:Sprite = new Sprite();
      
      public var clothes:Sprite = new Sprite();
      
      public var head:Sprite = new Sprite();
      
      public var eyes:Sprite = new Sprite();
      
      public var mouth:Sprite = new Sprite();
      
      public var hairFront:Sprite = new Sprite();
      
      public var hatFront:Sprite = new Sprite();
      
      public var avatarContainer:Sprite = new Sprite();
      
      public var preloader:Sprite = new Sprite();
      
      private const MAX:int = 9;
      
      private var _current:int = 0;
      
      public function AvatarComponent()
      {
         super();
         addChild(this.avatarContainer);
         this.avatarContainer.visible = false;
         addChild(this.preloader);
         this.avatarContainer.addChild(this.background);
         this.avatarContainer.addChild(this.hatBehind);
         this.avatarContainer.addChild(this.hairBehind);
         this.avatarContainer.addChild(this.clothes);
         this.avatarContainer.addChild(this.head);
         this.avatarContainer.addChild(this.eyes);
         this.avatarContainer.addChild(this.mouth);
         this.avatarContainer.addChild(this.hairFront);
         this.avatarContainer.addChild(this.hatFront);
         this.preloader = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_PRELOAD_MINI_ANIM);
      }
      
      public function loaded() : void
      {
         if(++this._current >= this.MAX)
         {
            this.preloader.visible = false;
            this.avatarContainer.visible = true;
         }
      }
   }
}

