package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.gameEvents.UserResourcesProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.ActionType;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
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
   
   public class CageCuddleActionCommand extends SimpleCommand
   {
      public function CageCuddleActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc16_:int = 0;
         var _loc17_:CageDropRequestVO = null;
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:UserResourcesProxy = facade.retrieveProxy(UserResourcesProxy.NAME) as UserResourcesProxy;
         var _loc4_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         var _loc5_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc6_:Cage = _loc5_.getItem(Categories.CAGE,_loc2_) as Cage;
         var _loc7_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc8_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(_loc6_.speciesId);
         var _loc9_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc10_:Point = _loc9_.getItemPosInStage(Categories.CAGE,_loc2_);
         var _loc11_:SoundManager = SoundManager.getInstance();
         var _loc12_:CageData = new CageData();
         _loc12_.uniqueId = _loc2_;
         if(Settings.TUTORIAL_ACTIVE)
         {
            TutorialInjectionManager.getInstance().step3Cuddle();
         }
         _loc12_.cuddleTimeStamp = TimeManager.currentTime + _loc8_.cuddleTime;
         sendNotification(NET.CUDDLE_ANIMAL_CAGE,[_loc2_]);
         var _loc13_:int = _loc7_.currentRequestId;
         if(!Settings.TUTORIAL_ACTIVE)
         {
            _loc16_ = _loc3_.getItemCalculatedXP(_loc6_,ActionType.CUDDLE);
            _loc17_ = new CageDropRequestVO(_loc2_,CageActionIds.CUDDLE);
            sendNotification(Note.GENERATE_DROPS,_loc17_);
            sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.INCREASE_CURRENCY,UserResources.EXPERIENCE,_loc16_,new Point(_loc10_.x,_loc10_.y + 30)));
            _loc4_.increaseCurrency(UserResources.EXPERIENCE,_loc16_);
         }
         _loc6_.commandIds.cudle = _loc13_;
         _loc11_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_CUDDLE);
         sendNotification(Note.SET_FIELDS_ITEMS,Vector.<FieldItemData>([_loc12_]));
         sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,_loc2_);
         var _loc14_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc15_:CageData = _loc5_.getFieldItem(_loc14_.getCurrentPlayFieldId(),_loc12_.category,_loc12_.uniqueId) as CageData;
         if(_loc15_)
         {
            _loc15_.cuddle = _loc12_.cuddleTimeStamp;
         }
         _loc14_.changeAttractions(_loc14_.getCurrentPlayFieldId(),_loc15_,true);
         _loc14_.recalculatePlayfieldsInfo();
      }
   }
}

