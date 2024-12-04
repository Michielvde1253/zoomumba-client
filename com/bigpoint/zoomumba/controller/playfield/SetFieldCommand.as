package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.VisitorWishesProxy;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class SetFieldCommand extends SimpleCommand
   {
      public function SetFieldCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:VisitorWishesProxy = facade.retrieveProxy(VisitorWishesProxy.NAME) as VisitorWishesProxy;
         _loc2_.setCurrentAction(WishesConstants.ACTION_CHECK_PLAYFIELD_INTERACTIONS);
         sendNotification(Note.VISITOR_CALCULATE_WISHES);
         var _loc3_:PlayFieldAnimationProxy = facade.retrieveProxy(PlayFieldAnimationProxy.NAME) as PlayFieldAnimationProxy;
         if(_loc3_)
         {
            _loc3_.forceAnimationRecheck();
         }
      }
   }
}

