package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.ColorHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantVO;
   import com.bigpoint.zoomumba.model.user.assistances.vo.AssistantsVO;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionMenuNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AssistanceActionMenu extends AbstractActionMenu
   {
      private var notifier:Notifier;
      
      private var assistanceBossPic:MovieClip;
      
      private var assistanceBossContainer:Sprite;
      
      private var centerPicButton:SimpleButton;
      
      private var mainAssistIsActive:Boolean = true;
      
      private var _assistButtons:Vector.<ActionButton> = new Vector.<ActionButton>();
      
      private var _assistDiactiveButtons:Vector.<ActionButton> = new Vector.<ActionButton>();
      
      private var _superFoodButtons:Vector.<ActionButton> = new Vector.<ActionButton>(2,true);
      
      private var _assitIds:Vector.<int> = Vector.<int>([AssistantsVO.CUDDLE_ASSIST,AssistantsVO.FEED_ASSIST,AssistantsVO.WATER_ASSIST,AssistantsVO.CLEAN_ASSIST,AssistantsVO.TRASH_ASSIST,AssistantsVO.CASH_ASSIST,AssistantsVO.HEAL_ASSIST]);
      
      private var _assistTips:Vector.<String> = Vector.<String>(["zoo.tooltip.popup.assistance.4","zoo.tooltip.popup.assistance.1","zoo.tooltip.popup.assistance.2","zoo.tooltip.popup.assistance.3","zoo.tooltip.popup.assistance.5","zoo.tooltip.popup.assistance.6","zoo.tooltip.popup.assistance.7"]);
      
      private var _assitOceanIds:Vector.<int> = Vector.<int>([AssistantsVO.OCEAN_CUDDLE_ASSIST,AssistantsVO.OCEAN_FEED_ASSIST,AssistantsVO.OCEAN_WATER_ASSIST,AssistantsVO.OCEAN_CLEAN_ASSIST,AssistantsVO.TRASH_ASSIST,AssistantsVO.CASH_ASSIST,AssistantsVO.HEAL_ASSIST]);
      
      private var _assistOceanTips:Vector.<String> = Vector.<String>(["zoo.tooltip.popup.assistance.11","zoo.tooltip.popup.assistance.8","zoo.tooltip.popup.assistance.9","zoo.tooltip.popup.assistance.10","zoo.tooltip.popup.assistance.5","zoo.tooltip.popup.assistance.6","zoo.tooltip.popup.assistance.7"]);
      
      private var _buttonIds:Vector.<int> = Vector.<int>([ActionButton.CUDDLE_ASSIST_ACTON,ActionButton.FEED_ASSIST_ACTON,ActionButton.WATER_ASSIST_ACTON,ActionButton.CLEAN_ASSIST_ACTON,ActionButton.TRASH_ASSIST_ACTON,ActionButton.CASH_ASSIST_ACTON,ActionButton.HEAL_ASSIST_ACTON]);
      
      private var _buttonDiactiveIds:Vector.<int> = Vector.<int>([ActionButton.CUDDLE_ASSIST_ACTON_DIACTIVE,ActionButton.FEED_ASSIST_ACTON_DIACTIVE,ActionButton.WATER_ASSIST_ACTON_DIACTIVE,ActionButton.CLEAN_ASSIST_ACTON_DIACTIVE,ActionButton.TRASH_ASSIST_ACTON_DIACTIVE,ActionButton.CASH_ASSIST_ACTON_DIACTIVE,ActionButton.HEAL_ASSIST_ACTON_DIACTIVE]);
      
      private var _buttonOceanIds:Vector.<int> = Vector.<int>([ActionButton.CUDDLE_OCEAN_ASSIST_ACTON,ActionButton.FEED_OCEAN_ASSIST_ACTON,ActionButton.WATER_OCEAN_ASSIST_ACTON,ActionButton.CLEAN_OCEAN_ASSIST_ACTON,ActionButton.TRASH_ASSIST_ACTON,ActionButton.CASH_ASSIST_ACTON,ActionButton.HEAL_ASSIST_ACTON]);
      
      private var _buttonOceanDeactiveIds:Vector.<int> = Vector.<int>([ActionButton.CUDDLE_OCEAN_ASSIST_ACTON_DEACTIVE,ActionButton.FEED_OCEAN_ASSIST_ACTON_DEACTIVE,ActionButton.WATER_OCEAN_ASSIST_ACTON_DEACTIVE,ActionButton.CLEAN_OCEAN_ASSIST_ACTON_DEACTIVE,ActionButton.TRASH_ASSIST_ACTON_DIACTIVE,ActionButton.CASH_ASSIST_ACTON_DIACTIVE,ActionButton.HEAL_ASSIST_ACTON_DIACTIVE]);
      
      private var buttonPositions:Vector.<Array> = Vector.<Array>([[70,35],[-67,-3],[-40,48],[18,59],[-32,-59],[26,-67],[66,-25]]);
      
      private var _isOceanWorld:Boolean = false;
      
      private var mainIsActive:Boolean = true;
      
      public function AssistanceActionMenu(param1:Notifier)
      {
         super();
         this._menuType = ActionMenuTypes.MENU_TYPE_ASSISTANCES;
         this.notifier = new Notifier(param1);
         this.assistanceBossContainer = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BIG_ACTION_BUTTON);
         this.assistanceBossPic = AssetLibrary.getMovieClip(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_ASSIST_CENTERPIC);
         this.assistanceBossPic.gotoAndStop("out");
         this.assistanceBossContainer.addChild(this.assistanceBossPic);
         this.assistanceBossContainer.mouseChildren = this.assistanceBossContainer.mouseEnabled = false;
         this.addChild(this.assistanceBossContainer);
         this.centerPicButton = AssetLibrary.getButton(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BUTTON);
         this.centerPicButton.addEventListener(MouseEvent.CLICK,this.handleCenterPicClicked);
         this.centerPicButton.addEventListener(MouseEvent.MOUSE_OVER,this.handleMouseOverCenterPic);
         this.centerPicButton.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOutCenterPic);
         this.centerPicButton.scaleX = this.centerPicButton.scaleY = 1.5;
         this.centerPicButton.useHandCursor = true;
         this.addChild(this.centerPicButton);
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
      
      private function createCircularMenu(param1:Array, param2:Array) : void
      {
         var _loc8_:ActionButton = null;
         var _loc9_:ActionButton = null;
         var _loc10_:ActionButton = null;
         var _loc3_:Vector.<int> = param1[0];
         var _loc4_:Vector.<int> = param1[1];
         var _loc5_:Vector.<int> = param2[0];
         var _loc6_:Vector.<String> = param2[1];
         var _loc7_:uint = _loc5_.length;
         var _loc11_:int = 0;
         while(_loc11_ < _loc7_)
         {
            _loc8_ = new ActionButton(this.notifier,this,this._menuType,_loc3_[_loc11_]);
            this._assistButtons.push(_loc8_);
            _loc8_.visible = false;
            _loc8_.toolTipTextData = _loc6_[_loc11_];
            _loc9_ = new ActionButton(this.notifier,this,this._menuType,_loc4_[_loc11_]);
            this._assistDiactiveButtons.push(_loc9_);
            _loc9_.hideProgressBar();
            _loc9_.x = _loc8_.x = this.buttonPositions[_loc11_][0];
            _loc9_.y = _loc8_.y = this.buttonPositions[_loc11_][1];
            if(_loc8_.y < 10 && _loc8_.y > -10)
            {
               this.swapChildren(_loc8_,this.assistanceBossContainer);
               this.swapChildren(_loc9_,this.centerPicButton);
            }
            switch(_loc5_[_loc11_])
            {
               case AssistantsVO.FEED_ASSIST:
                  _loc10_ = new ActionButton(this.notifier,_loc8_.subButtonContainer,this._menuType,ActionButton.SUPER_FEED_ASSIST_ACTON,true);
                  _loc10_.x = -35;
                  _loc10_.y = 35;
                  _loc10_.toolTipTextData = "zoo.tooltip.popup.assistance.1s";
                  this._superFoodButtons[0] = _loc10_;
                  _loc10_ = new ActionButton(this.notifier,_loc8_.subButtonContainer,this._menuType,ActionButton.POWER_FEED_ASSIST_ACTON,true);
                  _loc10_.x = -35;
                  _loc10_.y = -30;
                  _loc10_.toolTipTextData = "zoo.tooltip.popup.assistance.1p";
                  this._superFoodButtons[1] = _loc10_;
                  break;
               case AssistantsVO.OCEAN_FEED_ASSIST:
                  _loc10_ = new ActionButton(this.notifier,_loc8_.subButtonContainer,this._menuType,ActionButton.SUPER_FEED_OCEAN_ASSIST_ACTON,true);
                  _loc10_.x = -35;
                  _loc10_.y = 35;
                  _loc10_.toolTipTextData = "zoo.tooltip.popup.assistance.1s";
                  this._superFoodButtons[0] = _loc10_;
                  _loc10_ = new ActionButton(this.notifier,_loc8_.subButtonContainer,this._menuType,ActionButton.POWER_FEED_OCEAN_ASSIST_ACTON,true);
                  _loc10_.x = -35;
                  _loc10_.y = -30;
                  _loc10_.toolTipTextData = "zoo.tooltip.popup.assistance.1p";
                  this._superFoodButtons[1] = _loc10_;
                  break;
               case AssistantsVO.HEAL_ASSIST:
                  _loc10_ = new ActionButton(this.notifier,_loc8_.subButtonContainer,this._menuType,ActionButton.SUPER_HEAL_ASSIST_ACTON,true);
                  _loc10_.x = 44;
                  _loc10_.y = -15;
                  _loc10_.toolTipTextData = "zoo.tooltip.popup.assistance.7a";
            }
            if(_loc11_ == 4)
            {
               _loc8_.toolTipTextData = "zoo.tooltip.popup.assistance.5";
            }
            if(_loc11_ == 5)
            {
               _loc8_.toolTipTextData = "zoo.tooltip.popup.assistance.6";
            }
            if(_loc11_ == 6)
            {
               _loc8_.toolTipTextData = "zoo.tooltip.popup.assistance.7";
            }
            _loc11_++;
         }
      }
      
      private function handleMouseOverCenterPic(param1:MouseEvent) : void
      {
         if(this.mainAssistIsActive)
         {
            this.assistanceBossPic.gotoAndStop("over");
         }
         TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText("zoo.tooltip.popup.assistance.0"));
      }
      
      private function handleMouseOutCenterPic(param1:MouseEvent) : void
      {
         this.assistanceBossPic.gotoAndStop("out");
         TooltipNewManager.removeToolTip();
      }
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
         TimeManager.registerTickFunction(this.updateAssistActionMenu);
         this.updateAssistActionMenu();
      }
      
      private function updateAssistActionMenu() : void
      {
         var _loc1_:Vector.<int> = null;
         var _loc3_:AssistancesProxy = null;
         var _loc4_:AssistantVO = null;
         if(this._isOceanWorld)
         {
            _loc1_ = this._assitOceanIds;
         }
         else
         {
            _loc1_ = this._assitIds;
         }
         this.mainIsActive = true;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = TempGetterProxy.getAssistantsProxy();
            _loc4_ = _loc3_.getAssistantData(_loc1_[_loc2_]);
            this._assistButtons[_loc2_].hideProgressBar();
            if(_loc4_.endTimeStamp > TimeManager.currentTime)
            {
               this._assistButtons[_loc2_].visible = true;
               this._assistDiactiveButtons[_loc2_].visible = false;
            }
            else
            {
               this._assistButtons[_loc2_].visible = false;
               this._assistDiactiveButtons[_loc2_].visible = true;
            }
            if(_loc4_.assistId != AssistantsVO.HEAL_ASSIST)
            {
               this.mainIsActive = this.mainIsActive && this._assistButtons[_loc2_].visible;
            }
            _loc2_++;
         }
         if(this.mainAssistIsActive != this.mainIsActive)
         {
            if(!this.mainIsActive)
            {
               ColorHelper.applyColor(this.assistanceBossPic,ColorHelper.GRAYSCALE);
            }
            else
            {
               ColorHelper.removeColor(this.assistanceBossPic);
            }
            this.mainAssistIsActive = this.mainIsActive;
         }
      }
      
      private function handleCenterPicClicked(param1:MouseEvent) : void
      {
         if(this.mainIsActive)
         {
            this.notifier.dispatchNotice(new ActionMenuNotice(ActionMenuNotice.EXECUTE_ALL_ACTIONS,1));
         }
         else
         {
            TempGetterProxy.getFacade().sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.ASSISTANTS);
         }
      }
      
      override public function close() : void
      {
         TimeManager.unregisterTickFunction(this.updateAssistActionMenu);
      }
      
      public function setOceanWorldIcon() : void
      {
         this._isOceanWorld = true;
         this.removeAllAssistantButtons();
         this.createCircularMenu([this._buttonOceanIds,this._buttonOceanDeactiveIds],[this._assitOceanIds,this._assistOceanTips]);
      }
      
      public function setForestZooButtons() : void
      {
         this._isOceanWorld = false;
         this.removeAllAssistantButtons();
         this.createCircularMenu([this._buttonIds,this._buttonDiactiveIds],[this._assitIds,this._assistTips]);
      }
      
      private function removeAllAssistantButtons() : void
      {
         var _loc1_:int = int(this._assistButtons.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            this.removeChild(this._assistButtons[_loc2_]);
            _loc2_++;
         }
         _loc1_ = int(this._assistDiactiveButtons.length);
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.removeChild(this._assistDiactiveButtons[_loc2_]);
            _loc2_++;
         }
         this._assistButtons = new Vector.<ActionButton>();
         this._assistDiactiveButtons = new Vector.<ActionButton>();
         this._superFoodButtons = new Vector.<ActionButton>(2,true);
      }
   }
}

