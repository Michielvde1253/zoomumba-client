package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoomumba.view.playfield.xmas.SleighMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.FeatureActiveReference;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class Sleigh extends NewBuilding
   {
      private var breedingLabAsset:SWFAsset;
      
      public var level:int = -1;
      
      public function Sleigh(param1:Notifier, param2:Sprite, param3:int, param4:int)
      {
         super(param1,param2,param3,param4,Categories.SLEIGH,2,5);
         Facade.getInstance().registerMediator(new SleighMediator(Categories.SLEIGH,param4,this));
         this._dragable = false;
         this.higlightable = true;
         this._systemItem = true;
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int, param4:int) : Sleigh
      {
         var _loc5_:Sleigh = null;
         canConstruct = true;
         _loc5_ = new Sleigh(param1,param2,param3,param4);
         canConstruct = false;
         return _loc5_;
      }
      
      override public function get NAME() : String
      {
         return "sleigh";
      }
      
      private function get linkageName() : String
      {
         return this.level <= 0 ? AssetConfig.DEFAULT_OBJECT_MC : "ObjectState" + this.level + "MC";
      }
      
      override protected function handleAsset(param1:SWFAsset) : void
      {
         this.breedingLabAsset = param1;
         if(!_isDisposed && Boolean(param1))
         {
            if(skin)
            {
               DisplayObjectHelper.removeChild(this,skin);
            }
            skin = param1.getEmbededMovieClip(this.linkageName);
            skin.mouseEnabled = false;
            skin.mouseChildren = false;
            if(FeatureActiveReference.cashFieldItemsAsBitmap)
            {
               skin.cacheAsBitmap = true;
            }
            updateView();
         }
      }
      
      public function setLevel(param1:int) : void
      {
         this.level = param1;
         this.handleAsset(this.breedingLabAsset);
      }
      
      override public function dispose() : void
      {
         Facade.getInstance().removeMediator(BuildingMediator.getFullName(SleighMediator.NAME,Categories.SLEIGH,this.uniqueId));
         super.dispose();
      }
   }
}

