package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoomumba.view.playfield.advBreed.BreedingLabMediator;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class BreedingLab extends NewBuilding
   {
      public function BreedingLab(param1:Notifier, param2:Sprite, param3:int, param4:int)
      {
         super(param1,param2,param3,param4,Categories.BREEDING_LAB,2,2);
         Facade.getInstance().registerMediator(new BreedingLabMediator(Categories.BREEDING_LAB,param4,this));
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int, param4:int) : BreedingLab
      {
         var _loc5_:BreedingLab = null;
         canConstruct = true;
         _loc5_ = new BreedingLab(param1,param2,param3,param4);
         canConstruct = false;
         return _loc5_;
      }
      
      override public function get NAME() : String
      {
         return "breedingLab";
      }
      
      override public function dispose() : void
      {
         Facade.getInstance().removeMediator(BuildingMediator.getFullName(BreedingLabMediator.NAME,Categories.BREEDING_LAB,this.uniqueId));
         super.dispose();
      }
   }
}

