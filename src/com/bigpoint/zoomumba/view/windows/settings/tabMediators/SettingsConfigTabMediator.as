package com.bigpoint.zoomumba.view.windows.settings.tabMediators
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.ResourceLoaderProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import com.bigpoint.zoomumba.model.app.settings.vo.AppSettingsVO;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.settings.tabs.SettingsConfigTabContent;
   
   public class SettingsConfigTabMediator extends Mediator
   {
      public static const NAME:String = "SettingsConfigTabMediator";
      
      private var appSettingsProxy:AppSettingsProxy;
      
      private var resourceLoaderProxy:ResourceLoaderProxy;
      
      public function SettingsConfigTabMediator(param1:SettingsConfigTabContent)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.init();
      }
      
      private function init() : void
      {
         this.appSettingsProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         this.resourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         this.content.graphicTitleText.text = TextResourceModule.getText("zoo.window.settings.quality.title");
         this.content.qualityOptText.text = TextResourceModule.getText("zoo.window.settings.quality.info");
         this.content.qualityLRadio.label = TextResourceModule.getText("zoo.window.settings.quality.low");
         this.content.qualityMRadio.label = TextResourceModule.getText("zoo.window.settings.quality.middle");
         this.content.qualityHRadio.label = TextResourceModule.getText("zoo.window.settings.quality.high");
         this.content.tooltipOptText.text = TextResourceModule.getText("zoo.window.settings.title.tooltipps");
         this.content.tooltipONRadio.label = TextResourceModule.getText("zoo.window.settings.on");
         this.content.tooltipOFFRadio.label = TextResourceModule.getText("zoo.window.settings.off");
         this.content.visitorsOptText.text = TextResourceModule.getText("zoo.window.settings.title.visitors");
         this.content.visitorsONRadio.label = TextResourceModule.getText("zoo.window.settings.on");
         this.content.visitorsOFFRadio.label = TextResourceModule.getText("zoo.window.settings.off");
         this.content.wishesOptText.text = TextResourceModule.getText("zoo.window.settings.title.visitorWishes");
         this.content.wishesONRadio.label = TextResourceModule.getText("zoo.window.settings.on");
         this.content.wishesOFFRadio.label = TextResourceModule.getText("zoo.window.settings.off");
         this.content.animationTitleText.text = TextResourceModule.getText("zoo.window.settings.anim.title");
         this.content.animationsOptText.text = TextResourceModule.getText("zoo.window.settings.anim.info");
         this.content.soundTitleText.text = TextResourceModule.getText("zoo.window.settings.title.sound");
         this.content.soundEffectsOptText.text = TextResourceModule.getText("zoo.window.settings.title.sound.effects");
         this.content.soundEffectsONRadio.label = TextResourceModule.getText("zoo.window.settings.on");
         this.content.soundEffectsOFFRadio.label = TextResourceModule.getText("zoo.window.settings.off");
         this.content.musicOptText.text = TextResourceModule.getText("zoo.window.settings.title.sound.background");
         this.content.musicONRadio.label = TextResourceModule.getText("zoo.window.settings.on");
         this.content.musicOFFRadio.label = TextResourceModule.getText("zoo.window.settings.off");
         this.content.localStorageOptText.text = TextResourceModule.getText("zoo.window.settings.saveAssets");
         this.content.localStorageONRadio.label = TextResourceModule.getText("zoo.window.settings.on");
         this.content.localStorageOFFRadio.label = TextResourceModule.getText("zoo.window.settings.off");
         this.content.qualityRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.tooltipRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.visitorsRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.wishesRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.soundEffectRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.musicRadioGroup.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.animationsSlider.addEventListener(Event.CHANGE,this.optionChanged);
         this.content.localStorageRadioGroup.addEventListener(Event.CHANGE,this.handleLocalStoragedOptionChanged);
         this.content.animationsSlider.minimum = 0;
         this.content.animationsSlider.maximum = 20;
         this.content.animationsSlider.stepSize = 5;
         this.content.animationsSlider.snapInterval = 5;
         this.content.animationsSlider.showDataTip = true;
         this.content.localStorageOFFRadio.enabled = this.content.localStorageONRadio.enabled = this.resourceLoaderProxy.localStoragedEnabled;
         this.content.localStorageOFFRadio.alpha = this.content.localStorageONRadio.alpha = this.resourceLoaderProxy.localStoragedEnabled ? 1 : 0.5;
         this.populateValues();
         sendNotification(Note.SETTINGS_TAB_LOADED);
      }
      
      private function populateValues() : void
      {
         this.content.qualityRadioGroup.selectedValue = this.getQualityToInt(this.appSettingsProxy.quality);
         this.content.tooltipRadioGroup.selectedValue = this.appSettingsProxy.hasTooltips;
         this.content.visitorsRadioGroup.selectedValue = this.appSettingsProxy.hasVisitors;
         this.content.wishesRadioGroup.selectedValue = this.appSettingsProxy.hasVisitorWishes;
         this.content.soundEffectRadioGroup.selectedValue = this.appSettingsProxy.hasSoundEffects;
         this.content.musicRadioGroup.selectedValue = this.appSettingsProxy.hasBackgroundSounds;
         this.content.animationsSlider.value = this.appSettingsProxy.animationLevel;
         if(this.resourceLoaderProxy.hasUserAnsweredPermissionForLocalCache)
         {
            this.content.localStorageRadioGroup.selectedValue = int(this.resourceLoaderProxy.hasUserPermissionForLocalCache);
         }
      }
      
      private function getQualityToInt(param1:String) : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case "h":
               _loc2_ = 2;
               break;
            case "m":
               _loc2_ = 1;
               break;
            case "l":
               _loc2_ = 0;
         }
         return _loc2_;
      }
      
      private function getQualityToString(param1:int) : String
      {
         var _loc2_:String = "h";
         switch(param1)
         {
            case 2:
               _loc2_ = "h";
               break;
            case 1:
               _loc2_ = "m";
               break;
            case 0:
               _loc2_ = "l";
         }
         return _loc2_;
      }
      
      private function optionChanged(param1:Event) : void
      {
         var _loc2_:AppSettingsVO = new AppSettingsVO();
         _loc2_.q = this.getQualityToString(this.content.qualityRadioGroup.selectedValue as int);
         _loc2_.t = this.content.tooltipRadioGroup.selectedValue as int;
         _loc2_.v = this.content.visitorsRadioGroup.selectedValue as int;
         _loc2_.w = this.content.wishesRadioGroup.selectedValue as int;
         _loc2_.se = this.content.soundEffectRadioGroup.selectedValue as int;
         _loc2_.sb = this.content.musicRadioGroup.selectedValue as int;
         _loc2_.a = this.content.animationsSlider.value as int;
         sendNotification(Note.UPDATE_APP_SETTINGS,_loc2_);
      }
      
      private function handleLocalStoragedOptionChanged(param1:Event) : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRemove() : void
      {
         if(this.content.qualityRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.qualityRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.tooltipRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.tooltipRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.visitorsRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.visitorsRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.wishesRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.wishesRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.soundEffectRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.soundEffectRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.musicRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.musicRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.animationsSlider.hasEventListener(Event.CHANGE))
         {
            this.content.animationsSlider.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         if(this.content.localStorageRadioGroup.hasEventListener(Event.CHANGE))
         {
            this.content.localStorageRadioGroup.removeEventListener(Event.CHANGE,this.optionChanged);
         }
         this.resourceLoaderProxy.hasUserPermissionForLocalCache = Boolean(this.content.localStorageRadioGroup.selectedValue);
         sendNotification(Note.SERVER_SAVE_APP_SETTINGS);
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      private function get content() : SettingsConfigTabContent
      {
         return this.viewComponent as SettingsConfigTabContent;
      }
   }
}

