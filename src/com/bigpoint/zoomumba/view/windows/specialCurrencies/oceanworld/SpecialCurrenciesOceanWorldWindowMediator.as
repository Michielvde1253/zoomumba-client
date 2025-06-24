package com.bigpoint.zoomumba.view.windows.specialCurrencies.oceanworld
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.specialCurrencies.oceanworld.tabMediators.SpecialPearlsTabMediator;
   import com.bigpoint.zoomumba.view.windows.specialCurrencies.tabMediators.SpecialTrashTabMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.currencies.SpecialsCurrenciesContent;
   import windows.custom.currencies.SpecialsCurrenciesWindow;
   import windows.custom.currencies.tabs.CurrencyTabContent;
   import windows.custom.currencies.tabs.TrashTabContent;
   import windows.events.WindowCustomEvent;
   
   public class SpecialCurrenciesOceanWorldWindowMediator extends WindowMediator
   {
      public static const NAME:String = "SpecialCurrenciesOceanWorldWindowMediator";
      
      private var _lastTabMediator:String = null;
      
      public function SpecialCurrenciesOceanWorldWindowMediator(param1:SpecialsCurrenciesWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.window.getTabsGroup().selectedIndex = 0;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         (this.window.getContent() as SpecialsCurrenciesContent).tab1.label = TextResourceModule.getText("zoo.inventory.tabs.pearls");
         (this.window.getContent() as SpecialsCurrenciesContent).tab2.label = TextResourceModule.getText("zoo.inventory.tabs.trash");
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc2_.getHeaderPath("header_specialCurrency");
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         var event:WindowCustomEvent = param1;
         this.window.preloaderVisibility = true;
         if(this._lastTabMediator)
         {
            facade.removeMediator(this._lastTabMediator);
         }
         switch(event.contentClass)
         {
            case CurrencyTabContent:
               AssetLibrary.sendAssetToFunction("SpecialCurrenciesAssets",function(param1:SWFAsset):void
               {
                  window.preloaderVisibility = false;
                  facade.registerMediator(new SpecialPearlsTabMediator(window.getContent() as CurrencyTabContent,param1));
                  _lastTabMediator = SpecialPearlsTabMediator.NAME;
               });
               break;
            case TrashTabContent:
               AssetLibrary.sendAssetToFunction("SpecialCurrenciesAssets",function(param1:SWFAsset):void
               {
                  window.preloaderVisibility = false;
                  facade.registerMediator(new SpecialTrashTabMediator(window.getContent() as TrashTabContent,param1));
                  _lastTabMediator = SpecialTrashTabMediator.NAME;
               });
         }
      }
      
      private function get content() : SpecialsCurrenciesContent
      {
         return this.window.getContent() as SpecialsCurrenciesContent;
      }
      
      private function get window() : SpecialsCurrenciesWindow
      {
         return this.viewComponent as SpecialsCurrenciesWindow;
      }
      
      override public function dispose() : void
      {
         if(this._lastTabMediator)
         {
            facade.removeMediator(this._lastTabMediator);
            this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         }
      }
   }
}

