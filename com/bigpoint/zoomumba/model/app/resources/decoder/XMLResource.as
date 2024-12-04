package com.bigpoint.zoomumba.model.app.resources.decoder
{
   import flash.utils.ByteArray;
   
   public class XMLResource extends Resource
   {
      private var _xml:XML;
      
      public function XMLResource(param1:String, param2:ByteArray)
      {
         super(param1,param2);
      }
      
      public function getXML() : XML
      {
         return this._xml;
      }
      
      override public function decode() : void
      {
         try
         {
            _data.position = 0;
            this._xml = new XML(_data.readUTFBytes(_data.length));
            _handleDecode();
         }
         catch(e:Error)
         {
            _handleDecodeError();
         }
      }
   }
}

