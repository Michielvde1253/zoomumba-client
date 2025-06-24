package com.bigpoint.zoomumba.view.cards.group
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.user.contactList.vo.FriendsCardData;
   import com.bigpoint.zoomumba.view.cards.BaseCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.AssistantCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.BabyCaravanAnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.BreedingLabCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.CageCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.CraftingDecoCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.DecorationCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.ExpansionCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.FriendsFriendshipCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.FriendsReceivedCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.FriendsSentCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.HalloweenCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryAnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryBreedingLabCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryCageCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryDecoCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryMaterialCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryNurseryCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryRoadCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryStorageCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryStoreCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.InventoryTrashBinCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.ItemRewardCard;
   import com.bigpoint.zoomumba.view.cards.custom.NurseryCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.PowerupCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.PremiumPackCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.RecyclingCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.RecyclingChooseCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.RecyclingProduceCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.ResourceCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.RewardBlueprintCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.RoadCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.SafariJokerCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.SpecialCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.SpecieCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.StorageCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.StoreCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.SurpriseBoxCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.TrashbinCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.BreedingEventPriceCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.step2.BreedingAnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.step3.BreedingCollectableCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.advancedBreeding.step3.BreedingResourceCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.events.CommunityAnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.nursery.NurseryAnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.xmas.Xmas2012AnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.xmas.Xmas2012CommunityAnimalCardMediator;
   import com.bigpoint.zoomumba.view.cards.custom.xmas.XmasAnimalCardMediator;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.AssistanceShopData;
   import com.bigpoint.zoorama.data.settings.BreedingLabShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.CollectableShopData;
   import com.bigpoint.zoorama.data.settings.DecorShopData;
   import com.bigpoint.zoorama.data.settings.ExpansionShopData;
   import com.bigpoint.zoorama.data.settings.HalloweenShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.NurseryShopData;
   import com.bigpoint.zoorama.data.settings.PowerupShopData;
   import com.bigpoint.zoorama.data.settings.PremiumPackShopData;
   import com.bigpoint.zoorama.data.settings.PremiumShopData;
   import com.bigpoint.zoorama.data.settings.ResourceShopData;
   import com.bigpoint.zoorama.data.settings.RoadShopData;
   import com.bigpoint.zoorama.data.settings.SafariShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.data.settings.StorageShopData;
   import com.bigpoint.zoorama.data.settings.StoreShopData;
   import com.bigpoint.zoorama.data.settings.SurpriseBoxShopData;
   import com.bigpoint.zoorama.data.settings.TrashbinShopData;
   import com.greensock.TweenLite;
   import custom.card.component.CardGroupHolder;
   import general.paginator.PaginatorEvent;
   import mx.core.IVisualElement;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class CardGroupHolderMediator extends Mediator
   {
      public static const NAME:String = "CardGroupHolderMediator_";
      
      private var cardMediators:Vector.<String> = new Vector.<String>();
      
      private var _dataProvider:Vector.<Object>;
      
      private var _currentPage:int = 0;
      
      private var cardsAdded:Boolean = false;
      
      private var _searchName:String = "";
      
      private var MODE:int = 1;
      
      private var _searchTween:TweenLite;
      
      public function CardGroupHolderMediator(param1:CardGroupHolder, param2:int)
      {
         super(NAME + param2.toString(),param1);
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set currentPage(param1:int) : void
      {
         this._currentPage = param1;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
      }
      
      private function initPaginator() : void
      {
         if(!this._dataProvider)
         {
            this.content.paginator.maxEntries = 0;
            this.content.paginator.currentPage = 0;
            this.content.paginator.forceAlwaysEnabledButtons = false;
            return;
         }
         var _loc1_:int = int(this.content.paginator.maxEntries = this._dataProvider.length);
         if(!this.content.paginator.hasEventListener(PaginatorEvent.CHANGE_PAGE))
         {
            this.content.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChanged);
         }
         var _loc2_:Number = _loc1_ / 8;
         if(this.currentPage > _loc2_)
         {
            this.currentPage = int(_loc2_);
            if(this.currentPage > 0 && Boolean(_loc1_ & 7 == 0))
            {
               --this.currentPage;
            }
         }
         this.content.paginator.currentPage = this.currentPage;
      }
      
      private function handlePageChanged(param1:PaginatorEvent) : void
      {
         this.currentPage = param1.page;
         this.createMediator();
      }
      
      private function createMediator() : void
      {
         if(this._dataProvider)
         {
            switch(this.MODE)
            {
               case CardHolderModes.NEWS_MODE:
               case CardHolderModes.SHOP_WINDOW_MODE:
                  this.createShopCardMediators(this._searchName);
                  break;
               case CardHolderModes.BABY_CARAVAN_MODE:
                  this.createBabyBaravanCardMediators();
                  break;
               case CardHolderModes.XMAS:
                  this.createXmasCards();
                  break;
               case CardHolderModes.XMAS2012:
                  this.createXmas2012Cards();
                  break;
               case CardHolderModes.COMMUNITY_EVENT:
                  this.createCommunityEventCards();
                  break;
               case CardHolderModes.XMAS2012_COMMUNITY:
                  this.createXmas2012CommunityCards();
                  break;
               case CardHolderModes.BREEDING_LAB_STEP_2:
                  this.createBreedingStep2Cards();
                  break;
               case CardHolderModes.BREEDING_LAB_STEP_3:
                  this.createBreedingStep3Cards();
                  break;
               case CardHolderModes.BREEDING_EVENT:
                  this.createBreedingEventCards();
                  break;
               case CardHolderModes.INVENTORY_WINDOW_MODE:
                  this.createInventoryCardMediators(this._searchName);
                  break;
               case CardHolderModes.SAFARI_SHOP_MODE:
               case CardHolderModes.SAFARI_INTERNAL_MODE:
                  this.createSafariCardMediators();
                  break;
               case CardHolderModes.FRIENDS_WINDOW_MODE:
                  this.createFriendsCardMediators();
                  break;
               case CardHolderModes.NURSERY:
                  this.createNurseryCardMediators();
                  break;
               case CardHolderModes.RECYCLING_MODE:
                  this.createRecyclingCardMediators();
                  break;
               case CardHolderModes.ITEM_REWARD_MODE:
                  this.createItemRewardModeCardMediators();
                  break;
               case CardHolderModes.RECYCLING_CHOOSE_MODE:
                  this.createRecyclingChooseCardMediators();
                  break;
               case CardHolderModes.RECYCLING_PRODUCE_MODE:
                  this.createRecyclingProduceCardMediators();
                  break;
               case CardHolderModes.CRAFTING_CHOOSE_MODE:
                  this.createChooseCraftingCardMediators(this._searchName);
                  break;
               case CardHolderModes.CRAFTING_REWARD_MODE:
                  this.createrRewardCraftingCardMediators();
            }
         }
         sendNotification(Note.CARD_GROUP_HOLDER_CREATE_CARDS,this.MODE);
      }
      
      private function createrRewardCraftingCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               _loc3_ = this.getRewardBlueprintCard(this._dataProvider[_loc1_] as ShopItemData);
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createItemRewardModeCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               _loc3_ = this.getItemRewardCard([this._dataProvider[_loc1_]]);
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      public function searchInCategorie(param1:String, param2:Boolean = false) : void
      {
         this._searchName = param1;
         this.killSearchTween();
         if(param2)
         {
            this.startSearch();
         }
         else
         {
            this._searchTween = TweenLite.delayedCall(0.7,this.startSearch);
         }
      }
      
      private function startSearch() : void
      {
         this.killSearchTween();
         this.jumpToFirstPage();
         this.createMediator();
      }
      
      private function killSearchTween() : void
      {
         if(this._searchTween)
         {
            this._searchTween.pause();
            this._searchTween.kill();
            this._searchTween = null;
         }
      }
      
      public function jumpToFirstPage() : void
      {
         if(this.content.paginator.currentPage != 0)
         {
            this.content.paginator.jumpToFirstPage();
         }
      }
      
      private function createBreedingEventCards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getBreedingEventCard(this._dataProvider[_loc1_] as AnimalShopData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createNurseryCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getNurseryAnimalCard(this._dataProvider[_loc1_] as AnimalShopData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createCommunityEventCards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider[_loc1_].length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_][1]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getCommunityAnimalCard(this._dataProvider[_loc1_] as Array);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createXmas2012CommunityCards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider[_loc1_].length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_][1]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getXmas2012CommunityAnimalCard(this._dataProvider[_loc1_] as Array);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createXmas2012Cards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider[_loc1_].length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_][1]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getXmas2012AnimalCard(this._dataProvider[_loc1_] as Array);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createRecyclingProduceCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         this.cleanupContainer();
         this.content.paginator.maxEntries = this._dataProvider.length;
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
            {
               case ItemInternalTypes.MATERIAL:
                  _loc3_ = this.getRecyclingProduceCard(this._dataProvider[_loc1_] as MaterialShopData);
                  if(Boolean(_loc3_) && _loc3_.data.visible)
                  {
                     this.content.paginator.itNext();
                     _loc2_ = _loc3_.getViewComponent() as IVisualElement;
                     _loc2_.depth = 100 - _loc1_;
                     this.content.container.addElement(_loc2_);
                     facade.registerMediator(_loc3_);
                     this.cardMediators.push(_loc3_.internalMediatorName);
                  }
                  else
                  {
                     this.content.paginator.itScape();
                  }
                  break;
               default:
                  throw Error("Canot display card, undefined type");
            }
         }
      }
      
      private function createRecyclingChooseCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         this.cleanupContainer();
         this.content.paginator.maxEntries = this._dataProvider.length;
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
            {
               case ItemInternalTypes.MATERIAL:
                  _loc3_ = this.getRecyclingChooseCard(this._dataProvider[_loc1_] as MaterialShopData);
                  if(Boolean(_loc3_) && _loc3_.data.visible)
                  {
                     this.content.paginator.itNext();
                     _loc2_ = _loc3_.getViewComponent() as IVisualElement;
                     _loc2_.depth = 100 - _loc1_;
                     this.content.container.addElement(_loc2_);
                     facade.registerMediator(_loc3_);
                     this.cardMediators.push(_loc3_.internalMediatorName);
                  }
                  else
                  {
                     this.content.paginator.itScape();
                  }
                  break;
               default:
                  throw Error("Canot display card, undefined type");
            }
         }
      }
      
      private function createRecyclingCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.RECYCLING_CARD:
                     _loc3_ = this.getRecyclingCardCard(this._dataProvider[_loc1_] as RecyclingCardInfoVo);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createXmasCards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getXmasAnimalCard(this._dataProvider[_loc1_] as AnimalShopData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createBreedingStep2Cards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getBreedingAnimalCard(this._dataProvider[_loc1_] as AnimalShopData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createBreedingStep3Cards() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.RESOURCE:
                     _loc3_ = this.getBreedingResourceCard(this._dataProvider[_loc1_] as ResourceShopData);
                     break;
                  case ItemInternalTypes.COLLECTABLE:
                     _loc3_ = this.getBreedingCollectableCard(this._dataProvider[_loc1_] as CollectableShopData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createChooseCraftingCardMediators(param1:String = "") : void
      {
         var _loc2_:int = 0;
         var _loc4_:BaseCardMediator = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         this.cleanupContainer();
         this._searchName = param1;
         this.content.paginator.maxEntries = this._dataProvider.length;
         var _loc3_:IVisualElement = null;
         var _loc5_:* = this._searchName != "";
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            if(_loc5_)
            {
               _loc2_ = this.content.paginator.itCurrent();
               if(this._dataProvider[_loc2_])
               {
                  _loc7_ = (this._dataProvider[_loc2_] as InheritedShopData).cardName.toLowerCase();
                  if(_loc7_.indexOf(this._searchName.toLowerCase()) < 0)
                  {
                     this.content.paginator.itScape();
                     continue;
                  }
               }
            }
            else
            {
               _loc2_ = this.content.paginator.itCurrent();
            }
            if(this._dataProvider[_loc2_])
            {
               switch(InheritedShopData(this._dataProvider[_loc2_]).internalType)
               {
                  case ItemInternalTypes.DECORATION:
                     _loc4_ = this.getCraftingCard(this._dataProvider[_loc2_] as ShopItemData);
                     break;
                  case ItemInternalTypes.STORE:
                     _loc4_ = this.getCraftingCard(this._dataProvider[_loc2_] as ShopItemData);
                     break;
                  case ItemInternalTypes.CAGE:
                     _loc4_ = this.getCraftingCard(this._dataProvider[_loc2_] as ShopItemData);
                     break;
                  case ItemInternalTypes.ROAD:
                     _loc4_ = this.getCraftingCard(this._dataProvider[_loc2_] as ShopItemData);
                     break;
                  case ItemInternalTypes.TRASHBIN:
                     _loc4_ = this.getCraftingCard(this._dataProvider[_loc2_] as ShopItemData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc4_) && _loc4_.data.visible)
            {
               this.content.paginator.itNext();
               _loc3_ = _loc4_.getViewComponent() as IVisualElement;
               _loc3_.depth = 100 - _loc2_;
               this.content.container.addElement(_loc3_);
               facade.registerMediator(_loc4_);
               this.cardMediators.push(_loc4_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc4_ = null;
         _loc3_ = null;
      }
      
      private function createInventoryCardMediators(param1:String = "") : void
      {
         var _loc2_:int = 0;
         var _loc4_:BaseCardMediator = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         this.cleanupContainer();
         this._searchName = param1;
         this.content.paginator.maxEntries = this._dataProvider.length;
         var _loc3_:IVisualElement = null;
         var _loc5_:* = this._searchName != "";
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            if(_loc5_)
            {
               _loc2_ = this.content.paginator.itCurrent();
               if(this._dataProvider[_loc2_].length > 0)
               {
                  _loc6_ = (this._dataProvider[_loc2_][0] as InheritedShopData).translatedTextSpecies.toLowerCase();
                  _loc7_ = (this._dataProvider[_loc2_][0] as InheritedShopData).cardName.toLowerCase();
                  if(_loc6_.indexOf(this._searchName.toLowerCase()) < 0 && _loc7_.indexOf(this._searchName.toLowerCase()) < 0)
                  {
                     this.content.paginator.itScape();
                     continue;
                  }
               }
            }
            else
            {
               _loc2_ = this.content.paginator.itCurrent();
            }
            if(this._dataProvider[_loc2_].length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc2_][0]).internalType)
               {
                  case ItemInternalTypes.DECORATION:
                     _loc4_ = this.getInventoryDecoCard(this._dataProvider[_loc2_] as Array);
                     break;
                  case ItemInternalTypes.STORE:
                     _loc4_ = this.getInventoryStoreCard(this._dataProvider[_loc2_] as Array);
                     break;
                  case ItemInternalTypes.CAGE:
                     _loc4_ = this.getInventoryCageCard(this._dataProvider[_loc2_] as Array);
                     break;
                  case ItemInternalTypes.ANIMAL:
                     _loc4_ = this.getInventoryAnimalCard(this._dataProvider[_loc2_] as Array);
                     break;
                  case ItemInternalTypes.STORAGE:
                     _loc4_ = this.getInventoryDecoCard(this._dataProvider[_loc2_] as Array);
                     break;
                  case ItemInternalTypes.NURSERY:
                  case ItemInternalTypes.BREEDING_LAB:
                     break;
                  case ItemInternalTypes.ROAD:
                     if(InheritedShopData(this._dataProvider[_loc2_][0]).categoryId == Categories.ROAD)
                     {
                        _loc4_ = this.getInventoryRoadCard(this._dataProvider[_loc2_] as Array);
                     }
                     else
                     {
                        _loc4_ = this.getInventoryTrashbinCard(this._dataProvider[_loc2_] as Array);
                     }
                     break;
                  case ItemInternalTypes.MATERIAL:
                     _loc4_ = this.getInventoryMaterialCard(this._dataProvider[_loc2_] as Array);
                     break;
                  case ItemInternalTypes.TRASHBIN:
                     _loc4_ = this.getInventoryTrashbinCard(this._dataProvider[_loc2_] as Array);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc4_) && _loc4_.data.visible)
            {
               this.content.paginator.itNext();
               _loc3_ = _loc4_.getViewComponent() as IVisualElement;
               _loc3_.depth = 100 - _loc2_;
               this.content.container.addElement(_loc3_);
               facade.registerMediator(_loc4_);
               this.cardMediators.push(_loc4_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc4_ = null;
         _loc3_ = null;
      }
      
      private function createBabyBaravanCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(InheritedShopData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.ANIMAL:
                     _loc3_ = this.getAnimalBabyCaravanCard(this._dataProvider[_loc1_] as AnimalShopData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createFriendsCardMediators() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc2_:IVisualElement = null;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            _loc1_ = this.content.paginator.itCurrent();
            if(this._dataProvider.length > 0)
            {
               switch(FriendsCardData(this._dataProvider[_loc1_]).internalType)
               {
                  case ItemInternalTypes.FRIEND:
                     _loc3_ = this.getFriendsFriendshipCard(this._dataProvider[_loc1_] as FriendsCardData);
                     break;
                  case ItemInternalTypes.FRIEND_RECEIVED:
                     _loc3_ = this.getFriendsReceivedCard(this._dataProvider[_loc1_] as FriendsCardData);
                     break;
                  case ItemInternalTypes.FRIEND_SENT:
                     _loc3_ = this.getFriendsSentCard(this._dataProvider[_loc1_] as FriendsCardData);
                     break;
                  default:
                     throw Error("Canot display card, undefined type");
               }
            }
            if(Boolean(_loc3_) && _loc3_.data.visible)
            {
               this.content.paginator.itNext();
               _loc2_ = _loc3_.getViewComponent() as IVisualElement;
               _loc2_.depth = 100 - _loc1_;
               this.content.container.addElement(_loc2_);
               facade.registerMediator(_loc3_);
               this.cardMediators.push(_loc3_.internalMediatorName);
            }
            else
            {
               this.content.paginator.itScape();
            }
         }
         _loc3_ = null;
         _loc2_ = null;
      }
      
      private function createShopCardMediators(param1:String = "") : void
      {
         var _loc3_:int = 0;
         var _loc5_:BaseCardMediator = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         this.cleanupContainer();
         this._searchName = param1;
         this.content.paginator.maxEntries = this._dataProvider.length;
         var _loc2_:* = this._searchName != "";
         var _loc4_:IVisualElement = null;
         this.content.paginator.maxEntries = this._dataProvider.length;
         this.content.paginator.itReset();
         while(this.content.paginator.itHasNext())
         {
            if(_loc2_)
            {
               _loc3_ = this.content.paginator.itCurrent();
               _loc6_ = (this._dataProvider[_loc3_] as InheritedShopData).translatedTextSpecies.toLowerCase();
               _loc7_ = (this._dataProvider[_loc3_] as InheritedShopData).cardName.toLowerCase();
               if(_loc6_.indexOf(this._searchName.toLowerCase()) < 0 && _loc7_.indexOf(this._searchName.toLowerCase()) < 0)
               {
                  this.content.paginator.itScape();
                  continue;
               }
            }
            else
            {
               _loc3_ = this.content.paginator.itCurrent();
            }
            switch(InheritedShopData(this._dataProvider[_loc3_]).internalType)
            {
               case ItemInternalTypes.SPECIE:
                  _loc5_ = this.getAnimalCard(this._dataProvider[_loc3_] as AnimalSpeciesVO);
                  break;
               case ItemInternalTypes.ASSISTANT:
                  _loc5_ = this.getAssistantCard(this._dataProvider[_loc3_] as AssistanceShopData);
                  break;
               case ItemInternalTypes.CAGE:
                  _loc5_ = this.getCageCard(this._dataProvider[_loc3_] as CageShopData);
                  break;
               case ItemInternalTypes.NURSERY:
               case ItemInternalTypes.BREEDING_LAB:
                  break;
               case ItemInternalTypes.DECORATION:
                  _loc5_ = this.getDecorCard(this._dataProvider[_loc3_] as DecorShopData);
                  break;
               case ItemInternalTypes.RESOURCE:
                  _loc5_ = this.getResourceCard(this._dataProvider[_loc3_] as ResourceShopData);
                  break;
               case ItemInternalTypes.ROAD:
                  _loc5_ = this.getRoadCard(this._dataProvider[_loc3_] as RoadShopData);
                  break;
               case ItemInternalTypes.SPECIAL:
                  _loc5_ = this.getSpecialCard(this._dataProvider[_loc3_] as PremiumShopData);
                  break;
               case ItemInternalTypes.STORE:
                  _loc5_ = this.getStoreCard(this._dataProvider[_loc3_] as StoreShopData);
                  break;
               case ItemInternalTypes.TRASHBIN:
                  _loc5_ = this.getTrashbinCard(this._dataProvider[_loc3_] as TrashbinShopData);
                  break;
               case ItemInternalTypes.EXPANSION:
                  _loc5_ = this.getExpansionCard(this._dataProvider[_loc3_] as ExpansionShopData);
                  break;
               case ItemInternalTypes.STORAGE:
                  _loc5_ = this.getDecorCard(this._dataProvider[_loc3_] as DecorShopData);
                  break;
               case ItemInternalTypes.POWERUP:
                  _loc5_ = this.getPowerupCard(this._dataProvider[_loc3_] as PowerupShopData);
                  break;
               case ItemInternalTypes.HALLOWEEN:
                  _loc5_ = this.getHalloweenCard(this._dataProvider[_loc3_] as HalloweenShopData);
                  break;
               case ItemInternalTypes.PACK:
                  _loc5_ = this.getPackMediator(this._dataProvider[_loc3_] as PremiumPackShopData);
                  break;
               case ItemInternalTypes.SUPRISE_BOX:
                  _loc5_ = this.getSurpriseBoxCard(this._dataProvider[_loc3_] as SurpriseBoxShopData);
                  break;
               default:
                  throw Error("Canot display card, undefined type");
            }
            if(_loc5_)
            {
               if(_loc5_.data.visible)
               {
                  this.content.paginator.itNext();
                  _loc4_ = _loc5_.getViewComponent() as IVisualElement;
                  _loc4_.depth = 100 - _loc3_;
                  this.content.container.addElement(_loc4_);
                  facade.registerMediator(_loc5_);
                  this.cardMediators.push(_loc5_.internalMediatorName);
               }
               else
               {
                  this.content.paginator.itScape();
               }
            }
         }
         _loc4_ = null;
      }
      
      private function createSafariCardMediators() : void
      {
         var _loc3_:BaseCardMediator = null;
         this.cleanupContainer();
         var _loc1_:IVisualElement = null;
         var _loc2_:int = this.content.paginator.currentIndexPageIni;
         while(_loc2_ <= this.content.paginator.currentIndexPageEnd)
         {
            switch(InheritedShopData(this._dataProvider[_loc2_]).internalType)
            {
               case ItemInternalTypes.SAFARI_JOKER:
                  _loc3_ = this.getSafariJokerCard(this._dataProvider[_loc2_] as SafariShopData);
                  if(_loc3_)
                  {
                     _loc1_ = _loc3_.getViewComponent() as IVisualElement;
                     _loc1_.depth = 100 - _loc2_;
                     this.content.container.addElement(_loc1_);
                     facade.registerMediator(_loc3_);
                     this.cardMediators.push(_loc3_.internalMediatorName);
                  }
                  _loc2_++;
                  break;
               default:
                  throw Error("Canot display card, undefined type");
            }
         }
         _loc1_ = null;
      }
      
      private function cleanupContainer() : void
      {
         this.content.container.removeAllElements();
         while(this.cardMediators.length)
         {
            facade.removeMediator(this.cardMediators[0]);
            this.cardMediators.splice(0,1);
         }
      }
      
      private function getRecyclingCardCard(param1:RecyclingCardInfoVo) : RecyclingCardMediator
      {
         return new RecyclingCardMediator(param1);
      }
      
      private function getBreedingEventCard(param1:AnimalShopData) : BreedingEventPriceCardMediator
      {
         return new BreedingEventPriceCardMediator(param1);
      }
      
      private function getXmasAnimalCard(param1:AnimalShopData) : XmasAnimalCardMediator
      {
         return new XmasAnimalCardMediator(param1);
      }
      
      private function getXmas2012CommunityAnimalCard(param1:Array) : Xmas2012CommunityAnimalCardMediator
      {
         return new Xmas2012CommunityAnimalCardMediator(param1);
      }
      
      private function getCommunityAnimalCard(param1:Array) : CommunityAnimalCardMediator
      {
         return new CommunityAnimalCardMediator(param1);
      }
      
      private function getXmas2012AnimalCard(param1:Array) : Xmas2012AnimalCardMediator
      {
         return new Xmas2012AnimalCardMediator(param1);
      }
      
      private function getNurseryAnimalCard(param1:AnimalShopData) : NurseryAnimalCardMediator
      {
         return new NurseryAnimalCardMediator(param1);
      }
      
      private function getBreedingAnimalCard(param1:AnimalShopData) : BreedingAnimalCardMediator
      {
         return new BreedingAnimalCardMediator(param1);
      }
      
      private function getBreedingResourceCard(param1:ResourceShopData) : BreedingResourceCardMediator
      {
         return new BreedingResourceCardMediator(param1);
      }
      
      private function getBreedingCollectableCard(param1:CollectableShopData) : BreedingCollectableCardMediator
      {
         return new BreedingCollectableCardMediator(param1);
      }
      
      private function getInventoryAnimalCard(param1:Array) : InventoryAnimalCardMediator
      {
         return new InventoryAnimalCardMediator(param1);
      }
      
      private function getInventoryDecoCard(param1:Array) : InventoryDecoCardMediator
      {
         return new InventoryDecoCardMediator(param1);
      }
      
      private function getRewardBlueprintCard(param1:ShopItemData) : RewardBlueprintCardMediator
      {
         return new RewardBlueprintCardMediator(param1 as ShopItemData);
      }
      
      private function getCraftingCard(param1:ShopItemData) : CraftingDecoCardMediator
      {
         return new CraftingDecoCardMediator(param1 as ShopItemData);
      }
      
      private function getInventoryMaterialCard(param1:Array) : InventoryMaterialCardMediator
      {
         return new InventoryMaterialCardMediator(param1);
      }
      
      private function getItemRewardCard(param1:Array) : ItemRewardCard
      {
         return new ItemRewardCard(param1);
      }
      
      private function getRecyclingProduceCard(param1:MaterialShopData) : RecyclingProduceCardMediator
      {
         return new RecyclingProduceCardMediator(param1);
      }
      
      private function getRecyclingChooseCard(param1:MaterialShopData) : RecyclingChooseCardMediator
      {
         return new RecyclingChooseCardMediator(param1);
      }
      
      private function getInventoryStorageCard(param1:Array) : InventoryStorageCardMediator
      {
         return new InventoryStorageCardMediator(param1);
      }
      
      private function getInventoryStoreCard(param1:Array) : InventoryStoreCardMediator
      {
         return new InventoryStoreCardMediator(param1);
      }
      
      private function getInventoryCageCard(param1:Array) : InventoryCageCardMediator
      {
         return new InventoryCageCardMediator(param1);
      }
      
      private function getInventoryNurseryCard(param1:Array) : InventoryNurseryCardMediator
      {
         return new InventoryNurseryCardMediator(param1);
      }
      
      private function getInventoryBreedingLabCard(param1:Array) : InventoryBreedingLabCardMediator
      {
         return new InventoryBreedingLabCardMediator(param1);
      }
      
      private function getInventoryRoadCard(param1:Array) : InventoryRoadCardMediator
      {
         return new InventoryRoadCardMediator(param1);
      }
      
      private function getInventoryTrashbinCard(param1:Array) : InventoryTrashBinCardMediator
      {
         return new InventoryTrashBinCardMediator(param1);
      }
      
      private function getInventoryTrashBinCard(param1:Array) : InventoryRoadCardMediator
      {
         return new InventoryRoadCardMediator(param1);
      }
      
      private function getCageCard(param1:CageShopData) : CageCardMediator
      {
         return new CageCardMediator(param1);
      }
      
      private function getNurseryCard(param1:NurseryShopData) : NurseryCardMediator
      {
         return new NurseryCardMediator(param1);
      }
      
      private function getBreedingLabCard(param1:BreedingLabShopData) : BreedingLabCardMediator
      {
         return new BreedingLabCardMediator(param1);
      }
      
      private function getAnimalCard(param1:AnimalSpeciesVO) : SpecieCardMediator
      {
         return new SpecieCardMediator(param1);
      }
      
      private function getStoreCard(param1:StoreShopData) : StoreCardMediator
      {
         return new StoreCardMediator(param1);
      }
      
      private function getDecorCard(param1:DecorShopData) : DecorationCardMediator
      {
         return new DecorationCardMediator(param1);
      }
      
      private function getResourceCard(param1:ResourceShopData) : ResourceCardMediator
      {
         return new ResourceCardMediator(param1);
      }
      
      private function getAssistantCard(param1:AssistanceShopData) : AssistantCardMediator
      {
         return new AssistantCardMediator(param1);
      }
      
      private function getSpecialCard(param1:PremiumShopData) : SpecialCardMediator
      {
         return new SpecialCardMediator(param1);
      }
      
      private function getRoadCard(param1:RoadShopData) : RoadCardMediator
      {
         return new RoadCardMediator(param1);
      }
      
      private function getTrashbinCard(param1:TrashbinShopData) : TrashbinCardMediator
      {
         return new TrashbinCardMediator(param1);
      }
      
      private function getExpansionCard(param1:ExpansionShopData) : ExpansionCardMediator
      {
         return new ExpansionCardMediator(param1,facade);
      }
      
      private function getStorageCard(param1:StorageShopData) : StorageCardMediator
      {
         return new StorageCardMediator(param1,facade);
      }
      
      private function getPowerupCard(param1:PowerupShopData) : PowerupCardMediator
      {
         return new PowerupCardMediator(param1);
      }
      
      private function getSurpriseBoxCard(param1:SurpriseBoxShopData) : SurpriseBoxCardMediator
      {
         return new SurpriseBoxCardMediator(param1);
      }
      
      private function getHalloweenCard(param1:HalloweenShopData) : HalloweenCardMediator
      {
         return new HalloweenCardMediator(param1);
      }
      
      private function getPackMediator(param1:PremiumPackShopData) : PremiumPackCardMediator
      {
         return new PremiumPackCardMediator(param1);
      }
      
      private function getSafariJokerCard(param1:SafariShopData) : SafariJokerCardMediator
      {
         return new SafariJokerCardMediator(param1);
      }
      
      private function getFriendsFriendshipCard(param1:FriendsCardData) : FriendsFriendshipCardMediator
      {
         return new FriendsFriendshipCardMediator(param1);
      }
      
      private function getFriendsReceivedCard(param1:FriendsCardData) : FriendsReceivedCardMediator
      {
         return new FriendsReceivedCardMediator(param1);
      }
      
      private function getFriendsSentCard(param1:FriendsCardData) : FriendsSentCardMediator
      {
         return new FriendsSentCardMediator(param1);
      }
      
      private function getAnimalBabyCaravanCard(param1:AnimalShopData) : BabyCaravanAnimalCardMediator
      {
         return new BabyCaravanAnimalCardMediator(param1);
      }
      
      public function set dataProvider(param1:Vector.<Object>) : void
      {
         this._dataProvider = param1;
         this.initPaginator();
      }
      
      public function forceRemoveItems() : void
      {
         this.content.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChanged);
         this.content.container.removeAllElements();
      }
      
      override public function onRemove() : void
      {
         this.content.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChanged);
         this.cleanupContainer();
      }
      
      public function set mode(param1:int) : void
      {
         this.MODE = param1;
      }
      
      public function get content() : CardGroupHolder
      {
         return this.viewComponent as CardGroupHolder;
      }
   }
}

