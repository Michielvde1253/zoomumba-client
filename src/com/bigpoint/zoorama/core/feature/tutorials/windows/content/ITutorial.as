package com.bigpoint.zoorama.core.feature.tutorials.windows.content
{
   import com.bigpoint.utils.notificator.Notifier;
   
   public interface ITutorial
   {
      function initStep(param1:Notifier) : void;
      
      function set step(param1:int) : void;
   }
}

