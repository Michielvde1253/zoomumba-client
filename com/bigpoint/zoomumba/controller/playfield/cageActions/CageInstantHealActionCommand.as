package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import com.bigpoint.zoomumba.model.gameConfig.PremiumPackConfigProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.CageData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
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
   
   public class CageInstantHealActionCommand extends SimpleCommand
   {
      public function CageInstantHealActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:ResourcesProxy = null;
         var _loc12_:CageData = null;
         var _loc16_:Boolean = false;
         var _loc17_:CageDropRequestVO = null;
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         _loc4_ = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         var _loc5_:Cage = _loc3_.getItem(Categories.CAGE,_loc2_) as Cage;
         var _loc6_:SpecieShopData = ConfigurationModule.getInstance().getSpecieData(_loc5_.speciesId);
         var _loc7_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc8_:SoundManager = SoundManager.getInstance();
         var _loc9_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc10_:Point = _loc9_.getItemPosInStage(Categories.CAGE,_loc2_);
         var _loc11_:PremiumPackConfigProxy = facade.retrieveProxy(PremiumPackConfigProxy.NAME) as PremiumPackConfigProxy;
         _loc12_ = new CageData();
         _loc12_.uniqueId = _loc2_;
         var _loc13_:int = 1;
         if(_loc4_.supermedicine >= _loc13_)
         {
            _loc5_.instantHealInitialised();
            _loc12_.healthTimeStamp = TimeManager.currentTime + _loc5_.healthTime + Math.floor(_loc5_.sickTime * _loc11_.animalHealtTimeMultiplyer) * 2;
            _loc5_.sickTimeStamp = 0;
            _loc16_ = false;
            if(_loc5_.sickTimeStamp == 0 && _loc5_.healthTimeStamp < _loc12_.healthTimeStamp)
            {
               sendNotification(NET.SUPER_HEAL_ANIMAL_CAGE,[_loc2_]);
               _loc5_.commandIds.feed = _loc7_.currentRequestId;
               _loc17_ = new CageDropRequestVO(_loc2_,CageActionIds.SUPERHEAL);
               sendNotification(Note.GENERATE_DROPS,_loc17_);
               sendNotification(Note.QUICK_INFO_NOTICE,new QuickInfoNotice(QuickInfoNotice.REDUCE_RESOURCE,Resources.SUPERMEDICINE,_loc13_,new Point(_loc10_.x,_loc10_.y)));
               _loc4_.reduceResource(Resources.SUPERMEDICINE,_loc13_);
               _loc8_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_HEAL);
               _loc5_.instantHealUsed();
            }
         }
         else
         {
            sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
         }
         sendNotification(Note.SET_FIELDS_ITEMS,Vector.<FieldItemData>([_loc12_]));
         sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,_loc2_);
         var _loc14_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc15_:CageData = _loc3_.getFieldItem(_loc14_.getCurrentPlayFieldId(),_loc12_.category,_loc12_.uniqueId) as CageData;
         _loc15_.health = _loc12_.healthTimeStamp;
         _loc14_.changeAttractions(_loc14_.getCurrentPlayFieldId(),_loc15_,true);
         _loc14_.recalculatePlayfieldsInfo();
      }
   }
}

