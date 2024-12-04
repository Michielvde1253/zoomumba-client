package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.TrashBinData;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import flash.display.Sprite;
   
   public class TrashBin extends Building
   {
      public static const STATUS_ID_EMPTY:int = 0;
      
      public static const STATUS_ID_USED:int = 1;
      
      public static const STATUS_ID_FULL:int = 2;
      
      private var _capacity:int;
      
      private var _trashAmmount:int = 0;
      
      private var _statusId:int = 0;
      
      private var _cleanTimeStamp:int = -1;
      
      public function TrashBin(param1:Notifier, param2:Sprite, param3:int)
      {
         super(param1,param2,param3);
         _category = Categories.TRASHBIN;
         _groundRequired = ItemAbstract.GROUND_ROAD;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.itemHeight = 1;
         this.itemWidth = 1;
         this.fillTrashBinConfigData();
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleTrashBinAsset);
         createActiveZone();
         this._statusId = TrashBin.STATUS_ID_EMPTY;
         this.updateView();
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : TrashBin
      {
         var _loc4_:TrashBin = null;
         canConstruct = true;
         _loc4_ = new TrashBin(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         var _loc3_:TrashBinData = TrashBinData(param1);
         if(_loc3_.cleantTimeStamp > 0)
         {
            this._cleanTimeStamp = _loc3_.cleantTimeStamp;
         }
         super.updateState(param1,param2);
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
            switch(this.statusId)
            {
               case TrashBin.STATUS_ID_USED:
                  skin.trash_mc.gotoAndStop(AssetConfig.TRASH_BIN_STATUS_USED);
                  break;
               case TrashBin.STATUS_ID_FULL:
                  skin.trash_mc.gotoAndStop(AssetConfig.TRASH_BIN_STATUS_FULL);
                  break;
               case TrashBin.STATUS_ID_EMPTY:
               default:
                  skin.trash_mc.gotoAndStop(AssetConfig.TRASH_BIN_STATUS_EMPTY);
            }
            if(this._rotatePos == ItemAbstract.ROTATION_270)
            {
               this.skin.scaleX = -1;
            }
            else if(this._rotatePos == ItemAbstract.ROTATION_0)
            {
               this.skin.scaleX = 1;
            }
         }
         super.updateView();
      }
      
      private function hadleTrashBinAsset(param1:SWFAsset) : void
      {
         if(!_isDisposed)
         {
            skin = param1.getEmbededMovieClip("ObjectMC");
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            this.updateView();
         }
      }
      
      private function fillTrashBinConfigData() : void
      {
         var _loc1_:TrashbinShopData = ConfigurationModule.getInstance().getTrashBinData(this._itemId);
         if(_loc1_)
         {
            this.itemWidth = _loc1_.width;
            this.itemHeight = _loc1_.height;
            this.defaultItemWidth = _loc1_.width;
            this.defaultItemHeight = _loc1_.height;
            this._sellable = _loc1_.getSellable();
            this._sellVirtual = _loc1_.getSellVirtual();
            this._sellReal = _loc1_.getSellReal();
            this._capacity = _loc1_.capacity;
            this._alias = _loc1_.alias;
         }
      }
      
      public function get capacity() : int
      {
         return this._capacity;
      }
      
      public function set statusId(param1:int) : void
      {
         this._statusId = param1;
         this.updateView();
      }
      
      public function get statusId() : int
      {
         return this._statusId;
      }
      
      public function get trashAmmount() : int
      {
         return this._trashAmmount;
      }
      
      public function set trashAmmount(param1:int) : void
      {
         this._trashAmmount = param1;
         var _loc2_:Number = this._trashAmmount / this._capacity;
         if(_loc2_ > 0.95)
         {
            this.statusId = STATUS_ID_FULL;
         }
         else if(_loc2_ < 0.05)
         {
            this.statusId = STATUS_ID_EMPTY;
         }
         else
         {
            this.statusId = STATUS_ID_USED;
         }
      }
      
      public function get cleanTimeStamp() : int
      {
         return this._cleanTimeStamp;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}

