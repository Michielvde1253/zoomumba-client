package com.bigpoint.zoorama.core.feature.tutorials
{
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.tempModel.TempGetterProxy;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.PlayFieldManager;
   import com.bigpoint.zoorama.core.feature.tutorials.managers.TutorialServerClone;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.core.feature.tutorials.states.ItemModel;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TutorialStyleOverlay extends Sprite
   {
      private var penguin1:MovieClip;
      
      private var penguin2:MovieClip;
      
      private var notifier:Notifier;
      
      private var currentPenguin:MovieClip;
      
      private var cageArrow:MovieClip;
      
      private var playFieldManager:PlayFieldManager;
      
      public var shopButtonArrow:MovieClip;
      
      private var cagePositionArrow:MovieClip;
      
      private var roadPositionArrow:MovieClip;
      
      private var superLayer:MovieClip;
      
      public function TutorialStyleOverlay(param1:Notifier, param2:PlayFieldManager)
      {
         super();
         this.buttonMode = false;
         this.mouseEnabled = false;
         this.notifier = new Notifier(param1);
         this.playFieldManager = param2;
      }
      
      public function addFieldArrow(param1:Point, param2:Boolean = false) : void
      {
         if(!this.cageArrow)
         {
            this.cageArrow = AssetLibrary.getMovieClip("tutorialElements",AssetConfig.TUTORIAL_ARROW);
            this.cageArrow.mouseEnabled = false;
            this.cageArrow.mouseChildren = false;
            this.addChild(this.cageArrow);
         }
         this.cageArrow.x = param1.x;
         this.cageArrow.y = param1.y;
         this.cageArrow.visible = param2;
      }
      
      public function addShopButtonArrow(param1:ItemModel) : void
      {
         this.shopButtonArrow = AssetLibrary.getMovieClip(AssetConfig.ASSET_FIELD_ELEMENTS,"CageEmptyIcon_200_MC");
         this.addChild(this.shopButtonArrow);
         var _loc2_:Point = param1.object.localToGlobal(new Point());
         this.shopButtonArrow.x = _loc2_.x;
         this.shopButtonArrow.y = _loc2_.y - param1.object.height;
         this.shopButtonArrow.visible = false;
      }
      
      public function showShopButtonArrow(param1:ItemModel) : void
      {
         if(!this.shopButtonArrow)
         {
            this.addShopButtonArrow(param1);
         }
         this.shopButtonArrow.visible = true;
      }
      
      public function hideShopButtonArrow() : void
      {
         this.shopButtonArrow.visible = false;
      }
      
      public function showCageArrow() : void
      {
         if(this.cageArrow)
         {
            this.cageArrow.visible = true;
         }
      }
      
      public function hideCageArrow() : void
      {
         if(this.cageArrow)
         {
            this.cageArrow.visible = false;
         }
      }
      
      public function addPenguins() : void
      {
         this.penguin1 = AddAssetItem.addMovieClipToContainer(this,AssetConfig.TUTORIALS_PENGUIN_ESCAPE_1,"tutorialElements",345,170,false);
         this.penguin2 = AddAssetItem.addMovieClipToContainer(this,AssetConfig.TUTORIALS_PENGUIN_ESCAPE_2,"tutorialElements",570,250,false);
         this.enablePenguin(this.penguin1);
      }
      
      private function enablePenguin(param1:MovieClip) : void
      {
         param1.buttonMode = true;
         var _loc2_:MovieClip = AssetLibrary.getMovieClip("tutorialElements",AssetConfig.TUTORIAL_ARROW);
         _loc2_.mouseEnabled = false;
         _loc2_.mouseChildren = false;
         _loc2_.buttonMode = false;
         param1.folowTarget.addChild(_loc2_);
         _loc2_.y = -50;
         param1.addEventListener(MouseEvent.CLICK,this.handlePenguinClick);
      }
      
      public function enableNextPenguin() : void
      {
         this.hideCageArrow();
         if(this.currentPenguin == this.penguin1)
         {
            this.removeChild(this.currentPenguin);
            this.enablePenguin(this.penguin2);
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,1));
         }
         else
         {
            this.removeChild(this.currentPenguin);
            this.notifier.dispatchNoticeToRoot(new TutorialNotices(TutorialNotices.TASK_COMPLETE,2));
         }
      }
      
      private function handlePenguinClick(param1:MouseEvent) : void
      {
         this.showCageArrow();
         this.currentPenguin = MovieClip(param1.currentTarget);
         this.currentPenguin.visible = false;
         var _loc2_:ShopItemData = new ShopItemData();
         _loc2_.categoryId = 10;
         _loc2_.itemId = 19;
         var _loc3_:PlayFieldManager = TempGetterProxy.getFacade().retrieveMediator(PlayFieldManager.NAME) as PlayFieldManager;
         _loc3_.startDragShopItem(_loc2_,false);
      }
      
      public function reactivateLastPenguin() : void
      {
         this.hideCageArrow();
         this.currentPenguin.visible = true;
      }
      
      public function highlightRoads() : void
      {
         TutorialServerClone.getInstance().setHighlightStep6Roads(1);
         TutorialServerClone.getInstance().setHighlightStep6Roads(2);
         TutorialServerClone.getInstance().setHighlightStep6Roads(3);
      }
      
      public function showRoadPositionArrow(param1:int) : void
      {
      }
      
      public function hideRoadPositionArrow() : void
      {
         if(this.roadPositionArrow)
         {
            this.roadPositionArrow.visible = false;
         }
      }
      
      public function showAllArrows() : void
      {
         if(Settings.SCALE_TEST)
         {
            this.superLayer = AssetLibrary.getMovieClip("tutorialElements",AssetConfig.FINAL_LAYER_SOCIAL);
         }
         else
         {
            this.superLayer = AssetLibrary.getMovieClip("tutorialElements",AssetConfig.FINAL_LAYER);
         }
         this.addChild(this.superLayer);
         this.superLayer.x = 470;
         this.superLayer.y = 280;
      }
      
      public function destroyArrowLayer() : void
      {
         this.removeChild(this.superLayer);
      }
      
      public function skipStep1() : void
      {
         this.hideCageArrow();
      }
      
      public function hideTrashCleanArrow() : void
      {
         this.hideRoadPositionArrow();
      }
   }
}

