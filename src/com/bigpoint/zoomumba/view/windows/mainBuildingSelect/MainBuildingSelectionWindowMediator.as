package com.bigpoint.zoomumba.view.windows.mainBuildingSelect
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.mainBuildingSelect.MainBuildingSelectionProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.features.settings.RadioButtonMainBuilding;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.mainBuildingSelect.MainBuildingSelectionContent;
   import windows.custom.mainBuildingSelect.MainBuildingSelectionWindow;
   
   public class MainBuildingSelectionWindowMediator extends WindowMediator
   {
      public static var NAME:String = "MainBuildingSelectionWindowMediator";
      
      private var mainBuildingSelectionProxy:MainBuildingSelectionProxy;
      
      private var userProxy:UserProxy;
      
      private var playfieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var doReport:Boolean = false;
      
      public function MainBuildingSelectionWindowMediator(param1:MainBuildingSelectionWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.mainBuildingSelectionProxy = facade.retrieveProxy(MainBuildingSelectionProxy.NAME) as MainBuildingSelectionProxy;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
      }
      
      override public function init(param1:Object) : void
      {
         var _loc5_:Object = null;
         var _loc6_:RadioButtonMainBuilding = null;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction(AssetConfig.MAIN_BUILDING_SELECTION_ASSET_FILE,this.handleAssetsLoaded);
         this.content.mainBuildingsText.htmlText = TextResourceModule.getText("zoo.window.settings.buildings.info");
         var _loc2_:Array = this.mainBuildingSelectionProxy.getBuildings(this.playfieldSettingsProxy.activePlayfieldType);
         var _loc3_:int = int(_loc2_.length);
         this.content.ammountOfBuilding = _loc3_;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = this.content.getBuilding(_loc4_);
            _loc6_.value = _loc5_.id;
            _loc6_.preloaderVisibility = true;
            _loc6_.currentState = _loc5_.levelRequired <= this.userProxy.userLevel ? "enabled" : "disabled";
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.SPECIAL,_loc5_.id),this.loadPreviewOfBuilding,_loc6_);
            _loc4_++;
         }
         this.content.mainBuildingsRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.mainBuildingsRadioGroup.selectedValue = this.mainBuildingSelectionProxy.currentBuildingID;
         var _loc7_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc7_.getHeaderPath("header_mainBuilding");
      }
      
      private function loadPreviewOfBuilding(param1:SWFAsset, param2:RadioButtonMainBuilding) : void
      {
         param2.preloaderVisibility = false;
         param2.spriteImage = param1.getEmbededObject(AssetConfig.DEFAULT_OBJECT_SPR);
      }
      
      private function optionChanged(param1:Event) : void
      {
         this.mainBuildingSelectionProxy.currentBuildingID = this.content.mainBuildingsRadioGroup.selectedValue as int;
         sendNotification(DataNote.USER_LEVEL);
         sendNotification(NET.SAVE_ACTIV_MAIN_BUILDING,[this.mainBuildingSelectionProxy.currentBuildingID,this.playfieldSettingsProxy.getCurrentPlayFieldId()]);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRemove() : void
      {
         if(this.content.mainBuildingsRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.mainBuildingsRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         this.window.preloaderVisibility = false;
         this.content.background.source = param1.getEmbededBitmapData(AssetConfig.MAIN_BUILDING_SELECTION_BG_SONJA);
         this.content.bubble.source = param1.getEmbededBitmapData(AssetConfig.MAIN_BUILDING_SELECTION_SONJA_BUBBLE);
         this.content.sonja.source = param1.getEmbededBitmapData(AssetConfig.MAIN_BUILDING_SELECTION_SONJA_ICON);
      }
      
      private function get window() : MainBuildingSelectionWindow
      {
         return this.viewComponent as MainBuildingSelectionWindow;
      }
      
      private function get content() : MainBuildingSelectionContent
      {
         return this.window.getContent(0) as MainBuildingSelectionContent;
      }
   }
}

