package com.bigpoint.zoomumba.controller.features.fortuneWheel
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.features.collectables.CollectablesProxy;
   import com.bigpoint.zoomumba.model.features.fortuneWheel.vo.FortuneWheelRewardVO;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.fortuneWheel.ZooWheelRewardInitParams;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.sound.SoundManager;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class HandleZooWheelWinRewardCommand extends SimpleCommand
   {
      public function HandleZooWheelWinRewardCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:CollectablesProxy = null;
         var _loc2_:FortuneWheelRewardVO = param1.getBody() as FortuneWheelRewardVO;
         SoundManager.getInstance().playSoundEffect(SoundEffectNames.SND_ZOOWHEEL_WON);
         facade.sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.ZOO_WHEEL_REWARD_WINDOW,"",new ZooWheelRewardInitParams(_loc2_)));
         if(_loc2_.category == Categories.COLLECTIBLE)
         {
            _loc3_ = facade.retrieveProxy(CollectablesProxy.NAME) as CollectablesProxy;
            _loc3_.increaseCollectableAmount(_loc2_.id,_loc2_.count);
         }
      }
   }
}

