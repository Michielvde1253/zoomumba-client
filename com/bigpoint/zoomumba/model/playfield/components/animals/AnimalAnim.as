package com.bigpoint.zoomumba.model.playfield.components.animals
{
   import flash.display.MovieClip;
   
   public class AnimalAnim
   {
      private static const STILL_ANIM:String = "still";
      
      private static const LOOP_ANIM:String = "loop";
      
      private static const RANDOM_ANIM:String = "random";
      
      private var males:Vector.<MovieClip>;
      
      private var females:Vector.<MovieClip>;
      
      private var childs:Vector.<MovieClip>;
      
      private var maleAnimDatas:Vector.<AnimData>;
      
      private var femaleAnimDatas:Vector.<AnimData>;
      
      private var childAnimDatas:Vector.<AnimData>;
      
      private var assetId:String;
      
      public function AnimalAnim(param1:int, param2:int, param3:int, param4:String)
      {
         super();
         this.males = new Vector.<MovieClip>(param1 + 1);
         this.females = new Vector.<MovieClip>(param2 + 1);
         this.childs = new Vector.<MovieClip>(param3 + 1);
         this.maleAnimDatas = new Vector.<AnimData>(param1 + 1);
         this.femaleAnimDatas = new Vector.<AnimData>(param2 + 1);
         this.childAnimDatas = new Vector.<AnimData>(param3 + 1);
         this.assetId = param4;
      }
      
      public function scaleAllAnims(param1:Number) : void
      {
         var _loc2_:int = 1;
         while(_loc2_ < this.maleAnimDatas.length)
         {
            _loc2_++;
         }
         _loc2_ = 1;
         while(_loc2_ < this.femaleAnimDatas.length)
         {
            _loc2_++;
         }
         _loc2_ = 1;
         while(_loc2_ < this.childAnimDatas.length)
         {
            _loc2_++;
         }
      }
      
      public function addMale(param1:MovieClip, param2:int) : void
      {
         if(param2 < this.males.length)
         {
            this.males[param2] = param1;
            this.maleAnimDatas[param2] = this.registerAnim(param1,this.assetId);
            this.maleAnimDatas[param2].showStill();
         }
         param1.visible = false;
      }
      
      public function addFemale(param1:MovieClip, param2:int) : void
      {
         if(param2 < this.females.length)
         {
            this.females[param2] = param1;
            this.femaleAnimDatas[param2] = this.registerAnim(param1,this.assetId);
            this.femaleAnimDatas[param2].showStill();
         }
         param1.visible = false;
      }
      
      public function addChild(param1:MovieClip, param2:int) : void
      {
         if(param2 < this.childs.length)
         {
            this.childs[param2] = param1;
            this.childAnimDatas[param2] = this.registerAnim(param1,this.assetId);
            this.childAnimDatas[param2].showStill();
         }
         param1.visible = false;
      }
      
      public function checkAsset() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ < this.males.length)
         {
            if(this.males[_loc1_])
            {
            }
            _loc1_++;
         }
         var _loc2_:int = 1;
         while(_loc2_ < this.females.length)
         {
            if(this.females[_loc2_])
            {
            }
            _loc2_++;
         }
         var _loc3_:int = 1;
         while(_loc3_ < this.childs.length)
         {
            if(this.childs[_loc3_])
            {
            }
            _loc3_++;
         }
      }
      
      public function showAnimalCount(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 1;
         while(_loc5_ < this.males.length)
         {
            if(this.males[_loc5_])
            {
               if(_loc4_ < param1)
               {
                  _loc4_++;
                  if(!this.males[_loc5_].visible)
                  {
                     this.males[_loc5_].visible = true;
                  }
               }
               else
               {
                  this.males[_loc5_].visible = false;
                  this.maleAnimDatas[_loc5_].showStill();
               }
            }
            _loc5_++;
         }
         var _loc6_:int = 0;
         _loc5_ = int(this.females.length - 1);
         while(_loc5_ > 0)
         {
            if(this.females[_loc5_])
            {
               if(_loc6_ < param2)
               {
                  _loc6_++;
                  if(!this.females[_loc5_].visible)
                  {
                     this.females[_loc5_].visible = true;
                  }
               }
               else
               {
                  this.females[_loc5_].visible = false;
                  this.femaleAnimDatas[_loc5_].showStill();
               }
            }
            _loc5_--;
         }
         var _loc7_:int = 0;
         _loc5_ = 1;
         while(_loc5_ < this.childs.length)
         {
            if(this.childs[_loc5_])
            {
               if(_loc7_ < param3)
               {
                  _loc7_++;
                  if(!this.childs[_loc5_].visible)
                  {
                     this.childs[_loc5_].visible = true;
                  }
               }
               else
               {
                  this.childs[_loc5_].visible = false;
                  this.childAnimDatas[_loc5_].showStill();
               }
            }
            _loc5_++;
         }
      }
      
      public function registerAnim(param1:MovieClip, param2:String) : AnimData
      {
         var _loc3_:MovieClip = null;
         var _loc4_:AnimData = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         if(param1 != null)
         {
            _loc4_ = new AnimData(param1.name,param2);
            _loc5_ = 0;
            while(_loc5_ < param1.numChildren)
            {
               if(param1.getChildAt(_loc5_) is MovieClip)
               {
                  _loc3_ = param1.getChildAt(_loc5_) as MovieClip;
                  if(_loc3_.name.indexOf(STILL_ANIM) != -1)
                  {
                     _loc4_.addStill(_loc3_);
                  }
                  else if(_loc3_.name.indexOf(LOOP_ANIM) != -1)
                  {
                     _loc4_.addLoop(_loc3_);
                  }
                  else if(_loc3_.name.indexOf(RANDOM_ANIM) != -1)
                  {
                     _loc6_ = _loc3_.name.match(/\d{1,4}/g);
                     _loc4_.addRandome(_loc3_,_loc6_[_loc6_.length - 1]);
                  }
                  _loc4_.showStill();
               }
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 1;
         while(_loc1_ < this.maleAnimDatas.length)
         {
            _loc1_++;
         }
         _loc1_ = 1;
         while(_loc1_ < this.femaleAnimDatas.length)
         {
            _loc1_++;
         }
         _loc1_ = 1;
         while(_loc1_ < this.childAnimDatas.length)
         {
            _loc1_++;
         }
         this.males = null;
         this.females = null;
         this.childs = null;
         this.maleAnimDatas = null;
         this.femaleAnimDatas = null;
         this.childAnimDatas = null;
      }
      
      public function getMaleAnim(param1:int) : AnimData
      {
         return this.maleAnimDatas[param1];
      }
      
      public function getFemaleAnim(param1:int) : AnimData
      {
         return this.femaleAnimDatas[this.females.length - param1];
      }
      
      public function getChildAnim(param1:int) : AnimData
      {
         return this.childAnimDatas[param1];
      }
   }
}

