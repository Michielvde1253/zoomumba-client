package com.bigpoint.zoomumba.view.windows.info
{
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windows.information.RewardInfoInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import windows.custom.reward.RewardInfoContent;
   import windows.custom.reward.RewardInfoWindow;
   
   public class RewardInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "RewardInfoWindowMediator";
      
      public function RewardInfoWindowMediator(param1:RewardInfoWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         var _loc3_:RewardInfoInitParams = param1 as RewardInfoInitParams;
         var _loc4_:String = AssetIds.getPreviewAssetId(_loc3_.reward.type,_loc3_.reward.id);
         this.content.header.title.text = _loc3_.title;
         this.content.message.htmlText = _loc3_.message;
         if(_loc3_.reward.amount > 0 || _loc3_.reward.id > 0)
         {
            this.content.icon.addChild(new WrapedSprite(_loc4_,AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
            this.content.amount.text = "x " + _loc3_.reward.amount * (_loc3_.reward.useUL ? _loc2_.userLevel : 1);
         }
         this.content.message2.htmlText = _loc3_.message2;
      }
      
      private function get content() : RewardInfoContent
      {
         return this.window.getContent(0) as RewardInfoContent;
      }
      
      private function get window() : RewardInfoWindow
      {
         return this.viewComponent as RewardInfoWindow;
      }
   }
}

