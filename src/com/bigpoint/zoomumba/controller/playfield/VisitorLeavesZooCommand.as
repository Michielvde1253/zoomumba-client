package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.visitorWishes.VisitorWishesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class VisitorLeavesZooCommand extends SimpleCommand
   {
      public function VisitorLeavesZooCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:VisitorWishesProxy = facade.retrieveProxy(VisitorWishesProxy.NAME) as VisitorWishesProxy;
         _loc2_.setCurrentAction(WishesConstants.ACTION_VISITOR_LEAVES_ZOO);
         _loc2_.setCurrentVisitorId(int(param1.getBody()));
         sendNotification(Note.VISITOR_CALCULATE_WISHES);
      }
   }
}

