package com.bigpoint.zoomumba.controller.visitorWishes
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.VisitorWishesProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.vo.VisitorWishesBubbleVO;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.greensock.TweenLite;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CalculateVisitorWishesCommand extends SimpleCommand
   {
      private var userProxy:UserProxy;
      
      private var visitorWishesProxy:VisitorWishesProxy;
      
      private var playfieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function CalculateVisitorWishesCommand()
      {
         super();
      }
      
      private function get isReadyForNewWish() : Boolean
      {
         return TimeManager.currentTime > this.visitorWishesProxy.timeOfTheLastWishedFullfilled + WishesConstants.DELAY_VISITOR_RESPAWN;
      }
      
      private function get isReadyForTrashCheck() : Boolean
      {
         return TimeManager.currentTime > this.visitorWishesProxy.timeOfTheLastCheckForTrash + WishesConstants.DELAY_DURTY_ZOO_CHECK;
      }
      
      private function get askForCleanTheZoo() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = this.playfieldSettingsProxy.getCurrentTrash(this.playfieldSettingsProxy.getCurrentPlayFieldId());
         if(Math.random() * _loc2_ < _loc2_ && this.isReadyForTrashCheck)
         {
            _loc1_ = true;
            this.visitorWishesProxy.updateTimeOfTheLastCheckForTrash();
         }
         return _loc1_;
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Vector.<VisitorWishesBubbleVO> = null;
         var _loc3_:VisitorWishesBubbleVO = null;
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.visitorWishesProxy = facade.retrieveProxy(VisitorWishesProxy.NAME) as VisitorWishesProxy;
         this.playfieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         if((this.visitorWishesProxy.enabled && this.userProxy.userLevel >= WishesConstants.MIN_USER_LEVEL || !this.visitorWishesProxy.enabled && this.visitorWishesProxy.currentAction == WishesConstants.ACTION_CHANGE_STATUS) && this.playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO)
         {
            switch(this.visitorWishesProxy.currentAction)
            {
               case WishesConstants.ACTION_CHANGE_STATUS:
                  this.visitorWishesProxy.enabled = Boolean(param1.getBody());
                  if(!this.visitorWishesProxy.enabled)
                  {
                     this.destroyAllWishes();
                  }
                  break;
               case WishesConstants.ACTION_VISITOR_ENTER_ZOO:
                  this.visitorWishesProxy.updateVisitorsInZoo(1);
                  this.generateWish(this.visitorWishesProxy.currentVisitorId);
                  break;
               case WishesConstants.ACTION_VISITOR_LEAVES_ZOO:
                  this.visitorWishesProxy.updateVisitorsInZoo(-1);
                  this.destroyWish(this.visitorWishesProxy.currentVisitorId);
                  break;
               case WishesConstants.ACTION_CHECK_PLAYFIELD_INTERACTIONS:
                  _loc2_ = this.visitorWishesProxy.getAllWishes();
                  for each(_loc3_ in _loc2_)
                  {
                     if(this.wasWishFullfilled(_loc3_) && _loc3_.state != WishesConstants.STATE_LOVE && _loc3_.lastAction == WishesConstants.BUBBLE_SHOW)
                     {
                        this.hideWish(_loc3_);
                     }
                     else if(_loc3_.type == WishesConstants.TYPE_ASK_ITEM && _loc3_.item == null)
                     {
                        this.destroyWish(_loc3_.visitorId,true);
                     }
                  }
            }
         }
      }
      
      private function destroyAllWishes() : void
      {
         var _loc2_:VisitorWishesBubbleVO = null;
         var _loc1_:Vector.<VisitorWishesBubbleVO> = this.visitorWishesProxy.getAllWishes();
         for each(_loc2_ in _loc1_)
         {
            this.destroyWish(_loc2_.visitorId,true);
         }
      }
      
      private function generateWish(param1:int) : void
      {
         if(this.visitorWishesProxy.wishesCount < WishesConstants.MAX_VISITORS_WITH_WISHES && this.isReadyForNewWish && this.visitorWishesProxy.enabled && this.visitorWishesProxy.wishesCount / this.visitorWishesProxy.visitorsInZoo < 0.4 && Math.random() > 0.2)
         {
            if(this.askForCleanTheZoo)
            {
               this.visitorWishesProxy.createWishBubble(WishesConstants.TYPE_ASK_CLEAN_ZOO,param1);
            }
            else
            {
               this.visitorWishesProxy.createWishBubble(WishesConstants.TYPE_ASK_ITEM,param1,this.sortNewItem());
            }
            TweenLite.delayedCall(WishesConstants.DELAY_SHOW_BUBBLE,this.showWish,[this.visitorWishesProxy.getWishBubble(param1)]);
         }
      }
      
      private function wasWishFullfilled(param1:VisitorWishesBubbleVO) : Boolean
      {
         var _loc4_:ShopItemData = null;
         var _loc2_:* = false;
         var _loc3_:VisitorWishesBubbleVO = this.visitorWishesProxy.getWishBubble(param1.visitorId);
         if(Boolean(_loc3_) && _loc3_.state != WishesConstants.STATE_NULL)
         {
            switch(param1.type)
            {
               case WishesConstants.TYPE_ASK_ITEM:
                  _loc4_ = param1.item;
                  if(_loc4_)
                  {
                     if(_loc4_.categoryId == Categories.DECOR)
                     {
                        _loc2_ = this.playfieldProxy.getItemCount(_loc4_.categoryId) > this.visitorWishesProxy.oldAmmountDecorInPF;
                     }
                     else
                     {
                        _loc2_ = this.playfieldProxy.getItemCount(_loc4_.categoryId,-1,false,param1.item.itemId) > 0;
                     }
                  }
                  break;
               case WishesConstants.TYPE_ASK_CLEAN_ZOO:
                  _loc2_ = this.playfieldSettingsProxy.getCurrentTrash(this.playfieldSettingsProxy.getCurrentPlayFieldId()) <= WishesConstants.AMOUT_OF_TRASH_ALLOWED;
            }
         }
         return _loc2_;
      }
      
      private function showWish(param1:VisitorWishesBubbleVO) : void
      {
         var _loc2_:VisitorWishesBubbleVO = this.visitorWishesProxy.getWishBubble(param1.visitorId);
         if(_loc2_ && _loc2_.state != WishesConstants.STATE_NULL && (_loc2_.item != null && _loc2_.type == WishesConstants.TYPE_ASK_ITEM || _loc2_.item == null && _loc2_.type == WishesConstants.TYPE_ASK_CLEAN_ZOO))
         {
            switch(_loc2_.state)
            {
               case WishesConstants.STATE_CREATED:
                  if(this.wasWishFullfilled(_loc2_))
                  {
                     this.visitorWishesProxy.updateWishBubble(param1.visitorId,WishesConstants.STATE_LOVE);
                  }
                  else
                  {
                     this.visitorWishesProxy.updateWishBubble(_loc2_.visitorId,WishesConstants.STATE_WISHING);
                  }
                  break;
               case WishesConstants.STATE_LOVE:
                  this.visitorWishesProxy.updateHeartCounter(param1.visitorId);
                  if(_loc2_.heartCount >= WishesConstants.MAX_HEARTBEATS)
                  {
                     this.visitorWishesProxy.updateLastActionBubble(_loc2_.visitorId,WishesConstants.STATE_COMPLETE);
                  }
                  break;
               case WishesConstants.STATE_WISHING:
               case WishesConstants.STATE_WISHING_AGAIN:
                  if(this.wasWishFullfilled(_loc2_))
                  {
                     this.visitorWishesProxy.updateWishBubble(param1.visitorId,WishesConstants.STATE_LOVE);
                  }
                  else
                  {
                     this.visitorWishesProxy.updateWishBubble(_loc2_.visitorId,WishesConstants.STATE_WISHING_AGAIN);
                  }
            }
            if(_loc2_.state != WishesConstants.STATE_NULL && this.visitorWishesProxy.getWishBubble(_loc2_.visitorId) != null)
            {
               if(_loc2_.lastAction != WishesConstants.BUBBLE_SHOW)
               {
                  this.visitorWishesProxy.updateLastActionBubble(_loc2_.visitorId,WishesConstants.BUBBLE_SHOW);
                  sendNotification(Note.VISITOR_SHOW_BUBBLE,_loc2_);
                  TweenLite.delayedCall(WishesConstants.DELAY_DISAPPEAR_BUBBLE,this.hideWish,[_loc2_]);
               }
            }
         }
         else
         {
            this.destroyWish(param1.visitorId);
         }
      }
      
      private function hideWish(param1:VisitorWishesBubbleVO) : void
      {
         if(param1.lastAction == WishesConstants.BUBBLE_SHOW && this.visitorWishesProxy.getWishBubble(param1.visitorId) != null)
         {
            this.visitorWishesProxy.updateLastActionBubble(param1.visitorId,WishesConstants.BUBBLE_HIDE);
            sendNotification(Note.VISITOR_HIDE_BUBBLE,param1);
            if(param1.state != WishesConstants.STATE_NULL)
            {
               TweenLite.delayedCall(WishesConstants.DELAY_REAPPEAR_BUBBLE,this.showWish,[param1]);
            }
         }
      }
      
      private function destroyWish(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:VisitorWishesBubbleVO = this.visitorWishesProxy.getWishBubble(param1);
         if(Boolean(_loc3_) && _loc3_.state != WishesConstants.STATE_NULL)
         {
            this.visitorWishesProxy.updateWishBubble(_loc3_.visitorId,WishesConstants.STATE_NULL);
            if(param2)
            {
               this.hideWish(_loc3_);
            }
            this.visitorWishesProxy.removeWishBubble(param1);
         }
      }
      
      private function getProbabilityGroup() : int
      {
         var pointer:int;
         var range:Vector.<int> = new Vector.<int>(100);
         range.forEach(function(param1:int, param2:int, param3:Vector.<int>):void
         {
            if(param2 < 10)
            {
               param3[param2] = WishesConstants.PROB_GROUP_LEVEL_LESS_THAN_2;
            }
            else if(param2 < 75)
            {
               param3[param2] = WishesConstants.PROB_GROUP_LEVEL_UNTIL_LESS_2;
            }
            else if(param2 < 85)
            {
               param3[param2] = WishesConstants.PROB_GROUP_LEVEL_MORE_1;
            }
            else
            {
               param3[param2] = WishesConstants.PROB_GROUP_SPECIAL_ITEMS;
            }
         });
         range.sort(this.compare);
         pointer = int(Math.random() * 100);
         return range[pointer];
      }
      
      private function compare(param1:int, param2:int) : Number
      {
         return Math.random() * 100 - 50;
      }
      
      private function sortNewItem(param1:int = -1) : ShopItemData
      {
         var allChoices:Vector.<ShopItemData>;
         var filtered:Vector.<ShopItemData>;
         var includeSpecialItems:Boolean = false;
         var categoriesChoosed:Vector.<int> = null;
         var pointer:int = 0;
         var forceGroupId:int = param1;
         var finalChoice:ShopItemData = null;
         var probGroup:int = forceGroupId == -1 ? this.getProbabilityGroup() : forceGroupId;
         var startLevel:int = this.userProxy.userLevel;
         var rangeLevels:int = 0;
         includeSpecialItems = false;
         var categoriesProbability:Vector.<int> = Vector.<int>([Categories.CAGE,Categories.CAGE,Categories.CAGE,Categories.ANIMAL,Categories.ANIMAL,Categories.ANIMAL,Categories.ANIMAL,Categories.STORE,Categories.STORE,Categories.DECOR]);
         var randomIndex:int = int(Math.random() * 10);
         var categoryChoosed:int = categoriesProbability[randomIndex];
         switch(probGroup)
         {
            case WishesConstants.PROB_GROUP_LEVEL_MORE_1:
               startLevel += 1;
               rangeLevels = 0;
               categoriesChoosed = Vector.<int>([categoryChoosed]);
               break;
            case WishesConstants.PROB_GROUP_LEVEL_LESS_THAN_2:
               startLevel -= 2;
               rangeLevels = -999;
               categoriesChoosed = Vector.<int>([categoryChoosed]);
               break;
            case WishesConstants.PROB_GROUP_LEVEL_UNTIL_LESS_2:
               rangeLevels = -2;
               categoriesChoosed = Vector.<int>([categoryChoosed]);
               break;
            case WishesConstants.PROB_GROUP_SPECIAL_ITEMS:
               startLevel = 999;
               rangeLevels = -999;
               includeSpecialItems = true;
               categoriesChoosed = Vector.<int>([Categories.CAGE,Categories.ANIMAL,Categories.STORE]);
         }
         allChoices = ConfigurationModule.getInstance().getAllItemsByCategoryAndLevel(categoriesChoosed,startLevel,rangeLevels);
         filtered = allChoices.filter(function(param1:ShopItemData, param2:int, param3:Vector.<ShopItemData>):Boolean
         {
            var _loc4_:* = false;
            _loc4_ = param1.buyable == 1 && param1.onlyDev == 0 && (param1.buyVirtual > 0 && !includeSpecialItems || includeSpecialItems && (param1.buyReal > 0 && param1.buyVirtual <= 0 || param1.isEventItem == 1 || param1.isEvent == 1));
            if(param1.categoryId == Categories.ANIMAL)
            {
               _loc4_ &&= param1["male"] == 1 || param1["child"] == 1;
            }
            return _loc4_;
         });
         if(filtered.length > 0)
         {
            pointer = int(Math.random() * (filtered.length - 1));
            finalChoice = filtered[pointer];
         }
         else if(probGroup != WishesConstants.PROB_GROUP_SPECIAL_ITEMS)
         {
            finalChoice = this.sortNewItem(WishesConstants.PROB_GROUP_SPECIAL_ITEMS);
         }
         return finalChoice;
      }
   }
}

