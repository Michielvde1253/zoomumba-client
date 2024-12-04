package com.bigpoint.zoomumba.view.windows.events.boardgameReward
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.events.boardgame.vo.BoardGameRewardWindowVo;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import windows.custom.events.boardgameReward.BoardgameRewardContent;
   import windows.custom.events.boardgameReward.BoardgameRewardWindow;
   
   public class BoardgameRewardWindowMediator extends WindowMediator
   {
      public static const NAME:String = "BoardgameRewardWindowMediator";
      
      public function BoardgameRewardWindowMediator(param1:BoardgameRewardWindow)
      {
         super(NAME,param1);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:BoardGameRewardWindowVo = param1 as BoardGameRewardWindowVo;
         if(_loc2_.rewardObject.category == Categories.RESOURCES)
         {
            this.content.fivex.visible = true;
         }
         this.content.rewardDisplay.displayClass = new WrapedSprite(AssetIds.getPreviewAssetId(_loc2_.rewardObject.category,_loc2_.rewardObject.itemId),AssetConfig.DEFAULT_INFO_SPR);
         this.content.rewardText.text = TextResourceModule.getText("zoo.event.christmas.layer.congrats");
         this.content.header.title.text = TextResourceModule.getText("zoo.window.general.congrats");
      }
      
      private function get window() : BoardgameRewardWindow
      {
         return this.viewComponent as BoardgameRewardWindow;
      }
      
      private function get content() : BoardgameRewardContent
      {
         return this.window.getContent() as BoardgameRewardContent;
      }
      
      override public function dispose() : void
      {
      }
   }
}

