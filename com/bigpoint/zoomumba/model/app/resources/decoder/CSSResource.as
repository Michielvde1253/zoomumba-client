package com.bigpoint.zoomumba.model.app.resources.decoder
{
   import flash.utils.ByteArray;
   
   public class CSSResource extends Resource
   {
      private var _css:String;
      
      public function CSSResource(param1:String, param2:ByteArray)
      {
         super(param1,param2);
      }
      
      public function getCSS() : String
      {
         return this._css;
      }
      
      override public function decode() : void
      {
         try
         {
            _data.position = 0;
            this._css = _data.readUTFBytes(_data.length);
            _handleDecode();
         }
         catch(e:Error)
         {
            _handleDecodeError();
         }
      }
   }
}

