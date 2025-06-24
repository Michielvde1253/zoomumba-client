package com.bigpoint.zoorama.notices.view.field
{
   import com.bigpoint.utils.notificator.Notice;
   import com.bigpoint.zoorama.view.field.items.Cage;
   
   public class CageNotice extends Notice
   {
      public static const OPEN_CAGE_BREED_WINDOW:String = "openCageBreedWindow";
      
      public var cage:Cage;
      
      public function CageNotice(param1:String, param2:Cage)
      {
         super(param1);
         this.cage = param2;
      }
   }
}

