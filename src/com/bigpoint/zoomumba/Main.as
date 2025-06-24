package com.bigpoint.zoomumba
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.greensock.plugins.ColorMatrixFilterPlugin;
   import com.greensock.plugins.TweenPlugin;
   import components.tooltip.ToolTipBrown;
   import flash.ui.ContextMenuItem;
   import mx.core.Application;
   import mx.events.FlexEvent;
   import mx.managers.ToolTipManager;
   
   public class Main extends Application
   {
      public const VERSION:String = "13681";
      
      public function Main()
      {
         super();
         addEventListener(FlexEvent.APPLICATION_COMPLETE,this.init);
      }
      
      private function init(param1:FlexEvent) : void
      {
         TimeManager.init();
         ApplicationFacade.getInstance().startup(this);
         ToolTipManager.toolTipClass = ToolTipBrown;
         this.contextMenu.customItems.push(new ContextMenuItem(this.VERSION));
         this.mouseChildren = true;
         this.mouseEnabled = false;
         TweenPlugin.activate([ColorMatrixFilterPlugin]);
      }
   }
}

