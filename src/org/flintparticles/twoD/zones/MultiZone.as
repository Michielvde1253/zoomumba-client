package org.flintparticles.twoD.zones
{
   import flash.geom.Point;
   import org.flintparticles.twoD.particles.Particle2D;
   
   public class MultiZone implements Zone2D
   {
      private var _zones:Array;
      
      private var _areas:Array;
      
      private var _totalArea:Number;
      
      public function MultiZone()
      {
         super();
         this._zones = new Array();
         this._areas = new Array();
         this._totalArea = 0;
      }
      
      public function addZone(param1:Zone2D) : void
      {
         this._zones.push(param1);
         var _loc2_:Number = param1.getArea();
         this._areas.push(_loc2_);
         this._totalArea += _loc2_;
      }
      
      public function removeZone(param1:Zone2D) : void
      {
         var _loc2_:int = int(this._zones.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._zones[_loc3_] == param1)
            {
               this._totalArea -= this._areas[_loc3_];
               this._areas.splice(_loc3_,1);
               this._zones.splice(_loc3_,1);
               return;
            }
            _loc3_++;
         }
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:int = int(this._zones.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(Zone2D(this._zones[_loc4_]).contains(param1,param2))
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public function getLocation() : Point
      {
         var _loc1_:Number = Math.random() * this._totalArea;
         var _loc2_:int = int(this._zones.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _loc1_ - this._areas[_loc3_];
            if(_loc1_ <= 0)
            {
               return Zone2D(this._zones[_loc3_]).getLocation();
            }
            _loc3_++;
         }
         if(this._zones.length == 0)
         {
            throw new Error("Attempt to use a MultiZone object that contains no Zones");
         }
         return Zone2D(this._zones[0]).getLocation();
      }
      
      public function getArea() : Number
      {
         return this._totalArea;
      }
      
      public function collideParticle(param1:Particle2D, param2:Number = 1) : Boolean
      {
         var _loc4_:Zone2D = null;
         var _loc3_:Boolean = false;
         for each(_loc4_ in this._zones)
         {
            _loc3_ = Boolean(_loc4_.collideParticle(param1,param2)) || _loc3_;
         }
         return _loc3_;
      }
   }
}

