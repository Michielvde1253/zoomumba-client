package com.bigpoint.zoomumba.model.app.resources
{
   import com.bigpoint.zoomumba.ApplicationFacade;
   import com.bigpoint.zoomumba.model.app.resources.decoder.Resource;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.media.Sound;
   import org.puremvc.as3.interfaces.IFacade;
   
   public class AssetLibrary
   {
      private static var _resourceLoaderProxy:ResourceLoaderProxy;
      
      private static var facade:IFacade = ApplicationFacade.getInstance();
      
      public function AssetLibrary()
      {
         super();
      }
      
      private static function get resourceLoaderProxy() : ResourceLoaderProxy
      {
         if(_resourceLoaderProxy == null)
         {
            _resourceLoaderProxy = facade.retrieveProxy(ResourceLoaderProxy.NAME) as ResourceLoaderProxy;
         }
         return _resourceLoaderProxy;
      }
      
      public static function sendAssetToFunction(param1:String, param2:Function, param3:DisplayObjectContainer = null, param4:String = "swf") : void
      {
         param1 += ".swf";
         resourceLoaderProxy.singleLoad(param1,param2,param3);
      }
      
      public static function sendAssetsToFunction(param1:String, param2:Vector.<String>, param3:Function = null, param4:DisplayObjectContainer = null) : void
      {
         resourceLoaderProxy.bulkLoad(param1,param2,param3);
      }
      
      public static function isAssetLoadedOrLoading(param1:String) : Boolean
      {
         return resourceLoaderProxy.isResourceLoadedOrLoading(param1);
      }
      
      public static function getAsset(param1:String) : Resource
      {
         if(_getResource(param1) != null)
         {
            return _getResource(param1);
         }
         throw Error("NO ASSET-Resource @ id " + param1);
      }
      
      public static function haveMovieClip(param1:String) : Boolean
      {
         param1 += ".swf";
         var _loc2_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc2_)
         {
            return true;
         }
         return false;
      }
      
      public static function getMovieClip(param1:String, param2:String) : MovieClip
      {
         var _loc3_:MovieClip = null;
         param1 += ".swf";
         var _loc4_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc4_)
         {
            _loc3_ = _loc4_.getEmbededMovieClip(param2);
         }
         return _loc3_;
      }
      
      public static function getSprite(param1:String, param2:String) : Sprite
      {
         var _loc3_:Sprite = null;
         param1 += ".swf";
         var _loc4_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc4_)
         {
            _loc3_ = _loc4_.getEmbededSprite(param2);
         }
         return _loc3_;
      }
      
      public static function getButton(param1:String, param2:String) : SimpleButton
      {
         var _loc3_:SimpleButton = null;
         param1 += ".swf";
         var _loc4_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc4_)
         {
            _loc3_ = _loc4_.getEmbededButton(param2);
         }
         return _loc3_;
      }
      
      public static function getBitmap(param1:String, param2:String) : Bitmap
      {
         var _loc3_:Bitmap = null;
         param1 += ".swf";
         var _loc4_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc4_)
         {
            _loc3_ = _loc4_.getEmbededBitmap(param2);
         }
         return _loc3_;
      }
      
      public static function getBitmapData(param1:String, param2:String) : BitmapData
      {
         var _loc3_:BitmapData = null;
         param1 += ".swf";
         var _loc4_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc4_)
         {
            _loc3_ = _loc4_.getEmbededBitmapData(param2);
         }
         return _loc3_;
      }
      
      public static function getSound(param1:String, param2:String) : Sound
      {
         var _loc3_:Sound = null;
         param1 += ".swf";
         var _loc4_:SWFAsset = _getResource(param1) as SWFAsset;
         if(_loc4_)
         {
            _loc3_ = _loc4_.getEmbededSound(param2);
         }
         return _loc3_;
      }
      
      public static function clearAsset(param1:String) : void
      {
         param1 += ".swf";
      }
      
      private static function _getResource(param1:String) : Resource
      {
         return resourceLoaderProxy.getResource(param1);
      }
   }
}

