package com.bigpoint.zoomumba.controller.app.settings
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WishesConstants;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppSettingsProxy;
   import com.bigpoint.zoomumba.model.app.settings.vo.AppSettingsVO;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldAnimationProxy;
   import com.bigpoint.zoomumba.model.visitorWishes.VisitorWishesProxy;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipManager;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.StageQuality;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class UpdateAppSettingsCommand extends SimpleCommand
   {
      public function UpdateAppSettingsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:AppSettingsProxy = facade.retrieveProxy(AppSettingsProxy.NAME) as AppSettingsProxy;
         var _loc3_:AppSettingsVO = param1.getBody() as AppSettingsVO;
         var _loc4_:AppConfigProxy = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
         _loc2_.updateAppSettingsData(_loc3_);
         if(_loc2_.hasBackgroundSounds != SoundManager.getInstance().hasBackgroundSound())
         {
            if(_loc2_.hasBackgroundSounds)
            {
               if(_loc4_.musicTheme != "")
               {
                  SoundManager.getInstance().setMusicTheme(_loc4_.musicTheme);
               }
               SoundManager.getInstance().enableBackgroundSound();
               sendNotification(Note.SOUND_BUTTON_STATE_ON);
            }
            else
            {
               SoundManager.getInstance().disableBackgroundSound();
               sendNotification(Note.SOUND_BUTTON_STATE_OFF);
            }
         }
         if(_loc2_.hasSoundEffects)
         {
            SoundManager.getInstance().enableSoundEffects();
         }
         else
         {
            SoundManager.getInstance().disableSoundEffects();
         }
         if(!_loc2_.hasBackgroundSounds && !_loc2_.hasSoundEffects)
         {
            sendNotification(Note.DISABLE_GAME_VOLUME);
         }
         else
         {
            sendNotification(Note.ENABLE_GAME_VOLUME);
         }
         if(_loc2_.hasVisitors)
         {
            sendNotification(Note.ENABLE_VISITORS);
         }
         else
         {
            sendNotification(Note.DISABLE_VISITORS);
         }
         var _loc5_:VisitorWishesProxy = facade.retrieveProxy(VisitorWishesProxy.NAME) as VisitorWishesProxy;
         _loc5_.setCurrentAction(WishesConstants.ACTION_CHANGE_STATUS);
         if(_loc2_.hasVisitorWishes)
         {
            sendNotification(Note.VISITOR_CALCULATE_WISHES,true);
         }
         else
         {
            sendNotification(Note.VISITOR_CALCULATE_WISHES,false);
         }
         if(_loc2_.hasTooltips)
         {
            TooltipManager.getInstance().enable();
            TooltipNewManager.enable();
         }
         else
         {
            TooltipManager.getInstance().disable();
            TooltipNewManager.disable();
         }
         switch(_loc3_.quality)
         {
            case "l":
               sendNotification(Note.CHANGE_STAGE_QUALITY,StageQuality.LOW);
               break;
            case "m":
               sendNotification(Note.CHANGE_STAGE_QUALITY,StageQuality.MEDIUM);
               break;
            case "h":
               sendNotification(Note.CHANGE_STAGE_QUALITY,StageQuality.BEST);
         }
         var _loc6_:PlayFieldAnimationProxy = facade.retrieveProxy(PlayFieldAnimationProxy.NAME) as PlayFieldAnimationProxy;
         _loc6_.setMaxPossibleAnimations(_loc2_.animationLevel);
      }
   }
}

