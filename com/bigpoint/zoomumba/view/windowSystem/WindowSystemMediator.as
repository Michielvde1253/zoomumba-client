package com.bigpoint.zoomumba.view.windowSystem
{
   import com.bigpoint.zoomumba.Zoomumba;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.view.gui.windows.WindowPanelMediator;
   import com.bigpoint.zoorama.MainConfig;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   import windows.core.AbstractWindow;
   
   public class WindowSystemMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "WindowSystemMediator";
      
      public function WindowSystemMediator(param1:Group)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         var _loc1_:WindowPanelMediator = facade.retrieveMediator(WindowPanelMediator.NAME) as WindowPanelMediator;
         (_loc1_.getViewComponent() as Group).addElement(this.windowContainer);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.APP_RESIZED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Zoomumba = null;
         var _loc3_:Number = NaN;
         switch(param1.getName())
         {
            case Note.APP_RESIZED:
               _loc2_ = param1.getBody() as Zoomumba;
               if(_loc2_.width < MainConfig.STAGE_DEFALT_WIDTH)
               {
                  _loc3_ = _loc2_.width / MainConfig.STAGE_DEFALT_WIDTH;
                  this.windowContainer.scaleX = _loc3_;
                  this.windowContainer.scaleY = _loc3_;
               }
               else
               {
                  this.windowContainer.scaleX = 1;
                  this.windowContainer.scaleY = 1;
               }
         }
      }
      
      public function showWindow(param1:AbstractWindow) : void
      {
         param1.verticalCenter = 0;
         param1.horizontalCenter = 0;
         this.windowContainer.addElement(param1);
      }
      
      public function hideWindow(param1:AbstractWindow) : void
      {
         this.windowContainer.removeElement(param1);
      }
      
      private function get windowContainer() : Group
      {
         return this.getViewComponent() as Group;
      }
   }
}

