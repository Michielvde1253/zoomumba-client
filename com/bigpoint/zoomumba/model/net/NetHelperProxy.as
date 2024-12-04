package com.bigpoint.zoomumba.model.net
{
   import com.bigpoint.zoomumba.model.app.resources.CvTagsProxy;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import org.puremvc.as3.interfaces.IProxy;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class NetHelperProxy extends Proxy implements IProxy
   {
      private static var appConfig:AppConfigProxy;
      
      public static const NAME:String = "NetHelperProxy";
      
      public function NetHelperProxy()
      {
         super(NAME);
         appConfig = facade.retrieveProxy(AppConfigProxy.NAME) as AppConfigProxy;
      }
      
      public function getHeaderPath(param1:String) : String
      {
         var _loc2_:CvTagsProxy = facade.retrieveProxy(CvTagsProxy.NAME) as CvTagsProxy;
         return _loc2_.getFileURL(param1 + ".png");
      }
      
      public function getCustomPath(param1:String, param2:String) : String
      {
         var _loc3_:CvTagsProxy = facade.retrieveProxy(CvTagsProxy.NAME) as CvTagsProxy;
         return _loc3_.getFileURL(param2 + ".png");
      }
   }
}

