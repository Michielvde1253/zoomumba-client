package com.bigpoint.zoomumba.view.playfield.xmas
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.events.xmas.XmasProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoorama.utils.mouseModule.MouseModule;
   import com.bigpoint.zoorama.utils.mouseModule.MouseState;
   import com.bigpoint.zoorama.view.field.PlayField;
   import com.bigpoint.zoorama.view.field.items.Sleigh;
   import com.bigpoint.zoorama.view.field.items.Special;
   import flash.events.Event;
   import org.puremvc.as3.interfaces.INotification;
   
   public class SleighMediator extends BuildingMediator
   {
      public static const NAME:String = "SleighBuildingMediator";
      
      private var xmasProxy:XmasProxy;
      
      private var playfieldMediator:PlayField;
      
      private var canClick:Boolean = true;
      
      public function SleighMediator(param1:int, param2:int, param3:Sleigh)
      {
         super(NAME,param1,param2,param3);
         param3.addEventListener("animDone",this.handleSleighGoing);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.xmasProxy = facade.retrieveProxy(XmasProxy.NAME) as XmasProxy;
         this.playfieldMediator = facade.retrieveMediator(PlayField.NAME) as PlayField;
         this.updateSleighState();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.GAME_COUNTER_UPDATED,Note.XMAS_START_SANTA_ANIM,Note.LOCK_SLEIGH,Note.UNLOCK_SLEIGH];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.GAME_COUNTER_UPDATED:
               this.updateSleighState();
               break;
            case Note.XMAS_START_SANTA_ANIM:
               this.sleigh.setLevel(10);
               break;
            case Note.LOCK_SLEIGH:
               this.canClick = false;
               break;
            case Note.UNLOCK_SLEIGH:
               this.canClick = true;
         }
      }
      
      override protected function handleClick(param1:Event) : void
      {
         if(this.canClick)
         {
            if(MouseModule.getInstance().mouseType == MouseState.DEFAULT && this.sleigh.level != 10)
            {
               sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CHRISTMAS_WINDOW));
            }
         }
      }
      
      private function updateSleighState() : void
      {
         this.sleigh.setLevel(this.xmasProxy.sleighLevel());
      }
      
      private function handleSleighGoing(param1:Event) : void
      {
         if(this.playfieldMediator == null)
         {
            this.playfieldMediator = facade.retrieveMediator(PlayField.NAME) as PlayField;
         }
         this.playfieldMediator.removeParkingLotItem(Special.XMAS_SLEIGH);
      }
      
      override public function onRemove() : void
      {
         viewComponent.removeEventListener("animDone",this.handleSleighGoing);
         super.onRemove();
      }
      
      private function get sleigh() : Sleigh
      {
         return this.viewComponent as Sleigh;
      }
   }
}

