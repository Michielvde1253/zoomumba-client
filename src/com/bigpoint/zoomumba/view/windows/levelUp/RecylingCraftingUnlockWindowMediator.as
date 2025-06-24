package com.bigpoint.zoomumba.view.windows.levelUp
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import windows.custom.levelUp.RecylingCraftingUnlockContent;
   import windows.custom.levelUp.RecylingCraftingUnlockWindow;
   
   public class RecylingCraftingUnlockWindowMediator extends WindowMediator
   {
      public static const NAME:String = "RecylingCraftingUnlockWindowMediator";
      
      public function RecylingCraftingUnlockWindowMediator(param1:RecylingCraftingUnlockWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         AssetLibrary.sendAssetToFunction("unlockRecylingCrafting",this.handleAssetLoad);
         this.window.preloaderVisibility = true;
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this.content.header.text = TextResourceModule.getText("zoo.window.general.congrats");
         this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.recylingcraftingunlock.info");
         this.content.preview.addChild(param1.getEmbededSprite("asset"));
         this.window.preloaderVisibility = false;
      }
      
      private function get content() : RecylingCraftingUnlockContent
      {
         return this.window.getContent(0) as RecylingCraftingUnlockContent;
      }
      
      private function get window() : RecylingCraftingUnlockWindow
      {
         return this.viewComponent as RecylingCraftingUnlockWindow;
      }
   }
}

