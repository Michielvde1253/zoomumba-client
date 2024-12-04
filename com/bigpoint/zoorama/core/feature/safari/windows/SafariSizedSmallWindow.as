package com.bigpoint.zoorama.core.feature.safari.windows
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.Window;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class SafariSizedSmallWindow extends Window
   {
      public function SafariSizedSmallWindow(param1:Notifier, param2:String = null, param3:WindowButtonParams = null)
      {
         super(param1,param2,param3);
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_INFO_WINDOW_SAFARI_SMALL,this.handleSmallWindowAsset);
      }
      
      override public function draw() : void
      {
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 270;
         this.y = 115;
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

