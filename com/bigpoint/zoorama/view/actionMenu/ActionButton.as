package com.bigpoint.zoorama.view.actionMenu
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.notices.view.actionMenu.ActionNotice;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.Tooltip;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ActionButton extends Sprite
   {
      private static var ACTION_COUNT:int = 0;
      
      public static const FEED_ACTON:int = ACTION_COUNT++;
      
      public static const WATER_ACTON:int = ACTION_COUNT++;
      
      public static const CLEAN_ACTON:int = ACTION_COUNT++;
      
      public static const CUDDLE_ACTON:int = ACTION_COUNT++;
      
      public static const MEDICINE_ACTON:int = ACTION_COUNT++;
      
      public static const BREED_ACTON:int = ACTION_COUNT++;
      
      public static const SUPER_FEED_ACTON:int = ACTION_COUNT++;
      
      public static const POWER_FEED_ACTON:int = ACTION_COUNT++;
      
      public static const SUPER_MEDICINE_ACTON:int = ACTION_COUNT++;
      
      public static const UPGRADE_ACTON:int = ACTION_COUNT++;
      
      public static const UPGRADE_EXTRA_ACTON:int = ACTION_COUNT++;
      
      public static const BABY_TO_INV_ACTON:int = ACTION_COUNT++;
      
      public static const BUILD_ACTON:int = ACTION_COUNT++;
      
      public static const CLEAN_TRASH_ACTON:int = ACTION_COUNT++;
      
      public static const FEED_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const SUPER_FEED_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const POWER_FEED_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const WATER_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const CLEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const CUDDLE_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const TRASH_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const CASH_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const HEAL_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const SUPER_HEAL_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const FEED_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const SUPER_FEED_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const POWER_FEED_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const WATER_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const CLEAN_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const CUDDLE_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const TRASH_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const CASH_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const HEAL_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      public static const SUPER_HEAL_ASSIST_ACTON_DIACTIVE:int = ACTION_COUNT++;
      
      private static var BUTTON_RADIUS:int = ACTION_COUNT++;
      
      public static const MAIL_ACTION:int = ACTION_COUNT++;
      
      public static const PRIZE_ACTION:int = ACTION_COUNT++;
      
      public static const BONUS_CODE_ACTION:int = ACTION_COUNT++;
      
      public static const NEWS_ACTION:int = ACTION_COUNT++;
      
      public static const INVITE_ACTION:int = ACTION_COUNT++;
      
      public static const PET_PENNY_PROGRESS_ACTION:int = ACTION_COUNT++;
      
      public static const ZOO_DOLLAR_PROGRESS_ACTION:int = ACTION_COUNT++;
      
      public static const GATE_COLLECT_ACTION:int = ACTION_COUNT++;
      
      public static const OCEAN_WORLD_ACTION:int = ACTION_COUNT++;
      
      public static const SAFARI_MINI_GAME_ACTION:int = ACTION_COUNT++;
      
      public static const FORGOTTEN_ZOO_ACTION:int = ACTION_COUNT++;
      
      public static const ZOO_WHEEL_ACTION:int = ACTION_COUNT++;
      
      public static const BACK_TO_MAIN_ACTION:int = ACTION_COUNT++;
      
      public static const MAIN_BUILDING_SELECTION_ACTION:int = ACTION_COUNT++;
      
      public static const AVATAR_CREATOR_ACTION:int = ACTION_COUNT++;
      
      public static const FEED_OCEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const WATER_OCEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const CLEAN_OCEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const CUDDLE_OCEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const SUPER_FEED_OCEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const POWER_FEED_OCEAN_ASSIST_ACTON:int = ACTION_COUNT++;
      
      public static const FEED_OCEAN_ASSIST_ACTON_DEACTIVE:int = ACTION_COUNT++;
      
      public static const WATER_OCEAN_ASSIST_ACTON_DEACTIVE:int = ACTION_COUNT++;
      
      public static const CLEAN_OCEAN_ASSIST_ACTON_DEACTIVE:int = ACTION_COUNT++;
      
      public static const CUDDLE_OCEAN_ASSIST_ACTON_DEACTIVE:int = ACTION_COUNT++;
      
      public static const SUPER_FEED_OCEAN_ASSIST_ACTON_DEACTIVE:int = ACTION_COUNT++;
      
      public static const POWER_FEED_OCEAN_ASSIST_ACTON_DEACTIVE:int = ACTION_COUNT++;
      
      private var skin:Sprite;
      
      private var perscentageBar:MovieClip;
      
      private var _menuType:int;
      
      private var _actionId:int;
      
      private var icon_out:Sprite;
      
      private var icon_over:Sprite;
      
      private var babyIcon_out:Sprite;
      
      private var babyIcon_over:Sprite;
      
      private var buttonBG:SimpleButton;
      
      private var notifier:Notifier;
      
      private var itemCategory:int = -1;
      
      private var itemUniqueId:int = -1;
      
      private var isSuperButton:Boolean = false;
      
      private var isActivated:Boolean = true;
      
      private var deactivateAfterAction:Boolean = false;
      
      public var maincontainer:Sprite;
      
      public var subButtonContainer:Sprite;
      
      private var showBabyIcon:Boolean = false;
      
      private var soundName:String;
      
      private var toolText:String;
      
      private var _tooltip:Tooltip;
      
      public function ActionButton(param1:Notifier, param2:Sprite, param3:int, param4:int, param5:Boolean = false, param6:String = null)
      {
         super();
         this.notifier = new Notifier(param1);
         this.isSuperButton = param5;
         this.soundName = param6;
         this.mouseEnabled = false;
         this.subButtonContainer = new Sprite();
         this.subButtonContainer.mouseEnabled = false;
         this.addChild(this.subButtonContainer);
         this.maincontainer = new Sprite();
         this.maincontainer.mouseEnabled = false;
         this.addChild(this.maincontainer);
         if(param5)
         {
            this.skin = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_BUTTON);
         }
         else
         {
            this.skin = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CAGE_BUTTON);
            this.perscentageBar = this.skin["percentageRemaining_mc"] as MovieClip;
            this.perscentageBar.mouseChildren = false;
            this.perscentageBar.mouseEnabled = false;
         }
         this.skin.mouseEnabled = false;
         this.maincontainer.addChild(this.skin);
         param2.addChild(this);
         this._menuType = param3;
         this._actionId = param4;
         this.buttonBG = this.skin[AssetConfig.ACTION_MENU_BUTTON_BG];
         this.buttonBG.addEventListener(MouseEvent.CLICK,this.handleButtonClick);
         this.buttonBG.addEventListener(MouseEvent.MOUSE_OVER,this.handleButtonMouseOver);
         this.buttonBG.addEventListener(MouseEvent.MOUSE_OUT,this.handleButtonMouseOut);
         this.showPercentage(0);
         switch(this._actionId)
         {
            case BABY_TO_INV_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BABY_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BABY_OVER);
               break;
            case UPGRADE_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_UPGRADE_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_UPGRADE_OVER);
               break;
            case WATER_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_WATER_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_WATER_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_DRINK;
               break;
            case FEED_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FEED_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_FEED;
               break;
            case SUPER_FEED_ACTON:
            case SUPER_FEED_ASSIST_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_FEED_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_FEED;
               break;
            case POWER_FEED_ACTON:
            case POWER_FEED_ASSIST_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_POWER_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_POWER_FEED_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_FEED;
               break;
            case CLEAN_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_CLEAN;
               break;
            case CUDDLE_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_CUDDLE;
               break;
            case MEDICINE_ACTON:
               this.deactivateAfterAction = true;
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CURE_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CURE_OVER);
               this.hideProgressBar();
               this.soundName = SoundEffectNames.SND_ACTIONMENU_HEAL;
               break;
            case UPGRADE_EXTRA_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_UPGRADE_EXTRA_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_UPGRADE_EXTRA_OVER);
               break;
            case SUPER_HEAL_ASSIST_ACTON:
            case SUPER_MEDICINE_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_CURE_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_CURE_OVER);
               this.soundName = SoundEffectNames.SND_ACTIONMENU_HEAL;
               break;
            case BREED_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BREED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BREED_OVER);
               this.babyIcon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BREED_READY_OUT);
               this.babyIcon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BREED_READY_OVER);
               this.babyIcon_out.mouseEnabled = false;
               this.babyIcon_over.mouseEnabled = false;
               this.babyIcon_out.mouseChildren = false;
               this.babyIcon_over.mouseChildren = false;
               this.hideProgressBar();
               this.soundName = SoundEffectNames.SND_ACTIONMENU_MAKEBABY;
               break;
            case BUILD_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BUILD_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BUILD_OVER);
               break;
            case CLEAN_TRASH_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_TRASH_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_TRASH_OVER);
               this.hideProgressBar();
               break;
            case FEED_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FEED_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FEED_ASSIST_OVER);
               break;
            case WATER_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_WATER_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_WATER_ASSIST_OVER);
               break;
            case CLEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_ASSIST_OVER);
               break;
            case CUDDLE_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_ASSIST_OVER);
               break;
            case HEAL_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_HEAL_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_HEAL_ASSIST_OVER);
               break;
            case HEAL_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_HEAL_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_HEAL_ASSIST_DISSABLED);
               break;
            case TRASH_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_TRASH_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_TRASH_ASSIST_OVER);
               break;
            case CASH_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CASH_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CASH_ASSIST_OVER);
               break;
            case FEED_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FEED_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_FEED_ASSIST_DISSABLED);
               break;
            case WATER_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_WATER_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_WATER_ASSIST_DISSABLED);
               break;
            case CLEAN_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_ASSIST_DISSABLED);
               break;
            case CUDDLE_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_ASSIST_DISSABLED);
               break;
            case ZOO_DOLLAR_PROGRESS_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_ZDOLLAR_PROGRESS_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_ZDOLLAR_PROGRESS_OVER);
               break;
            case PET_PENNY_PROGRESS_ACTION:
            case GATE_COLLECT_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_PENNY_PROGRESS_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_PENNY_PROGRESS_OVER);
               break;
            case MAIL_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_COMMUNITY_MAIL);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_COMMUNITY_MAIL_OVER);
               break;
            case PRIZE_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_COMMUNITY_PRIZE);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_COMMUNITY_PRIZE_OVER);
               break;
            case BONUS_CODE_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BONUS_CODE_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_BONUS_CODE_OVER);
               break;
            case NEWS_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_NEWS_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_NEWS_OVER);
               break;
            case INVITE_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_INVITE_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_INVITE_OVER);
               break;
            case TRASH_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_TRASH_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_TRASH_ASSIST_DISSABLED);
               break;
            case CASH_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CASH_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CASH_ASSIST_DISSABLED);
               break;
            case SUPER_FEED_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_FEED_OUT);
               break;
            case POWER_FEED_ASSIST_ACTON_DIACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_POWER_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_POWER_FEED_OUT);
               break;
            case OCEAN_WORLD_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_WORLD_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_WORLD_OVER);
               break;
            case SAFARI_MINI_GAME_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SAFARI_JEEP_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SAFARI_JEEP_OVER);
               this.hideProgressBar();
               break;
            case ZOO_WHEEL_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_ZOO_WHEEL_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_ZOO_WHEEL_OVER);
               this.hideProgressBar();
               break;
            case FORGOTTEN_ZOO_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_FORGOTTEN_ZOO_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_FORGOTTEN_ZOO_OVER);
               this.hideProgressBar();
               break;
            case BACK_TO_MAIN_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.BACK_TO_MAIN_ZOO_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.BACK_TO_MAIN_ZOO_OVER);
               this.hideProgressBar();
               break;
            case MAIN_BUILDING_SELECTION_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_MAIN_BUILDING_SELECTION_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_MAIN_BUILDING_SELECTION_OVER);
               this.hideProgressBar();
               break;
            case AVATAR_CREATOR_ACTION:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.AVATAR_MENU_MAIN_BUILDING_SELECTION_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.AVATAR_MENU_MAIN_BUILDING_SELECTION_OVER);
               this.hideProgressBar();
               break;
            case ActionButton.CUDDLE_OCEAN_ASSIST_ACTON_DEACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CUDDLE_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CUDDLE_ASSIST_DISSABLED);
               break;
            case ActionButton.CLEAN_OCEAN_ASSIST_ACTON_DEACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CLEAN_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CLEAN_ASSIST_DISSABLED);
               break;
            case ActionButton.WATER_OCEAN_ASSIST_ACTON_DEACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_WATER_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_WATER_ASSIST_DISSABLED);
               break;
            case ActionButton.FEED_OCEAN_ASSIST_ACTON_DEACTIVE:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_FEED_ASSIST_DISSABLED);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_FEED_ASSIST_DISSABLED);
               break;
            case ActionButton.CUDDLE_OCEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CUDDLE_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CUDDLE_ASSIST_OVER);
               break;
            case ActionButton.CLEAN_OCEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CLEAN_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CLEAN_ASSIST_OVER);
               break;
            case ActionButton.WATER_OCEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_WATER_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_WATER_ASSIST_OVER);
               break;
            case ActionButton.FEED_OCEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_FEED_ASSIST_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_FEED_ASSIST_OVER);
               break;
            case ActionButton.SUPER_FEED_OCEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_SUPER_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_SUPER_FEED_OVER);
               break;
            case ActionButton.POWER_FEED_OCEAN_ASSIST_ACTON:
               this.icon_out = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_POWER_FEED_OUT);
               this.icon_over = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_POWER_FEED_OVER);
         }
         this.skin.addChild(this.icon_out);
         this.icon_out.mouseEnabled = this.icon_out.mouseChildren = false;
         this.skin.addChild(this.icon_over);
         this.icon_over.mouseEnabled = this.icon_over.mouseChildren = false;
         this.icon_over.visible = false;
         if(this.babyIcon_out)
         {
            this.skin.addChild(this.babyIcon_out);
            this.skin.addChild(this.babyIcon_over);
            this.showBabyOnTheWay();
         }
         if(!param5)
         {
            this.skin.setChildIndex(this.perscentageBar,this.skin.numChildren - 1);
         }
      }
      
      public function grayOut() : void
      {
         TweenLite.to(this.icon_out,0,{"colorMatrixFilter":{
            "colorize":16777215,
            "amount":1
         }});
         TweenLite.to(this.icon_over,0,{"colorMatrixFilter":{
            "colorize":16777215,
            "amount":1
         }});
      }
      
      public function removeGrayOut() : void
      {
         TweenLite.to(this.icon_out,0,{"colorMatrixFilter":{
            "colorize":16777215,
            "amount":0
         }});
         TweenLite.to(this.icon_over,0,{"colorMatrixFilter":{
            "colorize":16777215,
            "amount":0
         }});
      }
      
      public function setItemIndentifiers(param1:int, param2:int) : void
      {
         this.itemCategory = param1;
         this.itemUniqueId = param2;
      }
      
      private function handleButtonClick(param1:MouseEvent) : void
      {
         if(this.isActivated)
         {
            if(this.deactivateAfterAction)
            {
               this.isActivated = false;
            }
            this.notifier.dispatchNotice(new ActionNotice(ActionNotice.ACTION_MENU_BUTTON_CLICK,this._menuType,this._actionId,this.itemCategory,this.itemUniqueId,this.soundName));
         }
      }
      
      private function handleButtonMouseOver(param1:MouseEvent) : void
      {
         if(this.isActivated)
         {
            if(this.showBabyIcon)
            {
               this.babyIcon_out.visible = false;
               this.babyIcon_over.visible = true;
               this.icon_out.visible = this.icon_over.visible = false;
            }
            else
            {
               this.icon_out.visible = false;
               this.icon_over.visible = true;
               this.icon_over.mouseChildren = this.icon_over.mouseEnabled = false;
            }
         }
         if(this.toolText != null)
         {
            TooltipNewManager.setToolTip(param1.target as DisplayObject,TextResourceModule.getText(this.toolText));
         }
      }
      
      private function handleButtonMouseOut(param1:MouseEvent) : void
      {
         if(this.isActivated)
         {
            if(this.showBabyIcon)
            {
               this.babyIcon_out.visible = true;
               this.babyIcon_over.visible = false;
               this.icon_out.visible = this.icon_over.visible = false;
            }
            else
            {
               this.icon_out.visible = true;
               this.icon_over.visible = false;
               this.icon_out.mouseChildren = this.icon_out.mouseEnabled = false;
            }
         }
         if(this.toolText != null)
         {
            TooltipNewManager.removeToolTip();
         }
      }
      
      public function showPercentage(param1:int) : void
      {
         if(!this.isSuperButton)
         {
            this.perscentageBar.gotoAndStop(param1 + 1);
         }
      }
      
      public function showBabyOnTheWay() : void
      {
         if(this.babyIcon_out)
         {
            this.babyIcon_out.visible = false;
            this.babyIcon_over.visible = false;
            if(!this.icon_over.visible)
            {
               this.icon_out.visible = true;
            }
            this.showBabyIcon = false;
         }
      }
      
      public function showBabyIsReady() : void
      {
         if(this.babyIcon_out)
         {
            if(this.icon_out.visible)
            {
               this.babyIcon_out.visible = true;
               this.icon_out.visible = false;
            }
            if(this.icon_over.visible)
            {
               this.babyIcon_over.visible = true;
               this.icon_over.visible = false;
            }
            this.showBabyIcon = true;
         }
      }
      
      public function activateButton() : void
      {
         this.isActivated = true;
         this.checkColisionWithButton();
      }
      
      private function checkColisionWithButton() : void
      {
         if(this.mouseX * this.mouseX + this.mouseY * this.mouseY < BUTTON_RADIUS * BUTTON_RADIUS)
         {
            this.icon_out.visible = false;
            this.icon_over.visible = true;
         }
         else
         {
            this.icon_out.visible = true;
            this.icon_over.visible = false;
         }
      }
      
      public function diactivateButton() : void
      {
         this.isActivated = false;
      }
      
      public function showProgressBar() : void
      {
         this.perscentageBar.visible = true;
      }
      
      public function hideProgressBar() : void
      {
         this.perscentageBar.visible = false;
      }
      
      public function set sound(param1:String) : void
      {
         this.soundName = param1;
      }
      
      public function showFromeWithName(param1:String) : void
      {
         (this.icon_out as MovieClip).gotoAndStop(param1);
         (this.icon_over as MovieClip).gotoAndStop(param1);
      }
      
      public function get menuType() : int
      {
         return this._menuType;
      }
      
      public function get actionId() : int
      {
         return this._actionId;
      }
      
      public function set tooltip(param1:Tooltip) : void
      {
         this._tooltip = param1;
         this._tooltip.target = this;
      }
      
      public function get tooltip() : Tooltip
      {
         return this._tooltip;
      }
      
      public function set toolTipTextData(param1:String) : void
      {
         this.toolText = param1;
      }
      
      public function get _itemUniqueId() : int
      {
         return this.itemUniqueId;
      }
      
      public function setOceanWorldCageIcon(param1:int) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         switch(param1)
         {
            case ActionButton.CUDDLE_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CUDDLE_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CUDDLE_OVER);
               break;
            case ActionButton.CLEAN_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CLEAN_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_CLEAN_OVER);
               break;
            case ActionButton.SUPER_FEED_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_SUPER_FEED_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_SUPER_FEED_OVER);
               break;
            case ActionButton.POWER_FEED_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_POWER_FEED_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_POWER_FEED_OVER);
               break;
            case ActionButton.UPGRADE_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_UPGRADE_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_OCEAN_UPGRADE_OVER);
               break;
            default:
               return;
         }
         this.setNewIcons(_loc2_,_loc3_);
      }
      
      public function setForrestCageIcon(param1:int) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         switch(param1)
         {
            case ActionButton.CUDDLE_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CUDDLE_OVER);
               break;
            case ActionButton.CLEAN_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_CLEAN_OVER);
               break;
            case ActionButton.SUPER_FEED_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_FEED_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_SUPER_FEED_OVER);
               break;
            case ActionButton.POWER_FEED_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_POWER_FEED_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_POWER_FEED_OVER);
               break;
            case ActionButton.UPGRADE_ACTON:
               _loc2_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_UPGRADE_OUT);
               _loc3_ = AssetLibrary.getSprite(AssetConfig.ASSET_ACTION_MENU,AssetConfig.ACTION_MENU_UPGRADE_OVER);
               break;
            default:
               return;
         }
         this.setNewIcons(_loc2_,_loc3_);
      }
      
      private function setNewIcons(param1:Sprite, param2:Sprite) : void
      {
         this.skin.removeChild(this.icon_out);
         this.skin.removeChild(this.icon_over);
         this.icon_out = param1;
         this.icon_over = param2;
         this.skin.addChild(this.icon_out);
         this.icon_out.mouseEnabled = this.icon_out.mouseChildren = false;
         this.skin.addChild(this.icon_over);
         this.icon_over.mouseEnabled = this.icon_over.mouseChildren = false;
         this.icon_over.visible = false;
      }
   }
}

