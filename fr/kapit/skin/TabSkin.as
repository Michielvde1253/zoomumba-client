package fr.kapit.skin
{
   import flash.display.*;
   import flash.geom.Matrix;
   import mx.skins.ProgrammaticSkin;
   
   public class TabSkin extends ProgrammaticSkin
   {
      public function TabSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var m:Matrix;
         var unscaledWidth:Number = param1;
         var unscaledHeight:Number = param2;
         super.updateDisplayList(unscaledWidth,unscaledHeight);
         m = new Matrix();
         m.createGradientBox(unscaledWidth,unscaledHeight,Math.PI / 2);
         with(this.graphics)
         {
            clear();
            beginFill(16777215,1);
            drawRoundRectComplex(0,0,unscaledWidth,unscaledHeight,3,3,0,0);
            if(name == "selectedUpSkin" || name == "selectedOverSkin" || name == "selectedDownSkin")
            {
               beginGradientFill(GradientType.LINEAR,[14869218,16053492],[1,1],[0,255],m);
            }
            else
            {
               beginGradientFill(GradientType.LINEAR,[14342874,12171705],[1,1],[0,255],m);
            }
            drawRoundRectComplex(1,1,unscaledWidth - 2,unscaledHeight - 1,2,2,0,0);
            switch(name)
            {
               case "overSkin":
               case "downSkin":
                  beginFill(16750848,0.2);
                  drawRoundRectComplex(0,0,unscaledWidth,unscaledHeight,3,3,0,0);
            }
         }
      }
   }
}

