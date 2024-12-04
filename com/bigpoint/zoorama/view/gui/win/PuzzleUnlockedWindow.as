package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementRewardsData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.quests.QuestWindowInitParams;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.btn.StateableButton;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.Window;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class PuzzleUnlockedWindow extends Window
   {
      private const CENTER:int = 275;
      
      private var notice:Notifier;
      
      protected var assetFileString:String;
      
      protected var iconsAssetFileString:String;
      
      private var tfTitle:TextField;
      
      private var tfInfo:TextField;
      
      private var tfQuestsInfo:TextField;
      
      private var rewardsContainer:Sprite;
      
      private var questsButtonContainer:Sprite;
      
      private var ribbons:MovieClip;
      
      private var iconSpace:int = 50;
      
      private var rewardData:AchievementRewardsData;
      
      public function PuzzleUnlockedWindow(param1:Notifier)
      {
         var _loc2_:String = null;
         this.notice = new Notifier(param1);
         _loc2_ = "PuzzleUnlockedMessage";
         modal = true;
         useHeaderLoader = false;
         super(param1,_loc2_);
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_INFO_WINDOW,this.handleInfoWindowAsset);
      }
      
      protected function handleMainPicAsset(param1:SWFAsset) : void
      {
      }
      
      public function updateView() : void
      {
         if(isLoaded)
         {
            this.updateWinView();
         }
      }
      
      override public function draw() : void
      {
         super.draw();
         this.x = 175;
         this.y = 100;
      }
      
      private function handleInfoWindowAsset(param1:SWFAsset) : void
      {
         this.asset = param1;
         if(this.asset)
         {
            assignWindowSkin();
         }
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         super.assignLoadedContentGUI();
         this.tfTitle = loadedContent.getChildByName("TF_TITEL") as TextField;
         this.tfInfo = loadedContent.getChildByName("TF_INFO") as TextField;
         this.tfQuestsInfo = loadedContent.getChildByName("TF_INFO_QUESTS_BUTTON") as TextField;
         this.rewardsContainer = new Sprite();
         this.rewardsContainer.x = this.CENTER;
         this.rewardsContainer.y = 220;
         loadedContent.addChild(this.rewardsContainer);
         this.questsButtonContainer = loadedContent.getChildByName("questsButtonContainer") as Sprite;
         this.ribbons = loadedContent.getChildByName("ribbonsMC") as MovieClip;
      }
      
      private function createRewardSymbols() : void
      {
         if(this.rewardData.experience > 0)
         {
            this.createRewardExperienceElement(this.rewardData.experience);
         }
         if(this.rewardData.realMoney > 0)
         {
            this.createRewardRealMoneyElement(this.rewardData.realMoney);
         }
         if(this.rewardData.virtualMoney > 0)
         {
            this.createRewardVirtualMoneyElement(this.rewardData.virtualMoney);
         }
         if(this.rewardData.storeId != -1)
         {
            this.createQuestRewardItem(Categories.STORE,this.rewardData.storeId);
         }
         var _loc1_:Vector.<int> = this.rewardData.resources;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            if(_loc1_[_loc2_] > 0)
            {
               this.createRewardAssetElement(_loc2_,_loc1_[_loc2_]);
            }
            _loc2_++;
         }
      }
      
      private function addToContainer(param1:DisplayObjectContainer, param2:DisplayObject, param3:int = 0) : void
      {
         if(!(param2 == null || param1 == null))
         {
            param1.addChild(param2);
            param2.x = param1.width + param3;
            param1.x = this.CENTER - param3 - (param1.width >> 1);
         }
      }
      
      private function createQuestRewardItem(param1:int, param2:int, param3:Boolean = false) : void
      {
         var rewardContainer:Sprite = null;
         var p_category:int = param1;
         var p_id:int = param2;
         var p_addStars:Boolean = param3;
         rewardContainer = new Sprite();
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(p_category,p_id),function(param1:SWFAsset):void
         {
            var _loc2_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
            var _loc3_:Bitmap = GUITemplates.createMaskedGradientTextfield(TextIdHelper.getCardName(p_category,p_id),StyleModule.HEADER_BOLD_14);
            _loc3_.x = -(_loc3_.width / 2);
            _loc3_.y = 40;
            rewardContainer.addChild(_loc3_);
            rewardContainer.addChild(_loc2_);
            if(p_addStars)
            {
               GUITemplates.createStars(_loc2_,3,30,30,-15,-15);
            }
            addToContainer(rewardsContainer,rewardContainer,iconSpace);
         });
      }
      
      private function createQuestRewardElement(param1:int, param2:int, param3:Boolean = false) : Sprite
      {
         var _loc5_:MovieClip = null;
         var _loc6_:Bitmap = null;
         var _loc4_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_QUESTS_SYMBOLS,AssetConfig.QUESTS_SYMBOLS_REWARD);
         if(_loc4_)
         {
            _loc5_ = AssetLibrary.getMovieClip(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_RESOURCE_REWARD_ICONS);
            _loc6_ = GUITemplates.createMaskedGradientTextfield(param2.toString(),StyleModule.HEADER_BOLD_14);
            _loc6_.x = -(_loc6_.width / 2);
            _loc6_.y = 40;
            _loc4_.addChild(_loc6_);
            _loc4_["reward_mc"].addChild(_loc5_);
            _loc5_.gotoAndStop("rsrc_" + param1);
            if(param3)
            {
               GUITemplates.createStars(_loc4_,3,30,30,-15,-15);
            }
         }
         return _loc4_;
      }
      
      private function createRewardExperienceElement(param1:int) : void
      {
         var _loc2_:Sprite = this.createQuestRewardElement(17,param1,true);
         this.addToContainer(this.rewardsContainer,_loc2_,this.iconSpace);
      }
      
      private function createRewardRealMoneyElement(param1:int) : void
      {
         var _loc2_:Sprite = this.createQuestRewardElement(16,param1);
         this.addToContainer(this.rewardsContainer,_loc2_,this.iconSpace);
      }
      
      private function createRewardVirtualMoneyElement(param1:int) : void
      {
         var _loc2_:Sprite = this.createQuestRewardElement(15,param1);
         this.addToContainer(this.rewardsContainer,_loc2_,this.iconSpace);
      }
      
      private function createRewardAssetElement(param1:int, param2:int) : void
      {
         var _loc3_:Sprite = this.createQuestRewardElement(param1,param2);
         this.addToContainer(this.rewardsContainer,_loc3_,this.iconSpace);
      }
      
      private function updateWinView() : void
      {
         StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_BOLD_12_CENTER);
         StyleModule.setTextFieldStyle(this.tfQuestsInfo,StyleModule.HEADER_BOLD_12_CENTER);
         var _loc1_:String = "";
         switch(this.rewardData.stage)
         {
            case 1:
               _loc1_ = "bronze";
               break;
            case 2:
               _loc1_ = "silver";
               break;
            case 3:
               _loc1_ = "gold";
               break;
            case 4:
               _loc1_ = "platinum";
         }
         this.tfTitle.text = TextResourceModule.getText("zoo.quests.achievements.unlocked." + _loc1_ + ".title");
         this.tfInfo.text = TextResourceModule.getText("zoo.quests.achievements.unlocked." + _loc1_ + ".description");
         this.tfQuestsInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.open.achievements.info");
         this.ribbons.gotoAndStop(_loc1_);
         var _loc2_:StateableButton = new StateableButton(notifier);
         _loc2_.skin = AssetLibrary.getSprite(AssetConfig.ASSET_MAINMENU,AssetConfig.MAINMENU_BUTTON_QUESTS_STATEABLE);
         _loc2_.addEventListener(MouseEvent.CLICK,this.handleOpenQuests);
         _loc2_.defaultState = AssetConfig.MAINMENU_QUESTMENU_BTN_NORMAL;
         _loc2_.states = [{
            "skin":AssetConfig.MAINMENU_QUESTMENU_BTN_NORMAL,
            "tooltipText":"abcMove"
         },{
            "skin":AssetConfig.MAINMENU_QUESTMENU_BTN_ACTIVE,
            "tooltipText":"abcRotate"
         },{
            "skin":AssetConfig.MAINMENU_QUESTMENU_BTN_FINISHED,
            "tooltipText":"abcSell"
         },{
            "skin":AssetConfig.MAINMENU_QUESTMENU_BTN_FAILED,
            "tooltipText":"abcArrow"
         }];
         this.questsButtonContainer.addChild(_loc2_);
         this.createRewardSymbols();
      }
      
      private function handleOpenQuests(param1:MouseEvent) : void
      {
         this.autoClose();
         TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUESTS,"",new QuestWindowInitParams(1,this.rewardData.stage - 1)));
      }
      
      public function setData(param1:AchievementRewardsData) : void
      {
         this.rewardData = param1;
      }
      
      override protected function loadContentFinished() : void
      {
         super.loadContentFinished();
         isLoaded = true;
         this.updateWinView();
      }
      
      override protected function autoClose() : void
      {
         super.autoClose();
      }
   }
}

