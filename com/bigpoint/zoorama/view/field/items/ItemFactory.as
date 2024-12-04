package com.bigpoint.zoorama.view.field.items
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoorama.Settings;
   import flash.display.Sprite;
   
   public class ItemFactory
   {
      private var itemHolder:Sprite;
      
      private var parentNotifierForItems:Notifier;
      
      public function ItemFactory(param1:Notifier, param2:Sprite)
      {
         super();
         this.parentNotifierForItems = param1;
         this.itemHolder = param2;
      }
      
      public function createItem(param1:int, param2:int, param3:int) : ItemAbstract
      {
         var _loc4_:ItemAbstract = null;
         if(Settings.DEBUG_ITEM_MODE)
         {
         }
         switch(param1)
         {
            case Categories.CAGE:
               _loc4_ = Cage.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               break;
            case Categories.STORE:
               _loc4_ = Store.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               break;
            case Categories.DECOR:
               _loc4_ = Decor.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               break;
            case Categories.SPECIAL:
               if(param2 == Special.XMAS_SLEIGH)
               {
                  _loc4_ = Sleigh.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2,param3);
               }
               else if(param2 == Special.XMAS_TREE)
               {
                  _loc4_ = XmasTree.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2,param3);
               }
               else
               {
                  _loc4_ = Special.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               }
               break;
            case Categories.TRASHBIN:
               _loc4_ = TrashBin.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               break;
            case Categories.TRASHROAD:
               _loc4_ = TrashRoad.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               break;
            case Categories.VISITOR:
               _loc4_ = Visitor.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2);
               break;
            case Categories.NURSERY:
               _loc4_ = Nursery.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2,param3);
               break;
            case Categories.BREEDING_LAB:
               _loc4_ = BreedingLab.getItemInstance(this.parentNotifierForItems,this.itemHolder,param2,param3);
         }
         return _loc4_;
      }
   }
}

