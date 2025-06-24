package com.bigpoint.zoorama.view.gui.win
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.view.gui.core.Coreponent;
   import com.bigpoint.zoorama.view.gui.win.generals.SizedSmallWindow;
   import com.bigpoint.zoorama.view.gui.win.generals.WindowButtonParams;
   
   public class AnimalBreedProgressWindow extends SizedSmallWindow
   {
      public function AnimalBreedProgressWindow(param1:Notifier, param2:WindowButtonParams = null)
      {
         var _loc3_:String = "AnimalbreedProgress";
         name = OldWindowTypes.ANIMALBREED_IN_PROGRESS.toString();
         modal = true;
         useHeaderLoader = false;
         isLoaded = true;
         super(param1,_loc3_,param2);
      }
      
      override protected function buildPreloaderWheel() : void
      {
         super.buildPreloaderWheel();
         preloaderWheel.alpha = 1;
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

