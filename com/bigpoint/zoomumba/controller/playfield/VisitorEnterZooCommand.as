package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.visitorWishes.VisitorWishesProxy;
   import com.bigpoint.zoorama.data.fieldItems.FieldVisitorData;
   import com.bigpoint.zoorama.view.field.items.Visitor;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class VisitorEnterZooCommand extends SimpleCommand
   {
      public function VisitorEnterZooCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:VisitorWishesProxy = null;
         var _loc2_:FieldVisitorData = param1.getBody() as FieldVisitorData;
         if(_loc2_.itemId != Visitor.EASTER_VISITOR_ID)
         {
            _loc3_ = facade.retrieveProxy(VisitorWishesProxy.NAME) as VisitorWishesProxy;
            _loc3_.setCurrentAction(WishesConstants.ACTION_VISITOR_ENTER_ZOO);
            _loc3_.setCurrentVisitorId(_loc2_.uniqueId);
            sendNotification(Note.VISITOR_CALCULATE_WISHES);
         }
      }
   }
}

