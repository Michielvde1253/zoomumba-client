package com.bigpoint.zoomumba.model.gameConfig.vo
{
   import com.bigpoint.zoomumba.model.app.cageUpgrades.vo.LevelConfigVO;
   import com.bigpoint.zoorama.data.settings.WelcomeBackItem;
   
   public class MainConfigVO
   {
      public var userExperienceLevels:Vector.<Number> = new Vector.<Number>();
      
      public var resourcesCap:int;
      
      public var trashFactorForAttraction:Number;
      
      public var cageLevelConfigs:Vector.<LevelConfigVO> = new Vector.<LevelConfigVO>();
      
      public var welcomeBackItems:Vector.<Vector.<WelcomeBackItem>> = new Vector.<Vector.<WelcomeBackItem>>();
      
      public function MainConfigVO()
      {
         super();
      }
   }
}

