package com.bigpoint.zoomumba.view.windows.crafting
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingRewardVo;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingStateVo;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windows.NurseryWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.crafting.SuccessCraftingContent;
   import windows.custom.crafting.SuccessCraftingWindow;
   
   public class SuccessCraftingMediator extends WindowMediator
   {
      public static const NAME:String = "SuccessCraftingMediator";
      
      private var winParams:NurseryWindowInitParams;
      
      private var _resourcesProxy:ResourcesProxy;
      
      private var _craftingProxy:CraftingProxy;
      
      public function SuccessCraftingMediator(param1:SuccessCraftingWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SHOW_CRAFTING_RESULT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.SHOW_CRAFTING_RESULT:
               this.showCraftingResult(param1.getBody());
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("StarsStaticLeft",this.handleStarsLoaded);
         AssetLibrary.sendAssetToFunction("EffectGlowMed",this.handleEffectLoaded);
         this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.purchaseConfirmed.title");
         this.content.successText.text = TextResourceModule.getText("zoo.window.crafting.success.text");
         this.craftingProxy.netSendCraftingCollect(Note.SHOW_CRAFTING_RESULT);
      }
      
      private function handleEffectLoaded(param1:SWFAsset) : void
      {
         if(Boolean(this.content) && Boolean(this.content.glow))
         {
            this.content.glow.displayClass = param1.getEmbededBitmapData("EffectGlowMed");
         }
      }
      
      private function handleStarsLoaded(param1:SWFAsset) : void
      {
         if(Boolean(this.content) && Boolean(this.content.starsLeft))
         {
            this.content.starsLeft.displayClass = param1.getEmbededBitmapData("StarsStaticLeft");
            this.content.starsRight.displayClass = param1.getEmbededBitmapData("StarsStaticLeft");
         }
      }
      
      private function showCraftingResult(param1:Object) : void
      {
         this.content.animalContainer.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(this.rewardData.itemVo.category,this.rewardData.itemVo.itemId),AssetConfig.DEFAULT_INFO_SPR,0,100,100);
         this.window.preloaderVisibility = false;
         sendNotification(Note.REFRESH_CRAFTING_BUILDING);
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      public function get resourcesProxy() : ResourcesProxy
      {
         if(this._resourcesProxy == null)
         {
            this._resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         }
         return this._resourcesProxy;
      }
      
      public function get craftingData() : CraftingStateVo
      {
         return this.craftingProxy.craftingData;
      }
      
      public function get rewardData() : CraftingRewardVo
      {
         return this.craftingProxy.craftingRewardVo;
      }
      
      override public function dispose() : void
      {
      }
      
      private function get content() : SuccessCraftingContent
      {
         return this.window.getContent() as SuccessCraftingContent;
      }
      
      private function get window() : SuccessCraftingWindow
      {
         return this.viewComponent as SuccessCraftingWindow;
      }
   }
}

