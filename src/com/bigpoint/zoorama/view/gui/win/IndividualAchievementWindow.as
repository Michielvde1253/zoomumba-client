package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.quests.QuestWindowInitParams;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.btn.StateableButton;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.Window;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class IndividualAchievementWindow extends Window
   {
      private var notice:Notifier;
      
      protected var assetFileString:String;
      
      protected var iconsAssetFileString:String;
      
      private var tfTitle:TextField;
      
      private var tfInfo:TextField;
      
      private var tfSecondInfo:TextField;
      
      private var tfQuestsInfo:TextField;
      
      private var rewardContainer:Sprite;
      
      private var questsButtonContainer:Sprite;
      
      private var ribbons:MovieClip;
      
      private var data:AchievementData;
      
      private var requestBitmap:Bitmap;
      
      public function IndividualAchievementWindow(param1:Notifier)
      {
         var _loc2_:String = null;
         this.notice = new Notifier(param1);
         _loc2_ = "IndividualAchievementWindow";
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
         this.tfSecondInfo = loadedContent.getChildByName("TF_INFO_SECOND") as TextField;
         this.tfQuestsInfo = loadedContent.getChildByName("TF_INFO_QUESTS_BUTTON") as TextField;
         this.rewardContainer = loadedContent.getChildByName("rewardContainer") as Sprite;
         this.questsButtonContainer = loadedContent.getChildByName("questsButtonContainer") as Sprite;
         this.ribbons = loadedContent.getChildByName("ribbonsMC") as MovieClip;
      }
      
      public function updateView() : void
      {
         if(isLoaded)
         {
            this.updateWinView();
         }
      }
      
      private function updateWinView() : void
      {
         StyleModule.setTextFieldStyle(this.tfInfo,StyleModule.HEADER_BOLD_12_CENTER);
         StyleModule.setTextFieldStyle(this.tfSecondInfo,StyleModule.HEADER_BOLD_12_CENTER);
         StyleModule.setTextFieldStyle(this.tfQuestsInfo,StyleModule.HEADER_BOLD_12_CENTER);
         this.tfTitle.text = TextResourceModule.getText("zoo.quests.achievements.individual." + this.data.itemId + ".title");
         this.tfInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.info.congrats");
         this.tfQuestsInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.open.achievements.info");
         var _loc1_:String = TextResourceModule.getText("zoo.quests.achievements.individual." + this.data.itemId + ".requirement");
         var _loc2_:RegExp = /%val%/;
         this.data.count = isNaN(Number(this.data.count)) ? this.data.count : StringHelper.numberFormater(Number(this.data.count),TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         _loc1_ = _loc1_.replace(_loc2_,this.data.count);
         if(this.requestBitmap)
         {
            this.rewardContainer.removeChild(this.requestBitmap);
         }
         this.requestBitmap = GUITemplates.createMaskedGradientTextfield(_loc1_,StyleModule.HEADER_BOLD_12_CENTER);
         this.rewardContainer.addChild(this.requestBitmap);
         this.requestBitmap.x = this.rewardContainer.width / 2 - this.requestBitmap.width / 2;
         switch(this.data.level)
         {
            case 1:
               this.ribbons.gotoAndStop("bronze");
               this.tfSecondInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.bronze.congrats");
               break;
            case 2:
               this.ribbons.gotoAndStop("silver");
               this.tfSecondInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.silver.congrats");
               break;
            case 3:
               this.ribbons.gotoAndStop("gold");
               this.tfSecondInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.gold.congrats");
               break;
            case 4:
               this.ribbons.gotoAndStop("platinum");
               this.tfSecondInfo.text = TextResourceModule.getText("zoo.quests.achievements.individual.platinum.congrats");
         }
         var _loc3_:StateableButton = new StateableButton(notifier);
         _loc3_.skin = AssetLibrary.getSprite(AssetConfig.ASSET_MAINMENU,AssetConfig.MAINMENU_BUTTON_QUESTS_STATEABLE);
         _loc3_.addEventListener(MouseEvent.CLICK,this.handleOpenQuests);
         _loc3_.defaultState = AssetConfig.MAINMENU_QUESTMENU_BTN_NORMAL;
         _loc3_.states = [{
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
         this.questsButtonContainer.addChild(_loc3_);
      }
      
      private function handleOpenQuests(param1:MouseEvent) : void
      {
         this.autoClose();
         TempGetterProxy.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUESTS,"",new QuestWindowInitParams(1,this.data.level - 1)));
      }
      
      public function setData(param1:AchievementData) : void
      {
         this.data = param1;
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

