package com.bigpoint.zoomumba.view.windows.nursery
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.windows.NurseryWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.nursery.success.NurserySuccessContent;
   import windows.custom.nursery.success.NurserySuccessWindow;
   
   public class NurserySuccessWindowMediator extends WindowMediator
   {
      public static const NAME:String = "NurserySuccessWindowMediator";
      
      private var winParams:NurseryWindowInitParams;
      
      public function NurserySuccessWindowMediator(param1:NurserySuccessWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.SHOW_NURSERY_RESULT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.SHOW_NURSERY_RESULT:
               this.showNurseryResult(param1.getBody() as Object);
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.winParams = param1 as NurseryWindowInitParams;
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.END_NURSERY_BREEDING,[this.winParams.uniqueId]).addCallback(Note.SHOW_NURSERY_RESULT).sendNow();
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("StarsStaticLeft",this.handleStarsLoaded);
         AssetLibrary.sendAssetToFunction("EffectGlowMed",this.handleEffectLoaded);
         this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.purchaseConfirmed.title");
         this.content.successText.text = TextResourceModule.getText("zoo.nursery.layer.success");
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
      
      private function showNurseryResult(param1:Object) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ItemConfigProxy = null;
         var _loc4_:AnimalShopData = null;
         if(Boolean(param1["raiseObj"]) && Boolean(param1["raiseObj"]["r"]))
         {
            _loc2_ = param1["raiseObj"]["r"]["0"];
         }
         if(_loc2_)
         {
            this.content.animalContainer.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc2_["aId"]),AssetConfig.DEFAULT_INFO_SPR,0,100,100);
            _loc3_ = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
            _loc4_ = _loc3_.getAnimalData(_loc2_["aId"]);
            this.content.sex.setStyle("skinClass",_loc4_.male == 1 ? RadioButtonSexMaleSkin : RadioButtonSexFemaleSkin);
            this.window.preloaderVisibility = false;
            sendNotification(Note.RESET_NURSERY_BUILDING);
         }
      }
      
      override public function dispose() : void
      {
      }
      
      private function get content() : NurserySuccessContent
      {
         return this.window.getContent() as NurserySuccessContent;
      }
      
      private function get window() : NurserySuccessWindow
      {
         return this.viewComponent as NurserySuccessWindow;
      }
   }
}

