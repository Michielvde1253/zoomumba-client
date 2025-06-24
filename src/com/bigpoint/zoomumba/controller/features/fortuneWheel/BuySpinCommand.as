package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.model.app.items.ItemPackVO;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.FortuneWheelProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class BuySpinCommand extends SimpleCommand
   {
      public static const PRICE_PER_TURN:int = 2;
      
      public function BuySpinCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:ItemPackVO = null;
         var _loc2_:Boolean = param1.getBody() as Boolean;
         var _loc3_:FortuneWheelProxy = facade.retrieveProxy(FortuneWheelProxy.NAME) as FortuneWheelProxy;
         if(this.afford)
         {
            sendNotification(NET.BUY_FORTUNE_WHEEL_TICKET);
            _loc3_.autoSpin = _loc2_;
            _loc3_.buy_log_data.push(TimeManager.currentTime);
            _loc4_ = new ItemPackVO();
            _loc4_.category = Categories.USER;
            _loc4_.itemId = UserResources.REAL_MONEY;
            _loc4_.count = -PRICE_PER_TURN;
            _loc3_.ticketBought = true;
            sendNotification(Note.UPDATE_RESOURCE_COUNT,_loc4_);
         }
         else
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
      }
      
      private function get afford() : Boolean
      {
         var _loc1_:CurrencyProxy = facade.retrieveProxy(CurrencyProxy.NAME) as CurrencyProxy;
         if(_loc1_.realMoney >= PRICE_PER_TURN)
         {
            return true;
         }
         return false;
      }
   }
}

