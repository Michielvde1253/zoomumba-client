package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.ColorHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.field.icons.Smiley;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.greensock.TweenLite;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import org.puremvc.as3.patterns.facade.Facade;
   import utils.ToolTipSpriteManager;
   
   public class CageActionMenu extends AbstractActionMenu
   {
      private var notifier:Notifier;
      
      private var targetCage:Cage;
      
      private var smiley:Smiley;
      
      private var smileyButton:SimpleButton;
      
      private var cageActionButtons:Vector.<ActionButton> = new Vector.<ActionButton>();
      
      private var babyActionButtons:ActionButton;
      
      private var buttonIds:Vector.<int> = Vector.<int>([ActionButton.FEED_ACTON,ActionButton.WATER_ACTON,ActionButton.CLEAN_ACTON,ActionButton.CUDDLE_ACTON,ActionButton.MEDICINE_ACTON,ActionButton.UPGRADE_ACTON,ActionButton.BABY_TO_INV_ACTON,ActionButton.BREED_ACTON]);
      
      private var buttonPositions:Vector.<Array> = Vector.<Array>([[-67,-11],[-35,51],[35,51],[67,-11],[33,-62],[33,-62],[-33,-62],[-33,-62]]);
      
      public function CageActionMenu(param1:Notifier)
      {
         super();
         this._menuType = ActionMenuTypes.MENU_TYPE_CAGE;
         this.notifier = new Notifier(param1);
         this.smiley = new Smiley();
         this.smiley.zoomLevel = 2;
         this.smiley.mouseChildren = this.smiley.mouseEnabled = false;
         this.smiley.hideNeeds();
         this.addChild(this.smiley);
         this.smileyButton = AssetLibrary.getButton(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BUTTON);
         this.smileyButton.addEventListener(MouseEvent.CLICK,this.handleSmileyClicked);
         this.smileyButton.useHandCursor = true;
         this.smileyButton.scaleX = this.smileyButton.scaleY = 1.5;
         this.addChild(this.smileyButton);
         this.createCircularMenuForTheCage();
         TweenLite.to(this,0.1,{
            "delay":0.05,
            "overwrite":0,
            "dropShadowFilter":{
               "color":0,
               "blurX":15,
               "blurY":15,
               "strength":0.75,
               "quality":1,
               "angle":90,
               "distance":10,
               "alpha":1,
               "index":0
            }
         });
         TweenLite.to(this,0.1,{
            "delay":0.1,
            "overwrite":0,
            "glowFilter":{
               "color":7576343,
               "blurX":100,
               "blurY":100,
               "strength":1.75,
               "alpha":1,
               "index":1
            }
         });
      }
      
      private function createCircularMenuForTheCage() : void
      {
         var _loc2_:ActionButton = null;
         var _loc3_:ActionButton = null;
         var _loc1_:uint = this.buttonIds.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ = new ActionButton(this.notifier,this,this._menuType,this.buttonIds[_loc4_]);
            switch(this.buttonIds[_loc4_])
            {
               case ActionButton.FEED_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_FEED");
                  break;
               case ActionButton.WATER_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_WATER");
                  break;
               case ActionButton.CUDDLE_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_CUDLE");
                  break;
               case ActionButton.CLEAN_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_CLEAN");
                  break;
               case ActionButton.UPGRADE_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_UPGRADE");
                  break;
               case ActionButton.MEDICINE_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_MEDICINE");
                  break;
               case ActionButton.BREED_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_BREED");
                  break;
               case ActionButton.BABY_TO_INV_ACTON:
                  TutorialInjectionManager.getInstance().addItem(_loc2_,"CAGE_MENU_BABY");
            }
            this.cageActionButtons.push(_loc2_);
            _loc2_.x = this.buttonPositions[_loc4_][0];
            _loc2_.y = this.buttonPositions[_loc4_][1];
            if(_loc2_.y < 12 && _loc2_.y > -12)
            {
               this.swapChildren(_loc2_,this.smileyButton);
               this.swapChildren(_loc2_,this.smiley);
            }
            switch(this.buttonIds[_loc4_])
            {
               case ActionButton.FEED_ACTON:
                  _loc3_ = new ActionButton(this.notifier,_loc2_.subButtonContainer,this._menuType,ActionButton.POWER_FEED_ACTON,true);
                  this.cageActionButtons.push(_loc3_);
                  TutorialInjectionManager.getInstance().addItem(_loc3_,"CAGE_MENU_POWER_FEED");
                  _loc3_.x = -35;
                  _loc3_.y = -25;
                  _loc3_ = new ActionButton(this.notifier,_loc2_.subButtonContainer,this._menuType,ActionButton.SUPER_FEED_ACTON,true);
                  TutorialInjectionManager.getInstance().addItem(_loc3_,"CAGE_MENU_SUPER_FEED");
                  this.cageActionButtons.push(_loc3_);
                  _loc3_.x = -35;
                  _loc3_.y = 35;
                  break;
               case ActionButton.UPGRADE_ACTON:
                  _loc3_ = new ActionButton(this.notifier,_loc2_.subButtonContainer,this._menuType,ActionButton.UPGRADE_EXTRA_ACTON,true);
                  TutorialInjectionManager.getInstance().addItem(_loc3_,"CAGE_MENU_EXTRA_UPGRADE");
                  this.cageActionButtons.push(_loc3_);
                  _loc3_.x = 47;
                  _loc3_.y = -7;
                  break;
               case ActionButton.MEDICINE_ACTON:
                  _loc3_ = new ActionButton(this.notifier,_loc2_.subButtonContainer,this._menuType,ActionButton.SUPER_MEDICINE_ACTON,true);
                  TutorialInjectionManager.getInstance().addItem(_loc3_,"CAGE_MENU_SUPER_MEDICINE");
                  this.cageActionButtons.push(_loc3_);
                  _loc3_.x = 47;
                  _loc3_.y = -7;
                  break;
            }
            _loc4_++;
         }
      }
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
         this.targetCage = param1 as Cage;
         TimeManager.registerTickFunction(this.updateCageActionMenu);
         this.smiley.visible = true;
         this.updateCageActionMenu();
      }
      
      private function updateSmiley() : void
      {
         var _loc1_:Boolean = false;
         if(this.targetCage.sickTimeStamp > TimeManager.currentTime && this.targetCage.healthTimeStamp > TimeManager.currentTime)
         {
            _loc1_ = true;
         }
         this.smiley.showHappiness(this.targetCage.happiness,this.targetCage.instantHealthRestored,0,0,0,0,_loc1_,true);
      }
      
      private function updateCageActionMenu() : void
      {
         var _loc2_:int = 0;
         var _loc3_:ActionButton = null;
         var _loc4_:int = 0;
         var _loc5_:CageShopData = null;
         var _loc6_:* = false;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc1_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         this.updateSmiley();
         for each(_loc3_ in this.cageActionButtons)
         {
            _loc4_ = TimeManager.currentTime;
            switch(_loc3_.actionId)
            {
               case ActionButton.WATER_ACTON:
                  _loc2_ = Math.floor((this.targetCage.waterTimeStamp - _loc4_) / this.targetCage.waterTime * 100);
                  if(_loc2_ < 0)
                  {
                     _loc2_ = 0;
                  }
                  if(_loc2_ >= MainConfig.PERCENTAGE_FOR_ACTIONS)
                  {
                     _loc3_.diactivateButton();
                  }
                  else
                  {
                     _loc3_.activateButton();
                  }
                  _loc3_.showPercentage(_loc2_);
                  break;
               case ActionButton.FEED_ACTON:
                  _loc2_ = Math.floor((this.targetCage.feedTimeStamp - _loc4_) / this.targetCage.feedTime * 100);
                  if(_loc2_ < 0)
                  {
                     _loc2_ = 0;
                  }
                  if(_loc2_ >= MainConfig.PERCENTAGE_FOR_ACTIONS)
                  {
                     _loc3_.diactivateButton();
                  }
                  else
                  {
                     _loc3_.activateButton();
                  }
                  _loc3_.showPercentage(_loc2_);
                  _loc3_.showFromeWithName("rsrc_" + this.targetCage.foodId);
                  break;
               case ActionButton.POWER_FEED_ACTON:
               case ActionButton.SUPER_FEED_ACTON:
                  _loc2_ = Math.floor((this.targetCage.feedTimeStamp - _loc4_) / this.targetCage.feedTime * 100);
                  if(_loc2_ >= MainConfig.PERCENTAGE_FOR_SUPER_ACTIONS)
                  {
                     _loc3_.diactivateButton();
                  }
                  else
                  {
                     _loc3_.activateButton();
                  }
                  break;
               case ActionButton.CLEAN_ACTON:
                  _loc2_ = Math.floor((this.targetCage.cleanTimeStamp - _loc4_) / this.targetCage.cleanTime * 100);
                  if(_loc2_ < 0)
                  {
                     _loc2_ = 0;
                  }
                  if(_loc2_ >= MainConfig.PERCENTAGE_FOR_ACTIONS)
                  {
                     _loc3_.diactivateButton();
                  }
                  else
                  {
                     _loc3_.activateButton();
                  }
                  _loc3_.showPercentage(_loc2_);
                  break;
               case ActionButton.CUDDLE_ACTON:
                  _loc2_ = Math.floor((this.targetCage.cuddleTimeStamp - _loc4_) / this.targetCage.cuddleTime * 100);
                  if(_loc2_ < 0)
                  {
                     _loc2_ = 0;
                  }
                  if(_loc2_ >= MainConfig.PERCENTAGE_FOR_ACTIONS)
                  {
                     _loc3_.diactivateButton();
                  }
                  else
                  {
                     _loc3_.activateButton();
                  }
                  _loc3_.showPercentage(_loc2_);
                  break;
               case ActionButton.MEDICINE_ACTON:
                  if(this.targetCage.healthTimeStamp > TimeManager.currentTime)
                  {
                     if(this.targetCage.sickTimeStamp > TimeManager.currentTime)
                     {
                        _loc2_ = Math.floor((this.targetCage.sickTimeStamp - _loc4_) / this.targetCage.sickTime * 100);
                        _loc3_.showProgressBar();
                        _loc3_.showPercentage(100 - _loc2_);
                        _loc3_.diactivateButton();
                        _loc3_.visible = true;
                     }
                     else
                     {
                        _loc3_.visible = false;
                     }
                  }
                  else if(this.targetCage.healthTimeStamp != 0)
                  {
                     _loc3_.hideProgressBar();
                     _loc3_.activateButton();
                     _loc3_.visible = true;
                  }
                  else
                  {
                     _loc3_.visible = false;
                  }
                  break;
               case ActionButton.SUPER_MEDICINE_ACTON:
                  if(this.targetCage.healthTimeStamp > TimeManager.currentTime)
                  {
                     _loc3_.visible = true;
                  }
                  else
                  {
                     _loc3_.visible = true;
                  }
                  break;
               case ActionButton.BREED_ACTON:
                  if(!Settings.TUTORIAL_ACTIVE)
                  {
                     _loc3_.visible = true;
                  }
                  if(this.targetCage.canBreed && this.targetCage.animalTier == 1)
                  {
                     if(this.targetCage.breedTimeStamp <= 0)
                     {
                        _loc3_.showBabyOnTheWay();
                        _loc3_.hideProgressBar();
                     }
                     else if(this.targetCage.breedTimeStamp > _loc4_)
                     {
                        _loc3_.showBabyOnTheWay();
                        _loc3_.showPercentage(100 - int((this.targetCage.breedTimeStamp - _loc4_) / this.targetCage.breadTime * 100));
                        _loc3_.showProgressBar();
                     }
                     else
                     {
                        _loc3_.showBabyIsReady();
                        _loc3_.hideProgressBar();
                     }
                  }
                  else
                  {
                     _loc3_.visible = false;
                  }
                  break;
               case ActionButton.BABY_TO_INV_ACTON:
                  this.babyActionButtons = _loc3_;
                  if(this.targetCage.canBreed)
                  {
                     _loc3_.x = -62;
                     _loc3_.y = -92;
                  }
                  else
                  {
                     _loc3_.x = -33;
                     _loc3_.y = -62;
                  }
                  _loc3_.hideProgressBar();
                  _loc3_.visible = this.targetCage.childCount > 0;
                  ToolTipSpriteManager.registerToolTip(_loc3_,TextResourceModule.getText("zoo.event.caravan.tooltip.inventorizeBabies").replace("%species%",TextIdHelper.getName(Categories.SPECIES,this.targetCage.speciesId)));
                  break;
               case ActionButton.UPGRADE_EXTRA_ACTON:
                  _loc3_.visible = this.targetCage.eventId != EventTypes.ANNIVERSARY_WHOLE_EVENT && TempGetterProxy.getIsGlobalEventRunning(EventTypes.ANNIVERSARY_WHOLE_EVENT);
                  if(_loc3_.visible == false)
                  {
                     _loc3_.visible = this.targetCage.eventId != EventTypes.BDAY2014_EVENT && TempGetterProxy.getIsGlobalEventRunning(EventTypes.BDAY2014_EVENT);
                  }
                  break;
               case ActionButton.UPGRADE_ACTON:
                  if(!Settings.TUTORIAL_ACTIVE)
                  {
                     _loc5_ = ConfigurationModule.getInstance().getCageData(this.targetCage.itemId);
                     _loc6_ = this.targetCage.eventId == -1;
                     _loc6_ = (_loc6_) && this.targetCage.healthTimeStamp > TimeManager.currentTime;
                     _loc6_ = (_loc6_) && this.targetCage.sickTimeStamp <= TimeManager.currentTime;
                     _loc6_ = (_loc6_) && _loc5_.baseLevel != MainConfig.MAX_CAGE_LEVEL;
                     _loc6_ = (_loc6_) && this.targetCage.level < MainConfig.MAX_CAGE_LEVEL;
                     _loc3_.visible = _loc6_;
                     if(this.targetCage.eventId != -1 || this.targetCage.level == MainConfig.MAX_CAGE_LEVEL)
                     {
                        _loc3_.hideProgressBar();
                        _loc3_.diactivateButton();
                        ColorHelper.applyColor(_loc3_.maincontainer,ColorHelper.GRAYSCALE_LIGHT);
                     }
                     else
                     {
                        ColorHelper.removeColor(_loc3_.maincontainer);
                        _loc3_.activateButton();
                        if(_loc3_.visible)
                        {
                           _loc7_ = ConfigurationModule.getInstance().getLevelUpCageConfig(this.targetCage.level + 1).petPowsCost;
                           _loc8_ = this.targetCage.level + 2 <= MainConfig.MAX_CAGE_LEVEL ? ConfigurationModule.getInstance().getLevelUpCageConfig(this.targetCage.level + 2).petPowsCost : -1;
                           _loc9_ = Math.min(_loc1_.petPaws / _loc7_,1) * 100;
                           _loc10_ = Math.min(Math.max((_loc1_.petPaws - _loc7_) / _loc8_,0),1) * 100;
                           _loc11_ = _loc8_ != -1 ? _loc10_ : 0;
                           _loc3_.showPercentage(_loc9_ + _loc11_);
                           _loc3_.showProgressBar();
                        }
                        else
                        {
                           _loc3_.hideProgressBar();
                        }
                     }
                  }
                  break;
            }
            _loc3_.setItemIndentifiers(this.targetCage.category,this.targetCage.uniqueId);
         }
      }
      
      private function handleSmileyClicked(param1:MouseEvent) : void
      {
         this.notifier.dispatchNoticeToRoot(new ActionMenuNotice(ActionMenuNotice.CLOSE_ACTION_MENU));
      }
      
      override public function close() : void
      {
         if(this.babyActionButtons)
         {
            ToolTipSpriteManager.unregisterToolTip(this.babyActionButtons);
         }
         TimeManager.unregisterTickFunction(this.updateCageActionMenu);
      }
      
      public function setOceanWorldIcons() : void
      {
         var _loc1_:int = 0;
         var _loc4_:ActionButton = null;
         var _loc2_:uint = this.buttonIds.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            for each(_loc4_ in this.cageActionButtons)
            {
               _loc1_ = this.buttonIds[_loc3_];
               if(_loc4_.actionId == _loc1_)
               {
                  _loc4_.setOceanWorldCageIcon(_loc1_);
               }
               if(_loc4_.actionId == ActionButton.SUPER_FEED_ACTON)
               {
                  _loc4_.setOceanWorldCageIcon(ActionButton.SUPER_FEED_ACTON);
               }
               if(_loc4_.actionId == ActionButton.POWER_FEED_ACTON)
               {
                  _loc4_.setOceanWorldCageIcon(ActionButton.POWER_FEED_ACTON);
               }
            }
            _loc3_++;
         }
      }
      
      public function setForrestZooIcons() : void
      {
         var _loc1_:int = 0;
         var _loc4_:ActionButton = null;
         var _loc2_:uint = this.buttonIds.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            for each(_loc4_ in this.cageActionButtons)
            {
               _loc1_ = this.buttonIds[_loc3_];
               if(_loc4_.actionId == _loc1_)
               {
                  _loc4_.setForrestCageIcon(_loc1_);
               }
               if(_loc4_.actionId == ActionButton.SUPER_FEED_ACTON)
               {
                  _loc4_.setForrestCageIcon(ActionButton.SUPER_FEED_ACTON);
               }
               if(_loc4_.actionId == ActionButton.POWER_FEED_ACTON)
               {
                  _loc4_.setForrestCageIcon(ActionButton.POWER_FEED_ACTON);
               }
            }
            _loc3_++;
         }
      }
   }
}

