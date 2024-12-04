package com.bigpoint.zoomumba.view.windows.quests
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.achievements.AchievementConfigProxy;
   import com.bigpoint.zoomumba.model.features.achievements.AchievementProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenMax;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.questsWindow.PuzzleTabContent;
   
   public class PuzzleTabMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "PuzzleTabMediator";
      
      private var _sections:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _sectionData:Vector.<AchievementData>;
      
      private var _images:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var _badges:Vector.<Sprite> = new Vector.<Sprite>();
      
      private var border:Sprite;
      
      private var outline:Sprite;
      
      private var arrowLeft:Sprite;
      
      private var arrowRight:Sprite;
      
      private var imgBronze:Sprite;
      
      private var imgSilver:Sprite;
      
      private var imgGold:Sprite;
      
      private var imgPlatinum:Sprite;
      
      private var badgeBronze:Sprite;
      
      private var badgeSilver:Sprite;
      
      private var badgeGold:Sprite;
      
      private var badgePlatinum:Sprite;
      
      private var activeImageSection:int = 0;
      
      private var achievementConfig:Vector.<AchievementData>;
      
      private var content:MovieClip;
      
      private var achievementProxy:AchievementProxy;
      
      private var preloader:Sprite;
      
      public function PuzzleTabMediator(param1:PuzzleTabContent)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.ACHIEVEMENT_UPDATED,Note.OPEN_ACHIEVMENT_PAGE_BY_STAGEID];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case DataNote.ACHIEVEMENT_UPDATED:
               this.handleNewData();
               break;
            case Note.OPEN_ACHIEVMENT_PAGE_BY_STAGEID:
               this.activeImageSection = int(param1.getBody());
         }
      }
      
      private function handleNewData() : void
      {
         if(this.content)
         {
            this.showPuzzle();
         }
         if(this.achievementProxy == null)
         {
            this.achievementProxy = facade.retrieveProxy(AchievementProxy.NAME) as AchievementProxy;
         }
         this._sectionData = this.achievementProxy.getAchievementData();
         if(this.content)
         {
            this.showCorrectPieces();
         }
         if(this.content)
         {
            this.content.visible = true;
         }
      }
      
      private function showPuzzle() : void
      {
         DisplayObjectHelper.removeChild(this.puzzleTab.puzzleContainer,this.preloader);
         DisplayObjectHelper.addChild(this.puzzleTab.puzzleContainer,this.content);
         this.sendPuzzleToVector();
      }
      
      override public function onRegister() : void
      {
         sendNotification(NET.GET_ACHIEVEMENTS);
         this.preloader = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_PRELOAD_ANIM);
         this.puzzleTab.puzzleContainer.addChild(this.preloader);
         this.preloader.x = 280;
         this.preloader.y = 150;
         AssetLibrary.sendAssetToFunction("achievement_tab",this.handleAchievementAsset);
         this.achievementProxy = facade.retrieveProxy(AchievementProxy.NAME) as AchievementProxy;
         var _loc1_:AchievementConfigProxy = facade.retrieveProxy(AchievementConfigProxy.NAME) as AchievementConfigProxy;
         this.achievementConfig = _loc1_.getAchievementConfig();
      }
      
      private function handleAchievementAsset(param1:SWFAsset) : void
      {
         this.content = param1.getEmbededMovieClip("PuzzleContent");
         this.handleNewData();
         sendNotification(Note.QUESTS_WINDOW_TAB_LOADED);
      }
      
      private function showCorrectPieces() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         if(this._sectionData.length != 0)
         {
            while(_loc2_ < this._sectionData.length)
            {
               if(this._sectionData[_loc2_].level > this.activeImageSection)
               {
                  this.setPiece(this._sectionData[_loc2_].itemId,true);
                  _loc1_++;
               }
               else
               {
                  this.setPiece(this._sectionData[_loc2_].itemId,false);
               }
               _loc2_++;
            }
         }
         this.changeBorderType(_loc1_);
         this.addArrowListeners();
      }
      
      private function setPiece(param1:int, param2:Boolean) : void
      {
         var piece:Sprite = null;
         var id:int = param1;
         var state:Boolean = param2;
         try
         {
            piece = this._sections[id - 1];
            if(state)
            {
               piece.alpha = 0;
            }
            else
            {
               piece.alpha = 1;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function sendPuzzleToVector() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         var _loc4_:Sprite = null;
         if(this._images.length == 0)
         {
            _loc1_ = 0;
            while(_loc1_ < this.content.numChildren)
            {
               _loc2_ = this.content.getChildByName("mcPiece" + String(_loc1_)) as Sprite;
               if(_loc2_ != null)
               {
                  this._sections.push(_loc2_);
                  _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.handlePuzzleRollOver);
                  _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.handlePuzzleRollOut);
               }
               else
               {
                  this.border = this.content.getChildByName("mcBorder") as Sprite;
                  this.border.mouseEnabled = false;
                  this.border.visible = false;
                  this.outline = this.content.getChildByName("mcOutline") as Sprite;
                  this.outline.mouseEnabled = false;
                  this.arrowLeft = this.content.getChildByName("mcArrowLeft") as Sprite;
                  this.arrowRight = this.content.getChildByName("mcArrowRight") as Sprite;
                  _loc3_ = this.content.getChildByName("mcImages") as Sprite;
                  this.imgBronze = _loc3_.getChildByName("mcA") as Sprite;
                  this.imgSilver = _loc3_.getChildByName("mcB") as Sprite;
                  this.imgGold = _loc3_.getChildByName("mcC") as Sprite;
                  this.imgPlatinum = _loc3_.getChildByName("mcD") as Sprite;
                  _loc4_ = this.content.getChildByName("mcBadges") as Sprite;
                  this.badgeBronze = _loc4_.getChildByName("mcBronze") as Sprite;
                  this.badgeSilver = _loc4_.getChildByName("mcSilver") as Sprite;
                  this.badgeGold = _loc4_.getChildByName("mcGold") as Sprite;
                  this.badgePlatinum = _loc4_.getChildByName("mcPlatinum") as Sprite;
               }
               _loc1_++;
            }
            this._images.push(this.imgBronze);
            this._images.push(this.imgSilver);
            this._images.push(this.imgGold);
            this._images.push(this.imgPlatinum);
            this._badges.push(this.badgeBronze);
            this._badges.push(this.badgeSilver);
            this._badges.push(this.badgeGold);
            this._badges.push(this.badgePlatinum);
            this.addArrowListeners();
            this.changeArrowStates();
            this.changeImageStates();
         }
      }
      
      private function handlePuzzleRollOver(param1:MouseEvent) : void
      {
         var _loc5_:AchievementData = null;
         var _loc2_:Array = param1.target.name.split("mcPiece");
         var _loc3_:String = TextResourceModule.getText("zoo.tooltip.achievements.puzzle." + _loc2_[1] + ".title");
         var _loc4_:String = TextResourceModule.getText("zoo.tooltip.achievements.puzzle." + _loc2_[1] + ".description");
         var _loc6_:String = "";
         var _loc7_:int = this.getAchievementIndexById(int(_loc2_[1]));
         if(_loc7_ > -1)
         {
            _loc5_ = this._sectionData[_loc7_];
         }
         else
         {
            _loc5_ = new AchievementData();
            _loc5_.count = "0";
            _loc5_.level = 0;
         }
         var _loc8_:AchievementData = this.achievementConfig[this.getAchievementConfigIndexById(int(_loc2_[1]))];
         _loc6_ += " " + StringHelper.numberFormater(Math.round(int(_loc5_.count)),TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR))) + "/" + StringHelper.numberFormater(_loc8_.stages[this.activeImageSection + 1],TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
         if(param1.target.alpha != 0)
         {
            _loc3_ = TextResourceModule.getText("zoo.tooltip.achievements.puzzle." + _loc2_[1] + ".title");
            TweenMax.to(param1.target,0.5,{"colorTransform":{
               "tint":16777164,
               "tintAmount":0.5
            }});
            if(_loc5_.level == this.activeImageSection)
            {
               _loc3_ += _loc6_;
            }
            TooltipNewManager.setToolTip(param1.target as Sprite,_loc3_ + "<br>" + _loc4_,true);
            TweenMax.to(param1.target,0.5,{"colorTransform":{
               "tint":16777164,
               "tintAmount":0.5
            }});
         }
         else
         {
            _loc3_ = TextResourceModule.getText("zoo.quests.achievements.individual." + _loc2_[1] + ".title");
            TooltipNewManager.setToolTip(param1.target as Sprite,_loc3_,true);
         }
      }
      
      private function getAchievementIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._sectionData.length)
         {
            if(this._sectionData[_loc2_].itemId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      private function getAchievementConfigIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.achievementConfig.length)
         {
            if(this.achievementConfig[_loc2_].id == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return 0;
      }
      
      private function handlePuzzleRollOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
         if(param1.target.alpha != 0)
         {
            TweenMax.to(param1.target,0,{"colorTransform":{
               "tint":16777164,
               "tintAmount":0
            }});
         }
      }
      
      private function addArrowListeners() : void
      {
         this.arrowLeft.addEventListener(MouseEvent.MOUSE_DOWN,this.handleArrowDown);
         this.arrowRight.addEventListener(MouseEvent.MOUSE_DOWN,this.handleArrowDown);
         this.arrowLeft.addEventListener(MouseEvent.MOUSE_OVER,this.handleArrowOver);
         this.arrowRight.addEventListener(MouseEvent.MOUSE_OVER,this.handleArrowOver);
         this.arrowLeft.addEventListener(MouseEvent.MOUSE_OUT,this.handleArrowOut);
         this.arrowRight.addEventListener(MouseEvent.MOUSE_OUT,this.handleArrowOut);
      }
      
      private function removeArrowListeners() : void
      {
         this.arrowLeft.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleArrowDown);
         this.arrowRight.removeEventListener(MouseEvent.MOUSE_DOWN,this.handleArrowDown);
         this.arrowLeft.removeEventListener(MouseEvent.MOUSE_OVER,this.handleArrowOver);
         this.arrowRight.removeEventListener(MouseEvent.MOUSE_OVER,this.handleArrowOver);
         this.arrowLeft.removeEventListener(MouseEvent.MOUSE_OUT,this.handleArrowOut);
         this.arrowRight.removeEventListener(MouseEvent.MOUSE_OUT,this.handleArrowOut);
      }
      
      private function handleArrowOver(param1:MouseEvent) : void
      {
      }
      
      private function handleArrowOut(param1:MouseEvent) : void
      {
      }
      
      private function handleArrowDown(param1:MouseEvent) : void
      {
         this.removeArrowListeners();
         switch(param1.target.name)
         {
            case "mcArrowLeft":
               if(this.activeImageSection > 0)
               {
                  --this.activeImageSection;
               }
               break;
            case "mcArrowRight":
               if(this.activeImageSection < 3)
               {
                  ++this.activeImageSection;
               }
         }
         this.changeArrowStates();
         this.changeImageStates();
      }
      
      private function changeArrowStates() : void
      {
         switch(this.activeImageSection)
         {
            case 0:
               this.arrowLeft.visible = false;
               this.arrowRight.visible = true;
               break;
            case 1:
               this.arrowLeft.visible = true;
               this.arrowRight.visible = true;
               break;
            case 2:
               this.arrowLeft.visible = true;
               this.arrowRight.visible = true;
               break;
            case 3:
               this.arrowLeft.visible = true;
               this.arrowRight.visible = false;
         }
      }
      
      private function changeImageStates() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this._images.length)
         {
            if(_loc1_ == this.activeImageSection)
            {
               this._images[_loc1_].visible = true;
            }
            else
            {
               this._images[_loc1_].visible = false;
            }
            _loc1_++;
         }
         while(_loc2_ < this._badges.length)
         {
            if(_loc2_ == this.activeImageSection)
            {
               this._badges[_loc2_].visible = true;
            }
            else
            {
               this._badges[_loc2_].visible = false;
            }
            _loc2_++;
         }
         if(this._sectionData)
         {
            this.showCorrectPieces();
         }
      }
      
      private function changeBorderType(param1:int) : void
      {
         if(param1 == 12)
         {
            this.border.visible = true;
            this.outline.visible = false;
         }
         else
         {
            this.border.visible = false;
            this.outline.visible = true;
         }
      }
      
      private function get puzzleTab() : PuzzleTabContent
      {
         return this.viewComponent as PuzzleTabContent;
      }
   }
}

