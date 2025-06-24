package com.bigpoint.zoomumba.view.windows.events.ballonEventSell.components
{
   import buttons.extended.ButtonBuy;
   import com.bigpoint.utils.ItemTypeHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.events.ballonEvent.vo.BoardgameDropPackVo;
   import com.bigpoint.zoomumba.view.windows.events.ballonEventSell.events.SellContainerEvent;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class SellContainerItem extends EventDispatcher
   {
      private var _packageVo:BoardgameDropPackVo;
      
      private var _asset:MovieClip;
      
      private var _button:ButtonBuy;
      
      private var amount_txt:TextField;
      
      private var background_mc:MovieClip;
      
      private var iconHolder_mc:MovieClip;
      
      public function SellContainerItem(param1:MovieClip, param2:ButtonBuy, param3:BoardgameDropPackVo)
      {
         super();
         this._packageVo = param3;
         this._button = param2;
         this._asset = param1;
         this._asset.visible = false;
         this._button.visible = false;
         this.init();
         this.initVo();
      }
      
      private function init() : void
      {
         this.background_mc = this._asset.background_mc;
         this.iconHolder_mc = this._asset.iconHolder_mc;
         this.amount_txt = this._asset.amount_txt;
      }
      
      private function initVo() : void
      {
         var _loc1_:String = null;
         var _loc2_:Sprite = null;
         if(this._packageVo)
         {
            _loc1_ = AssetIds.getPreviewAssetId(ItemTypeHelper.typeToCategory(this._packageVo.type),this._packageVo.itemId);
            _loc2_ = new WrapedSprite(_loc1_,AssetConfig.DEFAULT_OBJECT_SPR,-1,25,25);
            this.iconHolder_mc.addChild(_loc2_);
            this.amount_txt.htmlText = "<b>" + String(this._packageVo.amount) + "x" + "</b>";
            this._button.label.setDisplaySource(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.USER,UserResources.REAL_MONEY),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,20));
            this._button.label.value = this._packageVo.currencyReal;
            if(this._button.enabled)
            {
               this._button.addEventListener(MouseEvent.CLICK,this.onBuyItem,false,0,true);
            }
            this._asset.visible = true;
            this._button.visible = true;
         }
      }
      
      private function onBuyItem(param1:MouseEvent) : void
      {
         dispatchEvent(new SellContainerEvent(SellContainerEvent.ON_BUY_ITEM,this._packageVo));
      }
   }
}

