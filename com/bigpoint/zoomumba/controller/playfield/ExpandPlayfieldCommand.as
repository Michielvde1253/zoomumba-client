package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoorama.view.field.PlayField;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class ExpandPlayfieldCommand extends SimpleCommand
   {
      public function ExpandPlayfieldCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         _loc2_.renderField(param1.getBody() as PlayfieldSettingsVO);
      }
   }
}

