package com.bigpoint.zoomumba.view.windows.events.advBreeding
{
   import com.bigpoint.zoomumba.model.app.core.vo.CurrencyVO;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.view.windows.info.RewardInfoWindowMediator;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import spark.components.RadioButton;
   import windows.custom.reward.RewardInfoContent;
   import windows.custom.reward.RewardInfoWindow;
   
   public class AdvBreedingEventRewardWindowMediator extends RewardInfoWindowMediator
   {
      public static const NAME:String = "AdvBreedingEventRewardWindowMediator";
      
      public function AdvBreedingEventRewardWindowMediator(param1:RewardInfoWindow)
      {
         super(param1);
         mediatorName = uniqueMediatorName = NAME;
      }
      
      override public function init(param1:Object) : void
      {
         super.init(param1);
         this.content.content.left += 50;
         this.content.content.gap += 30;
         this.content.reward.left += 100;
         this.content.message.width = 200;
         this.content.outerAsset.x = 15;
         this.content.outerAsset.y = 138;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc3_:CurrencyVO = param1.reward as CurrencyVO;
         var _loc4_:AnimalShopData = _loc2_.getAnimalData(_loc3_.id);
         var _loc5_:ResourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         _loc5_.singleLoad("JeanBig.swf",this.handleAsset);
         var _loc6_:RadioButton = new RadioButton();
         _loc6_.left = -30;
         _loc6_.setStyle("skinClass",_loc4_.male == 1 ? RadioButtonSexMaleSkin : RadioButtonSexFemaleSkin);
         this.content.extraInfo.addElementAt(_loc6_,0);
         this.content.extraInfo.removeElement(this.content.amount);
      }
      
      private function handleAsset(param1:SWFAsset) : void
      {
         this.content.outerAsset.addChild(param1.getEmbededBitmap("JeanBig"));
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

