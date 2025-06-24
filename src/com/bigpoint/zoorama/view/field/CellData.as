package com.bigpoint.zoorama.view.field
{
   import com.bigpoint.zoorama.view.field.items.ItemAbstract;
   
   public class CellData
   {
      public var isNullObject:Boolean = true;
      
      public var items:Vector.<ItemAbstract> = new Vector.<ItemAbstract>();
      
      public function CellData()
      {
         super();
      }
   }
}

