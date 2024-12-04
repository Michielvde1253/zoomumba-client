package com.bigpoint.zoomumba.view.windows.advBreeding
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.playfield.advBreed.BreedingLabProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.advancedBreeding.AdvancedBreedingWindowInitParams;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.steps.AdvancedBreedingStep1Mediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.steps.AdvancedBreedingStep2Mediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.steps.AdvancedBreedingStep3Mediator;
   import com.bigpoint.zoomumba.view.windows.advBreeding.steps.AdvancedBreedingStep4Mediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.advBreeding.AdvancedBreedingWindow;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep1;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep2;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep3;
   import windows.custom.advBreeding.steps.AdvancedBreedingStep4;
   import windows.events.WindowCustomEvent;
   
   public class AdvancedBreedingWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AdvancedBreedingWindowMediator";
      
      private const STEPS_CLASS_REF:Array = [AdvancedBreedingStep1,AdvancedBreedingStep2,AdvancedBreedingStep3,AdvancedBreedingStep4];
      
      private var netHelperProxy:NetHelperProxy;
      
      private var _lastMediator:String = null;
      
      private var _currentStep:int = 0;
      
      private var _showWarning:Boolean = false;
      
      private var _currentLoadStep:int = 0;
      
      private var _assets:Dictionary;
      
      private var breedingProxy:BreedingLabProxy;
      
      private var _windowParams:AdvancedBreedingWindowInitParams;
      
      public function AdvancedBreedingWindowMediator(param1:AdvancedBreedingWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.ADVANCED_BREEDING_SWITCH_STEP];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.ADVANCED_BREEDING_SWITCH_STEP:
               this._currentStep = param1.getBody() as int;
               this.window.content = this.STEPS_CLASS_REF[this._currentStep];
         }
      }
      
      override public function onRegister() : void
      {
         this.netHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this._currentLoadStep = 0;
         this._showWarning = false;
         this._windowParams = param1 as AdvancedBreedingWindowInitParams;
         this._currentStep = this._windowParams.currentStep;
         this._assets = new Dictionary(true);
         this.breedingProxy = facade.retrieveProxy(BreedingLabProxy.NAME + "_" + this._windowParams.categoryId + "_" + this._windowParams.uniqueId) as BreedingLabProxy;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleContentChanged);
         this.window.header.filePath = this.netHelperProxy.getHeaderPath("header_breedingLab");
         AssetLibrary.sendAssetToFunction("BubbleBig",this.handleAssets);
         AssetLibrary.sendAssetToFunction("PatternBreedingWood",this.handleAssets);
         AssetLibrary.sendAssetToFunction("SoniaElixirMed",this.handleAssets);
      }
      
      private function handleAssets(param1:SWFAsset) : void
      {
         switch(param1.id)
         {
            case "BubbleBig":
            case "BubbleBig.swf":
               this._assets["BubbleBig"] = param1.getEmbededBitmapData("BubbleBig");
               break;
            case "SoniaElixirMed":
            case "SoniaElixirMed.swf":
               this._assets["SoniaElixirMed"] = param1.getEmbededBitmapData("SoniaElixirMed");
               break;
            case "PatternBreedingWood":
            case "PatternBreedingWood.swf":
               this.window.backgroundPattern = param1.getEmbededObject("PatternBreedingWood").constructor;
         }
         if(++this._currentLoadStep == 3)
         {
            this.window.content = this.STEPS_CLASS_REF[this._currentStep];
         }
      }
      
      private function handleContentChanged(param1:WindowCustomEvent) : void
      {
         var _loc2_:* = undefined;
         this.window.preloaderVisibility = true;
         if(this._lastMediator)
         {
            facade.removeMediator(this._lastMediator);
         }
         switch(param1.contentClass)
         {
            case this.STEPS_CLASS_REF[0]:
               _loc2_ = this.window.getContent() as AdvancedBreedingStep1;
               _loc2_.bubble.displayClass = this._assets["BubbleBig"];
               _loc2_.sonia.displayClass = this._assets["SoniaElixirMed"];
               this._currentStep = 0;
               facade.registerMediator(new AdvancedBreedingStep1Mediator(this.window,_loc2_,this._windowParams));
               this._lastMediator = AdvancedBreedingStep1Mediator.NAME;
               break;
            case this.STEPS_CLASS_REF[1]:
               _loc2_ = this.window.getContent() as AdvancedBreedingStep2;
               _loc2_.bubble.displayClass = this._assets["BubbleBig"];
               _loc2_.sonia.displayClass = this._assets["SoniaElixirMed"];
               this._showWarning = true;
               this._currentStep = 1;
               facade.registerMediator(new AdvancedBreedingStep2Mediator(this.window,_loc2_,this._windowParams));
               this._lastMediator = AdvancedBreedingStep2Mediator.NAME;
               break;
            case this.STEPS_CLASS_REF[2]:
               _loc2_ = this.window.getContent() as AdvancedBreedingStep3;
               _loc2_.bubble.displayClass = this._assets["BubbleBig"];
               _loc2_.sonia.displayClass = this._assets["SoniaElixirMed"];
               this._showWarning = true;
               this._currentStep = 2;
               facade.registerMediator(new AdvancedBreedingStep3Mediator(this.window,_loc2_,this._windowParams));
               this._lastMediator = AdvancedBreedingStep3Mediator.NAME;
               break;
            case this.STEPS_CLASS_REF[3]:
               _loc2_ = this.window.getContent() as AdvancedBreedingStep4;
               _loc2_.bubble.displayClass = this._assets["BubbleBig"];
               _loc2_.sonia.displayClass = this._assets["SoniaElixirMed"];
               this._showWarning = true;
               this._currentStep = 3;
               facade.registerMediator(new AdvancedBreedingStep4Mediator(this.window,_loc2_,this._windowParams));
               this._lastMediator = AdvancedBreedingStep4Mediator.NAME;
         }
      }
      
      override public function dispose() : void
      {
         if(this._lastMediator)
         {
            facade.removeMediator(this._lastMediator);
            this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleContentChanged);
         }
         this.breedingProxy.dispose();
         this._assets = null;
      }
      
      override protected function handleWindowCloseClick(param1:WindowCustomEvent = null) : void
      {
         if(this._showWarning)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.window.infoLayers.breedInInventory.title"),TextResourceModule.getText("zoo.advancedBreed.layer.abort")),new WindowParams("",null,"",null,WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.ADVANCED_BREEDING_WINDOW))));
         }
         else
         {
            super.handleWindowCloseClick(param1);
         }
      }
      
      private function get window() : AdvancedBreedingWindow
      {
         return this.viewComponent as AdvancedBreedingWindow;
      }
   }
}

