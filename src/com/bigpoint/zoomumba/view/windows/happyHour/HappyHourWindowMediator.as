package com.bigpoint.zoomumba.view.windows.happyHour
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.GlobalEventVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import spark.components.Group;
   import windows.custom.happyHour.HappyHourContent;
   import windows.custom.happyHour.HappyHourWindow;
   
   public class HappyHourWindowMediator extends WindowMediator
   {
      public static var NAME:String = "HappyHourWindowMediator";
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var paymentProxy:PaymentUrlProxy;
      
      public function HappyHourWindowMediator(param1:HappyHourWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.paymentProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:String = "";
         var _loc3_:int = 100;
         this.window.preloaderVisibility = true;
         var _loc4_:GlobalEventVO = this.globalEventProxy.getGlobalEvent(EventTypes.HAPPY_HOUR_EVENT);
         if(_loc4_.affectedActionObject.percent)
         {
            _loc3_ = parseInt(String(_loc4_.affectedActionObject.percent));
         }
         TimeManager.registerTickFunction(this.updateTimer);
         var _loc5_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc5_.getHeaderPath("header_happyHour");
         (this.window.header.parent as Group).top = -35;
         _loc2_ = TextResourceModule.getText("zoo.window.infoLayers.payment.happyHourHeader");
         _loc2_ = _loc2_.replace("%percent%",_loc3_.toString());
         this.content.gradient_header.text = _loc2_;
         this.content.text_main.text = TextResourceModule.getText("zoo.window.infoLayers.payment.happyHourBody");
         this.content.text_topic_1.text = TextResourceModule.getText("zoo.window.infoLayers.payment.happyHourBullet_1");
         _loc2_ = TextResourceModule.getText("zoo.window.infoLayers.payment.happyHourBullet_2");
         _loc2_ = _loc2_.replace("%extradollar%",(100 + _loc3_).toString());
         this.content.text_topic_2.text = _loc2_;
         this.content.text_topic_3.text = TextResourceModule.getText("zoo.window.infoLayers.payment.happyHourBullet_3");
         this.content.text_end.text = TextResourceModule.getText("zoo.window.infoLayers.payment.happyHourFin");
         this.content.gradient_clock.text = "60:00";
         this.content.buyButton.label = TextResourceModule.getText("zoo.shop.buyitem");
         this.content.buyButton.addEventListener(MouseEvent.CLICK,this.openBuy);
         AssetLibrary.sendAssetToFunction("HappyHour",this.assetLoaded);
      }
      
      private function openBuy(param1:MouseEvent) : void
      {
         var _loc2_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         if(this.paymentProxy.paymentUrlVO.ajaxPay.length > 2)
         {
            ExternalInterface.call("faLoadPage(\'" + this.paymentProxy.paymentUrlVO.ajaxPay + "\')");
         }
         else
         {
            navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlPay),"_blank");
         }
         facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.HAPPY_HOUR_WINDOW));
      }
      
      private function assetLoaded(param1:SWFAsset) : void
      {
         if(this.content)
         {
            this.content.sonia.source = param1.getEmbededBitmapData("Sonia");
            this.content.header_bg.source = param1.getEmbededBitmapData("HeaderBG");
            this.content.star_1.source = param1.getEmbededBitmapData("Star");
            this.content.star_2.source = param1.getEmbededBitmapData("Star");
            this.content.star_3.source = param1.getEmbededBitmapData("Star");
            this.content.clock_red.source = param1.getEmbededBitmapData("Clock");
            this.window.preloaderVisibility = false;
         }
      }
      
      private function updateTimer() : void
      {
         var _loc1_:int = this.globalEventProxy.getGlobalEvent(EventTypes.HAPPY_HOUR_EVENT).endDate - TimeManager.currentTime;
         if(_loc1_ < 0)
         {
            facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.HAPPY_HOUR_WINDOW));
         }
         this.content.gradient_clock.text = TimeFormat.secondsToTimeString(_loc1_);
      }
      
      private function get content() : HappyHourContent
      {
         return this.window.getContent(0) as HappyHourContent;
      }
      
      private function get window() : HappyHourWindow
      {
         return this.viewComponent as HappyHourWindow;
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
   }
}

