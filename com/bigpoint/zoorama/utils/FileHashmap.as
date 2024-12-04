package com.bigpoint.zoorama.utils
{
   import com.bigpoint.zoorama.Settings;
   
   public class FileHashmap
   {
      public static var cvList:Object;
      
      public function FileHashmap()
      {
         super();
      }
      
      public static function getFilenameWithHashFromCDNHost(param1:String, param2:Boolean = true) : String
      {
         var _loc4_:String = null;
         var _loc3_:String = param1;
         if(cvList)
         {
            _loc4_ = cvList[param1];
            if(!_loc4_)
            {
               _loc4_ = cvList["/swf/" + param1];
            }
            if(_loc4_)
            {
               if(Settings.isLocal)
               {
                  _loc3_ = Settings.CDN_HOST + _loc3_ + "?__cv=" + _loc4_;
               }
               else if(param2)
               {
                  _loc3_ = Settings.CDN_HOST + "/swf/" + _loc3_ + "?__cv=" + _loc4_;
               }
               else
               {
                  _loc3_ = Settings.CDN_HOST + _loc3_ + "?__cv=" + _loc4_;
               }
            }
         }
         return _loc3_;
      }
   }
}

