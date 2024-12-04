package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class NewBuilding extends Building
   {
      private var iconHolder:Sprite = new Sprite();
      
      private var iconBitmap:Bitmap = new Bitmap(null,PixelSnapping.NEVER,true);
      
      public function NewBuilding(param1:Notifier, param2:Sprite, param3:int, param4:int, param5:int, param6:int, param7:int)
      {
         super(param1,param2,param3);
         _category = param5;
         this.uniqueId = param4;
         this.mouseChildren = true;
         this.mouseEnabled = true;
         this.itemHeight = param7;
         this.itemWidth = param6;
         this.iconHolder.addChild(this.iconBitmap);
         this.mouseEnabled = false;
         this.addEventListener(MouseEvent.CLICK,this.handleInternalClicked);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.handleInternalMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.handleInternalMouseOut);
         this.loadAsset();
      }
      
      public function get NAME() : String
      {
         return "NewBuilding_" + Math.random() * 16777215;
      }
      
      final public function get EVENT_NAME_CLICK() : String
      {
         return this.NAME + "Clicked";
      }
      
      final public function get EVENT_NAME_STAT_ICON_OVER() : String
      {
         return this.NAME + "MouseOver";
      }
      
      final public function get EVENT_NAME_STAT_ICON_OUT() : String
      {
         return this.NAME + "MouseOut";
      }
      
      protected function loadAsset() : void
      {
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.handleAsset);
      }
      
      private function handleInternalClicked(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case activeZone:
            case this.iconHolder:
               dispatchEvent(new Event(this.EVENT_NAME_CLICK));
         }
      }
      
      private function handleInternalMouseOver(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.iconHolder:
               dispatchEvent(new MouseEvent(this.EVENT_NAME_STAT_ICON_OVER,true,false,0,0,this.iconHolder));
               super.handleMouseOver(param1);
               break;
            case activeZone:
               super.handleMouseOver(param1);
         }
      }
      
      private function handleInternalMouseOut(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.iconHolder:
               dispatchEvent(new MouseEvent(this.EVENT_NAME_STAT_ICON_OUT,true,false,0,0,this.iconHolder));
               super.handleMouseOut(param1);
               break;
            case activeZone:
               super.handleMouseOut(param1);
         }
      }
      
      protected function handleAsset(param1:SWFAsset) : void
      {
         if(!_isDisposed)
         {
            if(_currentStateId == 0)
            {
               skin = param1.getEmbededMovieClip("ObjectMC");
            }
            else
            {
               skin = param1.getEmbededMovieClip("ObjectState" + _currentStateId + "MC");
            }
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            this.updateView();
         }
      }
      
      override protected function updateView() : void
      {
         if(skin)
         {
            if(!this.contains(skin))
            {
               this.addChild(skin);
            }
            skin.gotoAndStop("zoom_" + String(_zoomlevel));
            if(this._rotatePos == ItemAbstract.ROTATION_270)
            {
               this.skin.scaleX = -1;
            }
            else if(this._rotatePos == ItemAbstract.ROTATION_0)
            {
               this.skin.scaleX = 1;
            }
         }
         if(this.iconBitmap.bitmapData)
         {
            this.iconBitmap.x = -this.iconBitmap.width * 0.5;
            this.iconBitmap.y = -this.iconBitmap.height * 0.5;
         }
         super.updateView();
         this.updateInactiveIcon();
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         super.updateState(param1,param2);
         if(!this.contains(this.iconHolder))
         {
            this.addChild(this.iconHolder);
         }
      }
      
      override protected function updateInactiveIcon(param1:Boolean = false) : void
      {
         if(this.iconHolder)
         {
            this.iconBitmap.scaleX = this.iconBitmap.scaleY = _zoomlevel * 0.5;
            this.iconHolder.y = MainConstants.TILE_HEIGHT * 2 * _zoomlevel - this.iconHolder.height * 0.4;
         }
      }
      
      public function assignIcon(param1:BitmapData = null) : void
      {
         if(Boolean(param1) && this.iconBitmap.bitmapData != param1)
         {
            if(this.iconBitmap.bitmapData)
            {
               this.iconBitmap.bitmapData = null;
            }
            this.iconBitmap.bitmapData = param1;
            this.updateView();
         }
         else if(param1)
         {
            this.updateView();
         }
         else if(Boolean(this.iconBitmap.bitmapData) && param1 == null)
         {
            this.iconBitmap.bitmapData = null;
         }
         this.updateInactiveIcon();
      }
      
      override public function dispose() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.handleInternalClicked);
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.handleInternalMouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.handleInternalMouseOut);
         super.dispose();
      }
   }
}

