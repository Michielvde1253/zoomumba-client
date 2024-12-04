package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.zoomumba.constants.CageActionIds;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.features.itemDrops.vo.CageDropRequestVO;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageInstantBreedActionCommand extends SimpleCommand
   {
      public function CageInstantBreedActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:CageDropRequestVO = new CageDropRequestVO(_loc2_,CageActionIds.SUPERBREAD);
         sendNotification(Note.GENERATE_DROPS,_loc3_);
         sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,_loc2_);
      }
   }
}

