package fr.kapit.skin
{
   import mx.skins.Border;
   
   public class FocusSkin extends Border
   {
      public function FocusSkin()
      {
         super();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var cornerRadius:uint;
         var unscaledWidth:Number = param1;
         var unscaledHeight:Number = param2;
         super.updateDisplayList(unscaledWidth,unscaledHeight);
         cornerRadius = uint(this.getStyle("cornerRadius"));
         with(this.graphics)
         {
            clear();
            lineStyle(1,16750848,0.2);
            drawRoundRect(0,0,unscaledWidth - 1,unscaledHeight - 1,cornerRadius);
            endFill();
         }
      }
   }
}

