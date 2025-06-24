package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoomumba.view.playfield.xmas.XmasTreeBuildingMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class XmasTree extends NewBuilding
   {
      private var _refresh:Boolean = false;
      
      public function XmasTree(param1:Notifier, param2:Sprite, param3:int, param4:int)
      {
         this._dragable = false;
         this.higlightable = true;
         this.itemHeight = 3;
         this.itemWidth = 3;
         this._systemItem = true;
         super(param1,param2,param3,param4,Categories.SPECIAL,2,2);
         Facade.getInstance().registerMediator(new XmasTreeBuildingMediator(Categories.SPECIAL,param4,this));
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int, param4:int) : XmasTree
      {
         var _loc5_:XmasTree = null;
         canConstruct = true;
         _loc5_ = new XmasTree(param1,param2,param3,param4);
         canConstruct = false;
         return _loc5_;
      }
      
      override public function get NAME() : String
      {
         return "XmasTree";
      }
      
      override protected function loadAsset() : void
      {
         this.loadNewAsset(93);
      }
      
      public function loadNewAsset(param1:int = 0) : void
      {
         this._refresh = true;
         AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.DECOR,param1),this.handleAsset);
      }
      
      override protected function handleAsset(param1:SWFAsset) : void
      {
         if((!_isDisposed || this._refresh) && Boolean(param1))
         {
            if(skin)
            {
               DisplayObjectHelper.removeChild(this,skin);
            }
            skin = param1.getEmbededMovieClip(AssetConfig.DEFAULT_OBJECT_MC);
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            updateView();
            this._refresh = false;
         }
      }
      
      override public function dispose() : void
      {
         Facade.getInstance().removeMediator(BuildingMediator.getFullName(XmasTreeBuildingMediator.NAME,Categories.SPECIAL,this.uniqueId));
         super.dispose();
      }
   }
}

