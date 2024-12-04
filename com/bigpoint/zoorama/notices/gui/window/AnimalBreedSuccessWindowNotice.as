package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.view.field.items.Cage;
   
   public class AnimalBreedSuccessWindowNotice extends WindowNotice
   {
      public var cage:Cage;
      
      public function AnimalBreedSuccessWindowNotice(param1:String, param2:Cage)
      {
         this.windowTypeId = OldWindowTypes.ANIMALBREED_SUCCESS;
         this.cage = param2;
         super(param1,windowTypeId,null);
      }
   }
}

