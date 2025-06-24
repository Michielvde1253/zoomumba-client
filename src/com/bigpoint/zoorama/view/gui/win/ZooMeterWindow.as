package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedMediumWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class ZooMeterWindow extends SizedMediumWindow
   {
      public function ZooMeterWindow(param1:Notifier, param2:WindowButtonParams = null)
      {
         var _loc3_:String = "ZooMeterWindow";
         name = OldWindowTypes.ZOO_METER.toString();
         modal = true;
         useHeaderLoader = false;
         headerFilename = "header_messaging";
         super(param1,_loc3_);
         halign = Coreponent.ALIGN_H_LEFT;
         valign = Coreponent.ALIGN_V_TOP;
         this.x = 143;
         this.y = 70;
      }
      
      override protected function assignLoadedContentGUI() : void
      {
         super.assignLoadedContentGUI();
      }
      
      override protected function loadContentFinished() : void
      {
         super.loadContentFinished();
         var _loc1_:Sprite = loadedContent.getChildByName("mcHeaderItem") as Sprite;
         _loc1_.visible = true;
         this.buildHeader();
      }
      
      override protected function buildHeader() : void
      {
         if(headerLoader)
         {
            headerLoader.x = 145;
            headerLoader.y = -15;
            addChild(headerLoader);
         }
      }
      
      override protected function connectButtonToClass(param1:DisplayObject, param2:Array) : void
      {
      }
   }
}

