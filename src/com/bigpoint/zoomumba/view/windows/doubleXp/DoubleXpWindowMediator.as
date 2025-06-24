package com.bigpoint.zoomumba.view.windows.doubleXp
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.app.gameEvents.vo.EventTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.payment.PaymentUrlProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.doubleXp.DoubleXpWindowProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import mx.core.UIComponent;
   import spark.components.Group;
   import windows.custom.doubleXp.DoubleXpContent;
   import windows.custom.doubleXp.DoubleXpWindow;
   
   public class DoubleXpWindowMediator extends WindowMediator
   {
      public static var NAME:String = "DoubleXpWindowMediator";
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var paymentProxy:PaymentUrlProxy;
      
      private var doubleXpProxy:DoubleXpWindowProxy;
      
      public function DoubleXpWindowMediator(param1:DoubleXpWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.paymentProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         this.doubleXpProxy = facade.retrieveProxy(DoubleXpWindowProxy.NAME) as DoubleXpWindowProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc2_.getHeaderPath("header_doublexp");
         (this.window.header.parent as Group).top = -35;
         this.content.gradient_clock.text = "60:00";
         AssetLibrary.sendAssetToFunction("doubleXp",this.assetLoaded);
         TimeManager.registerTickFunction(this.updateTimer);
      }
      
      private function openBuy(param1:MouseEvent) : void
      {
         var _loc2_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         navigateToURL(new URLRequest(this.paymentProxy.paymentUrlVO.urlPay),"_blank");
         facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.DOUBLE_XP_WINDOW));
      }
      
      private function assetLoaded(param1:SWFAsset) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Sprite = null;
         if(this.content)
         {
            _loc2_ = false;
            _loc3_ = 1;
            this.content.header_bg.source = param1.getEmbededBitmapData("content");
            this.content.clock_red.source = param1.getEmbededBitmapData("Clock");
            this.content.clock_bg.source = param1.getEmbededBitmapData("HeaderBG");
            this.window.preloaderVisibility = false;
            if(Boolean(this.doubleXpProxy) && Boolean(this.doubleXpProxy.doubleXpConfigVo))
            {
               for each(_loc4_ in this.doubleXpProxy.doubleXpConfigVo.displayAnimals)
               {
                  _loc5_ = AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc4_);
                  _loc6_ = new WrapedSprite(_loc5_,AssetConfig.DEFAULT_OBJECT_SPR,-1,70,70);
                  _loc6_.cacheAsBitmap = true;
                  TweenLite.to(_loc6_,0,{"glowFilter":{
                     "color":16777164,
                     "blurX":20,
                     "blurY":20,
                     "strength":1,
                     "alpha":1,
                     "quality":1
                  }});
                  if(this.content["special" + _loc3_])
                  {
                     (this.content["special" + _loc3_] as UIComponent).left = 140 + 70 * _loc3_;
                     (this.content["special" + _loc3_] as UIComponent).addChild(_loc6_);
                  }
                  _loc2_ = true;
                  _loc3_++;
               }
            }
            if(_loc2_ == false)
            {
               this.content.text_xpinfo.text = TextResourceModule.getText("zoo.window.infoLayers.doublexp.allitems");
               this.content.timebarGroup.top = 315;
               this.content.clockwoodGroup.top = 330;
            }
            else
            {
               this.content.text_xpinfo.text = TextResourceModule.getText("zoo.window.infoLayers.doublexp.specialitems");
            }
         }
      }
      
      private function updateTimer() : void
      {
         var _loc1_:int = this.globalEventProxy.getGlobalEvent(EventTypes.DOUBLE_XP_EVENT).endDate - TimeManager.currentTime;
         if(_loc1_ < 0)
         {
            facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.DOUBLE_XP_WINDOW));
            _loc1_ = this.globalEventProxy.getGlobalEvent(EventTypes.TRIPLE_XP_EVENT).endDate - TimeManager.currentTime;
            if(_loc1_ < 0)
            {
               facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.TRIPLE_XP_WINDOW));
               return;
            }
            this.updateTimerView(_loc1_);
            return;
         }
         this.updateTimerView(_loc1_);
      }
      
      private function updateTimerView(param1:int) : void
      {
         if(this.content)
         {
            this.content.gradient_clock.text = TimeFormat.secondsToTimeString(param1);
         }
      }
      
      private function get content() : DoubleXpContent
      {
         return this.window.getContent(0) as DoubleXpContent;
      }
      
      private function get window() : DoubleXpWindow
      {
         return this.viewComponent as DoubleXpWindow;
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
   }
}

