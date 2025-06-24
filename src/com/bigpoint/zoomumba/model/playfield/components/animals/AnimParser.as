package com.bigpoint.zoomumba.model.playfield.components.animals
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class AnimParser
   {
      private static var instance:AnimParser;
      
      public function AnimParser()
      {
         super();
         if(instance)
         {
            throw new Error("Error: Instantiation failed: Use AnimParser.getInstance() instead of new.");
         }
      }
      
      public static function getInstance() : AnimParser
      {
         if(instance == null)
         {
            instance = new AnimParser();
         }
         return instance;
      }
      
      public function parseAnimal(param1:MovieClip, param2:String, param3:int, param4:int, param5:int) : AnimalAnim
      {
         var _loc8_:DisplayObject = null;
         var _loc9_:Array = null;
         var _loc6_:AnimalAnim = new AnimalAnim(param3,param4,param5,param2);
         var _loc7_:int = 0;
         while(_loc7_ < param1.numChildren)
         {
            _loc8_ = param1.getChildAt(_loc7_);
            _loc9_ = _loc8_.name.split("_");
            switch(_loc9_[0])
            {
               case "adult":
                  if(_loc9_[2] == "0")
                  {
                  }
                  if(_loc9_[1] == "m")
                  {
                     _loc6_.addMale(_loc8_ as MovieClip,_loc9_[2]);
                  }
                  else if(_loc9_[1] == "f")
                  {
                     _loc6_.addFemale(_loc8_ as MovieClip,_loc9_[2]);
                  }
                  break;
               case "child":
                  if(_loc9_[1] == "0")
                  {
                  }
                  _loc6_.addChild(_loc8_ as MovieClip,_loc9_[1]);
                  break;
               case "decor":
                  break;
            }
            _loc7_++;
         }
         _loc6_.checkAsset();
         return _loc6_;
      }
   }
}

