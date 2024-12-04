package com.bigpoint.zoomumba.model.visitorWishes
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.vo.VisitorWishesBubbleVO;
   import com.bigpoint.zoomumba.model.visitorWishes.vo.VisitorWishesVO;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import flash.utils.Dictionary;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class VisitorWishesProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "VisitorWishesProxy";
      
      private var _enabled:Boolean = false;
      
      private var _wishesCount:int = 0;
      
      private var _lastBubble:VisitorWishesBubbleVO;
      
      private var dicOfWishesByVisitor:Dictionary;
      
      private var wishesVO:VisitorWishesVO;
      
      private var _oldAmmountDecorInPF:int;
      
      private var _visitorsInZoo:int = 0;
      
      private var playFieldProxy:PlayFieldProxy;
      
      private var playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function VisitorWishesProxy()
      {
         super(NAME);
         this.dicOfWishesByVisitor = new Dictionary(true);
         this.wishesVO = new VisitorWishesVO();
      }
      
      override public function onRegister() : void
      {
         this.playFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         this.playfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
      }
      
      public function get visitorsInZoo() : int
      {
         return this._visitorsInZoo;
      }
      
      public function updateVisitorsInZoo(param1:int) : void
      {
         this._visitorsInZoo += param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function get oldAmmountDecorInPF() : int
      {
         return this._oldAmmountDecorInPF;
      }
      
      public function get timeOfTheLastWishedFullfilled() : int
      {
         return this.wishesVO.timeOfTheLastWishedFullfilled;
      }
      
      public function updateTimeOfTheLastWishedFullfilled() : void
      {
         this.wishesVO.timeOfTheLastWishedFullfilled = TimeManager.currentTime;
      }
      
      public function get timeOfTheLastCheckForTrash() : int
      {
         return this.wishesVO.timeOfTheLastCheckForTrash;
      }
      
      public function updateTimeOfTheLastCheckForTrash() : void
      {
         this.wishesVO.timeOfTheLastCheckForTrash = TimeManager.currentTime;
      }
      
      public function get currentAction() : int
      {
         return this.wishesVO.currentAction;
      }
      
      public function setCurrentAction(param1:int) : void
      {
         this.wishesVO.currentAction = param1;
      }
      
      public function get currentVisitorId() : int
      {
         return this.wishesVO.currentVisitorId;
      }
      
      public function setCurrentVisitorId(param1:int) : void
      {
         this.wishesVO.currentVisitorId = param1;
      }
      
      public function get wishesCount() : int
      {
         return this._wishesCount;
      }
      
      public function get lastBubble() : VisitorWishesBubbleVO
      {
         return this._lastBubble;
      }
      
      public function getWishBubble(param1:int) : VisitorWishesBubbleVO
      {
         return this.dicOfWishesByVisitor[param1];
      }
      
      public function getAllWishes() : Vector.<VisitorWishesBubbleVO>
      {
         var _loc2_:VisitorWishesBubbleVO = null;
         var _loc1_:Vector.<VisitorWishesBubbleVO> = new Vector.<VisitorWishesBubbleVO>();
         for each(_loc2_ in this.dicOfWishesByVisitor)
         {
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function updateHeartCounter(param1:int) : void
      {
         var _loc2_:VisitorWishesBubbleVO = this.dicOfWishesByVisitor[param1];
         ++_loc2_.heartCount;
      }
      
      public function updateWishBubble(param1:int, param2:int) : void
      {
         var _loc3_:VisitorWishesBubbleVO = this.dicOfWishesByVisitor[param1];
         _loc3_.state = param2;
      }
      
      public function updateLastActionBubble(param1:int, param2:int) : void
      {
         var _loc3_:VisitorWishesBubbleVO = this.dicOfWishesByVisitor[param1];
         _loc3_.lastAction = param2;
      }
      
      public function removeWishBubble(param1:int) : void
      {
         --this._wishesCount;
         this.dicOfWishesByVisitor[param1] = null;
      }
      
      public function createWishBubble(param1:int, param2:int, param3:ShopItemData = null) : void
      {
         var _loc4_:VisitorWishesBubbleVO = new VisitorWishesBubbleVO();
         _loc4_.type = param1;
         _loc4_.item = param3;
         _loc4_.visitorId = param2;
         _loc4_.state = WishesConstants.STATE_CREATED;
         if(param1 == WishesConstants.TYPE_ASK_ITEM && param3 == null)
         {
            _loc4_.state = WishesConstants.STATE_ERROR;
         }
         else
         {
            this._lastBubble = this.dicOfWishesByVisitor[_loc4_.visitorId] = _loc4_;
            if(this._lastBubble != null || this._wishesCount == 0)
            {
               if(param3 != null && param3.categoryId == Categories.DECOR && !this.isWishingAnotherDecoration(_loc4_))
               {
                  this._oldAmmountDecorInPF = this.playFieldProxy.getItemCount(param3.categoryId,this.playfieldSettingsProxy.getCurrentPlayFieldId());
               }
               ++this._wishesCount;
            }
         }
      }
      
      private function isWishingAnotherDecoration(param1:VisitorWishesBubbleVO) : Boolean
      {
         var _loc4_:VisitorWishesBubbleVO = null;
         var _loc2_:* = false;
         var _loc3_:Vector.<VisitorWishesBubbleVO> = this.getAllWishes();
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.item != null && _loc4_ != param1)
            {
               _loc2_ = _loc4_.item.categoryId == Categories.DECOR;
               if(_loc2_)
               {
                  break;
               }
            }
         }
         return _loc2_;
      }
   }
}

