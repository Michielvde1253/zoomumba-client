package com.bigpoint.zoomumba.model.gameConfig
{
   import com.bigpoint.utils.BmpUtil;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CollectionPoolSetProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "CollectionPoolSetProxy";
      
      public static const SEPARATOR:String = "_";
      
      public static const COLLECT_FILE_PART:String = "collectable_preview_";
      
      public static const COLLECT_FILE_END:String = ".swf";
      
      private var _dropItems:Dictionary;
      
      private var _directLoadCollItems:Vector.<ItemVO>;
      
      private var _glowIcons:Vector.<Bitmap>;
      
      private var _bmpUtil:BmpUtil;
      
      public function CollectionPoolSetProxy(param1:Vector.<ItemVO> = null)
      {
         super(NAME);
         this._dropItems = new Dictionary();
         this._bmpUtil = new BmpUtil();
         this._directLoadCollItems = param1;
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         if(this._directLoadCollItems)
         {
            this.loadItems(this._directLoadCollItems);
         }
         AssetLibrary.sendAssetToFunction("dropGlows",this.handleAssetsLoaded);
         this.getCollectionItemById(1001);
         this.getCollectionItemById(1002);
      }
      
      private function handleAssetsLoaded(param1:SWFAsset) : void
      {
         this._glowIcons = new Vector.<Bitmap>();
         var _loc2_:Bitmap = new Bitmap();
         _loc2_ = new Bitmap();
         _loc2_ = param1.getEmbededBitmap("IconGlow001");
         _loc2_.x -= _loc2_.width / 2;
         _loc2_.y -= _loc2_.height / 2;
         this._glowIcons.push(_loc2_);
         _loc2_ = new Bitmap();
         _loc2_ = param1.getEmbededBitmap("IconGlow002");
         _loc2_.x -= _loc2_.width / 2;
         _loc2_.y -= _loc2_.height / 2;
         this._glowIcons.push(_loc2_);
         _loc2_ = new Bitmap();
         _loc2_ = param1.getEmbededBitmap("IconGlow003");
         _loc2_.x -= _loc2_.width / 2;
         _loc2_.y -= _loc2_.height / 2;
         this._glowIcons.push(_loc2_);
      }
      
      public function getCollectionsItemById(param1:int) : Vector.<Sprite>
      {
         return this.createItemCollections(param1);
      }
      
      public function createItemCollections(param1:int) : Vector.<Sprite>
      {
         var _loc7_:Bitmap = null;
         var _loc8_:Sprite = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Sprite = new Sprite();
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Sprite = new Sprite();
         var _loc6_:Vector.<Sprite> = new Vector.<Sprite>();
         var _loc9_:int = 1;
         while(_loc9_ <= 3)
         {
            _loc3_ = new Sprite();
            _loc2_ = new Sprite();
            _loc5_ = new Sprite();
            _loc4_ = new Sprite();
            _loc8_ = this.getCollectionItemById(param1);
            if(_loc8_)
            {
               _loc3_.addChild(_loc8_);
               if(_loc9_ == 1)
               {
                  if(param1 == 1001 || param1 == 1002)
                  {
                     _loc3_.height /= 2.4;
                     _loc3_.width /= 2.4;
                  }
                  else
                  {
                     _loc3_.height /= 2;
                     _loc3_.width /= 2;
                  }
               }
               else if(_loc9_ == 2)
               {
                  if(param1 == 1001 || param1 == 1002)
                  {
                     _loc3_.height /= 1.7;
                     _loc3_.width /= 1.7;
                  }
                  else
                  {
                     _loc3_.height /= 1.3;
                     _loc3_.width /= 1.3;
                  }
               }
               else if(_loc9_ == 3)
               {
                  if(param1 == 1001 || param1 == 1002)
                  {
                     _loc3_.height /= 1.4;
                     _loc3_.width /= 1.4;
                  }
                  else
                  {
                     _loc3_.height = _loc3_.height;
                     _loc3_.width = _loc3_.width;
                  }
               }
               if(this._glowIcons)
               {
                  _loc5_.addChild(this._glowIcons[_loc9_ - 1]);
                  _loc5_.alpha = 0.85;
                  _loc2_.addChild(_loc5_);
               }
               if(param1 == 1001 || param1 == 1002)
               {
                  _loc5_.height /= 1.4;
                  _loc5_.width /= 1.4;
               }
               _loc2_.addChild(_loc3_);
               _loc4_.addChild(this._bmpUtil.toBitmap(_loc2_));
               _loc4_.x -= _loc4_.width / 2;
               _loc4_.y -= _loc4_.height / 2;
            }
            _loc6_.push(_loc4_);
            _loc9_++;
         }
         return _loc6_;
      }
      
      public function getCopiedCollectionsItemById(param1:int) : Sprite
      {
         var _loc3_:Bitmap = null;
         var _loc2_:Sprite = new Sprite();
         _loc3_ = this._bmpUtil.toBitmap(this.getCollectionItemById(param1));
         _loc3_.x -= _loc3_.width / 2;
         _loc3_.y -= _loc3_.height / 2;
         _loc2_.addChild(_loc3_);
         return _loc2_;
      }
      
      public function getCollectionItemById(param1:int) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         if(!this._dropItems[param1])
         {
            _loc2_ = new Sprite();
            _loc3_ = new Sprite();
            _loc3_ = AssetLibrary.getSprite(COLLECT_FILE_PART + param1,AssetConfig.DEFAULT_OBJECT_SPR);
            if(_loc3_)
            {
               _loc3_.y = _loc3_.width / 2;
               _loc3_.x = _loc3_.height / 2;
               _loc2_.addChild(_loc3_);
               this._dropItems[param1] = _loc2_;
            }
            else
            {
               AssetLibrary.sendAssetToFunction(COLLECT_FILE_PART + param1,this.onLoadedIcon,_loc2_);
            }
         }
         return this._dropItems[param1];
      }
      
      public function loadItems(param1:Vector.<ItemVO>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ItemVO = null;
         var _loc4_:Vector.<String> = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         if(param1)
         {
            _loc4_ = new Vector.<String>();
            _loc5_ = int(param1.length);
            _loc7_ = "";
            _loc8_ = 0;
            while(_loc8_ < _loc5_)
            {
               _loc3_ = param1[_loc8_];
               _loc2_ = _loc3_.itemId;
               if(this._dropItems[_loc2_] == null)
               {
                  _loc6_ = String(COLLECT_FILE_PART + _loc3_.itemId + COLLECT_FILE_END);
                  _loc7_ += _loc6_;
                  if(AssetLibrary.isAssetLoadedOrLoading(_loc6_) == false)
                  {
                     _loc4_.push(_loc6_);
                  }
               }
               _loc8_++;
            }
            if(_loc4_.length > 0)
            {
               AssetLibrary.sendAssetsToFunction(_loc7_,_loc4_,this.onLoadAssets);
            }
         }
      }
      
      private function onLoadAssets(param1:Dictionary) : void
      {
         var _loc2_:String = null;
         var _loc3_:Sprite = null;
         var _loc4_:int = 0;
         var _loc5_:SWFAsset = null;
         for each(_loc5_ in param1)
         {
            this.addSWFAssetItem(_loc5_);
         }
      }
      
      private function addSWFAssetItem(param1:SWFAsset) : int
      {
         var _loc2_:String = null;
         var _loc3_:Sprite = null;
         var _loc4_:int = 0;
         _loc2_ = param1.id;
         _loc4_ = parseInt(_loc2_.replace(COLLECT_FILE_PART,"").replace(COLLECT_FILE_END,""));
         if(_loc4_)
         {
            if(this._dropItems[_loc4_] == null)
            {
               this._dropItems[_loc4_] = new Sprite();
            }
            _loc3_ = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
            (this._dropItems[_loc4_] as Sprite).addChild(_loc3_);
            return _loc4_;
         }
         return -1;
      }
      
      private function onLoadedIcon(param1:SWFAsset, param2:DisplayObjectContainer) : void
      {
         var _loc3_:int = this.addSWFAssetItem(param1);
      }
   }
}

