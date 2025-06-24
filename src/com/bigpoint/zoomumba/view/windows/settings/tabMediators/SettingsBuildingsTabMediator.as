package com.bigpoint.zoomumba.view.windows.settings.tabMediators
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import custom.features.settings.RadioButtonMainBuilding;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.mainBuildingSelect.MainBuildingSelectionContent;
   
   public class SettingsBuildingsTabMediator extends Mediator
   {
      public static const NAME:String = "SettingsBuildingsTabMediator";
      
      public function SettingsBuildingsTabMediator(param1:MainBuildingSelectionContent)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.init();
      }
      
      private function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:int = 4;
         this.content.mainBuildingsText.text = TextResourceModule.getText("zoo.window.settings.buildings.info");
         this.content.ammountOfBuilding = _loc1_;
         _loc3_ = 0;
         while(_loc3_ < _loc1_)
         {
            this.content.getBuilding(_loc3_).value = _loc3_;
            this.content.getBuilding(_loc3_).preloaderVisibility = true;
            this.content.getBuilding(_loc3_).currentState = "enabled";
            _loc2_ = AssetIds.getPreviewAssetId(Categories.SPECIAL,_loc3_ + 1);
            AssetLibrary.sendAssetToFunction(_loc2_,this.loadPreviewOfBuilding,this.content.getBuilding(_loc3_));
            _loc3_++;
         }
         this.content.mainBuildingsRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         sendNotification(Note.SETTINGS_TAB_LOADED);
      }
      
      private function loadPreviewOfBuilding(param1:SWFAsset, param2:RadioButtonMainBuilding) : void
      {
         param2.preloaderVisibility = false;
         param2.spriteImage = param1.getEmbededObject(AssetConfig.DEFAULT_OBJECT_SPR);
      }
      
      private function optionChanged(param1:Event) : void
      {
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
      
      private function get content() : MainBuildingSelectionContent
      {
         return this.viewComponent as MainBuildingSelectionContent;
      }
   }
}

