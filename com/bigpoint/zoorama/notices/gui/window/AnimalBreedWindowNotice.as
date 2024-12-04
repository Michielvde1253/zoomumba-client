package com.bigpoint.zoorama.notices.gui.window
{
   import com.bigpoint.zoorama.data.OldWindowTypes;
   import com.bigpoint.zoorama.view.field.items.Cage;
   import flash.geom.Point;
   
   public class AnimalBreedWindowNotice extends WindowNotice
   {
      public var titleId:String;
      
      public var textId:String;
      
      public var replaceIds:Object;
      
      public var replaceVars:Object;
      
      public var itemCategory:int;
      
      public var itemUniqueId:int;
      
      public var breedTimeStamp:int;
      
      public var breedTime:int;
      
      public var directBreedReal:int;
      
      public var canDirectBreed:Boolean;
      
      public var breedCostReal:int;
      
      public var breedCostVirtual:int;
      
      public var breedExperience:int;
      
      public var cage:Cage;
      
      public var cagePosition:Point = this.cagePosition;
      
      public function AnimalBreedWindowNotice(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Boolean, param8:int, param9:int, param10:int, param11:Cage)
      {
         this.windowTypeId = OldWindowTypes.ANIMALBREED;
         this.itemCategory = param2;
         this.itemUniqueId = param3;
         this.breedTimeStamp = param4;
         this.breedTime = param5;
         this.directBreedReal = param6;
         this.canDirectBreed = param7;
         this.breedCostReal = param8;
         this.breedCostVirtual = param9;
         this.breedExperience = param10;
         this.cage = param11;
         super(param1,windowTypeId,null);
      }
   }
}

