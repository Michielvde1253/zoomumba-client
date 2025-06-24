package com.bigpoint.utils.functions
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class AddAssetItem
   {
      public function AddAssetItem()
      {
         super();
      }
      
      public static function addSpriteToContainer(param1:Sprite, param2:String, param3:String, param4:int, param5:int, param6:Boolean = false) : Sprite
      {
         var _loc7_:Sprite = AssetLibrary.getSprite(param3,param2);
         if(param6)
         {
            _loc7_.x = param4 - _loc7_.width / 2;
         }
         else
         {
            _loc7_.x = param4;
         }
         _loc7_.y = param5;
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      public static function addMovieClipToContainer(param1:Sprite, param2:String, param3:String, param4:int, param5:int, param6:Boolean = false) : MovieClip
      {
         var _loc7_:MovieClip = AssetLibrary.getMovieClip(param3,param2);
         if(param6)
         {
            _loc7_.x = param4 - _loc7_.width / 2;
         }
         else
         {
            _loc7_.x = param4;
         }
         _loc7_.y = param5;
         param1.addChild(_loc7_);
         return _loc7_;
      }
   }
}

