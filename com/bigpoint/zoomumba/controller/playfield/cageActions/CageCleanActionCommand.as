package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialInjectionManager;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.SpecieShopData;
   import com.bigpoint.zoorama.notices.view.quickInfo.QuickInfoNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageCleanActionCommand extends SimpleCommand
   {
      public static const FILTER_RESOURCE_DATA_ID:int = 20;
      
      public function CageCleanActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc8_:SoundManager = null;
         var _loc16_:Number = NaN;
         var _loc17_:ItemConfigProxy = null;
         var _loc18_:ResourceShopData = null;
         var _loc19_:CageDropRequestVO = null;
         var _loc20_:CageShopData = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:ResourcesProxy = null;
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:UserResourcesProxy = facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
         var _loc4_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc5_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc6_:Cage = _loc5_.getItem(Categories.CAGE,_loc2_) as Cage;
         var _loc7_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(_loc6_.speciesId);
         _loc8_ = SoundManager.getInstance();
         var _loc9_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc10_:Point = _loc9_.getItemPosInStage(Categories.CAGE,_loc2_);
         var _loc11_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc12_:CageData = new CageData();
         _loc12_.uniqueId = _loc2_;
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().step3Clean();
         }
         _loc12_.cleanTimeStamp = TimeManager.currentTime + _loc7_.cleanTime;
         var _loc13_:int = _loc11_.currentRequestId;
         if(!Settings.TUTORIAL_ACTIVE)
         {
            _loc16_ = _loc3_.getItemCalculatedXP(_loc6_,ActionType.CLEAN);
            _loc17_ = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
            _loc18_ = _loc17_.getResourseData(FILTER_RESOURCE_DATA_ID);
            if(_loc18_.cageTypeUsage != null)
            {
               _loc20_ = ConfigurationModule.getInstance().getCageData(_loc6_.itemId);
               _loc21_ = _loc20_.type;
               _loc22_ = int(_loc18_.cageTypeUsage[_loc21_]);
               _loc23_ = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
               if(_loc22_ > 0 && _loc22_ > _loc23_.filter)
               {
                  sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
                  return;
               }
               _loc23_.reduceResource(Resources.FILTER,_loc22_);
            }
            sendNotification(NET.CLEAN_ANIMAL_CAGE,[_loc2_]);
            _loc19_ = new CageDropRequestVO(_loc2_,CageActionIds.CLEAN);
            sendNotification(Note.GENERATE_DROPS,_loc19_);
            sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc16_,new Point(_loc10_.x,_loc10_.y + 30)));
            _loc4_.increaseCurrency(UserResources.EXPERIENCE,_loc16_);
         }
         _loc6_.commandIds.clean = _loc13_;
         _loc8_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_CLEAN);
         sendNotification(Note.SET_FIELDS_ITEMS,Vector.<FieldItemData>([_loc12_]));
         sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,_loc2_);
         var _loc14_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc15_:CageData = _loc5_.getFieldItem(_loc14_.getCurrentPlayFieldId(),_loc12_.category,_loc12_.uniqueId) as CageData;
         if(_loc15_)
         {
            _loc15_.clean = _loc12_.cleanTimeStamp;
         }
         _loc14_.changeAttractions(_loc14_.getCurrentPlayFieldId(),_loc15_,true);
         _loc14_.recalculatePlayfieldsInfo();
      }
   }
}

