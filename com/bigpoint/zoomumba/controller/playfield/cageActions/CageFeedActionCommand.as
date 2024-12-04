package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageFeedActionCommand extends SimpleCommand
   {
      public function CageFeedActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc8_:int = 0;
         var _loc18_:CageDropRequestVO = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:UserResourcesProxy = facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
         var _loc4_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc5_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc6_:ResourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         var _loc7_:Cage = _loc4_.getItem(Categories.CAGE,_loc2_) as Cage;
         _loc8_ = _loc3_.getResourseUsedAmount(_loc7_,ActionType.FEED);
         var _loc9_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(_loc7_.speciesId);
         var _loc10_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc11_:SoundManager = SoundManager.getInstance();
         var _loc12_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc13_:Point = _loc12_.getItemPosInStage(Categories.CAGE,_loc2_);
         var _loc14_:UserProxy = facade.getProxy(UserProxy);
         var _loc15_:CageData = new CageData();
         _loc15_.uniqueId = _loc2_;
         if(_loc6_.getResourseAmmount(_loc7_.foodId) >= _loc8_)
         {
            if(Settings.TUTORIAL_ACTIVE)
            {
               TutorialInjectionManager.getInstance().feedAnimals(_loc7_.itemId);
            }
            _loc15_.feedTimeStamp = TimeManager.currentTime + _loc9_.feedTime;
            _loc18_ = new CageDropRequestVO(_loc2_,CageActionIds.FEED);
            sendNotification(Note.GENERATE_DROPS,_loc18_);
            sendNotification(NET.FEED_ANIMAL_CAGE,[_loc2_]);
            _loc19_ = _loc10_.currentRequestId;
            sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.REDUCE_RESOURCE,_loc7_.foodId,_loc8_,new Point(_loc13_.x,_loc13_.y)));
            _loc6_.reduceResource(_loc7_.foodId,_loc8_);
            _loc7_.commandIds.feed = _loc19_;
            if(!Settings.TUTORIAL_ACTIVE)
            {
               _loc20_ = _loc3_.getItemCalculatedXP(_loc7_,ActionType.FEED);
               _loc21_ = _loc13_.y + 30;
               if(_loc13_.y < 150)
               {
                  _loc21_ = 180;
               }
               sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc20_,new Point(_loc13_.x,_loc21_)));
               _loc5_.increaseCurrency(UserResources.EXPERIENCE,_loc20_);
            }
            _loc14_.commandIds.experience = _loc19_;
            _loc11_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_FEED);
         }
         else
         {
            sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
         }
         sendNotification(Note.SET_FIELDS_ITEMS,Vector.<FieldItemData>([_loc15_]));
         sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,_loc2_);
         var _loc16_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc17_:CageData = _loc4_.getFieldItem(_loc16_.getCurrentPlayFieldId(),_loc15_.category,_loc15_.uniqueId) as CageData;
         if(_loc17_)
         {
            _loc17_.feed = _loc15_.feedTimeStamp;
         }
         _loc16_.changeAttractions(_loc16_.getCurrentPlayFieldId(),_loc17_,true);
         _loc16_.recalculatePlayfieldsInfo();
      }
   }
}

