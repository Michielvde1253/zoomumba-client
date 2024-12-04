package com.bigpoint.zoomumba.controller.map
{
   import com.bigpoint.zoomumba.view.features.map.MapFullScreenMediator;
   import mx.core.UIComponent;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class InitMapSystemCommand extends SimpleCommand
   {
      public function InitMapSystemCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:UIComponent = param1.getBody() as UIComponent;
         facade.registerMediator(new MapFullScreenMediator(_loc2_));
      }
   }
}

