package custom.card.custom
{
   public class SpecieCard extends ItemCard
   {
      private static var _skinParts:Object = {
         "bottomGroup":true,
         "nail":true,
         "buyGroup":true,
         "lock":true,
         "ready":true,
         "rightGroup":true,
         "content":true,
         "topGroup":true,
         "container":true,
         "background":true,
         "preload":false,
         "decoBackContent":true,
         "actionGroup":true,
         "canCraft":true
      };
      
      public function SpecieCard()
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

