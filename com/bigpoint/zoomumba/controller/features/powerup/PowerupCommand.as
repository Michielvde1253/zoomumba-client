package com.bigpoint.zoomumba.controller.features.powerup
{
   import com.bigpoint.zoomumba.model.features.powerup.PowerupProxy;
   import com.bigpoint.zoomumba.model.features.powerup.vo.PowerupItemVO;
   import com.bigpoint.zoomumba.view.gui.powerupPanel.PowerupPanelMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class PowerupCommand extends SimpleCommand
   {
      public function PowerupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PowerupProxy = facade.retrieveProxy(PowerupProxy.NAME) as PowerupProxy;
         var _loc3_:PowerupPanelMediator = facade.retrieveMediator(PowerupPanelMediator.NAME) as PowerupPanelMediator;
         var _loc4_:int = param1.getBody() as int;
         var _loc5_:PowerupItemVO = _loc2_.getPowerupById(_loc4_);
         _loc3_.addPack(_loc5_);
      }
   }
}

