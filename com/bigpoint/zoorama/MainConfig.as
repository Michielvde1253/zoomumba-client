package com.bigpoint.zoorama
{
   import com.bigpoint.zoomumba.view.app.ApplicationMediator;
   import org.puremvc.as3.patterns.facade.Facade;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class MainConfig extends Proxy
   {
      public static const NAME:String = "MainConfig";
      
      public static const STAGE_DEFALT_WIDTH:int = 986;
      
      public static const STAGE_DEFALT_HEIGHT:int = 565;
      
      public static const SETTINGS_PATH:String = "./";
      
      public static const SETTINGS_FILENAME:String = "settings.xml";
      
      public static const LOCALIZATION_PATH:String = "./xml/";
      
      public static const LOCALIZATION_FILENAME:String = "local.xml";
      
      public static const LOCAL_DE:String = "de";
      
      public static const LOCAL_EN:String = "en";
      
      public static const LOCAL_RU:String = "ru";
      
      public static const REQUEST_TIMEOUT:int = 20000;
      
      public static const API_FLUSH_INTERVAL:int = 4000;
      
      public static const API_NAME:String = "ZooApi.php";
      
      public static const LOCALIZATION_TUTORIAL_PATH:String = "/img/$local$/flash/window_tutorial/";
      
      public static const LOCALIZATION_TUTORIAL_FILEXTENSION:String = ".png";
      
      public static const TILE_WIDTH:int = 94;
      
      public static const TILE_HEIGHT:int = 40;
      
      public static const GAME_FIELD_HEIGHT:int = 1340;
      
      public static const GAME_FIELD_WIDTH:int = 1972;
      
      public static const DEFAULT_FIELD_SIZE:int = 10;
      
      public static const MAX_FIELD_SIZE:int = 18;
      
      public static const FORGOTTEN_ZOO_ENABLE_FIELD_SIZE:int = 13;
      
      public static const ZOOM_LEVELS:Vector.<Number> = Vector.<Number>([0.5,1,2]);
      
      public static const ZOOM_DEFAULT_ID:int = 2;
      
      public static const GAME_MODE_TRANSITION_ANIM_TIME:Number = 0.5;
      
      public static const ANIMAL_HAPPYNESS_BASE:int = 10;
      
      public static const ANIMAL_HAPPYNESS_WATER:int = 30;
      
      public static const ANIMAL_HAPPYNESS_CLEAN:int = 30;
      
      public static const ANIMAL_HAPPYNESS_FOOD:int = 30;
      
      public static const ANIMAL_HAPPYNESS_CUDDLE:int = 50;
      
      public static const ANIMAL_HAPPYNESS_LEVEL_1:int = 0;
      
      public static const ANIMAL_HAPPYNESS_LEVEL_2:int = 30;
      
      public static const ANIMAL_HAPPYNESS_LEVEL_3:int = 60;
      
      public static const ANIMAL_HAPPYNESS_LEVEL_4:int = 90;
      
      public static const ANIMAL_HAPPYNESS_LEVEL_5:int = 140;
      
      public static const FAMILY_COUNT_MAX:int = 3;
      
      public static const MAX_PLAYER_LEVEL:int = 100;
      
      public static const VISITOR_SPOWN_INTERVALS:int = 20;
      
      public static const PERCENTAGE_FOR_ACTIONS:int = 80;
      
      public static const PERCENTAGE_FOR_SUPER_ACTIONS:int = 80;
      
      public static const MAX_CAGE_LEVEL:int = 5;
      
      public static const RESOURCE_ROUNDING_FACTOR:Number = 0.2;
      
      public static const FIELD_ITEM_TABLE_WIDTH:int = 200;
      
      public static const FIELD_ITEM_TABLE_HEIGHT:int = 200;
      
      public static const PRICE_TXT_COLOR_ENABLE:uint = 0;
      
      public static const PRICE_TXT_COLOR_ENABLE_BROWN:uint = 3480321;
      
      public static const PRICE_TXT_COLOR_DISABLE:uint = 13382451;
      
      public static const PRICE_TXT_COLOR_WHITE:uint = 16777215;
      
      public static const RESOURCE_TXT_COLOR_AMMOUNT_GOOD:uint = 16761439;
      
      public static const RESOURCE_TXT_COLOR_AMMOUNT_BAD:uint = 16731983;
      
      public static const COLECTABLE_ENTRANCE_FEE_AMMOUNT:int = 200;
      
      public static const COLECTABLE_ENTRANCE_FEE_CAP_MIN:int = 4500;
      
      public static const COLECTABLE_ENTRANCE_FEE_CAP_BY_LEVEL:int = 500;
      
      public static const CAGE_ANIMAL_HAPPYNESS_GOOD_FOR_STARADGE:Number = 0.9;
      
      public static const TRASH_ON_ROAD_VARIATIONS:int = 1;
      
      public static const SAFARI_JOKERS_VARIATIONS:int = 4;
      
      public static const SAFARI_ENABLED_LEVEL:int = 7;
      
      public static const FORTUNE_WHEEL_ENABLED_LEVEL:int = 3;
      
      public static const ESTER_CAGE_UPGRADE_COST:int = 10;
      
      public function MainConfig()
      {
         super(NAME);
      }
      
      public static function get STAGE_WIDTH() : int
      {
         var _loc1_:ApplicationMediator = Facade.getInstance().retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         return _loc1_.STAGE_WIDTH;
      }
      
      public static function get STAGE_HEIGHT() : int
      {
         var _loc1_:ApplicationMediator = Facade.getInstance().retrieveMediator(ApplicationMediator.NAME) as ApplicationMediator;
         return _loc1_.STAGE_HEIGHT;
      }
   }
}

