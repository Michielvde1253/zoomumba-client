package com.bigpoint.zoorama.core.feature
{
   import com.bigpoint.utils.ObjectHelper;
   import com.bigpoint.zoorama.data.settings.FeaturesData;
   
   public class FeatureActiveReference
   {
      private static var initialized:Boolean = false;
      
      private static var references:FeaturesData = new FeaturesData();
      
      public function FeatureActiveReference()
      {
         super();
      }
      
      public static function initialize(param1:Object) : void
      {
         if(!initialized)
         {
            ObjectHelper.copyData(references,param1);
            return;
         }
         throw new Error("FeatureActiveReference was already intialized and this operation must be done just once!");
      }
      
      public static function get safari() : Boolean
      {
         return references.safari;
      }
      
      public static function get news() : Boolean
      {
         return references.news;
      }
      
      public static function get flexGUI() : Boolean
      {
         return references.flexGUI;
      }
      
      public static function get buddyList() : Boolean
      {
         return references.buddyList;
      }
      
      public static function get storage() : Boolean
      {
         return references.storage;
      }
      
      public static function get serverSideStacking() : Boolean
      {
         return references.serverSideStacking;
      }
      
      public static function get cashFieldItemsAsBitmap() : Boolean
      {
         return references.cashFieldItemsAsBitmap;
      }
      
      public static function get cinema() : Boolean
      {
         return references.cinema;
      }
   }
}

