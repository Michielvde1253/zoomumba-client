package com.bigpoint.zoomumba.view.windows.dailyLogin
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.DAILYLOGIN;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.dailyLogin.DailyLoginProxy;
   import com.bigpoint.zoomumba.model.features.dailyLogin.vo.DailyLoginRewardVo;
   import com.bigpoint.zoomumba.model.features.dailyLogin.vo.DailyLoginVo;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.dailyLogin.items.DailyItem;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import mx.core.UIComponent;
   import windows.custom.dailyLogin.DailyLoginContent;
   import windows.custom.dailyLogin.DailyLoginWindow;
   
   public class DailyLoginMediator extends WindowMediator
   {
      public static const NAME:String = "DailyLoginMediator";
      
      private var _assets:SWFAsset;
      
      private var _mainAsset:MovieClip;
      
      private var _front1Asset:Sprite;
      
      private var _front2Asset:Sprite;
      
      private var _front3Asset:Sprite;
      
      private var _items:Vector.<DailyItem>;
      
      public function DailyLoginMediator(param1:DailyLoginWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         if(this._mainAsset == null)
         {
            this.window.preloaderVisibility = true;
            AssetLibrary.sendAssetToFunction(DAILYLOGIN.DAILYLOGIN_ASSET_NAME,this.handleAssetsLoaded);
         }
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:int = 0;
         var _loc4_:DailyItem = null;
         var _loc5_:DailyLoginRewardVo = null;
         var _loc7_:String = null;
         var _loc8_:UIComponent = null;
         var _loc9_:UIComponent = null;
         var _loc10_:UIComponent = null;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Sprite = null;
         var _loc6_:DailyLoginVo = this.dailyLoginProxy.proxyData;
         if(this.content)
         {
            if(param1.id.search(DAILYLOGIN.DAILYLOGIN_ASSET_NAME) != -1)
            {
               this._assets = param1;
               this._mainAsset = param1.getEmbededMovieClip("main");
               this._front1Asset = param1.getEmbededSprite("front1");
               this._front2Asset = param1.getEmbededSprite("front2");
               _loc8_ = this.content.dailyLogin;
               _loc8_.addChild(this._mainAsset);
               _loc9_ = this.content.front1;
               _loc9_.addChild(this._front1Asset);
               _loc10_ = this.content.front2;
               _loc10_.addChild(this._front2Asset);
               _loc9_.x = 549;
               _loc9_.y = 144;
               _loc10_.x = 40;
               _loc10_.y = 30;
               this._items = new Vector.<DailyItem>();
               _loc11_ = 1;
               while(_loc11_ < DAILYLOGIN.MAX_CARDS + 1)
               {
                  _loc2_ = this._mainAsset["prev_day" + String(_loc11_) + "_mc"];
                  _loc5_ = this.getRewardItemVoByStep(_loc11_);
                  if(Boolean(_loc2_) && Boolean(_loc5_))
                  {
                     _loc4_ = new DailyItem(_loc2_,_loc5_);
                     if(this.dailyLoginProxy.proxyData.countLogin == _loc5_.step)
                     {
                        _loc4_.state = DailyItem.CURRENT_DAY;
                        _loc12_ = AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(_loc5_.type),_loc5_.id);
                        _loc13_ = new WrapedSprite(_loc12_,AssetConfig.DEFAULT_OBJECT_SPR,-1,25,25);
                        this._mainAsset.reward_mc.iconHolder_mc.x += _loc13_.width;
                        this._mainAsset.reward_mc.iconHolder_mc.y += _loc13_.height;
                        this._mainAsset.reward_mc.iconHolder_mc.addChild(_loc13_);
                        this._mainAsset.reward_mc.amount_txt.htmlText = "<b>" + _loc5_.amount + "x" + "</b>";
                     }
                     else if(this.dailyLoginProxy.proxyData.countLogin > _loc5_.step)
                     {
                        _loc4_.state = DailyItem.PAST_DAY;
                     }
                     else
                     {
                        _loc4_.state = DailyItem.FUTURE_DAY;
                     }
                     this._items.push(_loc4_);
                  }
                  _loc11_++;
               }
               _loc7_ = TextResourceModule.getText("zoo.window.dailylogin.info");
               this._mainAsset.info_txt.htmlText = "<b>" + _loc7_ + "</b>";
               _loc7_ = TextResourceModule.getText("zoo.window.dailylogin.title");
               this._mainAsset.txt_title.htmlText = "<b>" + _loc7_ + "</b>";
               _loc7_ = TextResourceModule.getText("zoo.window.dailylogin.reward");
               this._mainAsset.reward_mc.reward_txt.htmlText = "<b>" + _loc7_ + "</b>";
            }
            this.window.preloaderVisibility = false;
         }
      }
      
      private function getRewardItemVoByStep(param1:int) : DailyLoginRewardVo
      {
         var _loc2_:DailyLoginRewardVo = null;
         for each(_loc2_ in this.dailyLoginProxy.proxyData.rewards)
         {
            if(_loc2_.step == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get dailyLoginProxy() : DailyLoginProxy
      {
         return facade.getProxy(DailyLoginProxy) as DailyLoginProxy;
      }
      
      private function get content() : DailyLoginContent
      {
         return this.window.getContent() as DailyLoginContent;
      }
      
      private function get window() : DailyLoginWindow
      {
         return this.viewComponent as DailyLoginWindow;
      }
   }
}

