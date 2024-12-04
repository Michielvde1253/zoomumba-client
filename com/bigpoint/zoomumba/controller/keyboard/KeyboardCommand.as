package com.bigpoint.zoomumba.controller.keyboard
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.instantDrag.InstantDragProxy;
   import org.puremvc.as3.interfaces.ICommand;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class KeyboardCommand extends SimpleCommand implements ICommand
   {
      public function KeyboardCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:Object = param1.getName();
         switch(_loc3_)
         {
            case Note.KEYBOARD_CTRL_DOWN:
               if(this.proxy.ctrlHold == false)
               {
                  this.proxy.clearLastDragItem();
               }
               this.proxy.ctrlHold = true;
               break;
            case Note.KEYBOARD_CTRL_UP:
               this.proxy.ctrlHold = false;
               this.proxy.clearLastDragItem();
         }
      }
      
      private function get proxy() : InstantDragProxy
      {
         return facade.getProxy(InstantDragProxy) as InstantDragProxy;
      }
   }
}

