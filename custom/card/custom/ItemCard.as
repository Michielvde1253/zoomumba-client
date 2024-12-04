package custom.card.custom
{
   import custom.card.core.AbstractCard;
   
   public class ItemCard extends AbstractCard
   {
      private static var _skinParts:Object = {
         "bottomGroup":true,
         "nail":true,
         "buyGroup":true,
         "lock":true,
         "ready":true,
         "rightGroup":true,
         "content":true,
         "container":true,
         "topGroup":true,
         "preload":false,
         "background":true,
         "decoBackContent":true,
         "actionGroup":true,
         "canCraft":true
      };
      
      public function ItemCard()
      {
         super();
      }
      
      override protected function init() : void
      {
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
   }
}

