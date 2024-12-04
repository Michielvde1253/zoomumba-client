package com.bigpoint.zoomumba.model.features.mainBuildingSelect
{
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class MainBuildingSelectionProxy extends Proxy
   {
      public static const NAME:String = "MainBuildingSelectionProxy";
      
      public var currentBuildingID:int = -1;
      
      public var currentFieldId:int = -1;
      
      public function MainBuildingSelectionProxy(param1:Object)
      {
         super(NAME,param1);
      }
      
      public function set showData(param1:Object) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in data)
         {
            _loc2_.visible = !!param1[_loc2_.id] ? true : false;
         }
      }
      
      public function getBuildings(param1:int) : Array
      {
         var _loc3_:Object = null;
         var _loc2_:Array = [];
         for each(_loc3_ in data)
         {
            if(_loc3_.fType == param1 && Boolean(_loc3_.visible))
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
   }
}

