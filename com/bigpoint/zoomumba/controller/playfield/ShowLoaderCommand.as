package com.bigpoint.zoomumba.controller.playfield
{
   import com.bigpoint.zoomumba.view.gui.windows.WindowPanelMediator;
   import custom.loader.Prealoder;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   import spark.components.Group;
   
   public class ShowLoaderCommand extends SimpleCommand
   {
      public function ShowLoaderCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc6_:* = null;
         var _loc7_:Prealoder = null;
         var _loc2_:WindowPanelMediator = facade.retrieveMediator(WindowPanelMediator.NAME) as WindowPanelMediator;
         var _loc3_:Group = _loc2_.getViewComponent() as Group;
         var _loc4_:Boolean = true;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.numElements)
         {
            _loc6_ = _loc3_.getElementAt(_loc5_) + "";
            if(_loc6_.indexOf(".") > 0)
            {
               _loc6_ = _loc6_.substr(_loc6_.lastIndexOf(".") + 1,_loc6_.length);
               if(_loc6_ == "loaderLayer")
               {
                  _loc4_ = false;
                  break;
               }
            }
            _loc5_++;
         }
         if(_loc4_)
         {
            _loc7_ = new Prealoder();
            _loc7_.id = "loaderLayer";
            _loc7_.currentState = "dark";
            _loc3_.addElement(_loc7_);
         }
      }
   }
}

