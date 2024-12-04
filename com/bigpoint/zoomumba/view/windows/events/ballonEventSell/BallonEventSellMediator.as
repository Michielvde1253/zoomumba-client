package com.bigpoint.zoomumba.view.windows.events.ballonEventSell
{
   import buttons.extended.ButtonBuy;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.events.ballonEvent.BallonEventProxy;
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BallonEventVo;
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BoardgameDropPackVo;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.events.ballonEventSell.components.SellContainerItem;
   import com.bigpoint.zoomumba.view.windows.events.ballonEventSell.events.SellContainerEvent;
   import com.bigpoint.zoomumba.view.windows.events.boardgameEvent.BoardgameEventMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.display.MovieClip;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.events.ballonEventSell.BallonEventSellContent;
   import windows.custom.events.ballonEventSell.BallonEventSellWindow;
   
   public class BallonEventSellMediator extends WindowMediator
   {
      public static const NAME:String = "BallonEventSellMediator";
      
      private static const SELLCARD_MAX:int = 3;
      
      private var _dropPack:Vector.<BoardgameDropPackVo>;
      
      private var _sellContainer:Vector.<SellContainerItem>;
      
      private var _assets:SWFAsset;
      
      private var _asset:MovieClip;
      
      public function BallonEventSellMediator(param1:BallonEventSellWindow)
      {
         super(BoardgameEventMediator.NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this._dropPack = this.proxyData.dropPack;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.BALLON_EVENT_BUY_REAL,Note.BALLON_EVENT_BUY_REAL_FINISHED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.BALLON_EVENT_BUY_REAL:
               this.putCall(param1.getBody().dropPackVo as BoardgameDropPackVo);
               break;
            case Note.BALLON_EVENT_BUY_REAL_FINISHED:
               this.window.preloaderVisibility = false;
               handleWindowCloseClick();
         }
      }
      
      override public function init(param1:Object) : void
      {
         AssetLibrary.sendAssetToFunction("EventShopWindow",this.handleAssetsLoaded);
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         var _loc3_:int = 0;
         var _loc5_:ButtonBuy = null;
         var _loc6_:SellContainerItem = null;
         var _loc7_:MovieClip = null;
         var _loc9_:BoardgameDropPackVo = null;
         this._assets = param1;
         this._asset = param1.getEmbededMovieClip("asset");
         this._asset.buy_1_mc.iconHolder_mc.x = this._asset.buy_1_mc.iconHolder_mc.width;
         this._asset.buy_1_mc.iconHolder_mc.y = this._asset.buy_1_mc.height - this._asset.buy_1_mc.iconHolder_mc.height / 3;
         this._asset.buy_2_mc.iconHolder_mc.x = this._asset.buy_2_mc.iconHolder_mc.width;
         this._asset.buy_2_mc.iconHolder_mc.y = this._asset.buy_2_mc.height - this._asset.buy_2_mc.iconHolder_mc.height / 3;
         this._asset.buy_3_mc.iconHolder_mc.x = this._asset.buy_3_mc.iconHolder_mc.width;
         this._asset.buy_3_mc.iconHolder_mc.y = this._asset.buy_3_mc.height - this._asset.buy_3_mc.iconHolder_mc.height / 3;
         var _loc2_:MovieClip = param1.getEmbededMovieClip("icontop");
         var _loc4_:Vector.<BoardgameDropPackVo> = this.proxyData.dropPack;
         var _loc8_:CurrencyProxy = facade.getProxy(CurrencyProxy) as CurrencyProxy;
         this._sellContainer = new Vector.<SellContainerItem>();
         _loc3_ = 0;
         for each(_loc9_ in this.proxyData.dropPack)
         {
            _loc3_++;
            _loc7_ = this._asset["buy_" + _loc3_ + "_mc"] as MovieClip;
            _loc5_ = this.content["buyButton" + _loc3_];
            if(_loc7_)
            {
               _loc5_.enabled = _loc8_.getCurrency(UserResources.REAL_MONEY) >= _loc9_.currencyReal;
               _loc6_ = new SellContainerItem(_loc7_,_loc5_,_loc9_);
               _loc6_.addEventListener(SellContainerEvent.ON_BUY_ITEM,this.buyItem);
               this._sellContainer.push(_loc6_);
            }
         }
         (this.content.sellContent as UIComponent).addChild(this._asset);
         (this.content.front1 as UIComponent).addChild(_loc2_);
      }
      
      public function buyItem(param1:SellContainerEvent) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.dropPackVo = param1.data;
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),param1.data.currencyReal),new WindowParams("",null,"",null,Note.BALLON_EVENT_BUY_REAL,_loc2_)));
      }
      
      public function putCall(param1:BoardgameDropPackVo) : void
      {
         this.window.preloaderVisibility = true;
         var _loc2_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         _loc2_.callServer(NET.BOARDGAME_BUY,[param1.eventId,param1.packId]).addCallbackIfTrue(Note.BALLON_EVENT_BUY_REAL_FINISHED).sendNow();
      }
      
      private function get proxyData() : BallonEventVo
      {
         return this.ballonProxy.proxyData as BallonEventVo;
      }
      
      private function get ballonProxy() : BallonEventProxy
      {
         return facade.getProxy(BallonEventProxy) as BallonEventProxy;
      }
      
      private function get content() : BallonEventSellContent
      {
         return this.window.getContent() as BallonEventSellContent;
      }
      
      private function get window() : BallonEventSellWindow
      {
         return this.viewComponent as BallonEventSellWindow;
      }
   }
}

