package com.bigpoint.zoomumba.view.windows.dailyLogin.items
{
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.DAILYLOGIN;
   import com.bigpoint.zoomumba.model.features.dailyLogin.vo.DailyLoginRewardVo;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import utils.GrayDisabler;
   
   public class DailyItem
   {
      public static const FUTURE_DAY:String = "FutureDay";
      
      public static const PAST_DAY:String = "PastDay";
      
      public static const CURRENT_DAY:String = "CurrentDay";
      
      private var _currentState:String;
      
      private var _active:Boolean;
      
      private var _iconsholder:MovieClip;
      
      private var _background:MovieClip;
      
      private var _asset:MovieClip;
      
      private var _day_txt:TextField;
      
      private var _amount_txt:TextField;
      
      private var _sign_mc:MovieClip;
      
      private var _itemVo:DailyLoginRewardVo;
      
      private var _rewardItemVo:DailyLoginRewardVo;
      
      public function DailyItem(param1:MovieClip, param2:DailyLoginRewardVo)
      {
         super();
         this._rewardItemVo = param2;
         this._asset = param1;
         this.init();
      }
      
      private function init() : void
      {
         this._day_txt = this._asset.day_txt;
         this._amount_txt = this._asset.amount_txt;
         this._iconsholder = this._asset.iconHolder_mc;
         this._background = this._asset.background_mc;
         this._sign_mc = this._asset.sign_mc;
         this._sign_mc = this._asset.sign_mc;
         if(this._rewardItemVo.step == DAILYLOGIN.MAX_CARDS)
         {
            this._asset.gotoAndStop("lastday");
         }
         else
         {
            this._asset.gotoAndStop("default");
         }
         var _loc1_:* = TextResourceModule.getText("zoo.window.dailylogin.day");
         _loc1_ = "<b>" + _loc1_.replace("%day%",this._rewardItemVo.step) + "</b>";
         this._day_txt.htmlText = _loc1_;
         this._amount_txt.htmlText = "<b>" + this._rewardItemVo.amount + "x" + "</b>";
         this.setImage();
      }
      
      public function setImage() : void
      {
         var _loc1_:String = AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this._rewardItemVo.type),this._rewardItemVo.id);
         var _loc2_:Sprite = new WrapedSprite(_loc1_,AssetConfig.DEFAULT_OBJECT_SPR,-1,25,25);
         _loc2_.x = _loc2_.width / 2;
         _loc2_.y = _loc2_.height / 2;
         this._iconsholder.addChild(_loc2_);
      }
      
      public function set state(param1:String) : void
      {
         this._currentState = param1;
         TweenLite.delayedCall(0.2,this.drawState);
      }
      
      private function drawState() : void
      {
         this._background = this._asset.background_mc;
         switch(this._currentState)
         {
            case FUTURE_DAY:
               GrayDisabler.enableIcon(this._background,false);
               GrayDisabler.enableIcon(this._iconsholder,false);
               GrayDisabler.enableIcon(this._sign_mc,false);
               GrayDisabler.enableIcon(this._amount_txt,false);
               GrayDisabler.enableIcon(this._day_txt,false);
               break;
            case PAST_DAY:
               break;
            case CURRENT_DAY:
               TweenLite.to(this._background,1,{"glowFilter":{
                  "color":16777113,
                  "blurX":10,
                  "blurY":10,
                  "strength":3,
                  "alpha":1
               }});
         }
      }
   }
}

