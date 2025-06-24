package com.bigpoint.zoomumba.view.admin
{
   import com.bigpoint.zoomumba.constants.ADMIN;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.admin.components.CageId;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class CageIdDebugMediator extends Mediator
   {
      public static const NAME:String = "CageIdDebugMediator";
      
      public function CageIdDebugMediator(param1:CageId)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         this.component.cageId.label = "468468468468";
         this.component.cageId.addEventListener(MouseEvent.CLICK,this.buttonClick);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ADMIN.SHOW_CAGE_ID];
      }
      
      private function buttonClick(param1:MouseEvent) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.VALENTINES_WINDOW));
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case ADMIN.SHOW_CAGE_ID:
               this.component.cageId.label = param1.getBody().toString();
         }
      }
      
      private function get component() : CageId
      {
         return this.viewComponent as CageId;
      }
   }
}

