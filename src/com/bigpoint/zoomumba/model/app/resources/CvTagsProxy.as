package com.bigpoint.zoomumba.model.app.resources
{
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.app.resources.decoder.Resource;
   import com.bigpoint.zoomumba.model.app.resources.vo.CvTagVO;
   import com.bigpoint.zoorama.Settings;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CvTagsProxy extends Proxy
   {
      public static const NAME:String = "CvTagsProxy";
      
      public function CvTagsProxy()
      {
         super(NAME,new Dictionary());
      }
      
      public function addCvTag(param1:String, param2:String = null) : void
      {
         var _loc3_:CvTagVO = new CvTagVO(param1,param2);
         if(Settings.ENABLE_ALCON)
         {
            if(data[_loc3_.id] != null && data[_loc3_.id].path != _loc3_.path)
            {
            }
         }
         data[_loc3_.id] = _loc3_;
      }
      
      public function cvTagById(param1:String) : Vector.<CvTagVO>
      {
         var _loc3_:CvTagVO = null;
         var _loc2_:Vector.<CvTagVO> = new Vector.<CvTagVO>();
         for each(_loc3_ in data)
         {
            if(_loc3_.id == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function cvTagByIdAndType(param1:String, param2:String) : Vector.<CvTagVO>
      {
         var _loc4_:CvTagVO = null;
         var _loc3_:Vector.<CvTagVO> = new Vector.<CvTagVO>();
         for each(_loc4_ in data)
         {
            if(_loc4_.id == param1 && _loc4_.type == param2)
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public function getCvTag(param1:String) : CvTagVO
      {
         return data[param1] as CvTagVO;
      }
      
      public function getFileType(param1:String) : String
      {
         return data[param1].type;
      }
      
      public function getFileURL(param1:String) : String
      {
         var _loc3_:String = null;
         var _loc2_:CvTagVO = data[param1] as CvTagVO;
         if(_loc2_)
         {
            _loc3_ = this._getResourceURL(_loc2_);
         }
         else
         {
            sendNotification(Note.ERROR_REPORT,"CvTagsProxy::getFileURL failed, no resource url available for: " + param1);
            _loc3_ = "";
         }
         return _loc3_;
      }
      
      private function _getResourceURL(param1:CvTagVO) : String
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case Resource.CSS:
            case Resource.SWF:
               _loc2_ = this._getSwfURL(param1);
               break;
            case Resource.XmL:
               _loc2_ = this._getXmlURL(param1);
               break;
            case Resource.PNG:
            case Resource.JPG:
               _loc2_ = this._getImageURL(param1);
         }
         return _loc2_;
      }
      
      private function _getSwfURL(param1:CvTagVO) : String
      {
         var _loc2_:String = null;
         if(Settings.isLocal)
         {
            _loc2_ = param1.path.substr(5);
         }
         else
         {
            _loc2_ = Settings.CDN_HOST + param1.path + "?__cv=" + param1.hash;
         }
         return _loc2_;
      }
      
      private function _getXmlURL(param1:CvTagVO) : String
      {
         var _loc2_:String = null;
         if(Settings.isLocal)
         {
            _loc2_ = Settings.httpProtocolString + Settings.API_HOST + param1.path + "?__cv=" + param1.hash;
         }
         else
         {
            _loc2_ = Settings.CDN_HOST + param1.path + "?__cv=" + param1.hash;
         }
         return _loc2_;
      }
      
      private function _getImageURL(param1:CvTagVO) : String
      {
         var _loc2_:String = null;
         if(Settings.isLocal)
         {
            _loc2_ = Settings.httpProtocolString + Settings.API_HOST + param1.path + "?__cv=" + param1.hash;
         }
         else
         {
            _loc2_ = Settings.CDN_HOST + param1.path + "?__cv=" + param1.hash;
         }
         return _loc2_;
      }
   }
}

