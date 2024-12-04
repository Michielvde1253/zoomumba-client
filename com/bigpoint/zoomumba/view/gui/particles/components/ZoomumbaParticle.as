package com.bigpoint.zoomumba.view.gui.particles.components
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Sprite;
   
   public class ZoomumbaParticle extends Sprite
   {
      public function ZoomumbaParticle(param1:String)
      {
         super();
         this.addChild(AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,param1));
      }
   }
}

