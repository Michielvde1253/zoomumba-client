package org.flintparticles.common.initializers
{
   import flash.display.DisplayObject;
   import flash.filters.BitmapFilter;
   import org.flintparticles.common.emitters.Emitter;
   import org.flintparticles.common.particles.Particle;
   
   public class ApplyFilter extends InitializerBase
   {
      private var _filter:BitmapFilter;
      
      public function ApplyFilter(param1:BitmapFilter = null)
      {
         super();
         priority = -10;
         this._filter = param1;
      }
      
      public function get filter() : BitmapFilter
      {
         return this._filter;
      }
      
      public function set filter(param1:BitmapFilter) : void
      {
         this._filter = param1;
      }
      
      override public function initialize(param1:Emitter, param2:Particle) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:Array = null;
         if(param2.image && param2.image is DisplayObject)
         {
            _loc3_ = param2.image;
            if(_loc3_.filters)
            {
               _loc4_ = _loc3_.filters;
               _loc4_.push(this._filter);
               _loc3_.filters = _loc4_;
            }
            else
            {
               _loc3_.filters = [this._filter];
            }
         }
      }
   }
}

