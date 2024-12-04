package com.bigpoint.zoomumba.controller.net.handlers
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.responceDataVo.general.ResponceData;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.information.InformationInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowSystemMediator;
   import com.bigpoint.zoorama.core.GUInterfaceManager;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleResponsesCommand extends SimpleCommand
   {
      public function HandleResponsesCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:ResponceData = null;
         var _loc7_:InventoryProxy = null;
         var _loc2_:Vector.<ResponceData> = param1.getBody() as Vector.<ResponceData>;
         var _loc3_:GUInterfaceManager = facade.retrieveMediator(GUInterfaceManager.NAME) as GUInterfaceManager;
         var _loc5_:WindowSystemMediator = facade.retrieveMediator(WindowSystemMediator.NAME) as WindowSystemMediator;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc6_];
            switch(_loc4_.success)
            {
               case "zoo.success.coupon.redeemed":
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.success.title"),TextResourceModule.getText("zoo.window.bonus.success.info"))));
                  _loc7_ = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
                  _loc7_.reload = true;
            }
            switch(_loc4_.error)
            {
               case "system.user.maintenance":
                  navigateToURL(new URLRequest("/index.php?maintenance=1"),"_self");
                  break;
               case "zoo.error.field.notHappy":
                  sendNotification(Note.HIDE_LOADER_LAYER);
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.inventory.store.error.title"),TextResourceModule.getText("zoo.inventory.store.error.info"))));
                  break;
               case "zoo.error.coupon.invalid":
                  sendNotification(Note.HIDE_LOADER_LAYER);
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.error.invalid.title"),TextResourceModule.getText("zoo.window.bonus.error.invalid.info"))));
                  break;
               case "zoo.error.coupon.participated":
                  sendNotification(Note.HIDE_LOADER_LAYER);
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.error.participated.title"),TextResourceModule.getText("zoo.window.bonus.error.participated.info"))));
                  break;
               case "zoo.error.coupon.bruteForce":
                  sendNotification(Note.HIDE_LOADER_LAYER);
                  sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.window.bonus.error.bruteforce.title"),TextResourceModule.getText("zoo.window.bonus.error.bruteforce.info"))));
                  break;
               case "zoo.user.notAuth":
               case "system.user.notAuth":
                  sendNotification(Note.HIDE_LOADER_LAYER);
                  if(_loc5_)
                  {
                     sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.INFORMATION,"",new InformationInitParams(TextResourceModule.getText("zoo.user.notAuth.title"),TextResourceModule.getText("zoo.user.notAuth.info")),new WindowParams("",null,Note.CLOSE_GAME,null,Note.CLOSE_GAME)));
                  }
                  else
                  {
                     sendNotification(Note.CLOSE_GAME);
                  }
                  break;
            }
            _loc6_++;
         }
      }
   }
}

