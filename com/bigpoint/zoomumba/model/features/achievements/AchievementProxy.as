package com.bigpoint.zoomumba.model.features.achievements
{
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AchievementProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "AchievementProxy";
      
      public function AchievementProxy()
      {
         super(NAME,new Vector.<AchievementData>());
      }
      
      public function storeAchievementData(param1:Vector.<AchievementData>) : void
      {
         this.data = param1;
         sendNotification(DataNote.ACHIEVEMENT_UPDATED);
      }
      
      public function getAchievementData() : Vector.<AchievementData>
      {
         return data as Vector.<AchievementData>;
      }
      
      public function stageChanged(param1:AchievementData) : Boolean
      {
         var _loc3_:AchievementData = null;
         var _loc2_:Vector.<AchievementData> = this.getAchievementData();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.itemId == param1.itemId && param1.level > _loc3_.level)
            {
               this.data[_loc3_.id] = param1;
               _loc3_.level = param1.level;
               return true;
            }
         }
         return false;
      }
   }
}

