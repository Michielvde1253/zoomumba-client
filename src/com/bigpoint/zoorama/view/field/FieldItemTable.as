package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.zoorama.MainConfig;
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   
   public class FieldItemTable
   {
      private var fieldItems:Vector.<Vector.<CellData>>;
      
      public function FieldItemTable()
      {
         var _loc2_:int = 0;
         super();
         this.fieldItems = new Vector.<Vector.<CellData>>();
         var _loc1_:int = 0;
         while(_loc1_ < MainConfig.FIELD_ITEM_TABLE_WIDTH)
         {
            this.fieldItems[_loc1_] = new Vector.<CellData>();
            _loc2_ = 0;
            while(_loc2_ < MainConfig.FIELD_ITEM_TABLE_HEIGHT)
            {
               this.fieldItems[_loc1_][_loc2_] = new CellData();
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function addItem(param1:ItemAbstract, param2:int, param3:int) : void
      {
         var _loc5_:int = 0;
         if(param2 < 0 || param2 >= MainConfig.FIELD_ITEM_TABLE_WIDTH || param3 < 0 || param3 >= MainConfig.FIELD_ITEM_TABLE_HEIGHT)
         {
            return;
         }
         var _loc4_:int = param2;
         while(_loc4_ < param2 + param1.itemWidth)
         {
            _loc5_ = param3;
            while(_loc5_ < param3 + param1.itemHeight)
            {
               (this.fieldItems[_loc4_][_loc5_] as CellData).items.push(param1);
               param1.listOfCells.push(this.fieldItems[_loc4_][_loc5_]);
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      public function removeItem(param1:ItemAbstract) : void
      {
         var _loc2_:CellData = null;
         var _loc3_:Vector.<ItemAbstract> = null;
         var _loc4_:int = 0;
         while(param1.listOfCells.length)
         {
            _loc2_ = param1.listOfCells.pop();
            _loc3_ = _loc2_.items;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if(_loc3_[_loc4_] == param1)
               {
                  _loc3_.splice(_loc4_,1);
                  break;
               }
               _loc4_++;
            }
         }
      }
      
      public function moveItem(param1:ItemAbstract) : void
      {
         this.removeItem(param1);
         this.addItem(param1,param1.posX,param1.posY);
      }
      
      public function moveItemStatic(param1:ItemAbstract, param2:int, param3:int) : void
      {
         this.removeItem(param1);
         this.addItem(param1,param2,param3);
      }
      
      public function getCellItems(param1:int, param2:int) : Vector.<ItemAbstract>
      {
         if(param1 < 0 || param1 >= MainConfig.FIELD_ITEM_TABLE_WIDTH || param2 < 0 || param2 >= MainConfig.FIELD_ITEM_TABLE_HEIGHT)
         {
            return null;
         }
         return (this.fieldItems[param1][param2] as CellData).items;
      }
   }
}

