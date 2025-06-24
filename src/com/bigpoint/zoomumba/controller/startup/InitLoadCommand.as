package com.bigpoint.zoomumba.controller.startup
{
   import org.puremvc.as3.patterns.command.MacroCommand;
   
   public class InitLoadCommand extends MacroCommand
   {
      public function InitLoadCommand()
      {
         super();
      }
      
      override protected function initializeMacroCommand() : void
      {
         addSubCommand(LoadGameConfigCommand);
         addSubCommand(PreloadResourcesCommand);
      }
   }
}

