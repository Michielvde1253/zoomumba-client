package com.bigpoint.zoorama.data.fieldItems
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.FieldItemData;
   
   public class FieldVisitorData extends FieldItemData
   {
      public var lifeTimeStamp:int = -1;
      
      public function FieldVisitorData()
      {
         super();
         _category = Categories.VISITOR;
      }
      
      override public function toString() : String
      {
         return "[FieldVisitorData lifeTimeStamp=" + this.lifeTimeStamp + "+" + super.toString() + "]";
      }
   }
}

