package com.bigpoint.zoomumba.view.managmentCenter
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MANAGMENTCENTER;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WATERSTOREHOUSE;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.circus.CircusProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.ManagmentCenterProxy;
   import com.bigpoint.zoomumba.model.managmentCenter.events.BuildingEvent;
   import com.bigpoint.zoomumba.model.managmentCenter.events.CircusBoxEvent;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import com.bigpoint.zoomumba.view.managmentCenter.components.ManagmentCity;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmenCenterCityViewVo;
   import com.bigpoint.zoomumba.view.managmentCenter.vo.ManagmentCenterBuildingViewVo;
   import com.bigpoint.zoorama.sound.SoundManager;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.media.SoundChannel;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class ManagmentCenterMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "ManagmentCenterMediator";
      
      private var _managmentCity:ManagmentCity;
      
      private var _viewState:String;
      
      public function ManagmentCenterMediator(param1:UIComponent)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         var _loc1_:Sprite = new Sprite();
         _loc1_.mouseEnabled = false;
         this._managmentCity = new ManagmentCity();
         this._managmentCity.addEventListener(CircusBoxEvent.CIRCUS_OPEN_BOX,this.openCircusBox);
         _loc1_.addChild(this._managmentCity);
         this._viewState = MANAGMENTCENTER.MC_ASSET_WINDOW;
         this.getContainer().addChild(_loc1_);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.APP_MODE_CHANGED,Note.FULLSCREEN_MODE_CHANGE,Note.MANAGMENTCENTER_SHOW,Note.APP_RESIZED,Note.SET_FIELDS_ITEMS,Note.REFRESH_NURSERY_BUILDING,Note.REFRESH_ADVANCED_BREEDING_BUILDING,Note.REFRESH_CRAFTING_BUILDING,Note.RECYCLING_SLOTS_REFRESHED,Note.MANAGMENTCENTER_UPDATE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:String = param1.getName();
         var _loc3_:Object = param1.getBody();
         switch(_loc2_)
         {
            case Note.SET_FIELDS_ITEMS:
               break;
            case Note.MANAGMENTCENTER_SHOW:
               this.show();
               break;
            case Note.MANAGMENTCENTER_UPDATE:
               this.update();
               break;
            case DataNote.APP_MODE_CHANGED:
               if(_loc3_ as String != AppMode.MANAGMENT_CENTER)
               {
                  if(this._managmentCity.isInit)
                  {
                     this._managmentCity.clearAsset();
                  }
               }
               break;
            case Note.FULLSCREEN_MODE_CHANGE:
               this.update();
               break;
            case Note.APP_RESIZED:
               if(this._managmentCity)
               {
                  if(this._managmentCity.isVisible)
                  {
                     this._managmentCity.centerCity();
                     this._managmentCity.buildBackgroundTiles();
                  }
               }
               break;
            case Note.REFRESH_NURSERY_BUILDING:
            case Note.REFRESH_ADVANCED_BREEDING_BUILDING:
            case Note.REFRESH_CRAFTING_BUILDING:
            case Note.RECYCLING_SLOTS_REFRESHED:
               if(this._managmentCity.isVisible)
               {
                  this.managmentProxy.setupBuildViewVo();
                  this.update();
               }
         }
      }
      
      private function setCirusBoxes(param1:Vector.<FieldItemData>) : void
      {
      }
      
      public function updateCityData() : void
      {
         this._managmentCity.updateBoxes(this.managmentProxy.circusBoxes);
      }
      
      private function openCircusBox(param1:CircusBoxEvent) : void
      {
         if(param1.uniqueId > 0)
         {
            facade.sendNotification(NET.CIRCUS_OPEN_BOX,[param1.uniqueId]);
            this.managmentProxy.clearCirusBox(param1.uniqueId);
         }
         else
         {
            this.update();
         }
      }
      
      private function update() : void
      {
         if(this.applicationMediator.application.stage.displayState == StageDisplayState.NORMAL)
         {
            this._viewState = MANAGMENTCENTER.MC_ASSET_WINDOW;
         }
         else
         {
            this._viewState = MANAGMENTCENTER.MC_ASSET_FULL;
         }
         if(this._managmentCity.isVisible)
         {
            this._managmentCity.managmentCenterDataVo = this.dataVo;
            this._managmentCity.updateView(this._viewState);
         }
         sendNotification(Note.HIDE_LOADER_LAYER);
      }
      
      private function show() : void
      {
         if(this._managmentCity.isVisible == false)
         {
            this._managmentCity.managmentCenterDataVo = this.dataVo;
            this._managmentCity.updateBoxes(this.managmentProxy.circusBoxes);
            this._managmentCity.show(this._viewState);
            this._managmentCity.addEventListener(BuildingEvent.CLICK_BUILDING,this.onBuildingClick);
         }
         this.update();
      }
      
      private function onBuildingClick(param1:BuildingEvent) : void
      {
         var _loc2_:ManagmentCenterBuildingViewVo = param1.dataVo;
         var _loc3_:Object = new Object();
         switch(param1.dataVo.id)
         {
            case MANAGMENTCENTER.MC_BUILDING_BANK:
               sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
               this.playSound("city_bank_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_BREEDINGSTATION:
               _loc3_.uId = _loc2_.uId;
               sendNotification(Note.OPEN_BREEDING_VIEW,_loc3_);
               this.playSound("city_zuchtstation_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_EXITCITY:
               this.closeManagmentCenter();
               break;
            case MANAGMENTCENTER.MC_BUILDING_TOMBOLA:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL));
               this.playSound("city_gluecksrad_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_KINDERGARTEN:
               _loc3_.uId = _loc2_.uId;
               sendNotification(Note.OPEN_NURSERY_VIEW,_loc3_);
               this.playSound("city_tierkindergarten_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_CINEMA:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CINEMA_WINDOW));
               this.playSound("city_cinema_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_POST:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.MAIL_WINDOW));
               this.playSound("city_post_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_QUEST:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUESTS));
               this.playSound("city_note_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_SAFARI:
               sendNotification(Note.SAFARI_SHOW);
               this.playSound("city_safari_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_FOODCRAFTING:
               break;
            case MANAGMENTCENTER.MC_BUILDING_EVENT:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BOARDGAME_WINDOW,"",_loc2_.eventId));
               break;
            case MANAGMENTCENTER.MC_BUILDING_STORAGE:
               _loc3_.id = WATERSTOREHOUSE.STOREHOUSE;
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.WATERSTOREHOUSE_WINDOW,"",_loc3_));
               this.playSound("city_lager_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_WATERTOWER:
               _loc3_.id = WATERSTOREHOUSE.WATERTOWER;
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.WATERSTOREHOUSE_WINDOW,"",_loc3_));
               this.playSound("city_watertower_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_RECYCLING:
               sendNotification(Note.OPEN_RECYCLING_WINDOW);
               this.playSound("city_recycling_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_CRAFTING:
               sendNotification(Note.OPEN_CRAFTING_WINDOW);
               this.playSound("city_werkstatt_01");
               break;
            case MANAGMENTCENTER.MC_BUILDING_ZIRKUS:
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CIRCUS_WINDOW));
               this.playSound("city_circus_01");
         }
      }
      
      private function playSound(param1:String) : void
      {
         var _loc2_:SoundChannel = SoundManager.getInstance().getSoundChannelById(param1);
         if(_loc2_ == null)
         {
            SoundManager.getInstance().playSoundEffect(param1);
         }
      }
      
      private function get circusProxy() : CircusProxy
      {
         return facade.retrieveProxy(CircusProxy.NAME) as CircusProxy;
      }
      
      private function closeManagmentCenter() : void
      {
         sendNotification(Note.SHOW_SETTINGSMENU);
         sendNotification(Note.MAP_SHOW);
      }
      
      public function get managmentProxy() : ManagmentCenterProxy
      {
         return facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy;
      }
      
      public function get applicationMediator() : ApplicationMediator
      {
         return facade.retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
      }
      
      public function get dataVo() : ManagmenCenterCityViewVo
      {
         return (facade.retrieveProxy(ManagmentCenterProxy.NAME) as ManagmentCenterProxy).managmentCenterViewVo;
      }
      
      private function getContainer() : UIComponent
      {
         return viewComponent as UIComponent;
      }
   }
}

