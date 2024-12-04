package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.view.playfield.BuildingMediator;
   import com.bigpoint.zoomumba.view.playfield.advBreed.NurseryMediator;
   import flash.display.Sprite;
   import org.puremvc.as3.patterns.facade.Facade;
   
   public class Nursery extends NewBuilding
   {
      public function Nursery(param1:Notifier, param2:Sprite, param3:int, param4:int)
      {
         super(param1,param2,param3,param4,Categories.NURSERY,2,2);
         Facade.getInstance().registerMediator(new NurseryMediator(Categories.NURSERY,param4,this));
      }
      
      internal static function getItemInstance(param1:Notifier, param2:Sprite, param3:int, param4:int) : Nursery
      {
         var _loc5_:Nursery = null;
         canConstruct = true;
         _loc5_ = new Nursery(param1,param2,param3,param4);
         canConstruct = false;
         return _loc5_;
      }
      
      override public function get NAME() : String
      {
         return "nursery";
      }
      
      override public function dispose() : void
      {
         Facade.getInstance().removeMediator(BuildingMediator.getFullName(NurseryMediator.NAME,Categories.NURSERY,this.uniqueId));
         super.dispose();
      }
   }
}

