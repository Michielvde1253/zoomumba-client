package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import com.bigpoint.zoorama.view.field.items.Special;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class ForgottenGateActionMenu extends AbstractActionMenu
   {
      public static const STORE_MENU_ZOOM_Y_OFFSETS:Vector.<int> = Vector.<int>([40,70,150]);
      
      private var notifier:Notifier;
      
      private var targetSpecial:Special;
      
      private var storeProgressActionButton:ActionButton;
      
      private var zooCircularBackground:Sprite;
      
      private var gateCenterPic:Sprite;
      
      private var backToMainZooAction:ActionButton;
      
      private var safariActionButton:ActionButton;
      
      private var zooWheelActionButton:ActionButton;
      
      private var avatarActionButton:ActionButton;
      
      public function ForgottenGateActionMenu(param1:Notifier)
      {
         super();
         _menuType = ActionMenuTypes.MENU_TYPE_GATE_FORGOTTEN;
         this.notifier = new Notifier(param1);
         this.avatarActionButton = new ActionButton(this.notifier,this,this._menuType,ActionButton.AVATAR_CREATOR_ACTION);
         this.avatarActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.avatar";
         this.avatarActionButton.x = 35;
         this.avatarActionButton.y -= 59;
         addChild(this.avatarActionButton);
         this.zooCircularBackground = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BIG_ACTION_BUTTON);
         this.zooCircularBackground.mouseChildren = this.zooCircularBackground.mouseEnabled = false;
         addChild(this.zooCircularBackground);
         this.gateCenterPic = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FORGOTTEN_GATE_CENTERPIC);
         this.gateCenterPic.mouseChildren = this.gateCenterPic.mouseEnabled = false;
         this.zooCircularBackground.addChild(this.gateCenterPic);
         this.storeProgressActionButton = new ActionButton(this.notifier,this,_menuType,ActionButton.GATE_COLLECT_ACTION);
         this.storeProgressActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.ForgottenZoo.PetPenny";
         this.storeProgressActionButton.x -= 35;
         this.storeProgressActionButton.y += 59;
         this.addChild(this.storeProgressActionButton);
         this.safariActionButton = new ActionButton(this.notifier,this,this._menuType,ActionButton.SAFARI_MINI_GAME_ACTION);
         this.safariActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.Safari";
         this.safariActionButton.x += 35;
         this.safariActionButton.y += 59;
         addChild(this.safariActionButton);
         this.zooWheelActionButton = new ActionButton(this.notifier,this,this._menuType,ActionButton.ZOO_WHEEL_ACTION);
         this.zooWheelActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.ForgottenZoo";
         this.zooWheelActionButton.x += 68;
         this.zooWheelActionButton.y += 5;
         addChild(this.zooWheelActionButton);
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
      
      override public function setTargetItem(param1:ItemAbstract) : void
      {
         this.targetSpecial = param1 as Special;
         this.storeProgressActionButton.setItemIndentifiers(this.targetSpecial.category,this.targetSpecial.uniqueId);
         var _loc2_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         if(_loc2_.userLevel >= MainConfig.SAFARI_ENABLED_LEVEL)
         {
            this.safariActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.Safari";
            this.safariActionButton.activateButton();
            this.safariActionButton.removeGrayOut();
         }
         else
         {
            if(!Settings.TUTORIAL_ACTIVE)
            {
               this.safariActionButton.toolTipTextData = "zoo.safari.tooltip.cantStartSafari";
            }
            this.safariActionButton.diactivateButton();
            this.safariActionButton.grayOut();
         }
         this.updateGateActionMenu();
      }
      
      override public function close() : void
      {
         this.targetSpecial.showCollectAnimation();
      }
      
      public function updateGateActionMenu() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc2_:Number = this.targetSpecial.entranceFee;
         var _loc3_:UserProxy = Facade.getInstance().getProxy(UserProxy);
         if(_loc3_.userLevel >= MainConfig.FORTUNE_WHEEL_ENABLED_LEVEL)
         {
            this.zooWheelActionButton.activateButton();
            this.zooWheelActionButton.removeGrayOut();
            this.zooWheelActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.ZooWheel";
         }
         else
         {
            this.zooWheelActionButton.diactivateButton();
            this.zooWheelActionButton.grayOut();
            this.zooWheelActionButton.toolTipTextData = "zoo.tooltip.mainBuildingUI.InactiveZooWheel";
         }
         if(_loc2_ >= MainConfig.COLECTABLE_ENTRANCE_FEE_AMMOUNT)
         {
            _loc4_ = MainConfig.COLECTABLE_ENTRANCE_FEE_CAP_MIN + MainConfig.COLECTABLE_ENTRANCE_FEE_CAP_BY_LEVEL * _loc3_.userLevel;
            _loc5_ = _loc4_ - MainConfig.COLECTABLE_ENTRANCE_FEE_AMMOUNT;
            _loc6_ = Math.max(0,(_loc2_ - MainConfig.COLECTABLE_ENTRANCE_FEE_AMMOUNT) / _loc5_);
            _loc1_ = 100 + _loc6_ * 100;
            this.storeProgressActionButton.showPercentage(Math.min(_loc1_,_loc4_));
            this.storeProgressActionButton.activateButton();
         }
         else
         {
            _loc1_ = Math.floor(_loc2_ / MainConfig.COLECTABLE_ENTRANCE_FEE_AMMOUNT * 100);
            this.storeProgressActionButton.showPercentage(_loc1_);
            this.storeProgressActionButton.diactivateButton();
         }
      }
   }
}

