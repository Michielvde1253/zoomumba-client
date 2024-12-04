package com.bigpoint.zoorama.view.info
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class InfoIconItemRef extends Sprite
   {
      private var category:int;
      
      private var vectorIndicator:int = 0;
      
      private var readyToLoad:Boolean = true;
      
      private var sprLoader:Sprite;
      
      private var stepperSPR:Sprite;
      
      private var arrowLeft:MovieClip;
      
      private var arrowRight:MovieClip;
      
      private var container:MovieClip;
      
      private var allItemFromCategory:DisplayObject;
      
      private var vectorOfIds:Vector.<int>;
      
      private var getShopItemDataFunction:Function;
      
      private var bonus:MovieClip;
      
      public function InfoIconItemRef(param1:Sprite, param2:int, param3:Function, param4:Vector.<int>, param5:DisplayObject = null)
      {
         super();
         this.stepperSPR = param1;
         this.arrowLeft = this.stepperSPR["$arrowLeft"];
         this.arrowRight = this.stepperSPR["$arrowRight"];
         this.container = this.stepperSPR["$container"];
         this.bonus = this.stepperSPR["cageBonus_mc"];
         if(this.bonus)
         {
            this.bonus.stop();
         }
         this.category = param2;
         this.getShopItemDataFunction = param3;
         this.vectorOfIds = param4;
         this.allItemFromCategory = param5;
         this.arrowLeft.addEventListener(MouseEvent.CLICK,this.handelArrowClick);
         this.arrowRight.addEventListener(MouseEvent.CLICK,this.handelArrowClick);
         this.sprLoader = AssetLibrary.getSprite(AssetConfig.ASSET_GAME_GUI,AssetConfig.GUI_PRELOADER);
         this.sprLoader.scaleX = this.sprLoader.scaleY = 0.5;
         this.vectorIndicator = 0;
         this.loadNewItem(param4[this.vectorIndicator]);
      }
      
      public function restart() : void
      {
         this.vectorIndicator = 0;
         this.loadNewItem(this.vectorOfIds[this.vectorIndicator]);
      }
      
      private function handelArrowClick(param1:MouseEvent) : void
      {
         if(this.readyToLoad)
         {
            if(param1.target.name == this.arrowLeft.name)
            {
               --this.vectorIndicator;
            }
            if(param1.target.name == this.arrowRight.name)
            {
               ++this.vectorIndicator;
            }
            this.loadNewItem(this.vectorOfIds[this.vectorIndicator]);
         }
      }
      
      public function dispose() : void
      {
         DisplayObjectHelper.removeChildren(this.container);
         this.arrowLeft.removeEventListener(MouseEvent.CLICK,this.handelArrowClick);
         this.arrowRight.removeEventListener(MouseEvent.CLICK,this.handelArrowClick);
      }
      
      public function showCageBonus(param1:int) : void
      {
         if(this.bonus)
         {
            if(param1 == CageSpecieBonus.GOOD)
            {
               this.bonus.visible = true;
               this.bonus.gotoAndStop("good");
            }
            else if(param1 == CageSpecieBonus.CRAZY)
            {
               this.bonus.visible = true;
               this.bonus.gotoAndStop("crazy");
            }
            else
            {
               this.bonus.visible = false;
            }
         }
      }
      
      private function loadNewItem(param1:int) : void
      {
         var shopItemData:ShopItemData = null;
         var p_id:int = param1;
         if(p_id == -1 && Boolean(this.allItemFromCategory))
         {
            this.allItemFromCategory.x = this.allItemFromCategory.y = 0;
            this.addChildToContainer(this.allItemFromCategory);
         }
         else
         {
            this.readyToLoad = false;
            this.sprLoader.x = this.sprLoader.y = 0;
            this.addChildToContainer(this.sprLoader);
            shopItemData = this.getShopItemDataFunction(p_id) as ShopItemData;
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(this.category,shopItemData.itemId,shopItemData.baseLevel),function(param1:SWFAsset):void
            {
               readyToLoad = true;
               addChildToContainer(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
            });
         }
         this.checkArrowsVisibility();
         dispatchEvent(new InfoIconEvent(InfoIconEvent.ICON_CHANGED,this.vectorIndicator));
      }
      
      private function checkArrowsVisibility() : void
      {
         this.arrowRight.visible = this.vectorIndicator < this.vectorOfIds.length - 1;
         this.arrowLeft.visible = this.vectorIndicator > 0;
      }
      
      private function addChildToContainer(param1:DisplayObject) : void
      {
         DisplayObjectHelper.removeChildren(this.container);
         this.container.addChildAt(param1,0);
         var _loc2_:Rectangle = param1.getBounds(param1);
         param1.x -= _loc2_.width / 2 + _loc2_.x;
         param1.y -= _loc2_.height / 2 + _loc2_.y;
      }
   }
}

