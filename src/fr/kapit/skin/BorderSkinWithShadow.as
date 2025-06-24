package fr.kapit.skin
{
   import flash.geom.Matrix;
   import fr.kapit.skin.utils.FilterUtils;
   import mx.skins.ProgrammaticSkin;
   
   public class BorderSkinWithShadow extends ProgrammaticSkin
   {
      public function BorderSkinWithShadow()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var matrix:Matrix;
         var unscaledWidth:Number = param1;
         var unscaledHeight:Number = param2;
         super.updateDisplayList(unscaledWidth,unscaledHeight);
         matrix = new Matrix();
         matrix.createGradientBox(unscaledWidth,unscaledHeight,Math.PI / 2);
         with(this.graphics)
         {
            clear();
            beginFill(16777215,1);
            drawRoundRect(0,0,unscaledWidth,unscaledHeight,3);
            beginFill(16053492,1);
            drawRoundRect(1,1,unscaledWidth - 2,unscaledHeight - 2,2);
         }
         this.filters = FilterUtils.getBoxShadow();
      }
   }
}

