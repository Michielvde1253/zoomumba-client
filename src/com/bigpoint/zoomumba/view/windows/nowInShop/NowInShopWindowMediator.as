package com.bigpoint.zoomumba.view.windows.nowInShop
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
   import com.bigpoint.zoomumba.model.windows.nowInShop.NowInShopWindowProxy;
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
   import windows.custom.nowInShop.NowInShopContent;
   import windows.custom.nowInShop.NowInShopWindow;
   
   public class NowInShopWindowMediator extends WindowMediator
   {
      public static var NAME:String = "NowInShopWindowMediator";
      
      private var globalEventProxy:GlobalEventProxy;
      
      private var paymentProxy:PaymentUrlProxy;
      
      private var nowInShopProxy:NowInShopWindowProxy;
      
      public function NowInShopWindowMediator(param1:NowInShopWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.globalEventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         this.paymentProxy = facade.retrieveProxy(PaymentUrlProxy.NAME) as PaymentUrlProxy;
         this.nowInShopProxy = facade.retrieveProxy(NowInShopWindowProxy.NAME) as NowInShopWindowProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.window.preloaderVisibility = true;
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.window.header.filePath = _loc2_.getHeaderPath("header_nowinshop");
         (this.window.header.parent as Group).top = -35;
         this.content.gradient_clock.text = "60:00";
         AssetLibrary.sendAssetToFunction("nowInShop",this.assetLoaded);
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
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Sprite = null;
         if(this.content)
         {
            _loc2_ = false;
            _loc3_ = 1;
            _loc4_ = 0;
            this.content.shop_img.source = param1.getEmbededBitmapData("shop");
            this.content.personal_img.source = param1.getEmbededBitmapData("personal");
            this.content.glow_img.source = param1.getEmbededBitmapData("glow");
            this.content.clock_red.source = param1.getEmbededBitmapData("Clock");
            this.content.clock_bg.source = param1.getEmbededBitmapData("HeaderBG");
            this.window.preloaderVisibility = false;
            if(Boolean(this.nowInShopProxy) && this.nowInShopProxy.nowInShopConfigVo.displayAnimals != null)
            {
               for each(_loc5_ in this.nowInShopProxy.nowInShopConfigVo.displayAnimals)
               {
                  _loc6_ = AssetIds.getPreviewAssetId(Categories.ANIMAL,_loc5_);
                  _loc7_ = new WrapedSprite(_loc6_,AssetConfig.DEFAULT_OBJECT_SPR,-1,70,70);
                  _loc7_.cacheAsBitmap = true;
                  TweenLite.to(_loc7_,0,{"glowFilter":{
                     "color":16777164,
                     "blurX":20,
                     "blurY":20,
                     "strength":1,
                     "alpha":1,
                     "quality":1
                  }});
                  if(this.content["special" + _loc3_])
                  {
                     _loc7_.x = 70 * _loc3_;
                     _loc4_ += 35;
                     (this.content["special" + _loc3_] as UIComponent).addChild(_loc7_);
                  }
                  _loc3_++;
               }
               this.content.HgroupItem.x = 250 - (_loc4_ - 35);
            }
            this.content.text_info.text = TextResourceModule.getText("zoo.window.infoLayers.specialShopItem.infotext");
            this.content.text_title.text = TextResourceModule.getText("zoo.window.infoLayers.specialShopItem.title");
            this.content.timebarGroup.top = 315;
            this.content.clockwoodGroup.top = 330;
         }
      }
      
      private function updateTimer() : void
      {
         var _loc1_:int = this.globalEventProxy.getGlobalEvent(EventTypes.NOW_IN_SHOP_EVENT).endDate - TimeManager.currentTime;
         if(_loc1_ < 0)
         {
            facade.sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.NOW_IN_SHOP));
         }
         if(this.content)
         {
            this.content.gradient_clock.text = TimeFormat.secondsToTimeString(_loc1_);
         }
      }
      
      private function get content() : NowInShopContent
      {
         return this.window.getContent(0) as NowInShopContent;
      }
      
      private function get window() : NowInShopWindow
      {
         return this.viewComponent as NowInShopWindow;
      }
      
      override public function dispose() : void
      {
         TimeManager.unregisterTickFunction(this.updateTimer);
      }
   }
}

