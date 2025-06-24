package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoorama.view.field.PlayField;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class RenderNeighbourFieldCommand extends SimpleCommand
   {
      public function RenderNeighbourFieldCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PlayfieldSettingsVO = param1.getBody() as PlayfieldSettingsVO;
         var _loc3_:AppProxy = facade.getProxy(AppProxy);
         var _loc4_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc5_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         _loc5_.setPlayFieldId(PlayFieldsTypes.FIELD_TYPE_FOREIGN,_loc2_.fId);
         _loc5_.storeNeighbourPlayfield(_loc2_);
         if(_loc3_.currentAppMode == AppMode.VISIT_NEIGHBOUR)
         {
            _loc4_.renderField(_loc2_);
         }
      }
   }
}

