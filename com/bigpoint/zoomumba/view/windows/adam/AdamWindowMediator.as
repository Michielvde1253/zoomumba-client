package com.bigpoint.zoomumba.view.windows.adam
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.windows.adam.AdamWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.adam.AdamContent;
   import windows.custom.adam.AdamWindow;
   
   public class AdamWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdamWindowMediator";
      
      public var adamParams:AdamWindowInitParams;
      
      public function AdamWindowMediator(param1:AdamWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         if(param1 != null)
         {
            this.adamParams = param1 as AdamWindowInitParams;
            AssetLibrary.sendAssetToFunction("AdamWindow",this.assetsLoaded);
            this.content.buyButton.label = TextResourceModule.getText("zoo.shop.buyitem");
            this.content.buyButton.addEventListener(MouseEvent.CLICK,this.clickBuyButton);
         }
      }
      
      private function assetsLoaded(param1:SWFAsset) : void
      {
         switch(this.adamParams.adamParams.type)
         {
            case "starterpack":
               this.content.bitmapImageHeader.top = -5;
               this.content.bitmapImageHeader.left = 66;
               this.content.bitmapImageHeader.source = param1.getEmbededBitmapData("Sonia");
               this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.starterPack.title");
               this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.starterPack.text");
               if(this.adamParams.adamParams.itemId == 14)
               {
                  this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.starterPack_14.title");
                  this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.starterPack_14.text");
               }
               if(this.adamParams.adamParams.itemId == 15)
               {
                  this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.starterPack_15.title");
                  this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.starterPack_15.text");
               }
               break;
            case "pantherpack":
               this.content.bitmapImageHeader.top = -5;
               this.content.bitmapImageHeader.left = 66;
               this.content.bitmapImageHeader.source = param1.getEmbededBitmapData("Sonia");
               this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.blackPanther.title");
               this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.blackPanther.text");
               break;
            case "upselling":
               this.content.bitmapImageHeader.top = 23;
               this.content.bitmapImageHeader.left = 36;
               this.content.bitmapImageHeader.source = param1.getEmbededBitmapData("ZD");
               this.content.header.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.upselling.title");
               this.content.message.text = TextResourceModule.getText("zoo.window.infoLayers.adamPenguin.upselling.text");
               break;
            default:
               return;
         }
         this.loadRewards();
      }
      
      private function loadRewards() : void
      {
         var _loc7_:ItemPackVO = null;
         this.content.dispose();
         var _loc1_:DisplayObject = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = -1;
         var _loc6_:Vector.<ItemPackVO> = new Vector.<ItemPackVO>();
         for each(_loc7_ in this.adamParams.adamParams.configData.items)
         {
            if(_loc7_.category == Categories.ASSISTANCE && (_loc5_ == _loc7_.count || _loc5_ == -1))
            {
               _loc6_.push(_loc7_);
               _loc5_ = _loc7_.count;
               _loc4_++;
            }
            else
            {
               if(_loc7_.category == Categories.POWERUP || _loc7_.category == Categories.PAY_PREMIUM)
               {
                  _loc3_ = TimeFormat.secondsToDays(_loc7_.count * 3600);
                  _loc2_ = _loc3_ + " ";
                  _loc2_ += _loc3_ == 1 ? TextResourceModule.getText("zoo.window.general.day") : TextResourceModule.getText("zoo.window.general.days");
               }
               else
               {
                  _loc2_ = _loc7_.count + "x";
               }
               _loc1_ = new WrapedSprite(AssetIds.getPreviewAssetId(_loc7_.category,_loc7_.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI);
               this.content.addReward(_loc1_,_loc2_);
            }
         }
         if(_loc4_ == MainConstants.MAX_ASSISTANTS)
         {
            _loc3_ = TimeFormat.secondsToDays(_loc5_ * 3600);
            _loc2_ = _loc3_ + " ";
            _loc2_ += _loc3_ == 1 ? TextResourceModule.getText("zoo.window.general.day") : TextResourceModule.getText("zoo.window.general.days");
            _loc1_ = new WrapedSprite("assistant_preview_all",AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI);
            this.content.addReward(_loc1_,_loc2_).currentState = "noBG";
         }
         else
         {
            for each(_loc7_ in _loc6_)
            {
               _loc3_ = TimeFormat.secondsToDays(_loc7_.count * 3600);
               _loc2_ = _loc3_ + " ";
               _loc2_ += _loc3_ == 1 ? TextResourceModule.getText("zoo.window.general.day") : TextResourceModule.getText("zoo.window.general.days");
               _loc1_ = new WrapedSprite(AssetIds.getPreviewAssetId(_loc7_.category,_loc7_.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI);
               this.content.addReward(_loc1_,_loc2_);
            }
         }
         _loc6_ = null;
      }
      
      private function clickBuyButton(param1:MouseEvent) : void
      {
         var _loc2_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         if(!_loc2_.open_social && this.adamParams.adamParams.ajax && this.adamParams.adamParams.ajax.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'" + this.adamParams.adamParams.ajax + "\')");
         }
         else
         {
            navigateToURL(new URLRequest(this.adamParams.adamParams.url),"_blank");
         }
      }
      
      override public function dispose() : void
      {
         this.content.buyButton.removeEventListener(MouseEvent.CLICK,this.clickBuyButton);
         this.content.dispose();
         super.dispose();
      }
      
      private function get content() : AdamContent
      {
         return this.window.getContent(0) as AdamContent;
      }
      
      private function get window() : AdamWindow
      {
         return this.viewComponent as AdamWindow;
      }
   }
}

