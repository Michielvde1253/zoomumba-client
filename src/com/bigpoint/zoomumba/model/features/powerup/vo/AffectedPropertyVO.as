package com.bigpoint.zoomumba.model.features.powerup.vo
{
   import com.bigpoint.utils.ItemTypeHelper;
   
   public class AffectedPropertyVO
   {
      private var _type:String;
      
      public var category:int;
      
      public var mod:Number = 0;
      
      private var _ids:Array = new Array();
      
      public function AffectedPropertyVO()
      {
         super();
      }
      
      public function set id(param1:Object) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in param1)
         {
            this._ids.push(param1[_loc2_]);
         }
      }
      
      public function get id() : Object
      {
         return new Object();
      }
      
      public function get affectedIds() : Array
      {
         return this._ids;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         this.category = ItemTypeHelper.typeToCategory(param1);
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}

