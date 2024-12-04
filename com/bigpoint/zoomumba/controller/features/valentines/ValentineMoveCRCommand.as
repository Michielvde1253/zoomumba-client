package com.bigpoint.zoomumba.controller.features.valentines
{
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ValentineMoveCRCommand extends SimpleCommand
   {
      public function ValentineMoveCRCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:NetProxy = null;
         var _loc2_:Array = param1.getBody() as Array;
         var _loc3_:CurrencyProxy = facade.getProxy(CurrencyProxy);
         if(_loc3_.realMoney < _loc2_[1])
         {
            sendNotification(GUINote.BANK_MENU_BUTTON_CLICKED);
         }
         else
         {
            _loc4_ = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
            _loc4_.callServer(NET.VALENTINES_MAKE_A_MOVE,[_loc2_[0],1]).addCallbackIfTrue(Note.VALENTINE_MOVED_OK,_loc2_[0]).addCallbackIfFalse(Note.VALENTINE_MOVED_ERROR,_loc2_[0]).sendNow();
         }
      }
   }
}

