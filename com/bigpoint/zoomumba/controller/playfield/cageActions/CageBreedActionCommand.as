package com.bigpoint.zoomumba.controller.playfield.cageActions
{
   import com.bigpoint.utils.timeManager.TimeManager;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net2.NetProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoorama.data.SoundEffectNames;
   import com.bigpoint.zoorama.notices.view.field.CageNotice;
   import com.bigpoint.zoorama.sound.SoundManager;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.command.SimpleCommand;
   
   public class CageBreedActionCommand extends SimpleCommand
   {
      public function CageBreedActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:Cage = _loc3_.getItem(Categories.CAGE,_loc2_) as Cage;
         var _loc5_:NetProxy = facade.retrieveProxy(NetProxy.NAME) as NetProxy;
         var _loc6_:SoundManager = SoundManager.getInstance();
         if(_loc4_.breedTimeStamp > 0 && _loc4_.breedTimeStamp < TimeManager.currentTime)
         {
            _loc4_.commandIds.breedEnd = _loc5_.currentRequestId;
            sendNotification(NET.BREED_END,[_loc2_]);
            _loc6_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_MAKEBABY);
         }
         else
         {
            sendNotification(Note.OPEN_CAGE_BREED_WINDOW,new CageNotice(CageNotice.OPEN_CAGE_BREED_WINDOW,_loc4_));
            _loc6_.playSoundEffect(SoundEffectNames.SND_ACTIONMENU_MAKEBABY);
         }
         sendNotification(Note.CHECK_CAGE_MENU_AUTOCLOSE,_loc2_);
      }
   }
}

