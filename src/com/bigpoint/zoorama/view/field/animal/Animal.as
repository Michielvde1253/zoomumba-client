package com.bigpoint.zoorama.view.field.animal
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.ApplicationFacade;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.CvTagsProxy;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.playfield.components.animals.AnimData;
   import com.bigpoint.zoomumba.model.playfield.components.animals.AnimParser;
   import com.bigpoint.zoomumba.model.playfield.components.animals.AnimalAnim;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.puremvc.as3.interfaces.IFacade;
   
   public class Animal extends Sprite
   {
      private var notifier:Notifier;
      
      private var skin:MovieClip;
      
      private var animalAnimData:AnimalAnim;
      
      private var _cageId:int = -1;
      
      private var _speciesId:int = -1;
      
      private var _familyCount:int;
      
      private var _pairCount:int;
      
      private var _maleCount:int = 0;
      
      private var _femaleCount:int = 0;
      
      private var _childCount:int = 0;
      
      private var _scale:Number = 1;
      
      private var _collectionItems:Vector.<ItemVO>;
      
      public var maxAdult:int;
      
      public var maxChild:int;
      
      private var facade:IFacade = ApplicationFacade.getInstance();
      
      private var cvtagsProxy:CvTagsProxy;
      
      public function Animal(param1:Notifier)
      {
         super();
         this.notifier = new Notifier(param1);
         this.cvtagsProxy = this.facade.retrieveProxy(CvTagsProxy.NAME) as CvTagsProxy;
      }
      
      private function hadleAnimalAsset(param1:SWFAsset) : void
      {
         if(this.skin)
         {
            this.removeChild(this.skin);
            this.skin = null;
         }
         this.skin = param1.getEmbededMovieClip(AssetConfig.DEFAULT_OBJECT_MC);
         this.skin.scaleX = this._scale;
         this.skin.scaleY = this._scale;
         this.addChild(this.skin);
         var _loc2_:AnimParser = AnimParser.getInstance();
         var _loc3_:String = param1.id.replace(".swf","");
         this.animalAnimData = _loc2_.parseAnimal(this.skin,_loc3_,this.maxAdult,this.maxAdult,this.maxChild);
         this._familyCount = this.maxChild;
         this.showAnimalCounts();
      }
      
      private function showAnimalCounts() : void
      {
         if(this.animalAnimData)
         {
            this.animalAnimData.showAnimalCount(this._maleCount,this._femaleCount,this._childCount);
         }
      }
      
      public function get maleCount() : int
      {
         return this._maleCount;
      }
      
      public function set maleCount(param1:int) : void
      {
         this._maleCount = param1;
         this.updatePairCount();
         this.showAnimalCounts();
      }
      
      public function get femaleCount() : int
      {
         return this._femaleCount;
      }
      
      public function set femaleCount(param1:int) : void
      {
         this._femaleCount = param1;
         this.updatePairCount();
         this.showAnimalCounts();
      }
      
      private function updatePairCount() : void
      {
         if(this._femaleCount < this._maleCount)
         {
            this._pairCount = this._femaleCount;
         }
         else
         {
            this._pairCount = this._maleCount;
         }
      }
      
      public function get childCount() : int
      {
         return this._childCount;
      }
      
      public function set childCount(param1:int) : void
      {
         this._childCount = param1;
         this.showAnimalCounts();
      }
      
      public function get speciesId() : int
      {
         return this._speciesId;
      }
      
      public function set speciesId(param1:int) : void
      {
         this._speciesId = param1;
         this._collectionItems = ConfigurationModule.getInstance().getCollectionDatabyTCategorieAndId(Categories.SPECIES,this._speciesId);
         if(this.speciesId == 165 && this._cageId == 33 || this.speciesId == 25 && this._cageId == 3 || this.speciesId == 14 && this._cageId == 16 || this.speciesId == 67 && this._cageId == 10 || this.speciesId == 70 && this._cageId == 2)
         {
            AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.SPECIES,this._speciesId) + "_" + this._cageId,this.hadleAnimalAsset);
         }
         else
         {
            AssetLibrary.sendAssetToFunction(AssetIds.getFieldAssetId(Categories.SPECIES,this._speciesId),this.hadleAnimalAsset);
         }
         this.checkSpecificAnimations();
      }
      
      private function getPreviewforDropitems() : void
      {
         var _loc1_:Vector.<String> = null;
         var _loc2_:String = null;
         var _loc3_:ItemVO = null;
         if(this._collectionItems)
         {
            _loc1_ = new Vector.<String>();
            for each(_loc3_ in this._collectionItems)
            {
               _loc2_ = AssetIds.getPreviewAssetId(_loc3_.category,_loc3_.itemId);
               if(AssetLibrary.isAssetLoadedOrLoading(_loc2_) == false)
               {
                  _loc1_.push(_loc2_);
               }
            }
            if(_loc1_.length > 0)
            {
               AssetLibrary.sendAssetsToFunction("speciesId_preview_Icon" + this._speciesId,_loc1_);
            }
         }
      }
      
      public function checkSpecificAnimations() : void
      {
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      public function set scale(param1:Number) : void
      {
         this._scale = param1;
         if(this.skin)
         {
            this.skin.scaleX = this._scale;
            this.skin.scaleY = this._scale;
            this.animalAnimData.scaleAllAnims(this._scale);
         }
      }
      
      public function get familyCount() : int
      {
         return this._familyCount;
      }
      
      public function set cageId(param1:int) : void
      {
         this._cageId = param1;
      }
      
      public function get pairCount() : int
      {
         return this._pairCount;
      }
      
      public function get _animalAnimData() : AnimalAnim
      {
         return this.animalAnimData;
      }
      
      public function dispose() : void
      {
         this.notifier = null;
         if(this.animalAnimData)
         {
            this.animalAnimData.dispose();
            this.animalAnimData = null;
            if(this.skin)
            {
               this.removeChild(this.skin);
               this.skin = null;
            }
         }
      }
      
      public function getAnimsByActivity(param1:Boolean) : Vector.<AnimData>
      {
         var _loc3_:AnimData = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Vector.<AnimData> = new Vector.<AnimData>();
         if(this.animalAnimData)
         {
            _loc4_ = 1;
            while(_loc4_ <= this._maleCount)
            {
               _loc3_ = this.animalAnimData.getMaleAnim(_loc4_);
               if(_loc3_)
               {
                  if(_loc3_.isPlayingAnimation == param1)
                  {
                     _loc2_.push(_loc3_);
                  }
               }
               _loc4_++;
            }
            _loc5_ = 1;
            while(_loc5_ <= this._femaleCount)
            {
               _loc3_ = this.animalAnimData.getFemaleAnim(_loc5_);
               if(_loc3_)
               {
                  if(_loc3_.isPlayingAnimation == param1)
                  {
                     _loc2_.push(_loc3_);
                  }
               }
               _loc5_++;
            }
            _loc6_ = 1;
            while(_loc6_ <= this._childCount)
            {
               _loc3_ = this.animalAnimData.getChildAnim(_loc6_);
               if(_loc3_)
               {
                  if(_loc3_.isPlayingAnimation == param1)
                  {
                     _loc2_.push(_loc3_);
                  }
               }
               _loc6_++;
            }
         }
         return _loc2_;
      }
   }
}

