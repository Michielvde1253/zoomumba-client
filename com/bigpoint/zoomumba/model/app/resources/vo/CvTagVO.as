package com.bigpoint.zoomumba.model.app.resources.vo
{
   import com.bigpoint.utils.URLUtils;
   
   public class CvTagVO
   {
      public var path:String;
      
      public var hash:String;
      
      public var type:String;
      
      public var id:String;
      
      public function CvTagVO(param1:String, param2:String)
      {
         super();
         this.id = URLUtils.getFileNameWithExtension(param1);
         this.hash = param2;
         this.path = param1;
         this.type = URLUtils.getFileExtension(param1);
      }
      
      public function toString() : String
      {
         return "CvTagVO ==> \thash: " + this.hash + "\ttype: " + this.type.toUpperCase() + "\tid: " + this.id + "\tpath: " + this.path;
      }
   }
}

