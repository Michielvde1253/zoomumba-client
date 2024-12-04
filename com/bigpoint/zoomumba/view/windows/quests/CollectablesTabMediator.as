package com.bigpoint.zoomumba.view.windows.quests
{
   import com.bigpoint.utils.DisplayObjectHelper;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.controller.collectables.param.GetCollectionRewardVO;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.gameConfig.CollectionSetsConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.CollectionSetConfigVO;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.collectienSets.CollectionSetRewordInitParams;
   import com.bigpoint.zoomumba.model.windows.info.ItemBigInfoInitParams;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import custom.features.collectable.book.component.CollBookCategoryIcon;
   import custom.features.collectable.book.component.CollBookPageIcon;
   import custom.features.collectable.book.component.CollBookPageItem;
   import custom.features.collectable.book.component.CollBookPageMain;
   import custom.features.collectable.book.component.RibbonBar;
   import custom.features.collectable.book.content.CollBookContPageCategory;
   import custom.features.collectable.book.events.BookEvents;
   import custom.features.collectable.book.events.BookStateEvent;
   import custom.features.collectable.button.CollWindowButton;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import general.paginator.PaginatorEvent;
   import general.paginator.PaginatorWarningEvent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.questsWindow.CollectablesTabContent;
   
   public class CollectablesTabMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "CollectablesTabMediator";
      
      private const MAX_PAGE_CATEGORIES:uint = 4;
      
      private const MAX_ENTITIES_PER_PAGE_CATEGORIES:uint = 12;
      
      private const MAX_ENTITIES_PER_PAGE_INTERNAL:uint = 6;
      
      private const BOOK_STATE_COVER:String = "cover";
      
      private const BOOK_STATE_CATEGORIES:String = "categories";
      
      private const BOOK_STATE_PAGE:String = "page";
      
      private var collectablesTab:CollectablesTabContent;
      
      private var mainSWFAsset:SWFAsset;
      
      private var rewardVO:GetCollectionRewardVO;
      
      private var currentCategoryID:int = 1;
      
      private var currentPageSetter:int = 0;
      
      private var collSetsProxy:CollectionSetsConfigProxy;
      
      private var collProxy:CollectablesProxy;
      
      private var _bufferNotLoadedPage:Array = null;
      
      public function CollectablesTabMediator(param1:CollectablesTabContent)
      {
         super(NAME,param1);
         this.collectablesTab = param1;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DataNote.COLLECTABLE_UPDATED,Note.OPEN_COLLECTABLE_PAGE_BY_SETID];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         switch(param1.getName())
         {
            case DataNote.COLLECTABLE_UPDATED:
               this.handleCollectableUpdate(param1.getBody() as int);
               break;
            case Note.OPEN_COLLECTABLE_PAGE_BY_SETID:
               _loc2_ = this.getBookInfoFromSetId(param1.getBody() as int);
               if(this.mainSWFAsset)
               {
                  this.openBook(this.BOOK_STATE_PAGE,_loc2_.index,_loc2_.page);
               }
               else
               {
                  this._bufferNotLoadedPage = [this.BOOK_STATE_PAGE,_loc2_.index,_loc2_.page];
               }
         }
      }
      
      public function getCategoryForTabIndex(param1:int) : int
      {
         var _loc2_:int = -1;
         switch(Math.min(param1,4))
         {
            case 1:
               _loc2_ = Categories.SPECIES;
               break;
            case 2:
               _loc2_ = Categories.CAGE;
               break;
            case 3:
               _loc2_ = Categories.ASSISTANCE;
               break;
            case 4:
               _loc2_ = Categories.SPECIAL;
         }
         return _loc2_;
      }
      
      public function getBookInfoFromSetId(param1:int) : Object
      {
         var _loc5_:CollectionSetConfigVO = null;
         var _loc2_:Object = {
            "page":0,
            "index":0
         };
         var _loc3_:CollectionSetConfigVO = this.collSetsProxy.getSetConfigByCollectionId(param1);
         var _loc4_:Vector.<CollectionSetConfigVO> = this.collSetsProxy.getAllSetsItemsByItemCategory(_loc3_.setCategory);
         var _loc6_:int = this.collSetsProxy.getTabCategoryByCollectionId(param1);
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            _loc5_ = _loc4_[_loc7_];
            if(_loc5_.setItemId == _loc3_.setItemId)
            {
               break;
            }
            ++_loc2_.page;
            _loc7_++;
         }
         switch(_loc6_)
         {
            case Categories.SPECIES:
               _loc2_.index = 1;
               break;
            case Categories.CAGE:
               _loc2_.index = 2;
               break;
            case Categories.ASSISTANCE:
               _loc2_.index = 3;
               break;
            case Categories.SPECIAL:
               _loc2_.index = 4;
         }
         return _loc2_;
      }
      
      override public function onRegister() : void
      {
         this.rewardVO = new GetCollectionRewardVO();
         this.collSetsProxy = facade.retrieveProxy(CollectionSetsConfigProxy.NAME) as CollectionSetsConfigProxy;
         this.collProxy = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
         this.collectablesTab.book.addEventListener(BookStateEvent.CHANGED,this.handleBookStateChange);
         this.collectablesTab.book.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePaginatorEvent);
         this.collectablesTab.book.paginator.addEventListener(PaginatorWarningEvent.REACHED_LIMIT,this.handlePaginatorLimit);
         this.collectablesTab.book.label1 = TextResourceModule.getText("zoo.collectableItems.book.tab.animals");
         this.collectablesTab.book.label2 = TextResourceModule.getText("zoo.collectableItems.book.tab.cages");
         this.collectablesTab.book.label3 = TextResourceModule.getText("zoo.collectableItems.book.tab.assistants");
         this.collectablesTab.book.label4 = TextResourceModule.getText("zoo.collectableItems.book.tab.specials");
         this.collectablesTab.book.ribonBar.addEventListener(BookEvents.RIBBON_BUTTON_MOUSE_OVER,this.handleRibonMouseOver);
         this.collectablesTab.book.ribonBar.addEventListener(BookEvents.RIBBON_BUTTON_MOUSE_OUT,this.handleRibonMouseOut);
         this.collectablesTab.book.ribonBar.addEventListener(BookEvents.RIBBON_BUTTON_MOUSE_CLICK,this.handleRibonMouseClick);
         AssetLibrary.sendAssetToFunction("CollectableBook",this.assetsLoaded);
      }
      
      private function assetsLoaded(param1:SWFAsset) : void
      {
         this.collectablesTab.book.preloader.visible = false;
         this.mainSWFAsset = param1;
         this.collectablesTab.book.$bookCoverSPRSource = param1.getEmbededObject("BookCoverSPR");
         this.collectablesTab.book.$pageRightCoverSource = param1.getEmbededObject("PageRightCover");
         this.collectablesTab.book.$pageRightPaperSource = param1.getEmbededObject("PageRightPaper");
         this.collectablesTab.book.$pageLeftCoverSource = param1.getEmbededObject("PageRightCover");
         this.collectablesTab.book.$pageLeftPaperSource = param1.getEmbededObject("PageRightPaper");
         this.collectablesTab.book.$lineHalfBookSource = param1.getEmbededBitmapData("LineHalfBook");
         this.collectablesTab.book.ribonBar.$ribbonAnimalsSource = param1.getEmbededObject("RibbonAnimals");
         this.collectablesTab.book.ribonBar.$ribbonAssistantsSource = param1.getEmbededObject("RibbonAssistants");
         this.collectablesTab.book.ribonBar.$ribbonHabitatsSource = param1.getEmbededObject("RibbonHabitats");
         this.collectablesTab.book.ribonBar.$ribbonSpecialsSource = param1.getEmbededObject("RibbonSpecials");
         CollBookContPageCategory.$lineSource = param1.getEmbededBitmapData("LineH1px");
         CollBookPageMain.$lineHMainSource = param1.getEmbededBitmapData("LineHMainBox");
         CollBookPageMain.$lineVMainSource = param1.getEmbededBitmapData("LineVMainBox");
         CollBookPageItem.$lineSource = param1.getEmbededBitmapData("LineH1px");
         CollBookPageIcon.$paper15Source = param1.getEmbededBitmapData("SmallPaper15");
         CollBookPageIcon.$paper24Source = param1.getEmbededBitmapData("SmallPaper24");
         CollBookPageIcon.$paper3Source = param1.getEmbededBitmapData("SmallPaper3");
         CollBookPageIcon.$questionMarkSource = param1.getEmbededBitmapData("QuestionMark");
         CollBookPageIcon.$tape1Source = param1.getEmbededBitmapData("Tape1");
         CollBookPageIcon.$tape2Source = param1.getEmbededBitmapData("Tape2");
         CollBookPageIcon.$tape3Source = param1.getEmbededBitmapData("Tape3");
         CollWindowButton.$buttonAskHelpSource = param1.getEmbededBitmapData("ButtonAskHelp");
         CollWindowButton.$safeOpenSource = param1.getEmbededBitmapData("SafeOpen");
         CollWindowButton.$safeClosedSource = param1.getEmbededBitmapData("SafeClosed");
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.collectablesTab.book.coverTitleSource = _loc2_.getHeaderPath("header_guideBook");
         sendNotification(Note.QUESTS_WINDOW_TAB_LOADED);
         if(this._bufferNotLoadedPage != null)
         {
            this.openBook(this._bufferNotLoadedPage[0],this._bufferNotLoadedPage[1],this._bufferNotLoadedPage[2]);
            this._bufferNotLoadedPage = null;
         }
      }
      
      private function handleCollectableUpdate(param1:int) : void
      {
         var _loc2_:CollectionSetConfigVO = null;
         var _loc3_:ItemVO = null;
         var _loc4_:CollBookPageItem = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.collectablesTab.book.currentState == this.BOOK_STATE_PAGE)
         {
            _loc2_ = this.collSetsProxy.getSetsItem(this.currentCategoryID,this.collectablesTab.book.paginator.currentPage);
            _loc3_ = null;
            _loc4_ = null;
            _loc5_ = false;
            _loc6_ = int(_loc2_.collectables.length);
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc3_ = _loc2_.collectables[_loc7_];
               _loc4_ = null;
               _loc5_ = false;
               if(_loc3_.itemId == param1)
               {
                  switch(_loc7_)
                  {
                     case 0:
                        _loc4_ = this.collectablesTab.book.contInternLeft.item2;
                        break;
                     case 1:
                        _loc4_ = this.collectablesTab.book.contInternLeft.item3;
                        break;
                     case 2:
                        _loc4_ = this.collectablesTab.book.contInternRight.item4;
                        break;
                     case 3:
                        _loc4_ = this.collectablesTab.book.contInternRight.item5;
                        break;
                     case 4:
                        _loc4_ = this.collectablesTab.book.contInternRight.item6;
                        _loc5_ = true;
                  }
                  this.updatePageItem(_loc4_,this.collProxy.getCollectableAmmount(param1),this.collProxy.isCollectableCollected(param1),_loc5_);
                  this.checkExchangeAvailability();
               }
               _loc7_++;
            }
         }
      }
      
      private function updatePageItem(param1:CollBookPageItem, param2:int, param3:Boolean, param4:Boolean = false) : void
      {
         if(param1)
         {
            param1.count = param2;
            param1.collected = param3;
            param1.moreEnabled = param3;
            if(param4)
            {
               param1.surprise = !param3;
            }
         }
      }
      
      private function checkExchangeAvailability() : void
      {
         var _loc3_:int = 0;
         var _loc4_:ItemVO = null;
         var _loc1_:Boolean = true;
         var _loc2_:CollectionSetConfigVO = this.collSetsProxy.getSetsItem(this.currentCategoryID,this.collectablesTab.book.paginator.currentPage);
         if(_loc2_)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.collectables.length)
            {
               _loc4_ = _loc2_.collectables[_loc3_];
               if(this.collProxy.getCollectableAmmount(_loc4_.itemId) <= 0)
               {
                  _loc1_ = false;
                  break;
               }
               _loc3_++;
            }
            this.collectablesTab.book.exchange.readyToGo = _loc1_;
         }
      }
      
      private function handleRibonMouseOver(param1:BookEvents) : void
      {
         var _loc2_:String = "";
         switch(param1.ribbonId)
         {
            case 1:
               _loc2_ = TextResourceModule.getText("zoo.collectableItems.book.tab.animals");
               break;
            case 2:
               _loc2_ = TextResourceModule.getText("zoo.collectableItems.book.tab.cages");
               break;
            case 3:
               _loc2_ = TextResourceModule.getText("zoo.collectableItems.book.tab.assistants");
               break;
            case 4:
               _loc2_ = TextResourceModule.getText("zoo.collectableItems.book.tab.specials");
         }
         TooltipNewManager.setToolTip(RibbonBar(param1.currentTarget),_loc2_,true);
      }
      
      private function handleRibonMouseOut(param1:BookEvents) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function openBookByCover(param1:MouseEvent) : void
      {
         this.openBook(this.BOOK_STATE_CATEGORIES,1);
      }
      
      private function handleRibonMouseClick(param1:BookEvents) : void
      {
         this.openBook(this.BOOK_STATE_CATEGORIES,param1.ribbonId);
      }
      
      private function openBook(param1:String, param2:int, param3:int = 0) : void
      {
         this.currentCategoryID = this.getCategoryForTabIndex(param2);
         switch(param1)
         {
            case this.BOOK_STATE_CATEGORIES:
               this.collectablesTab.book.paginator.forceAlwaysEnabledButtons = false;
               this.collectablesTab.book.paginator.maxEntries = this.collSetsProxy.getSetsCount(this.currentCategoryID);
               this.collectablesTab.book.paginator.entriesPerPage = this.MAX_ENTITIES_PER_PAGE_CATEGORIES;
               break;
            case this.BOOK_STATE_PAGE:
               this.collectablesTab.book.paginator.forceAlwaysEnabledButtons = true;
               this.collectablesTab.book.paginator.maxEntries = this.collSetsProxy.getSetsCount(this.currentCategoryID) * this.MAX_ENTITIES_PER_PAGE_INTERNAL;
               this.collectablesTab.book.paginator.entriesPerPage = this.MAX_ENTITIES_PER_PAGE_INTERNAL;
         }
         this.currentPageSetter = param3;
         this.collectablesTab.book.switchState(param1,param2);
      }
      
      private function handleBookStateChange(param1:BookStateEvent) : void
      {
         if(param1.state == this.BOOK_STATE_COVER)
         {
            if(!this.collectablesTab.book.cover.hasEventListener(MouseEvent.CLICK))
            {
               this.collectablesTab.book.cover.addEventListener(MouseEvent.CLICK,this.openBookByCover);
            }
         }
         this.collectablesTab.book.paginator.currentPage = this.currentPageSetter;
      }
      
      private function handlePaginatorLimit(param1:PaginatorWarningEvent) : void
      {
         if(param1.maximum)
         {
            this.openBook(this.BOOK_STATE_PAGE,this.collectablesTab.book.currentIndex + 1,0);
         }
         else
         {
            this.openBook(this.BOOK_STATE_PAGE,this.collectablesTab.book.currentIndex - 1,this.collSetsProxy.getSetsCount(this.getCategoryForTabIndex(this.collectablesTab.book.currentIndex - 1)) - 1);
         }
      }
      
      private function handlePaginatorEvent(param1:PaginatorEvent) : void
      {
         this.rewardVO.currentCategoryID = this.currentCategoryID;
         this.rewardVO.currentPage = param1.page;
         switch(this.collectablesTab.book.currentState)
         {
            case this.BOOK_STATE_CATEGORIES:
               this.currentPageSetter = param1.page;
               this.updateCategory();
               break;
            case this.BOOK_STATE_PAGE:
               this.collectablesTab.book.paginator.prevButton.enabled = true;
               this.collectablesTab.book.paginator.nextButton.enabled = true;
               if(param1.page == 0 && this.collectablesTab.book.currentIndex == 1)
               {
                  this.collectablesTab.book.paginator.prevButton.enabled = false;
               }
               else if(param1.page == this.collSetsProxy.getSetsCount(this.currentCategoryID) - 1 && this.collectablesTab.book.currentIndex == this.MAX_PAGE_CATEGORIES)
               {
                  this.collectablesTab.book.paginator.nextButton.enabled = false;
               }
               this.updateInternalPage();
         }
      }
      
      private function getCategoryIconByCat(param1:int) : CollBookCategoryIcon
      {
         var _loc2_:CollBookCategoryIcon = null;
         var _loc3_:int = param1 % this.MAX_ENTITIES_PER_PAGE_CATEGORIES;
         var _loc4_:int = this.MAX_ENTITIES_PER_PAGE_CATEGORIES / 2;
         var _loc5_:int = _loc3_ % _loc4_ + 1;
         if(_loc3_ < _loc4_)
         {
            _loc2_ = this.collectablesTab.book.contCategLeft["cat" + _loc5_];
         }
         else
         {
            _loc2_ = this.collectablesTab.book.contCategRight["cat" + _loc5_];
         }
         return _loc2_;
      }
      
      private function updateCategory() : void
      {
         var _loc1_:CollBookCategoryIcon = null;
         var _loc2_:CollectionSetConfigVO = null;
         var _loc12_:ItemVO = null;
         var _loc13_:CageShopData = null;
         var _loc3_:int = 0;
         var _loc4_:Vector.<CollectionSetConfigVO> = this.collSetsProxy.getAllSetsItemsByTabCategory(this.currentCategoryID);
         var _loc5_:int = int(_loc4_.length);
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         var _loc8_:int = -1;
         var _loc9_:int = 0;
         while(_loc9_ < this.MAX_ENTITIES_PER_PAGE_CATEGORIES)
         {
            _loc1_ = this.getCategoryIconByCat(_loc9_);
            _loc1_.progress = 0;
            _loc1_.currentState = "disabled";
            DisplayObjectHelper.removeChildren(_loc1_.container);
            if(_loc1_.hasEventListener(MouseEvent.CLICK))
            {
               _loc1_.removeEventListener(MouseEvent.CLICK,this.openInternalPage);
            }
            _loc9_++;
         }
         var _loc10_:int = this.collectablesTab.book.paginator.currentIndexPageIni;
         var _loc11_:int = this.collectablesTab.book.paginator.currentIndexPageEnd;
         while(_loc10_ <= _loc11_)
         {
            _loc1_ = this.getCategoryIconByCat(_loc10_);
            _loc1_.pageRefId = _loc10_;
            _loc2_ = _loc4_[_loc10_];
            _loc3_ = 0;
            for each(_loc12_ in _loc2_.collectables)
            {
               if(this.collProxy.getCollectableAmmount(_loc12_.itemId) > 0)
               {
                  _loc3_++;
               }
            }
            if(_loc3_ >= 0)
            {
               _loc1_.currentState = "enabled";
               _loc1_.progress = _loc3_ / 5 * 100;
            }
            else if(_loc3_ == 5)
            {
               _loc1_.currentState = "complete";
            }
            _loc1_.addEventListener(MouseEvent.CLICK,this.openInternalPage);
            _loc6_ = _loc2_.setCategory;
            _loc7_ = _loc2_.setItemId;
            _loc8_ = 0;
            switch(this.currentCategoryID)
            {
               case Categories.SPECIES:
                  _loc6_ = Categories.ANIMAL;
                  _loc7_ = ConfigurationModule.getInstance().getMaleAnimalData(_loc2_.setItemId).itemId;
                  this.collectablesTab.book.contCategLeft.title = TextResourceModule.getText("zoo.collectableItems.book.tab.animals");
                  break;
               case Categories.CAGE:
                  _loc13_ = ConfigurationModule.getInstance().getCageData(_loc2_.setItemId);
                  _loc8_ = _loc13_.baseLevel;
                  this.collectablesTab.book.contCategLeft.title = TextResourceModule.getText("zoo.collectableItems.book.tab.cages");
                  break;
               case Categories.ASSISTANCE:
                  this.collectablesTab.book.contCategLeft.title = TextResourceModule.getText("zoo.collectableItems.book.tab.assistants");
                  break;
               case Categories.SPECIAL:
                  this.collectablesTab.book.contCategLeft.title = TextResourceModule.getText("zoo.collectableItems.book.tab.specials");
                  break;
            }
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc6_,_loc7_,_loc8_),this.handleCategoryAsset,_loc1_.container);
            _loc10_++;
         }
      }
      
      private function handleCategoryAsset(param1:SWFAsset, param2:DisplayObjectContainer) : void
      {
         var _loc4_:Sprite = null;
         DisplayObjectHelper.removeChildren(param2 as Sprite);
         var _loc3_:Sprite = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
         if(this.currentCategoryID == Categories.CAGE || this.currentCategoryID == Categories.SPECIAL)
         {
            _loc4_ = this.mainSWFAsset.getEmbededSprite("MaskCategoryCircularSPR");
         }
         else
         {
            _loc4_ = this.mainSWFAsset.getEmbededSprite("MaskCategorySPR");
         }
         if(_loc3_["$content"] != null && _loc3_["$content"]["$bg"] != null)
         {
            _loc3_["$content"].removeChild(_loc3_["$content"]["$bg"]);
         }
         param2.addChild(_loc4_);
         param2.addChild(_loc3_);
         _loc3_.mask = _loc4_;
      }
      
      private function openInternalPage(param1:MouseEvent) : void
      {
         var _loc2_:CollBookCategoryIcon = param1.currentTarget as CollBookCategoryIcon;
         this.openBook(this.BOOK_STATE_PAGE,this.collectablesTab.book.currentIndex,_loc2_.pageRefId);
      }
      
      private function updateInternalPage() : void
      {
         var _loc1_:CollectionSetConfigVO = null;
         var _loc2_:CollBookPageMain = null;
         var _loc3_:CollBookPageItem = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:CageShopData = null;
         var _loc9_:ItemVO = null;
         _loc1_ = this.collSetsProxy.getSetsItem(this.currentCategoryID,this.collectablesTab.book.paginator.currentPage);
         if(_loc1_)
         {
            _loc4_ = _loc1_.setCategory;
            _loc5_ = _loc1_.setItemId;
            _loc6_ = 0;
            switch(this.currentCategoryID)
            {
               case Categories.SPECIES:
                  _loc4_ = Categories.ANIMAL;
                  _loc5_ = ConfigurationModule.getInstance().getMaleAnimalData(_loc1_.setItemId).animalId;
                  break;
               case Categories.CAGE:
                  _loc8_ = ConfigurationModule.getInstance().getCageData(_loc1_.setItemId);
                  _loc6_ = _loc8_.baseLevel;
                  break;
               case Categories.ASSISTANCE:
               case Categories.SPECIAL:
            }
            DisplayObjectHelper.removeChildren(this.collectablesTab.book.contInternLeft.main.container);
            AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(_loc4_,_loc5_,_loc6_),this.handleMainPicAsset);
            _loc7_ = 1;
            while(_loc7_ <= this.MAX_ENTITIES_PER_PAGE_INTERNAL)
            {
               if(_loc7_ == 1)
               {
                  _loc2_ = this.collectablesTab.book.contInternLeft.main;
               }
               else if(_loc7_ <= this.MAX_ENTITIES_PER_PAGE_INTERNAL / 2)
               {
                  _loc3_ = this.collectablesTab.book.contInternLeft["item" + _loc7_];
               }
               else
               {
                  _loc3_ = this.collectablesTab.book.contInternRight["item" + _loc7_];
               }
               if(_loc2_)
               {
                  if(_loc2_.hasEventListener("moreCliked"))
                  {
                     _loc2_.removeEventListener("moreCliked",this.openMoreInfoMainItem);
                  }
                  _loc2_.title = TextResourceModule.getText(TextIdHelper.getSetName(_loc1_.setCategory,_loc1_.setItemId));
                  _loc2_.text = TextResourceModule.getText(TextIdHelper.getSetInfo(_loc1_.setCategory,_loc1_.setItemId));
                  _loc2_.more = TextResourceModule.getText("zoo.collectableItems.book.more");
                  _loc2_.addEventListener("moreCliked",this.openMoreInfoMainItem);
               }
               if(_loc3_)
               {
                  if(_loc3_.hasEventListener("moreCliked"))
                  {
                     _loc3_.removeEventListener("moreCliked",this.openMoreInfoSecItem);
                  }
                  _loc9_ = _loc1_.collectables[_loc7_ - 2];
                  _loc3_.text = TextResourceModule.getText(TextIdHelper.getCardInfo(_loc9_.category,_loc9_.itemId));
                  _loc3_.more = TextResourceModule.getText("zoo.collectableItems.book.more");
                  _loc3_.addEventListener("moreCliked",this.openMoreInfoSecItem);
                  this.updatePageItem(_loc3_,this.collProxy.getCollectableAmmount(_loc9_.itemId),this.collProxy.isCollectableCollected(_loc9_.itemId),_loc7_ == 6);
                  AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetId(Categories.COLLECTIBLE,_loc9_.itemId),this.handleLoadPageItemSource,_loc3_);
               }
               _loc7_++;
            }
         }
         if(this.collectablesTab.book.exchange.hasEventListener(MouseEvent.CLICK))
         {
            this.collectablesTab.book.exchange.removeEventListener(MouseEvent.CLICK,this.handleGetRewardClick);
         }
         this.collectablesTab.book.exchange.addEventListener(MouseEvent.CLICK,this.handleGetRewardClick);
         this.checkExchangeAvailability();
      }
      
      private function openMoreInfoMainItem(param1:Event) : void
      {
         var _loc2_:CollectionSetConfigVO = this.collSetsProxy.getSetsItem(this.currentCategoryID,this.collectablesTab.book.paginator.currentPage);
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.COLLECTABLE_MAIN_ITEM_BIG_INFO,"",new ItemBigInfoInitParams(null,-1,_loc2_.setCategory,_loc2_.setItemId)));
      }
      
      private function openMoreInfoSecItem(param1:Event) : void
      {
         var _loc2_:CollBookPageItem = param1.currentTarget as CollBookPageItem;
         var _loc3_:CollectionSetConfigVO = this.collSetsProxy.getSetsItem(this.currentCategoryID,this.collectablesTab.book.paginator.currentPage);
         var _loc4_:ItemVO = _loc3_.collectables[_loc2_.pageRefId - 2];
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.COLLECTABLE_ITEM_BIG_INFO,"",new ItemBigInfoInitParams(_loc4_,_loc2_.pageRefId - 2,_loc3_.setCategory,_loc3_.setItemId)));
      }
      
      private function handleGetRewardClick(param1:MouseEvent) : void
      {
         var _loc2_:CollectionSetConfigVO = this.collSetsProxy.getSetsItem(this.currentCategoryID,this.collectablesTab.book.paginator.currentPage);
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.COLLECTION_SET_REWORD,"",new CollectionSetRewordInitParams(_loc2_.rewards,this.collectablesTab.book.exchange.readyToGo,this.handlePickReward1,this.handlePickReward2)));
      }
      
      private function handlePickReward1(param1:Event) : void
      {
         this.rewardVO.rewardId = 0;
         sendNotification(Note.GET_COLLECTION_SET_REWARD,this.rewardVO);
      }
      
      private function handlePickReward2(param1:Event) : void
      {
         this.rewardVO.rewardId = 1;
         sendNotification(Note.GET_COLLECTION_SET_REWARD,this.rewardVO);
      }
      
      private function handleMainPicAsset(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         if(this.collectablesTab.book.contInternLeft)
         {
            _loc2_ = this.mainSWFAsset.getEmbededSprite("MaskRectSPR");
            switch(this.currentCategoryID)
            {
               case Categories.SPECIES:
                  _loc3_ = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
                  _loc3_.scaleX = _loc3_.scaleY = 0.85;
                  break;
               case Categories.CAGE:
                  _loc3_ = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
                  _loc3_.scaleX = _loc3_.scaleY = 1.2;
                  _loc3_.x = -20;
                  break;
               case Categories.ASSISTANCE:
               case Categories.SPECIAL:
                  _loc3_ = param1.getEmbededSprite(AssetConfig.DEFAULT_INFO_SPR);
                  _loc3_.scaleX = _loc3_.scaleY = 0.5;
                  _loc3_.x = -5;
                  _loc3_.y = 40;
            }
            _loc3_.cacheAsBitmap = true;
            _loc2_.cacheAsBitmap = true;
            DisplayObjectHelper.removeChildren(this.collectablesTab.book.contInternLeft.main.container);
            this.collectablesTab.book.contInternLeft.main.container.addChild(_loc3_);
            this.collectablesTab.book.contInternLeft.main.container.addChild(_loc2_);
            _loc3_.mask = _loc2_;
         }
      }
      
      private function handleLoadPageItemSource(param1:SWFAsset, param2:CollBookPageItem) : void
      {
         param2.source = param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR);
      }
   }
}

