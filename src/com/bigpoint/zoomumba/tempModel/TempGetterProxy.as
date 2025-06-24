package com.bigpoint.zoomumba.tempModel
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import com.bigpoint.zoomumba.model.events.babyEvent.BabyEventProxy;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.assistances.AssistancesProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IFacade;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class TempGetterProxy extends Proxy implements IProxy
   {
      private static var instance:TempGetterProxy;
      
      private static var premiumPackProxy:PremiumPackConfigProxy;
      
      private static var appProxy:AppProxy;
      
      private static var userProxy:UserProxy;
      
      private static var playFieldProxy:PlayFieldProxy;
      
      private static var itemConfigProxy:ItemConfigProxy;
      
      private static var currencyProxy:CurrencyProxy;
      
      private static var resourceProxy:ResourcesProxy;
      
      private static var appConfigProxy:AppConfigProxy;
      
      private static var appSettingProxy:AppSettingsProxy;
      
      private static var userResourcesProxy:UserResourcesProxy;
      
      private static var globalEventProxy:GlobalEventProxy;
      
      private static var babyEventProxy:BabyEventProxy;
      
      private static var babyCaravanProxy:BabyCaravanProxy;
      
      private static var internalFacade:IFacade;
      
      public static const NAME:String = "TempGetterProxy";
      
      public function TempGetterProxy()
      {
         super(NAME);
         instance = this;
      }
      
      public static function getFacade() : IFacade
      {
         return internalFacade;
      }
      
      public static function getItemConfigProxy() : ItemConfigProxy
      {
         if(!itemConfigProxy)
         {
            itemConfigProxy = instance.facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         return itemConfigProxy;
      }
      
      public static function getPremiumPackCostMultiplier() : Number
      {
         if(premiumPackProxy == null)
         {
            premiumPackProxy = instance.facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         }
         return premiumPackProxy.allNormalBuildingsCostMultiplyer;
      }
      
      public static function getInventoryData(param1:int) : Dictionary
      {
         return playFieldProxy.getInventoryForCategory(param1);
      }
      
      public static function getSessionID() : String
      {
         return appProxy.getZooSessionId();
      }
      
      public static function sendNotification(param1:String, param2:Object = null, param3:String = null) : void
      {
         instance.facade.sendNotification(param1,param2,param3);
      }
      
      public static function exitFullscreenMode() : void
      {
         instance.sendNotification(Note.EXIT_FULLSCREEN_MODE);
      }
      
      public static function showBabyToInventory() : Boolean
      {
         if(globalEventProxy == null)
         {
            globalEventProxy = instance.facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         }
         if(babyCaravanProxy == null)
         {
            babyCaravanProxy = instance.facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         }
         return babyCaravanProxy.isEventActive && babyCaravanProxy.canRedeemMore;
      }
      
      public static function getBabyCageTooltip() : String
      {
         return babyCaravanProxy.eventCageMenuTooltip;
      }
      
      public static function getEventBabySpecieId() : int
      {
         if(babyCaravanProxy == null)
         {
            babyCaravanProxy = instance.facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         }
         return babyCaravanProxy.specieId;
      }
      
      public static function getIsGlobalEventRunning(param1:int) : Boolean
      {
         return (instance.facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy).isEventActive(param1);
      }
      
      public static function sendBuddyActionMenuShowNotice() : void
      {
         instance.facade.sendNotification(Note.SHOW_NEYBOUR_ACTION_MENU);
      }
      
      public static function sendBuddyActionMenuOpenNotice() : void
      {
         instance.facade.sendNotification(Note.OPEN_NEYBOUR_ACTION_MENU);
      }
      
      public static function sendBuddyActionMenuCloseNotice() : void
      {
         instance.facade.sendNotification(Note.CLOSE_NEYBOUR_ACTION_MENU);
      }
      
      public static function sendBuddyActionMenuHideNotice() : void
      {
         instance.facade.sendNotification(Note.HIDE_NEYBOUR_ACTION_MENU);
      }
      
      public static function getAssistantsProxy() : AssistancesProxy
      {
         return instance.facade.retrieveProxy(AssistancesProxy.NAME) as AssistancesProxy;
      }
      
      public static function getAppConfigSingleSessionUser() : Boolean
      {
         return appConfigProxy.single_sign_on_user;
      }
      
      public static function increaseCurrency(param1:int, param2:int) : void
      {
         currencyProxy.increaseCurrency(param1,param2);
      }
      
      public static function reduceCurrency(param1:int, param2:int) : void
      {
         currencyProxy.reduceCurrency(param1,param2);
      }
      
      public static function increaseResource(param1:int, param2:int) : void
      {
         resourceProxy.increaseResource(param1,param2);
      }
      
      public static function reduceResource(param1:int, param2:int) : void
      {
         resourceProxy.reduceResource(param1,param2);
      }
      
      public static function getResourceCount(param1:int) : int
      {
         return resourceProxy.getResourseAmmount(param1);
      }
      
      public static function getMaxResourceCount(param1:int) : int
      {
         return resourceProxy.getMaxResourse(param1);
      }
      
      public static function getCageSpecieBotus(param1:int, param2:int) : int
      {
         if(!itemConfigProxy)
         {
            itemConfigProxy = instance.facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         }
         return itemConfigProxy.getCageSpecieBonus(param1,param2);
      }
      
      public static function getuserResourceProxy() : UserResourcesProxy
      {
         return instance.facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
      }
      
      override public function onRegister() : void
      {
         internalFacade = facade;
         appProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         playFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         appConfigProxy = instance.facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         appSettingProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         currencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         resourceProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         babyEventProxy = facade.retrieveProxy(BabyEventProxy.NAME) as BabyEventProxy;
         babyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
      }
   }
}

