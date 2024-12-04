package com.bigpoint.zoorama.view.info
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.LevelConfigVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.data.infoWindow.InfoWindowData;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.notices.gui.window.WindowNotice;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.styleModule.StyleModule;
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.tooltip.Tooltip;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.bigpoint.zoorama.view.gui.win.generals.Window;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class InfoWindow extends Window
   {
      private var notice:Notifier;
      
      protected var assetFileString:String;
      
      protected var iconsAssetFileString:String;
      
      protected var xmlPath:String;
      
      private var tooltipRating:Tooltip;
      
      private var nextCage:MovieClip;
      
      private var prevCage:MovieClip;
      
      private var resourceIcons:MovieClip;
      
      private var attractionMC:MovieClip;
      
      private var attractionCountContainer:MovieClip;
      
      private var cagesMC:MovieClip;
      
      private var foodKind:String;
      
      public var itemType:String;
      
      protected var iconContainer:Sprite;
      
      protected var mainPictureContainer:Sprite;
      
      protected var sexIconContainer:MovieClip;
      
      protected var scrollContainer:Sprite;
      
      protected var cageUpgrades:MovieClip;
      
      private var upgradeBonus:Bitmap;
      
      private var lockedInForgottenZoo:MovieClip;
      
      protected var mainPic:MovieClip;
      
      protected var iconPic:MovieClip;
      
      protected var rating_mc:MovieClip;
      
      protected var tfTitle:TextField;
      
      protected var titelId:String;
      
      protected var textId:String;
      
      protected var textInfo:TextField;
      
      private var rating:int;
      
      private var vo:InfoWindowData;
      
      protected var assetId:String;
      
      public var isAnimal:Boolean = false;
      
      public var isPremium:Boolean = false;
      
      private var stepperCagesAsset:Sprite;
      
      private var infoIconCagesRef:InfoIconItemRef;
      
      private var cageIds:Vector.<int>;
      
      private var specieId:int = 1;
      
      public function InfoWindow(param1:Notifier)
      {
         var _loc2_:String = null;
         this.notice = new Notifier(param1);
         _loc2_ = "InfoWindowContent";
         modal = true;
         useHeaderLoader = false;
         super(param1,_loc2_);
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         AssetLibrary.sendAssetToFunction(AssetConfig.ASSET_INFO_WINDOW,this.handleInfoWindowAsset);
      }
      
      public function showInfoData(param1:InfoWindowData) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:SpecieShopData = null;
         this.vo = param1;
         while(this.mainPictureContainer.numChildren > 0)
         {
            this.mainPictureContainer.removeChildAt(0);
         }
         var _loc2_:AnimalShopData = ConfigurationModule.getInstance().getAnimalData(param1.itemId);
         if(this.isAnimal)
         {
            _loc3_ = this.xmlPath + "titel_" + _loc2_.speciesId;
            _loc4_ = this.xmlPath + "text_" + _loc2_.speciesId;
         }
         else if(this.isPremium)
         {
            _loc3_ = this.xmlPath + "title." + param1.itemId;
            _loc4_ = this.xmlPath + "infoText." + param1.itemId;
         }
         else
         {
            _loc3_ = this.xmlPath + "titel_" + param1.itemId;
            _loc4_ = this.xmlPath + "text_" + param1.itemId;
         }
         this.tfTitle.text = TextResourceModule.getText(_loc3_);
         this.textInfo.text = TextResourceModule.getText(_loc4_);
         if(this.mainPic)
         {
            this.mainPictureContainer.removeChild(this.mainPic);
         }
         AssetLibrary.sendAssetToFunction(this.assetId,this.handleMainPicAsset);
         if(!this.isAnimal)
         {
            this.sexIconContainer.gotoAndStop("not_animal_icon");
         }
         else
         {
            _loc2_ = ConfigurationModule.getInstance().getAnimalData(param1.itemId);
            _loc5_ = ConfigurationModule.getInstance().getSpecieData(_loc2_.speciesId);
            this.foodKind = Resources.getName(_loc5_.foodId);
            this.resourceIcons.gotoAndStop(this.foodKind);
            this.rating = _loc5_.rating;
            this.rating_mc.gotoAndStop(this.rating + 1);
            this.rating_mc.addEventListener(MouseEvent.MOUSE_OVER,this.handelRatingMcOver);
            this.rating_mc.addEventListener(MouseEvent.MOUSE_OUT,this.handelRatingMcOut);
            this.cageIds = this.defineVectorFrameNotifier(_loc2_.speciesId);
            if(!this.infoIconCagesRef)
            {
               this.infoIconCagesRef = new InfoIconItemRef(this.stepperCagesAsset,Categories.CAGE,ConfigurationModule.getInstance().getCageData,this.cageIds);
               this.infoIconCagesRef.addEventListener(InfoIconEvent.ICON_CHANGED,this.handleInfoIconChange);
            }
            this.infoIconCagesRef.showCageBonus(TempGetterProxy.getCageSpecieBotus(_loc5_.itemId,this.cageIds[0]));
         }
         this.refreshView(param1);
      }
      
      private function handleMainPicAsset(param1:SWFAsset) : void
      {
         loadedContent = param1.getEmbededSprite(AssetConfig.DEFAULT_INFO_SPR);
         this.mainPictureContainer.addChild(loadedContent);
      }
      
      private function refreshView(param1:InfoWindowData) : void
      {
         var _loc2_:int = 0;
         var _loc3_:AnimalShopData = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:LevelConfigVO = null;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         this.rating_mc.visible = false;
         this.rating_mc.visible = false;
         this.sexIconContainer.visible = false;
         this.resourceIcons.visible = false;
         this.cagesMC.visible = false;
         this.attractionMC.visible = false;
         this.cageUpgrades.visible = false;
         this.stepperCagesAsset.visible = false;
         this.lockedInForgottenZoo.visible = false;
         if(param1.availableInZoos.length)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.availableInZoos.length)
            {
               if(param1.availableInZoos[_loc2_] == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
               {
                  this.lockedInForgottenZoo.visible = true;
               }
               _loc2_++;
            }
         }
         switch(param1.categoryId)
         {
            case Categories.ANIMAL:
               _loc3_ = ConfigurationModule.getInstance().getAnimalData(this.vo.itemId);
               _loc4_ = ConfigurationModule.getInstance().getSpecieData(_loc3_.speciesId).getAttraction();
               this.attractionCountContainer.levelNumTextMc.numTf.text = _loc4_;
               this.resourceIcons.visible = true;
               this.attractionMC.visible = true;
               this.cagesMC.visible = false;
               this.rating_mc.visible = true;
               this.stepperCagesAsset.visible = true;
               this.infoIconCagesRef.showCageBonus(TempGetterProxy.getCageSpecieBotus(_loc3_.speciesId,this.cageIds[0]));
               break;
            case Categories.CAGE:
               _loc5_ = ConfigurationModule.getInstance().getCageData(this.vo.itemId).getAttraction();
               this.attractionCountContainer.levelNumTextMc.numTf.text = _loc5_;
               this.attractionMC.visible = true;
               this.cageUpgrades.visible = true;
               this.cageUpgrades.level_mc.levelNumTextMc.numTf.text = String(this.vo.level);
               _loc6_ = ConfigurationModule.getInstance().getLevelUpCageConfig(this.vo.level);
               _loc7_ = _loc6_.experienceBonus;
               _loc8_ = 100 + 100 * _loc7_ + "%";
               if(this.upgradeBonus)
               {
                  if(MovieClip(this.cageUpgrades.bonusContainer).contains(this.upgradeBonus))
                  {
                     MovieClip(this.cageUpgrades.bonusContainer).removeChild(this.upgradeBonus);
                     this.upgradeBonus.bitmapData.dispose();
                  }
               }
               this.upgradeBonus = GUITemplates.createMaskedGradientTextfield(TextResourceModule.getText(_loc8_),StyleModule.HEADER_BOLD_16);
               this.cageUpgrades.bonusContainer.addChild(this.upgradeBonus);
               break;
            case Categories.DECOR:
               _loc9_ = ConfigurationModule.getInstance().getDecorationData(this.vo.itemId).getAttraction();
               this.attractionCountContainer.levelNumTextMc.numTf.text = _loc9_;
               this.attractionMC.visible = true;
         }
      }
      
      private function handelRatingMcOver(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.tooltipRating == null)
         {
            _loc2_ = TextResourceModule.getText("zoo.tooltip.shopInfo.rating");
            this.tooltipRating = new Tooltip();
            this.tooltipRating = GUITemplates.getStandardTooltip(_loc2_);
            this.tooltipRating.target = this;
         }
         TooltipNewManager.setToolTip(this as DisplayObject,TextResourceModule.getText("zoo.tooltip.shopInfo.rating"));
      }
      
      private function handelRatingMcOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
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
         var _loc1_:Sprite = null;
         super.assignLoadedContentGUI();
         this.mainPictureContainer = loadedContent.getChildByName("SC_MAIN_ICON") as Sprite;
         this.rating_mc = loadedContent.getChildByName("rating_mc") as MovieClip;
         this.rating_mc.visible = false;
         this.sexIconContainer = loadedContent.getChildByName("sexIcon_mc") as MovieClip;
         this.sexIconContainer.gotoAndStop("not_animal_icon");
         this.tfTitle = loadedContent.getChildByName("TF_TITEL") as TextField;
         this.scrollContainer = loadedContent.getChildByName("SC_TF_INFO") as MovieClip;
         this.resourceIcons = loadedContent.getChildByName("resourceIcon_mc") as MovieClip;
         this.attractionMC = loadedContent.getChildByName("attractionMC") as MovieClip;
         this.lockedInForgottenZoo = loadedContent.getChildByName("lockedInForgottenZoo") as MovieClip;
         this.attractionCountContainer = this.attractionMC.getChildByName("attraction_mc") as MovieClip;
         this.cagesMC = loadedContent.getChildByName("cagesMC") as MovieClip;
         this.cageUpgrades = loadedContent.getChildByName("cageUpgrades") as MovieClip;
         this.nextCage = this.cagesMC.getChildByName("arrowRight") as MovieClip;
         this.prevCage = this.cagesMC.getChildByName("arrowLeft") as MovieClip;
         this.nextCage.addEventListener(MouseEvent.CLICK,this.handleNextCage);
         this.prevCage.addEventListener(MouseEvent.CLICK,this.handlePrevCage);
         this.checkArrowsVisibility();
         if(this.scrollContainer)
         {
            _loc1_ = this.scrollContainer.getChildByName("content") as Sprite;
            this.textInfo = _loc1_.getChildByName("tf") as TextField;
            StyleModule.setTextFieldStyle(this.textInfo,StyleModule.HEADER_BOLD_14);
         }
         this.stepperCagesAsset = loadedContent.getChildByName("stepperSPR") as Sprite;
      }
      
      private function handleInfoIconChange(param1:InfoIconEvent) : void
      {
         this.infoIconCagesRef.showCageBonus(TempGetterProxy.getCageSpecieBotus(this.specieId,this.cageIds[param1.position]));
      }
      
      private function defineVectorFrameNotifier(param1:int) : Vector.<int>
      {
         var _loc4_:CageShopData = null;
         this.specieId = param1;
         var _loc2_:Vector.<int> = new Vector.<int>();
         var _loc3_:Vector.<CageShopData> = ConfigurationModule.getInstance().getAllCagesBySpecieAsVector(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc2_.push(_loc4_.itemId);
         }
         return _loc2_;
      }
      
      private function handleNextCage(param1:MouseEvent) : void
      {
         this.cagesMC.cagesIcon_mc.nextFrame();
         this.checkArrowsVisibility();
      }
      
      private function handlePrevCage(param1:MouseEvent) : void
      {
         this.cagesMC.cagesIcon_mc.prevFrame();
         this.checkArrowsVisibility();
      }
      
      private function checkArrowsVisibility() : void
      {
         this.nextCage.visible = false;
         this.prevCage.visible = false;
         if(this.cagesMC.cagesIcon_mc.currentFrame > 1)
         {
            this.prevCage.visible = true;
         }
         if(this.cagesMC.cagesIcon_mc.currentFrame < this.cagesMC.cagesIcon_mc.totalFrames)
         {
            this.nextCage.visible = true;
         }
      }
      
      override protected function loadContentFinished() : void
      {
         super.loadContentFinished();
      }
      
      override protected function autoClose() : void
      {
         if(this.infoIconCagesRef)
         {
            this.infoIconCagesRef.restart();
         }
         super.autoClose();
         notifier.dispatchNotice(new WindowNotice(WindowNotice.CLOSE_WINDOW,OldWindowTypes.INFO_WINDOW));
      }
      
      public function set itemXmlPath(param1:String) : void
      {
         this.xmlPath = param1;
      }
      
      public function set itemAssetId(param1:String) : void
      {
         this.assetId = param1;
      }
   }
}

