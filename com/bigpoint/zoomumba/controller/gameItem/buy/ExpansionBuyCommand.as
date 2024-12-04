package com.bigpoint.zoomumba.controller.gameItem.buy
{
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.collectables.vo.CollectableItemType;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.ExpansionBuyInfoVo;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyTwoCurrencyConfirmationInitParams;
   import com.bigpoint.zoorama.data.settings.ExpansionShopData;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ExpansionBuyCommand extends SimpleCommand
   {
      public function ExpansionBuyCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ExpansionShopData = null;
         var _loc3_:int = 0;
         var _loc6_:Boolean = false;
         var _loc8_:ItemConfigProxy = null;
         var _loc9_:UserProxy = null;
         var _loc10_:CurrencyProxy = null;
         var _loc11_:PlayFieldProxy = null;
         var _loc12_:PlayfieldSettingsProxy = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:ExpansionBuyInfoVo = null;
         var _loc16_:BuyTwoCurrencyConfirmationInitParams = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = (facade.getProxy(CollectablesProxy) as CollectablesProxy).getCollectableAmmount(CollectableItemType.FORGOTTEN_ZOO_UPGRADE);
         if(param1.getBody() is int)
         {
            _loc3_ = param1.getBody() as int;
         }
         else
         {
            _loc2_ = param1.getBody() as ExpansionShopData;
            _loc3_ = MainConstants.EXPANSION_BUY_FROM_SHOP;
         }
         if(!_loc2_)
         {
            _loc8_ = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
            _loc9_ = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
            _loc10_ = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
            _loc11_ = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
            _loc12_ = facade.getProxy(PlayfieldSettingsProxy);
            _loc13_ = -1;
            if(_loc12_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO)
            {
               _loc13_ = MainConstants.PREMIUM_ID_FZOO_EXPANSION;
            }
            else if(_loc12_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_NEW_ZOO)
            {
               _loc13_ = MainConstants.PREMIUM_ID_MZOO_EXPANSION;
            }
            else if(_loc12_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_RIVER_ZOO)
            {
               _loc13_ = MainConstants.PREMIUM_ID_FOURTHZOO_EXPANSION;
            }
            else if(_loc12_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_COAST_ZOO)
            {
               _loc13_ = MainConstants.PREMIUM_ID_COASTZOO_EXPANSION;
            }
            else if(_loc12_.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO)
            {
               _loc13_ = MainConstants.PREMIUM_ID_OCEANWORLD_EXPANSION;
            }
            else
            {
               _loc13_ = MainConstants.PREMIUM_ID_ZOO_EXPANSION;
            }
            _loc2_ = _loc8_.getExpansionData(_loc13_);
            _loc2_.userLevel = _loc9_.userLevel;
            _loc2_.userFieldSize = _loc9_.fieldSize;
            _loc2_.flushCachedPrice();
            _loc2_.price.userResource = UserResources.REAL_MONEY;
            _loc2_.price.amount = _loc2_.getBuyReal();
            _loc2_.price.userCanBuy = _loc10_.getCurrency(UserResources.REAL_MONEY) >= _loc2_.getBuyReal();
         }
         if(_loc2_.price.amount == -1)
         {
            return;
         }
         var _loc7_:int = _loc2_.itemId;
         if(_loc2_.itemId == MainConstants.PREMIUM_ID_FZOO_FULL_EXPANSION || _loc2_.itemId == 30)
         {
            _loc7_ = MainConstants.PREMIUM_ID_ZOO_MAX_EXPANSION;
         }
         if(_loc3_ == MainConstants.EXPANSION_BUY_FROM_FIELD && _loc13_ == MainConstants.PREMIUM_ID_FZOO_EXPANSION && _loc5_ > 0)
         {
            _loc14_ = 0;
            _loc15_ = new ExpansionBuyInfoVo();
            if(_loc5_ > _loc2_.price.amount)
            {
               _loc15_.tools = _loc2_.price.amount;
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.premium.title." + _loc7_),TextResourceModule.getTextReplaced("zoo.premium.infoText.14",Vector.<TextReplace>([new TextReplace("%nextExpandLevel%",_loc2_.lvlNextAutomaticExp.toString())])),_loc15_.tools,-1,CollectableItemType.FORGOTTEN_ZOO_UPGRADE),new WindowParams("",null,"",null,Note.EXTEND_FORGOTTEN_ZOO_TOOLS,_loc15_)));
            }
            else
            {
               _loc15_.tools = _loc5_;
               _loc15_.zoodollar = _loc2_.price.amount - _loc5_;
               _loc16_ = new BuyTwoCurrencyConfirmationInitParams(TextResourceModule.getText("zoo.premium.title." + _loc7_),TextResourceModule.getTextReplaced("zoo.collectables.forgottenZoo.extension",Vector.<TextReplace>([new TextReplace("%zd%",_loc15_.zoodollar.toString()),new TextReplace("%tools%",_loc15_.tools.toString())])),_loc15_.tools,-1,CollectableItemType.FORGOTTEN_ZOO_UPGRADE,_loc15_.zoodollar,UserResources.REAL_MONEY,-1);
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_TWO_CURRENCY_CONFIRMATION,"",_loc16_,new WindowParams("",null,"",null,Note.EXTEND_FORGOTTEN_ZOO_TOOLS,_loc15_)));
            }
            _loc4_ = true;
         }
         if(!_loc4_)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.premium.title." + _loc7_),TextResourceModule.getTextReplaced("zoo.premium.infoText." + _loc7_,Vector.<TextReplace>([new TextReplace("%nextExpandLevel%",_loc2_.lvlNextAutomaticExp.toString())])),_loc2_.price.amount,_loc2_.price.userResource,_loc2_.price.collectable),new WindowParams("",null,"",null,SHOP.SHOPCARD_BUY_CLICKED,_loc2_)));
         }
      }
   }
}

