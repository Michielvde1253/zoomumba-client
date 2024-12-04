package com.bigpoint.zoomumba.view.windows.valentines
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.windows.events.valentines.ValentinesWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import windows.custom.valentines.ValentineRewardContent;
   import windows.custom.valentines.ValentineRewardWindow;
   
   public class ValentinesRewardWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ValentinesRewardWindowMediator";
      
      public function ValentinesRewardWindowMediator(param1:ValentineRewardWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:ValentinesWindowInitParams = param1 as ValentinesWindowInitParams;
         if(_loc2_.rewardObject.category == Categories.RESOURCES)
         {
            this.content.fivex.visible = true;
         }
         this.content.rewardDisplay.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(_loc2_.rewardObject.category,_loc2_.rewardObject.itemId),AssetConfig.DEFAULT_INFO_SPR);
         this.content.rewardText.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats");
         this.content.header.title.text = TextResourceModule.getText("zoo.window.general.congrats");
      }
      
      private function get window() : ValentineRewardWindow
      {
         return this.viewComponent as ValentineRewardWindow;
      }
      
      private function get content() : ValentineRewardContent
      {
         return this.window.getContent() as ValentineRewardContent;
      }
      
      override public function dispose() : void
      {
      }
   }
}

