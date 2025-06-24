package com.bigpoint.zoomumba.controller.lastItemAction
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.instantDrag.InstantDragProxy;
   import com.bigpoint.zoomumba.model.instantDrag.vo.LastBuyVo;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class LastItemActionCommand extends SimpleCommand
   {
      public function LastItemActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:String = param1.getName();
         var _loc3_:Object = param1.getBody();
         switch(_loc2_)
         {
            case Note.SAVE_LAST_DRAG_ITEM:
               this.proxy.lastItem = _loc3_ as LastBuyVo;
               break;
            case Note.CLEAR_LAST_DRAG_ITEM:
               this.proxy.clearLastDragItem();
               break;
            case Note.FINISHED_DRAG_ITEM:
               this.proxy.startNextDragItem();
         }
      }
      
      private function get proxy() : InstantDragProxy
      {
         return facade.getProxy(InstantDragProxy) as InstantDragProxy;
      }
   }
}

