package com.bigpoint.zoomumba.model.app.resources.decoder
{
   import com.bigpoint.zoomumba.model.app.resources.events.ResourceEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class Resource extends EventDispatcher implements IDecoder
   {
      public static const SWF:String = "swf";
      
      public static const XmL:String = "xml";
      
      public static const CSS:String = "css";
      
      public static const PNG:String = "png";
      
      public static const JPG:String = "jpg";
      
      public static const GENERIC_SWF:String = "generic.swf";
      
      protected var _id:String;
      
      protected var _data:ByteArray;
      
      protected var _isDecoded:Boolean = false;
      
      public function Resource(param1:String, param2:ByteArray)
      {
         super(this);
         this._id = param1;
         this._data = param2;
      }
      
      public function decode() : void
      {
         throw new Error("Resource.decode() must be override by sub-class");
      }
      
      public function dispose() : void
      {
         this._data.clear();
         this._data = null;
      }
      
      protected function _handleDecode(param1:Event = null) : void
      {
         this._isDecoded = true;
         dispatchEvent(new ResourceEvent(ResourceEvent.DECODED));
      }
      
      protected function _handleDecodeError(param1:Event = null) : void
      {
         dispatchEvent(new ResourceEvent(ResourceEvent.ERROR));
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get isDecoded() : Boolean
      {
         return this._isDecoded;
      }
      
      public function get data() : ByteArray
      {
         return this._data;
      }
   }
}

