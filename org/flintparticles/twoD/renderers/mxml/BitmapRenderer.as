package org.flintparticles.twoD.renderers.mxml
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.filters.BitmapFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.flintparticles.common.renderers.FlexRendererBase;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class BitmapRenderer extends FlexRendererBase
   {
      protected static var ZERO_POINT:Point = new Point(0,0);
      
      protected var _bitmap:Bitmap;
      
      protected var _bitmapData:BitmapData;
      
      protected var _preFilters:Array;
      
      protected var _postFilters:Array;
      
      protected var _colorMap:Array;
      
      protected var _smoothing:Boolean;
      
      protected var _canvas:Rectangle;
      
      protected var _clearBetweenFrames:Boolean;
      
      private var _canvasChanged:Boolean = true;
      
      public function BitmapRenderer(param1:Rectangle = null, param2:Boolean = false)
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
         this._smoothing = param2;
         this._clearBetweenFrames = true;
         this._preFilters = new Array();
         this._postFilters = new Array();
         if(param1 == null)
         {
            this._canvas = new Rectangle(0,0,0,0);
         }
         else
         {
            this._canvas = param1;
         }
         this.createBitmap();
      }
      
      public function addFilter(param1:BitmapFilter, param2:Boolean = false) : void
      {
         if(param2)
         {
            this._postFilters.push(param1);
         }
         else
         {
            this._preFilters.push(param1);
         }
      }
      
      public function removeFilter(param1:BitmapFilter) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._preFilters.length)
         {
            if(this._preFilters[_loc2_] == param1)
            {
               this._preFilters.splice(_loc2_,1);
               return;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this._postFilters.length)
         {
            if(this._postFilters[_loc2_] == param1)
            {
               this._postFilters.splice(_loc2_,1);
               return;
            }
            _loc2_++;
         }
      }
      
      public function get preFilters() : Array
      {
         return this._preFilters.slice();
      }
      
      public function set preFilters(param1:Array) : void
      {
         var _loc2_:BitmapFilter = null;
         for each(_loc2_ in this._preFilters)
         {
            this.removeFilter(_loc2_);
         }
         for each(_loc2_ in param1)
         {
            this.addFilter(_loc2_,false);
         }
      }
      
      public function get postFilters() : Array
      {
         return this._postFilters.slice();
      }
      
      public function set postFilters(param1:Array) : void
      {
         var _loc2_:BitmapFilter = null;
         for each(_loc2_ in this._postFilters)
         {
            this.removeFilter(_loc2_);
         }
         for each(_loc2_ in param1)
         {
            this.addFilter(_loc2_,true);
         }
      }
      
      public function get clearBetweenFrames() : Boolean
      {
         return this._clearBetweenFrames;
      }
      
      public function set clearBetweenFrames(param1:Boolean) : void
      {
         this._clearBetweenFrames = param1;
      }
      
      public function setPaletteMap(param1:Array = null, param2:Array = null, param3:Array = null, param4:Array = null) : void
      {
         this._colorMap = new Array(4);
         this._colorMap[0] = param4;
         this._colorMap[1] = param1;
         this._colorMap[2] = param2;
         this._colorMap[3] = param3;
      }
      
      public function clearPaletteMap() : void
      {
         this._colorMap = null;
      }
      
      protected function createBitmap() : void
      {
         if(Boolean(this._bitmap) && Boolean(this._bitmapData))
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
         }
         if(this._bitmap)
         {
            removeChild(this._bitmap);
            this._bitmap = null;
         }
         if(!this._canvas || this._canvas.width == 0 || this._canvas.height == 0)
         {
            return;
         }
         this._bitmap = new Bitmap(null,"auto",this._smoothing);
         this._bitmapData = new BitmapData(Math.ceil(this._canvas.width),Math.ceil(this._canvas.height),true,0);
         this._bitmap.bitmapData = this._bitmapData;
         addChild(this._bitmap);
         this._bitmap.x = this._canvas.x;
         this._bitmap.y = this._canvas.y;
      }
      
      public function get canvas() : Rectangle
      {
         return this._canvas;
      }
      
      public function set canvas(param1:Rectangle) : void
      {
         this._canvas = param1;
         this._canvasChanged = true;
         invalidateDisplayList();
      }
      
      public function get canvasX() : Number
      {
         return this._canvas.x;
      }
      
      public function set canvasX(param1:Number) : void
      {
         this._canvas.x = param1;
         this._canvasChanged = true;
         invalidateDisplayList();
      }
      
      public function get canvasY() : Number
      {
         return this._canvas.y;
      }
      
      public function set canvasY(param1:Number) : void
      {
         this._canvas.y = param1;
         this._canvasChanged = true;
         invalidateDisplayList();
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this._canvas.width = param1;
         this._canvasChanged = true;
         invalidateDisplayList();
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this._canvas.height = param1;
         this._canvasChanged = true;
         invalidateDisplayList();
      }
      
      public function get smoothing() : Boolean
      {
         return this._smoothing;
      }
      
      public function set smoothing(param1:Boolean) : void
      {
         this._smoothing = param1;
         if(this._bitmap)
         {
            this._bitmap.smoothing = param1;
         }
      }
      
      override protected function renderParticles(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this._bitmap)
         {
            return;
         }
         this._bitmapData.lock();
         _loc3_ = int(this._preFilters.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this._bitmapData.applyFilter(this._bitmapData,this._bitmapData.rect,BitmapRenderer.ZERO_POINT,this._preFilters[_loc2_]);
            _loc2_++;
         }
         if(this._clearBetweenFrames && _loc3_ == 0)
         {
            this._bitmapData.fillRect(this._bitmap.bitmapData.rect,0);
         }
         _loc3_ = int(param1.length);
         if(_loc3_)
         {
            _loc2_ = _loc3_;
            while(_loc2_--)
            {
               this.drawParticle(Particle2D(param1[_loc2_]));
            }
         }
         _loc3_ = int(this._postFilters.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this._bitmapData.applyFilter(this._bitmapData,this._bitmapData.rect,BitmapRenderer.ZERO_POINT,this._postFilters[_loc2_]);
            _loc2_++;
         }
         if(this._colorMap)
         {
            this._bitmapData.paletteMap(this._bitmapData,this._bitmapData.rect,ZERO_POINT,this._colorMap[1],this._colorMap[2],this._colorMap[3],this._colorMap[0]);
         }
         this._bitmapData.unlock();
      }
      
      protected function drawParticle(param1:Particle2D) : void
      {
         var _loc2_:Matrix = null;
         _loc2_ = param1.matrixTransform;
         _loc2_.translate(-this._canvas.x,-this._canvas.y);
         this._bitmapData.draw(param1.image,_loc2_,param1.colorTransform,DisplayObject(param1.image).blendMode,null,this._smoothing);
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(this._canvasChanged)
         {
            this.createBitmap();
         }
      }
   }
}

