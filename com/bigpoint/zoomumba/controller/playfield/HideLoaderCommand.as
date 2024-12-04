package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.view.gui.windows.WindowPanelMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   import spark.components.Group;
   
   public class HideLoaderCommand extends SimpleCommand
   {
      public function HideLoaderCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc5_:* = null;
         var _loc2_:WindowPanelMediator = facade.retrieveMediator(WindowPanelMediator.NAME) as WindowPanelMediator;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Group = _loc2_.getViewComponent() as Group;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.numElements)
         {
            _loc5_ = _loc3_.getElementAt(_loc4_) + "";
            if(_loc5_.indexOf(".") > 0)
            {
               _loc5_ = _loc5_.substr(_loc5_.lastIndexOf(".") + 1,_loc5_.length);
               if(_loc5_ == "loaderLayer")
               {
                  _loc3_.removeElement(_loc3_.getElementAt(_loc4_));
                  break;
               }
            }
            _loc4_++;
         }
      }
   }
}

