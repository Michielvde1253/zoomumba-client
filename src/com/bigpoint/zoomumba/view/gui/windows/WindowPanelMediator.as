package com.bigpoint.zoomumba.view.gui.windows
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoorama.MainConfig;
   import flash.display.Sprite;
   import mx.core.Application;
   import org.puremvc.as3.interfaces.IMediator;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   import spark.components.Group;
   import spark.core.SpriteVisualElement;
   
   public class WindowPanelMediator extends Mediator implements IMediator
   {
      public static const NAME:String = "WindowPanelMediator";
      
      private var oldWindowSystemHolders:SpriteVisualElement;
      
      public function WindowPanelMediator(param1:Group)
      {
         super(NAME,param1);
         this.oldWindowSystemHolders = new SpriteVisualElement();
         this.windowPanel.addElement(this.oldWindowSystemHolders);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.APP_RESIZED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Application = null;
         var _loc3_:Number = NaN;
         switch(param1.getName())
         {
            case Note.APP_RESIZED:
               _loc2_ = param1.getBody() as Application;
               this.windowPanel.width = _loc2_.width;
               this.windowPanel.height = _loc2_.height;
               if(_loc2_.width < MainConfig.STAGE_DEFALT_WIDTH)
               {
                  _loc3_ = _loc2_.width / MainConfig.STAGE_DEFALT_WIDTH;
                  this.oldWindowSystemHolders.scaleX = _loc3_;
                  this.oldWindowSystemHolders.scaleY = _loc3_;
               }
               else
               {
                  this.oldWindowSystemHolders.scaleX = 1;
                  this.oldWindowSystemHolders.scaleY = 1;
               }
         }
      }
      
      public function addOldWindowSystemLayer(param1:Sprite) : void
      {
         this.oldWindowSystemHolders.addChild(param1);
      }
      
      private function get windowPanel() : Group
      {
         return this.getViewComponent() as Group;
      }
   }
}

