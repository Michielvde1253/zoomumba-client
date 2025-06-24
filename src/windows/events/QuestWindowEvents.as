package windows.events
{
   import flash.events.Event;
   
   public class QuestWindowEvents extends Event
   {
      public static const QUESTS_INFO_BUTTON_CLICK:String = "QUESTS_INFO_BUTTON_CLICK";
      
      public static const RENEW_QUESTS_BUTTON_CLICK:String = "RENEW_QUESTS_BUTTON_CLICK";
      
      public static const QUEST_ITEM_BUTTON_CLICKED:String = "QUEST_ITEM_BUTTON_CLICKED";
      
      public static const QUEST_MAIN_BUTTON_CLICKED:String = "QUEST_MAIN_BUTTON_CLICKED";
      
      public var questId:int = -1;
      
      public function QuestWindowEvents(param1:String, param2:int = -1, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.questId = param2;
      }
   }
}

