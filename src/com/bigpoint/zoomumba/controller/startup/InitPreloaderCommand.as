package com.bigpoint.zoomumba.controller.startup
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.core.LoadingProcessProxy;
   import com.bigpoint.zoomumba.view.app.PreloaderMediator;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.command.MacroCommand;
   
   public class InitPreloaderCommand extends MacroCommand
   {
      public function InitPreloaderCommand()
      {
         super();
      }
      
      override protected function initializeMacroCommand() : void
      {
         facade.registerProxy(new LoadingProcessProxy());
         facade.registerMediator(new PreloaderMediator(new Sprite()));
         sendNotification(Note.INIT_PRELOADER);
         addSubCommand(LoadSettingsCommand);
      }
   }
}

