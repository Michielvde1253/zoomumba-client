package mx.skins.halo
{
   import flash.display.Graphics;
   import mx.core.mx_internal;
   import mx.skins.ProgrammaticSkin;
   
   use namespace mx_internal;
   
   public class AdvancedDataGridHeaderHorizontalSeparator extends ProgrammaticSkin
   {
      mx_internal static const VERSION:String = "4.0.0.14159";
      
      public function AdvancedDataGridHeaderHorizontalSeparator()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 10;
      }
      
      override public function get measuredHeight() : Number
      {
         return 2;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Graphics = graphics;
         _loc3_.clear();
         _loc3_.moveTo(0,0);
         _loc3_.lineTo(param1,0);
         _loc3_.lineStyle(1,getStyle("borderColor"));
         _loc3_.moveTo(0,1);
         _loc3_.lineTo(param1,1);
      }
   }
}

