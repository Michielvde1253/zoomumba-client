package com.bigpoint.zoomumba.controller.app
{
   import com.bigpoint.zoomumba.constants.AppMode;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.AppProxy;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.news.NewsProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.playfield.vo.PlayfieldSettingsVO;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.view.actionMenu.ActionMenuManager;
   import com.bigpoint.zoorama.view.field.PlayField;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class StartGameCommand extends SimpleCommand
   {
      public function StartGameCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppProxy = facade.retrieveProxy(AppProxy.NAME) as AppProxy;
         var _loc3_:NewsProxy = facade.retrieveProxy(NewsProxy.NAME) as NewsProxy;
         var _loc4_:PlayField = facade.retrieveMediator(PlayField.NAME) as PlayField;
         var _loc5_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc6_:UserProxy = facade.getProxy(UserProxy);
         var _loc7_:NetProxy = facade.getProxy(NetProxy);
         var _loc8_:ActionMenuManager = facade.retrieveMediator(ActionMenuManager.NAME) as ActionMenuManager;
         var _loc9_:PlayfieldSettingsVO = _loc5_.getCurrentFieldSettings();
         if(_loc2_.currentAppMode != AppMode.VISIT_NEIGHBOUR)
         {
            _loc4_.showPlayFieldData(_loc9_,_loc7_.lastParsedResponse);
            if(_loc6_.entranceFee > -1)
            {
               _loc8_.updateGateMenu();
            }
            _loc3_.checkForShow();
         }
         _loc4_.renderField(_loc9_);
         sendNotification(Note.REMOVE_PRELOADER);
      }
   }
}

