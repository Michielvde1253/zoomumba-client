package com.bigpoint.zoomumba.view.windows.gifts
{
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.gifts.vo.GiftSenderVO;
   import com.bigpoint.zoomumba.model.net.vo.PromoPackBuyVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.ConfirmationInitParams;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.greensock.TweenMax;
   import custom.features.gifts.BuddyGiftReceiverItem;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import windows.custom.gifts.SendGiftContent;
   
   public class SendGiftContentMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "SendGiftContentMediator";
      
      private var _listData:Vector.<GiftSenderVO>;
      
      private var _CURRENT_PAGE:int = 0;
      
      private const ITEMS_PER_PAGE:int = 7;
      
      private var selectedItems:Array = new Array();
      
      private var DEBUG:Boolean = false;
      
      private var MAX_SELECTED_ITEMS:int = 5;
      
      public function SendGiftContentMediator(param1:SendGiftContent)
      {
         super(NAME,param1);
      }
      
      private function TEST() : void
      {
         var _loc3_:GiftSenderVO = null;
         var _loc1_:Vector.<GiftSenderVO> = new Vector.<GiftSenderVO>();
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            _loc3_ = new GiftSenderVO();
            _loc3_.giftId = 1;
            _loc3_.userId = 200000150 + _loc2_;
            _loc3_.userName = "alexandrul";
            _loc1_.push(_loc3_);
            _loc2_++;
         }
         this.listData = _loc1_;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.BUY_SUPER_FOOD_PACK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.BUY_SUPER_FOOD_PACK:
               this.buyPack();
         }
      }
      
      private function buyPack() : void
      {
         var _loc1_:PromoPackBuyVO = new PromoPackBuyVO();
         _loc1_.packId = 3;
         _loc1_.giftTo = this.selectedItems;
         var _loc2_:String = TextResourceModule.getText("zoo.window.infoLayers.purchaseConfirmed.title");
         var _loc3_:String = TextResourceModule.getText("zoo.window.infoLayers.purchaseConfirmed.gift");
         sendNotification(NET.BUY_PROMO_PACK,[_loc1_.packId,_loc1_.giftTo]);
         sendNotification(WinNote.CLOSE_WINDOW,new WindowVars(WindowTypes.SEND_GIFT));
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(_loc2_,_loc3_)));
      }
      
      private function handleSendGiftsClick(param1:MouseEvent) : void
      {
         if(this.selectedItems.length < this.MAX_SELECTED_ITEMS)
         {
            facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CONFIRMATION,"",new ConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.gift.title"),TextResourceModule.getText("zoo.window.confirmation.gift.info")),new WindowParams("",null,"",null,Note.BUY_SUPER_FOOD_PACK,this.selectedItems)));
         }
         else
         {
            sendNotification(Note.BUY_SUPER_FOOD_PACK,this.selectedItems);
         }
      }
      
      private function handleAddUserButtonClick(param1:MouseEvent) : void
      {
         sendNotification(Note.OPEN_ADD_USER_WINDOW);
      }
      
      private function handleUpButtonClick(param1:MouseEvent) : void
      {
         --this.CURRENT_PAGE;
      }
      
      private function handleDownButtonClick(param1:MouseEvent) : void
      {
         this.CURRENT_PAGE += 1;
      }
      
      private function bindDataProvider() : void
      {
         this.setPaging();
         this.drawList();
      }
      
      private function drawList() : void
      {
         var _loc2_:BuddyGiftReceiverItem = null;
         this.removeOldItems();
         var _loc1_:int = 0;
         while(_loc1_ < this.ITEMS_PER_PAGE)
         {
            if(this.CURRENT_PAGE * this.ITEMS_PER_PAGE + _loc1_ >= this.listData.length)
            {
               this.updateSelection();
               return;
            }
            _loc2_ = new BuddyGiftReceiverItem();
            _loc2_.username = this.listData[this.CURRENT_PAGE * this.ITEMS_PER_PAGE + _loc1_].userName;
            _loc2_.userID = this.listData[this.CURRENT_PAGE * this.ITEMS_PER_PAGE + _loc1_].userId.toString();
            this.sendGiftContent.giftList.addElement(_loc2_);
            _loc2_.addEventListener(MouseEvent.CLICK,this.handleItemClick,false,0,true);
            _loc1_++;
         }
         this.updateSelection();
      }
      
      private function updateSelection() : void
      {
         var _loc2_:BuddyGiftReceiverItem = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.sendGiftContent.giftList.numChildren)
         {
            _loc2_ = BuddyGiftReceiverItem(this.sendGiftContent.giftList.getChildAt(_loc1_));
            if(this.selectedItems.indexOf(_loc2_.userID) > -1)
            {
               _loc2_.selected = true;
            }
            _loc1_++;
         }
      }
      
      private function handleItemClick(param1:MouseEvent) : void
      {
         if(this.selectedItems.length < this.MAX_SELECTED_ITEMS || BuddyGiftReceiverItem(param1.target)._selected)
         {
            BuddyGiftReceiverItem(param1.target).toggle();
            if(BuddyGiftReceiverItem(param1.target)._selected)
            {
               this.selectedItems.push(BuddyGiftReceiverItem(param1.target).userID);
            }
            else
            {
               this.selectedItems.splice(this.selectedItems.indexOf(BuddyGiftReceiverItem(param1.target).userID),1);
            }
            return;
         }
      }
      
      private function removeOldItems() : void
      {
         this.sendGiftContent.giftList.removeAllElements();
      }
      
      private function setPaging() : void
      {
         TweenMax.to(this.sendGiftContent.upButtonHit,0.5,{"colorMatrixFilter":{"saturation":0}});
         TweenMax.to(this.sendGiftContent.downButtonHit,0.5,{"colorMatrixFilter":{"saturation":0}});
         this.sendGiftContent.upButtonHit.removeEventListener(MouseEvent.CLICK,this.handleUpButtonClick);
         this.sendGiftContent.downButtonHit.removeEventListener(MouseEvent.CLICK,this.handleDownButtonClick);
         if(this.CURRENT_PAGE > 0)
         {
            TweenMax.to(this.sendGiftContent.upButtonHit,0.5,{"colorMatrixFilter":{"saturation":1}});
            this.sendGiftContent.upButtonHit.addEventListener(MouseEvent.CLICK,this.handleUpButtonClick);
         }
         if(this.TOTAL_PAGES - 1 > this.CURRENT_PAGE)
         {
            TweenMax.to(this.sendGiftContent.downButtonHit,0.5,{"colorMatrixFilter":{"saturation":1}});
            this.sendGiftContent.downButtonHit.addEventListener(MouseEvent.CLICK,this.handleDownButtonClick);
         }
      }
      
      private function get TOTAL_PAGES() : int
      {
         if(!this._listData)
         {
            return 0;
         }
         return Math.ceil(this._listData.length / this.ITEMS_PER_PAGE);
      }
      
      private function get sendGiftContent() : SendGiftContent
      {
         return this.viewComponent as SendGiftContent;
      }
      
      public function get listData() : Vector.<GiftSenderVO>
      {
         return this._listData;
      }
      
      public function set listData(param1:Vector.<GiftSenderVO>) : void
      {
         this._listData = param1;
         this.bindDataProvider();
      }
      
      public function get CURRENT_PAGE() : int
      {
         return this._CURRENT_PAGE;
      }
      
      public function set CURRENT_PAGE(param1:int) : void
      {
         this._CURRENT_PAGE = param1;
         this.bindDataProvider();
      }
   }
}

