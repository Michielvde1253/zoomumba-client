package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.core.cookies.AppCookieProxy;
   import com.bigpoint.zoomumba.model.core.cookies.vo.AppCookieType;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class InitResponseCommand extends SimpleCommand
   {
      public function InitResponseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.enablePushing();
         this.createShopData();
         this.checkForgottenZooExpansion();
         sendNotification(Note.PUSH_RESPONSE);
         var _loc3_:GlobalEventProxy = facade.getProxy(GlobalEventProxy);
         _loc3_.saveEventCookies();
         _loc3_.checkCookieFinishedEvents();
      }
      
      private function checkForgottenZooExpansion() : void
      {
         var _loc2_:AppCookieProxy = null;
         var _loc3_:PlayfieldSettingsProxy = null;
         var _loc4_:UserProxy = null;
         var _loc5_:int = 0;
         var _loc1_:GlobalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         if(_loc1_.isEventActive(EventTypes.ZOO_EXPAND_EVENT))
         {
            _loc2_ = facade.retrieveProxy(AppCookieProxy.NAME) as AppCookieProxy;
            _loc3_ = facade.getProxy(PlayfieldSettingsProxy);
            _loc4_ = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
            _loc5_ = _loc3_.activePlayfieldType;
            if(_loc5_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && _loc4_.fieldSize >= MainConstants.FIELD_SIZE_START + 3 || _loc5_ == PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO && _loc4_.fieldSize < MainConstants.MAX_FIELD_SIZE)
            {
               if(TimeManager.currentTime > _loc2_.getCookie(AppCookieType.FORGOTTEN_ZOO_EXPANSION))
               {
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.SPECIAL_OFFER_WINDOW,"",new InformationInitParams(TextResourceModule.getText("zoo.window.general.specialOffer"),TextResourceModule.getText("zoo.window.infoLayers.forgottenZoo.expansion"))));
                  _loc2_.setCookie(AppCookieType.FORGOTTEN_ZOO_EXPANSION,TimeManager.currentTime + TimeManager.SECONDS_IN_HOUR * 24);
               }
            }
         }
      }
      
      private function createShopData() : void
      {
         var _loc1_:ShopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         _loc1_.init();
      }
      
      private function enablePushing() : void
      {
         var _loc1_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc1_.enablePush();
      }
   }
}

