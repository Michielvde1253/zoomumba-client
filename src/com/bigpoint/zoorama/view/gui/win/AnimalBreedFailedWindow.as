package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   import com.bigpoint.zoorama.view.gui.win.generics.MessageWindow;
   
   public class AnimalBreedFailedWindow extends MessageWindow
   {
      public function AnimalBreedFailedWindow(param1:Notifier, param2:String, param3:String, param4:WindowButtonParams = null)
      {
         super(param1,param2,param3,param4);
      }
      
      override protected function initialize() : void
      {
         contentURL = "AnimalbreedFailed";
         name = OldWindowTypes.ANIMALBREED_FAILED.toString();
         modal = true;
      }
      
      override public function draw() : void
      {
         if(Settings.SCALE_TEST)
         {
            halign = Coreponent.ALIGN_H_LEFT;
            valign = Coreponent.ALIGN_V_TOP;
            this.x = 290;
            this.y = 120;
         }
         super.draw();
      }
   }
}

