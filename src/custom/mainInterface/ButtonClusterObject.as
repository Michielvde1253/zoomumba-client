package custom.mainInterface
{
   import buttons.tweeningButtons.BasicTweeningButton;
   import flash.display.Sprite;
   import spark.core.SpriteVisualElement;
   
   public class ButtonClusterObject extends SpriteVisualElement
   {
      public var button_id:int;
      
      public var sprite:Sprite;
      
      public function ButtonClusterObject(param1:BasicTweeningButton)
      {
         super();
         this.sprite = param1;
         this.addChild(this.sprite);
         this.buttonMode = true;
         this.useHandCursor = true;
      }
   }
}

