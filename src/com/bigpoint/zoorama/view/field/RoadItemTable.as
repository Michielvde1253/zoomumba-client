package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.zoorama.MainConfig;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class RoadItemTable
   {
      private var roadTypes:Vector.<Vector.<int>>;
      
      private var roadUniqueIds:Vector.<Vector.<int>>;
      
      private var allRoadIds:Vector.<int>;
      
      private var roadCommandIds:Dictionary;
      
      private var roadCords:Dictionary;
      
      private var roadTypeCountById:Vector.<int>;
      
      public function RoadItemTable()
      {
         var _loc2_:int = 0;
         this.allRoadIds = new Vector.<int>();
         this.roadCommandIds = new Dictionary();
         this.roadCords = new Dictionary();
         this.roadTypeCountById = new Vector.<int>();
         super();
         this.roadTypes = new Vector.<Vector.<int>>();
         this.roadUniqueIds = new Vector.<Vector.<int>>();
         var _loc1_:int = 0;
         while(_loc1_ < MainConfig.FIELD_ITEM_TABLE_WIDTH)
         {
            this.roadTypes[_loc1_] = new Vector.<int>();
            this.roadUniqueIds[_loc1_] = new Vector.<int>();
            _loc2_ = 0;
            while(_loc2_ < MainConfig.FIELD_ITEM_TABLE_HEIGHT)
            {
               this.roadTypes[_loc1_][_loc2_] = -1;
               this.roadUniqueIds[_loc1_][_loc2_] = -1;
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function getAllRoadsIds() : Vector.<int>
      {
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:int = 0;
         while(_loc2_ < this.allRoadIds.length)
         {
            _loc1_[_loc2_] = this.allRoadIds[_loc2_];
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function addRoad(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(param3 < 0 || param3 >= MainConfig.FIELD_ITEM_TABLE_WIDTH || param4 < 0 || param4 >= MainConfig.FIELD_ITEM_TABLE_HEIGHT)
         {
            return;
         }
         while(this.roadTypeCountById.length - 1 < param2)
         {
            this.roadTypeCountById.push(0);
         }
         if(this.roadTypes[param3][param4] != param2)
         {
            ++this.roadTypeCountById[param2];
         }
         this.roadTypes[param3][param4] = param2;
         this.roadUniqueIds[param3][param4] = param1;
         this.roadCords[param1] = new Point(param3,param4);
         if(param1 >= 0)
         {
            this.allRoadIds.push(param1);
         }
      }
      
      public function removeRoadAtCords(param1:int, param2:int) : void
      {
         this.removeRoadById(this.roadUniqueIds[param1][param2]);
      }
      
      public function removeRoadById(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Point = this.getRoadCords(param1);
         if(_loc2_)
         {
            --this.roadTypeCountById[this.roadTypes[_loc2_.x][_loc2_.y]];
            this.roadTypes[_loc2_.x][_loc2_.y] = -1;
            this.roadUniqueIds[_loc2_.x][_loc2_.y] = -1;
            delete this.roadCords[param1];
            _loc3_ = 0;
            while(_loc3_ < this.allRoadIds.length)
            {
               if(this.allRoadIds[_loc3_] == param1)
               {
                  this.allRoadIds.splice(_loc3_,1);
                  break;
               }
               _loc3_++;
            }
         }
      }
      
      public function getRoadCords(param1:int) : Point
      {
         var _loc2_:Point = null;
         if(this.roadCords[param1])
         {
            _loc2_ = new Point(this.roadCords[param1].x,this.roadCords[param1].y);
         }
         return _loc2_;
      }
      
      public function getCellRoadType(param1:int, param2:int) : int
      {
         if(param1 < 0 || param1 >= MainConfig.FIELD_ITEM_TABLE_WIDTH || param2 < 0 || param2 >= MainConfig.FIELD_ITEM_TABLE_HEIGHT)
         {
            return -1;
         }
         return this.roadTypes[param1][param2];
      }
      
      public function getCellRoadUniqueId(param1:int, param2:int) : int
      {
         if(param1 < 0 || param1 >= MainConfig.FIELD_ITEM_TABLE_WIDTH || param2 < 0 || param2 >= MainConfig.FIELD_ITEM_TABLE_HEIGHT)
         {
            return -1;
         }
         return this.roadUniqueIds[param1][param2];
      }
      
      public function setRoadCommandId(param1:int, param2:int) : void
      {
         this.roadCommandIds[param1] = param2;
      }
      
      public function getCellRoadCommandId(param1:int) : int
      {
         return this.roadCommandIds[param1];
      }
      
      public function getRoadTypeCountById() : Vector.<int>
      {
         return this.roadTypeCountById;
      }
   }
}

