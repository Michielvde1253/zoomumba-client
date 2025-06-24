package com.bigpoint.zoomumba.model.app.resources.decoder
{
   import com.senocular.utils.SWFReader;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.utils.ByteArray;
   import ru.etcs.utils.getDefinitionNames;
   
   public class SWFAsset extends Asset
   {
      public function SWFAsset(param1:String, param2:ByteArray)
      {
         super(param1,param2);
      }
      
      override public function decode() : void
      {
         var _loc1_:SWFReader = new SWFReader(data);
         if(_loc1_.parsed)
         {
            super.decode();
         }
         else
         {
            _handleDecodeError();
         }
      }
      
      public function getEmbededMovieClip(param1:String) : MovieClip
      {
         return this.getEmbededObject(param1) as MovieClip;
      }
      
      public function getEmbededSprite(param1:String) : Sprite
      {
         if(this.getEmbededObject(param1))
         {
            return this.getEmbededObject(param1) as Sprite;
         }
         return null;
      }
      
      public function getEmbededButton(param1:String) : SimpleButton
      {
         return this.getEmbededObject(param1) as SimpleButton;
      }
      
      public function getEmbededBitmap(param1:String) : Bitmap
      {
         return new Bitmap(this.getEmbededBitmapData(param1));
      }
      
      public function getEmbededBitmapData(param1:String) : BitmapData
      {
         return this.getEmbededObject(param1) as BitmapData;
      }
      
      public function getEmbededSound(param1:String) : Sound
      {
         return this.getEmbededObject(param1) as Sound;
      }
      
      public function getEmbededObject(param1:String) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:Class = this._getExportedClass(param1);
         if(_loc3_)
         {
            _loc2_ = new _loc3_() as Object;
         }
         return _loc2_;
      }
      
      public function getDefinitions() : Array
      {
         return getDefinitionNames(_loader.contentLoaderInfo,false,true);
      }
      
      private function _getExportedClass(param1:String) : Class
      {
         if(_loader.contentLoaderInfo.applicationDomain.hasDefinition(param1))
         {
            return _loader.contentLoaderInfo.applicationDomain.getDefinition(param1) as Class;
         }
         return null;
      }
      
      override protected function _handleComplete(param1:Event) : void
      {
         super._handleComplete(param1);
         this._stopAll(_loader.content);
      }
      
      private function _stopAll(param1:DisplayObject) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is MovieClip)
         {
            (param1 as MovieClip).stop();
         }
         var _loc2_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         if(_loc2_)
         {
            if(_loc2_.numChildren)
            {
               _loc5_ = _loc2_.numChildren;
               while(_loc4_ < _loc5_)
               {
                  if(_loc2_.getChildAt(_loc4_) is DisplayObjectContainer)
                  {
                     _loc3_ = _loc2_.getChildAt(_loc4_) as DisplayObjectContainer;
                     if(_loc3_.numChildren)
                     {
                        this._stopAll(_loc3_);
                     }
                     else if(_loc3_ is MovieClip)
                     {
                        (_loc3_ as MovieClip).stop();
                     }
                  }
                  _loc4_++;
               }
            }
         }
      }
   }
}

