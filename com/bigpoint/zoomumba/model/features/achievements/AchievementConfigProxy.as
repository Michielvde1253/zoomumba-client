package com.bigpoint.zoomumba.model.features.achievements
{
   import com.bigpoint.zoomumba.model.net.responceDataVo.quests.AchievementData;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class AchievementConfigProxy extends Proxy implements IProxy
   {
      public static const NAME:String = "AchievementConfigProxy";
      
      public function AchievementConfigProxy(param1:Vector.<AchievementData>)
      {
         super(NAME,param1);
      }
      
      public function getAchievementConfig() : Vector.<AchievementData>
      {
         return data as Vector.<AchievementData>;
      }
   }
}

