package com.bigpoint.zoorama.view.gui.win.generals
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   
   public class SizedMiniWindow extends Window
   {
      public function SizedMiniWindow(param1:Notifier, param2:String = null, param3:WindowButtonParams = null)
      {
         super(param1,param2,param3);
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_SIZED_MINI_WINDOW,this.handleSmallWindowAsset);
      }
      
      override public function draw() : void
      {
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 330;
         this.y = 140;
         super.draw();
      }
      
      private function handleSmallWindowAsset(param1:SWFAsset) : void
      {
         this.asset = param1;
         if(this.asset)
         {
            assignWindowSkin();
         }
      }
   }
}

