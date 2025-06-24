package com.bigpoint.zoomumba.controller.playfield.assistantActions
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
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   import flash.geom.Point;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class AssistantFeedCommand extends SimpleCommand
   {
      public function AssistantFeedCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc6_:Cage = null;
         var _loc7_:UserResourcesProxy = null;
         var _loc8_:CurrencyProxy = null;
         var _loc9_:ResourcesProxy = null;
         var _loc10_:int = 0;
         var _loc11_:SpecieShopData = null;
         var _loc12_:NetProxy = null;
         var _loc13_:SoundManager = null;
         var _loc14_:PlayField = null;
         var _loc15_:Point = null;
         var _loc16_:CageData = null;
         var _loc17_:CageDropRequestVO = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc3_:Vector.<ItemAbstract> = _loc2_.getItemsByCategory(Categories.CAGE);
         var _loc4_:UserProxy = facade.getProxy(UserProxy);
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc6_ = _loc3_[_loc5_] as Cage;
            _loc7_ = facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
            _loc8_ = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
            _loc9_ = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
            _loc10_ = _loc7_.getResourseUsedAmount(_loc6_,ActionType.FEED);
            _loc11_ = ConfigurationModule.getInstance().getSpecieData(_loc6_.speciesId);
            _loc12_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
            _loc13_ = SoundManager.getInstance();
            _loc14_ = facade.retrieveMediator(PlayField.NAME) as PlayField;
            _loc15_ = _loc14_.getItemPosInStage(Categories.CAGE,_loc6_.uniqueId);
            _loc16_ = new CageData();
            _loc16_.uniqueId = _loc6_.uniqueId;
            if(_loc2_.isActionValid(_loc6_.uniqueId,CageActionIds.FEED))
            {
               if(_loc9_.getResourseAmmount(_loc6_.foodId) < _loc10_)
               {
                  sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
               }
            }
            if(_loc9_.getResourseAmmount(_loc6_.foodId) >= _loc10_)
            {
               if(Settings.TUTORIAL_ACTIVE)
               {
                  TutorialInjectionManager.getInstance().feedAnimals(_loc6_.itemId);
               }
               _loc16_.feedTimeStamp = TimeManager.currentTime + _loc11_.feedTime;
               _loc17_ = new CageDropRequestVO(_loc6_.uniqueId,CageActionIds.FEED);
               sendNotification(Note.GENERATE_DROPS,_loc17_);
               sendNotification(NET.FEED_ANIMAL_CAGE,[_loc6_.uniqueId]);
               _loc18_ = _loc12_.currentRequestId;
               sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.REDUCE_RESOURCE,_loc6_.foodId,_loc10_,new Point(_loc15_.x,_loc15_.y)));
               _loc9_.reduceResource(_loc6_.foodId,_loc10_);
               _loc6_.commandIds.feed = _loc18_;
               if(!Settings.TUTORIAL_ACTIVE)
               {
                  _loc19_ = _loc7_.getItemCalculatedXP(_loc6_,ActionType.FEED);
                  sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc19_,new Point(_loc15_.x,_loc15_.y + 30)));
                  _loc8_.increaseCurrency(UserResources.EXPERIENCE,_loc19_);
               }
               _loc4_.commandIds.experience = _loc18_;
               _loc13_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_FEED);
            }
            else
            {
               sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
            }
            sendNotification(Note.SET_FIELDS_ITEMS,Vector.<FieldItemData>([_loc16_]));
            _loc5_++;
         }
      }
   }
}

