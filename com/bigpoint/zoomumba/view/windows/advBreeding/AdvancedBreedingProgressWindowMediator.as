package com.bigpoint.zoomumba.view.windows.advBreeding
{
   import com.bigpoint.utils.custom.advSpots.AutomatorAdvFillableSpot;
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.advBreeding.progress.AdvancedBreedingProgressContent;
   import windows.custom.advBreeding.progress.AdvancedBreedingProgressWindow;
   
   public class AdvancedBreedingProgressWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdvancedBreedingProgressWindowMediator";
      
      private var _currentLoadStep:int = 0;
      
      private var _assets:Dictionary;
      
      private var labId:int = 0;
      
      private var labProxy:BreedingLabProxy;
      
      private var resourcesProxy:ResourcesProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var netProxy:NetProxy;
      
      public function AdvancedBreedingProgressWindowMediator(param1:AdvancedBreedingProgressWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.RESOURCES_UPDATED,Note.ADVANCED_BREEDING_ENABLE_BUTTON_ELIXIR,Note.ADVANCED_BREEDING_DISABLE_BUTTON_ELIXIR];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.RESOURCES_UPDATED:
               this.updateElixirCount();
               break;
            case Note.ADVANCED_BREEDING_ENABLE_BUTTON_ELIXIR:
               this.content.btnPerfume.enabled = true;
               break;
            case Note.ADVANCED_BREEDING_DISABLE_BUTTON_ELIXIR:
               this.content.btnPerfume.enabled = false;
         }
      }
      
      override public function onRegister() : void
      {
         this.netProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
      }
      
      override public function init(param1:Object) : void
      {
         if(this.content == null)
         {
            return;
         }
         this.labId = param1 as int;
         this.labProxy = facade.retrieveProxy(BuildingMediator.getFullName(BreedingLabProxy.NAME,Categories.BREEDING_LAB,this.labId)) as BreedingLabProxy;
         this.resourcesProxy = facade.retrieveProxy(ResourcesProxy.NAME) as ResourcesProxy;
         this.content.addEventListener("perfumeClicked",this.handlePerfumClick);
         this.content.header.text = TextResourceModule.getText("zoo.advancedBreed.layer.inProgress.title");
         this.content.textMain.text = TextResourceModule.getText("zoo.advancedBreed.layer.inProgress.text");
         this.content.textUp.text = TextResourceModule.getText("zoo.advancedBreed.layer.inProgress.time");
         this.content.title2.text = TextResourceModule.getText("zoo.advancedBreed.layer.elixir.title");
         this.content.textDown.text = TextResourceModule.getText("zoo.advancedBreed.layer.elixir.text");
         this.content.btnPerfume.label = TextResourceModule.getText("zoo.advancedBreed.button.elixir");
         this.updateTimer();
         TimeManager.registerTickFunction(this.updateTimer);
         this.window.preloaderVisibility = true;
         this._assets = new Dictionary(true);
         this._currentLoadStep = 0;
         AssetLibrary.sendAssetToFunction("ShadowIconSmall",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SoniaElixirSmall",this.handleAssets);
         AssetLibrary.sendAssetToFunction("resource_preview_11",this.handleAssets);
         AssetLibrary.sendAssetToFunction("MaleFemaleIcon",this.handleAssets);
         this.content.countdownText.text = TimeFormat.secondsToTimeString(this.remainingTime);
         this.updateElixirCount();
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "ShadowIconSmall":
            case "ShadowIconSmall.swf":
               this._assets["ShadowIconSmall"] = param1.getEmbededBitmapData("ShadowIconSmall");
               break;
            case "SoniaElixirSmall":
            case "SoniaElixirSmall.swf":
               this._assets["SoniaElixirSmall"] = param1.getEmbededBitmapData("SoniaElixirSmall");
               break;
            case "MaleFemaleIcon":
            case "MaleFemaleIcon.swf":
               this._assets["MaleFemaleIcon"] = param1.getEmbededSprite("MaleFemaleIcon");
               break;
            case "resource_preview_11":
            case "resource_preview_11.swf":
               this._assets["elixir_preview"] = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         }
         if(++this._currentLoadStep == 4)
         {
            this.start();
         }
      }
      
      private function start() : void
      {
         var _loc1_:Vector.<int> = null;
         this.window.preloaderVisibility = false;
         if(this.content)
         {
            this.content.sonia.displayClass = this._assets["SoniaElixirSmall"];
            this.content.shadow1.displayClass = this._assets["ShadowIconSmall"];
            this.content.sprite1.displayClass = this._assets["MaleFemaleIcon"];
            this.content.shadow2.displayClass = this._assets["ShadowIconSmall"];
            this.content.sprite2.displayClass = this._assets["elixir_preview"];
            _loc1_ = new <int>[this.itemConfigProxy.getMaleAnimalData(this.labProxy.lab.usedItemId1).itemId,this.itemConfigProxy.getFemaleAnimalData(this.labProxy.lab.usedItemId2).itemId];
            AutomatorAdvFillableSpot.fillAnimals(_loc1_,this.itemConfigProxy,this.content,"spotAnimal",[AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_MALE,AutomatorAdvFillableSpot.STATE_ONLY_DISPLAY_ANIMAL_FEMALE]);
         }
      }
      
      private function updateTimer() : void
      {
         this.content.countdownText.text = TimeFormat.secondsToTimeString(this.remainingTime);
         if(this.remainingTime <= 0)
         {
            TimeManager.unregisterTickFunction(this.updateTimer);
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_PROGRESS_WINDOW));
         }
      }
      
      private function updateElixirCount() : void
      {
         this.content.elixirAmount.value = this.resourcesProxy.elixir;
      }
      
      private function handlePerfumClick(param1:Event) : void
      {
         if(this.resourcesProxy.elixir > 0)
         {
            sendNotification(Note.ADVANCED_BREEDING_DISABLE_BUTTON_ELIXIR);
            this.netProxy.callServer(NET.USE_ELIXIR,[this.labId]).addCallbackIfTrue(Note.ADVANCED_BREEDING_ENABLE_BUTTON_ELIXIR).addCallbackIfFalse(Note.ADVANCED_BREEDING_ENABLE_BUTTON_ELIXIR).sendNow();
         }
         else
         {
            sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_PROGRESS_WINDOW));
            sendNotification(SHOP.OPEN_SHOP_ON_TAB,ShopTabs.RESOURCES);
         }
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
         this.content.removeEventListener("perfumeClicked",this.handlePerfumClick);
      }
      
      private function get remainingTime() : int
      {
         return this.labProxy.lab.end - TimeManager.currentTime as int;
      }
      
      private function get content() : AdvancedBreedingProgressContent
      {
         return this.window.getContent() as AdvancedBreedingProgressContent;
      }
      
      private function get window() : AdvancedBreedingProgressWindow
      {
         return this.viewComponent as AdvancedBreedingProgressWindow;
      }
   }
}

