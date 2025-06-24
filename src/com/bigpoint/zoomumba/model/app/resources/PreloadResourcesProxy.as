package com.bigpoint.zoomumba.model.app.resources
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.LoadingProcessProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.Resource;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   import utils.GUIHelper;
   
   public class PreloadResourcesProxy extends Proxy
   {
      public static const NAME:String = "PreloadResourcesProxy";
      
      private var _resourcesList:Vector.<String> = new Vector.<String>();
      
      private var _assetsList:Vector.<String> = new Vector.<String>();
      
      private var _textsList:Vector.<String> = new Vector.<String>();
      
      private var _resourcesLoaded:int;
      
      private var _resourceLoaderProxy:ResourceLoaderProxy;
      
      private var _themeLoadFinished:Boolean = true;
      
      private var _mainLoadFinished:Boolean = false;
      
      public function PreloadResourcesProxy()
      {
         super(NAME);
         this._addAssetsResources();
         this._addTextResources();
      }
      
      override public function onRegister() : void
      {
         this._resourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
      }
      
      public function load() : void
      {
         this._resourcesList = this._textsList.concat(this._assetsList);
         this._resourcesLoaded = 0;
         this._resourceLoaderProxy.bulkLoad("preload",this._resourcesList,this._handleTotalAssetsLoaded,this._handleAssetLoaded);
      }
      
      private function _handleAssetLoaded(param1:Resource) : void
      {
         var _loc2_:int = int(++this._resourcesLoaded / this._resourcesList.length * 100);
         sendNotification(Note.UPDATE_PRELOADER_STATE,_loc2_);
      }
      
      private function _handleTotalAssetsLoaded(param1:Dictionary) : void
      {
         this._mainLoadFinished = true;
         this.checkAllReady();
      }
      
      private function _handleTotalAssetsThemeLoaded(param1:Dictionary) : void
      {
         this._themeLoadFinished = true;
         this.checkAllReady();
      }
      
      private function checkAllReady() : void
      {
         var _loc1_:LoadingProcessProxy = null;
         if(this._mainLoadFinished && this._themeLoadFinished)
         {
            GUIHelper.numberFormatterFunction = TextResourceModule.getNumberFormated;
            _loc1_ = facade.retrieveProxy(LoadingProcessProxy.NAME) as LoadingProcessProxy;
            _loc1_.setResourcesLoaded();
         }
      }
      
      public function addAssetsRoadTheme(param1:String) : void
      {
         this._themeLoadFinished = false;
         var _loc2_:Vector.<String> = new Vector.<String>();
         _loc2_.push("road_field_1_" + param1 + ".swf");
         _loc2_.push("road_field_2_" + param1 + ".swf");
         _loc2_.push("road_field_3_" + param1 + ".swf");
         _loc2_.push("road_field_4_" + param1 + ".swf");
         _loc2_.push("road_field_5_" + param1 + ".swf");
         _loc2_.push("road_field_6_" + param1 + ".swf");
         _loc2_.push("road_field_7_" + param1 + ".swf");
         _loc2_.push("road_field_8_" + param1 + ".swf");
         _loc2_.push("road_field_9_" + param1 + ".swf");
         _loc2_.push("road_field_10_" + param1 + ".swf");
         _loc2_.push("road_field_11_" + param1 + ".swf");
         _loc2_.push("road_field_12_" + param1 + ".swf");
         _loc2_.push("road_field_13_" + param1 + ".swf");
         _loc2_.push("road_field_14_" + param1 + ".swf");
         _loc2_.push("road_field_15_" + param1 + ".swf");
         _loc2_.push("road_field_16_" + param1 + ".swf");
         _loc2_.push("road_field_17_" + param1 + ".swf");
         _loc2_.push("road_field_18_" + param1 + ".swf");
         _loc2_.push("road_field_19_" + param1 + ".swf");
         _loc2_.push("road_field_20_" + param1 + ".swf");
         _loc2_.push("road_field_21_" + param1 + ".swf");
         _loc2_.push("road_field_22_" + param1 + ".swf");
         _loc2_.push("road_field_23_" + param1 + ".swf");
         _loc2_.push("road_field_24_" + param1 + ".swf");
         _loc2_.push("road_field_25_" + param1 + ".swf");
         _loc2_.push("road_field_26_" + param1 + ".swf");
         this._resourceLoaderProxy.bulkLoad("theme_load_" + param1,_loc2_,this._handleTotalAssetsThemeLoaded);
      }
      
      private function _addAssetsResources() : void
      {
         this._assetsList.push("Styles.css");
         this._assetsList.push(AssetConfig.FONT_TAHOMA + ".swf");
         this._assetsList.push("background.swf");
         this._assetsList.push("fieldElements.swf");
         this._assetsList.push("smileys.swf");
         this._assetsList.push("quickInfo.swf");
         this._assetsList.push("shop_cards.swf");
         this._assetsList.push("header.swf");
         this._assetsList.push("catface_needs_cured.swf");
         this._assetsList.push("road_field_1.swf");
         this._assetsList.push("road_field_2.swf");
         this._assetsList.push("road_field_3.swf");
         this._assetsList.push("road_field_4.swf");
         this._assetsList.push("road_field_5.swf");
         this._assetsList.push("road_field_6.swf");
         this._assetsList.push("road_field_7.swf");
         this._assetsList.push("road_field_8.swf");
         this._assetsList.push("road_field_9.swf");
         this._assetsList.push("road_field_10.swf");
         this._assetsList.push("road_field_11.swf");
         this._assetsList.push("road_field_12.swf");
         this._assetsList.push("road_field_13.swf");
         this._assetsList.push("road_field_14.swf");
         this._assetsList.push("road_field_15.swf");
         this._assetsList.push("road_field_16.swf");
         this._assetsList.push("road_field_17.swf");
         this._assetsList.push("road_field_18.swf");
         this._assetsList.push("road_field_19.swf");
         this._assetsList.push("road_field_20.swf");
         this._assetsList.push("road_field_21.swf");
         this._assetsList.push("road_field_22.swf");
         this._assetsList.push("road_field_23.swf");
         this._assetsList.push("road_field_24.swf");
         this._assetsList.push("road_field_25.swf");
         this._assetsList.push("road_field_26.swf");
         this._assetsList.push("GameGUI.swf");
         this._assetsList.push("MainMenu.swf");
         this._assetsList.push("action_pop_menu.swf");
         this._assetsList.push("happyMeter.swf");
         this._assetsList.push("commons.swf");
         this._assetsList.push("components.swf");
         this._assetsList.push("itemDrops.swf");
         this._assetsList.push("tutorialElements.swf");
         this._assetsList.push("ButtonGraphics.swf");
         this._assetsList.push("powerupIcons.swf");
         this._assetsList.push("SizedMiniWindow.swf");
         this._assetsList.push("SizedSmallWindow.swf");
         this._assetsList.push("SizedMediumWindow.swf");
         this._assetsList.push("SafariMediumInfoWindow.swf");
         this._assetsList.push("SafariSmallInfoWindow.swf");
         this._assetsList.push("SafariMiniInfoWindow.swf");
         this._assetsList.push("InfoWindow.swf");
         this._assetsList.push("WindowsAll.swf");
         this._assetsList.push("WindowGeneralHeaders.swf");
         this._assetsList.push("WindowSectionBars.swf");
         this._assetsList.push("StorageWindow.swf");
         this._assetsList.push("Shop.swf");
         this._assetsList.push("Friends.swf");
         this._assetsList.push("QuestsAssets.swf");
         this._assetsList.push("InventoryAssets.swf");
         this._assetsList.push("FriendsIcons.swf");
      }
      
      private function _addTextResources() : void
      {
         this._textsList.push("zoo.advancedBreed.xml");
         this._textsList.push("zoo.advisor.xml");
         this._textsList.push("zoo.assistantItems.xml");
         this._textsList.push("zoo.avatar.xml");
         this._textsList.push("zoo.cageItems.xml");
         this._textsList.push("zoo.cinema.xml");
         this._textsList.push("zoo.collectables.xml");
         this._textsList.push("zoo.collectableItems.xml");
         this._textsList.push("zoo.error.xml");
         this._textsList.push("zoo.eventItems.xml");
         this._textsList.push("zoo.genus.xml");
         this._textsList.push("zoo.inventory.xml");
         this._textsList.push("zoo.mail.xml");
         this._textsList.push("zoo.news.xml");
         this._textsList.push("zoo.nursery.xml");
         this._textsList.push("zoo.packs.xml");
         this._textsList.push("zoo.popup.xml");
         this._textsList.push("zoo.powerUpItems.xml");
         this._textsList.push("zoo.premium.xml");
         this._textsList.push("zoo.quests.xml");
         this._textsList.push("zoo.safari.xml");
         this._textsList.push("zoo.settings.xml");
         this._textsList.push("zoo.shop.specials.xml");
         this._textsList.push("zoo.shop.xml");
         this._textsList.push("zoo.slayer.xml");
         this._textsList.push("zoo.speciesItems.xml");
         this._textsList.push("zoo.storage.xml");
         this._textsList.push("zoo.tooltip.xml");
         this._textsList.push("zoo.tutorial.xml");
         this._textsList.push("zoo.user.xml");
         this._textsList.push("zoo.wheel.xml");
         this._textsList.push("zoo.window.animalbreed.xml");
         this._textsList.push("zoo.window.bank.xml");
         this._textsList.push("zoo.managementcenter.xml");
         this._textsList.push("zoo.window.waterstorehouse.xml");
         this._textsList.push("zoo.window.bonus.xml");
         this._textsList.push("zoo.window.buyassistance.xml");
         this._textsList.push("zoo.window.buyonce.xml");
         this._textsList.push("zoo.window.confirmation.xml");
         this._textsList.push("zoo.window.construction.xml");
         this._textsList.push("zoo.window.general.xml");
         this._textsList.push("zoo.window.gift.xml");
         this._textsList.push("zoo.window.infoLayers.xml");
         this._textsList.push("zoo.window.levelup.xml");
         this._textsList.push("zoo.window.minitutorial.xml");
         this._textsList.push("zoo.window.settings.xml");
         this._textsList.push("zoo.window.shop.xml");
         this._textsList.push("zoo.window.shopAnimalInfo.xml");
         this._textsList.push("zoo.window.shopCageInfo.xml");
         this._textsList.push("zoo.window.shopDecorationInfo.xml");
         this._textsList.push("zoo.window.shopResourceInfo.xml");
         this._textsList.push("zoo.window.recyclingMaterialInfo.xml");
         this._textsList.push("zoo.window.shopRoadsInfo.xml");
         this._textsList.push("zoo.window.shopStoreInfo.xml");
         this._textsList.push("zoo.window.shopTrashbinInfo.xml");
         this._textsList.push("zoo.window.upgrade.xml");
         this._textsList.push("zoo.window.welcomeBack.xml");
         this._textsList.push("zoo.window.wishes.xml");
         this._textsList.push("zoo.window.dailylogin.xml");
         this._textsList.push("zoo.window.recycling.xml");
         this._textsList.push("zoo.window.crafting.xml");
         this._textsList.push("zoo.event.caravan.xml");
         this._textsList.push("zoo.event.christmas.xml");
         this._textsList.push("zoo.event.circus.xml");
         this._textsList.push("zoo.eventValentine.xml");
         this._textsList.push("zoo.eventABtrade.xml");
         this._textsList.push("zoo.event.halloween.xml");
      }
   }
}

