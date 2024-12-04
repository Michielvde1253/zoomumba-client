package com.bigpoint.utils.functions
{
   import com.bigpoint.zoorama.view.gui.GUITemplates;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class AddBitmapItem
   {
      public function AddBitmapItem()
      {
         super();
      }
      
      public static function addGradientBitmapToContainer(param1:Sprite, param2:String, param3:int, param4:int, param5:int) : Bitmap
      {
         var _loc6_:Bitmap = GUITemplates.createMaskedGradientTextfield(param2,param3);
         _loc6_.x = param4;
         _loc6_.y = param5;
         param1.addChild(_loc6_);
         return _loc6_;
      }
      
      public static function addNormalBitmapToContainer(param1:Sprite, param2:String, param3:int, param4:int, param5:int, param6:int) : Bitmap
      {
         var _loc7_:Bitmap = GUITemplates.createBitmapTextfield(param2,param3,param4);
         _loc7_.x = param5;
         _loc7_.y = param6;
         param1.addChild(_loc7_);
         return _loc7_;
      }
   }
}

