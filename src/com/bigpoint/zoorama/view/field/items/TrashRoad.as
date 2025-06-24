package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import com.bigpoint.zoorama.data.fieldItems.TrashRoadData;
   import com.bigpoint.zoorama.view.field.TrashManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TrashRoad extends Building
   {
      private var _trashAmmount:int = 0;
      
      public function TrashRoad(param1:Notifier, param2:Sprite, param3:int)
      {
         super(param1,param2,param3);
         _category = Categories.TRASHROAD;
         _groundRequired = ItemAbstract.GROUND_ROAD;
         if(!canConstruct)
         {
            throw Error("This class can be created only with ItemFactory.as");
         }
         this.itemHeight = 1;
         this.itemWidth = 1;
         this._dragable = false;
         this.active = 1;
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(this._category,this._itemId),this.hadleTrashRoadAsset);
         createActiveZone();
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int) : TrashRoad
      {
         var _loc4_:TrashRoad = null;
         canConstruct = true;
         _loc4_ = new TrashRoad(param1,param2,param3);
         canConstruct = false;
         return _loc4_;
      }
      
      override public function updateState(param1:FieldItemData, param2:int) : void
      {
         var _loc3_:TrashRoadData = TrashRoadData(param1);
         if(_loc3_.trashAmount > 0)
         {
            this._trashAmmount = _loc3_.trashAmount;
         }
         super.updateState(param1,param2);
      }
      
      override protected function updateView() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(skin)
         {
            if(!this.contains(skin))
            {
               this.addChild(skin);
            }
            skin.gotoAndStop("zoom_" + String(_zoomlevel));
            _loc1_ = 1;
            _loc2_ = 0;
            while(_loc2_ < TrashManager.TRASH_PILE_AMMOUNTS.length - 1)
            {
               if(this._trashAmmount > TrashManager.TRASH_PILE_AMMOUNTS[_loc2_])
               {
                  _loc1_++;
               }
               _loc2_++;
            }
            skin.trash_mc.gotoAndStop("pile_" + _loc1_);
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
      
      private function hadleTrashRoadAsset(param1:SWFAsset) : void
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
      
      override protected function handleMouseUp(param1:MouseEvent) : void
      {
         super.handleMouseUp(param1);
      }
      
      public function get trashAmmount() : int
      {
         return this._trashAmmount;
      }
      
      override public function updatePosition(param1:Point) : void
      {
         super.updatePosition(param1);
         zDepth += 1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}

