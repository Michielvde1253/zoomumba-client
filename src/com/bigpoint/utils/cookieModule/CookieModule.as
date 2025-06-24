package com.bigpoint.utils.cookieModule
{
   import flash.net.SharedObject;
   
   public class CookieModule
   {
      private static var defaultSharedObject:SharedObject;
      
      private static var defaultSharedObjectName:String = "flashCookie";
      
      public function CookieModule()
      {
         super();
      }
      
      public static function setDefaultSharedObjectName(param1:String) : void
      {
         CookieModule.defaultSharedObjectName = param1;
         CookieModule.defaultSharedObject = null;
      }
      
      public static function getObject(param1:String = null) : SharedObject
      {
         var retVal:SharedObject = null;
         var sharedObjectName:String = param1;
         try
         {
            if(!sharedObjectName)
            {
               sharedObjectName = CookieModule.defaultSharedObjectName;
               if(!defaultSharedObject)
               {
                  defaultSharedObject = SharedObject.getLocal(sharedObjectName);
               }
               retVal = defaultSharedObject;
            }
            else
            {
               retVal = SharedObject.getLocal(sharedObjectName);
            }
         }
         catch(e:Error)
         {
         }
         return retVal;
      }
      
      public static function getValue(param1:String, param2:String = null) : Object
      {
         var sharedObject:SharedObject = null;
         var varName:String = param1;
         var sharedObjectName:String = param2;
         var ret:Object = {};
         try
         {
            if(!sharedObjectName)
            {
               sharedObjectName = CookieModule.defaultSharedObjectName;
               if(!defaultSharedObject)
               {
                  defaultSharedObject = SharedObject.getLocal(sharedObjectName);
               }
               sharedObject = defaultSharedObject;
            }
            else
            {
               sharedObject = SharedObject.getLocal(sharedObjectName);
            }
            if(sharedObject)
            {
               ret = sharedObject.data[varName];
            }
         }
         catch(e:Error)
         {
         }
         return ret;
      }
      
      public static function setValue(param1:String, param2:Object, param3:String = null) : void
      {
         var sharedObject:SharedObject = null;
         var varName:String = param1;
         var value:Object = param2;
         var sharedObjectName:String = param3;
         try
         {
            if(!sharedObjectName)
            {
               sharedObjectName = CookieModule.defaultSharedObjectName;
               if(!defaultSharedObject)
               {
                  defaultSharedObject = SharedObject.getLocal(sharedObjectName);
               }
               sharedObject = defaultSharedObject;
            }
            else
            {
               sharedObject = SharedObject.getLocal(sharedObjectName);
            }
            if(sharedObject)
            {
               sharedObject.data[varName] = value;
               sharedObject.flush();
            }
         }
         catch(e:Error)
         {
         }
      }
   }
}

