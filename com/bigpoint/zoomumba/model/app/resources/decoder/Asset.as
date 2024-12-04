package com.bigpoint.zoomumba.model.app.resources.decoder
{
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class Asset extends Resource
   {
      protected var _loader:Loader;
      
      public function Asset(param1:String, param2:ByteArray)
      {
         super(param1,param2);
      }
      
      public function get displayObject() : DisplayObject
      {
         return this._loader.content;
      }
      
      public function getAsDisplayObject() : DisplayObject
      {
         return this.displayObject;
      }
      
      override public function dispose() : void
      {
         this._loader.unloadAndStop();
         super.dispose();
      }
      
      override public function decode() : void
      {
         this._loader = new Loader();
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._handleComplete);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._handleError);
         this._loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._handleError);
         this._loader.loadBytes(_data,new LoaderContext());
      }
      
      protected function _handleComplete(param1:Event) : void
      {
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._handleComplete);
         this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,_handleDecodeError);
         this._loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this._handleError);
         _handleDecode();
      }
      
      protected function _handleError(param1:Event) : void
      {
         this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._handleComplete);
         this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,_handleDecodeError);
         this._loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this._handleError);
         _handleDecodeError();
      }
   }
}

