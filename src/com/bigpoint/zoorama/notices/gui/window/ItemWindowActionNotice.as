package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.utils.notificator.Notice;
   
   public class ItemWindowActionNotice extends Notice
   {
      public static const BUY_INSTANT_BUILD:String = "buyBuildingInstantBuild";
      
      public static const BUY_INSTANT_BREED:String = "buyCageInstantBreed";
      
      public static const START_BREED:String = "staretCageBreedAction";
      
      public static const UPGRADE_CAGE:String = "upgradeCageAction";
      
      public var itemCategory:int;
      
      public var itemUniqueId:int;
      
      public function ItemWindowActionNotice(param1:String, param2:int, param3:int)
      {
         this.itemCategory = param2;
         this.itemUniqueId = param3;
         super(param1);
      }
   }
}

