package com.bigpoint.zoomumba.controller.actionMenus
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuManager;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CheckCageMenuAutoCloseCommand extends SimpleCommand
   {
      public function CheckCageMenuAutoCloseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = 0;
         var _loc3_:PlayFieldProxy = null;
         var _loc4_:Cage = null;
         var _loc5_:ActionMenuManager = null;
         if(param1.getBody())
         {
            _loc2_ = int(param1.getBody());
            _loc3_ = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
            _loc4_ = _loc3_.getItem(Categories.CAGE,_loc2_) as Cage;
            if(_loc4_)
            {
               _loc4_.percentageTimeForFeed;
               _loc4_.percentageTimeForWater;
               _loc4_.percentageTimeForCuddle;
               _loc4_.percentageTimeForClean;
               if(_loc4_.percentageTimeForFeed < 0.2 && _loc4_.percentageTimeForWater < 0.2 && _loc4_.percentageTimeForCuddle < 0.2 && _loc4_.percentageTimeForClean < 0.2 && (!_loc4_.isSick || _loc4_.isHealing))
               {
                  _loc5_ = facade.retrieveMediator(ActionMenuManager.NAME) as ActionMenuManager;
                  _loc5_.closeMenu();
               }
            }
            else
            {
               sendNotification(Note.ERROR_REPORT,"Cage with unique id : " + _loc2_ + " does not exists.");
            }
         }
         else
         {
            sendNotification(Note.ERROR_REPORT,"CheckCageMenuAutoCloseCommand needs cage id as a body.");
         }
      }
   }
}

