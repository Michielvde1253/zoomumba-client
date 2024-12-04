package com.bigpoint.zoomumba.view.windows.inventory
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.NET;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.model.net.responceDataVo.fieldItems.AnimalData;
   import com.bigpoint.zoomumba.model.windows.gameItem.moveToInventory.AnimalMoveToInventoryWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.inventoryWindow.AnimalToInventoryContent;
   import windows.custom.inventoryWindow.AnimalToInventoryWindow;
   import windows.events.WindowCustomEvent;
   
   public class AnimalToInventoryWindowMediator extends WindowMediator
   {
      public static const NAME:String = "AnimalToInventoryWindowMediator";
      
      private var winParams:AnimalMoveToInventoryWindowInitParams;
      
      public function AnimalToInventoryWindowMediator(param1:AnimalToInventoryWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function init(param1:Object) : void
      {
         this.winParams = param1 as AnimalMoveToInventoryWindowInitParams;
         this.content.counter.value = this.winParams.cage.childCount;
         this.content.question.text = TextResourceModule.getText("zoo.event.halloween.layer.confirmBabyMove.text").replace("%species%",TextIdHelper.getName(Categories.SPECIES,this.winParams.cage.speciesId));
         this.content.header.text = TextResourceModule.getText("zoo.event.halloween.layer.confirmBabyMove.title");
         this.content.animalPic.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,this.winParams.babyId),AssetConfig.DEFAULT_OBJECT_SPR,0,-1,100));
         this.content.countSelector.maximum = this.winParams.cage.childCount;
         this.content.countSelector.minimum = 1;
         this.content.countSelector.stepSize = 1;
      }
      
      override protected function handleWindowConfirm(param1:WindowCustomEvent = null) : void
      {
         var _loc2_:Vector.<AnimalData> = this.getMovableAnimals();
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this.content.countSelector.value)
         {
            _loc3_.push({
               "id":_loc2_[_loc4_].uniqueId,
               "aId":this.winParams.babyId,
               "cId":this.winParams.cage.uniqueId,
               "sId":_loc2_[_loc4_].specieId
            });
            _loc4_++;
         }
         sendNotification(NET.MOVE_ANIMAL_FROM_FIELD_TO_INVENTORY,[Categories.ANIMAL,_loc3_]);
         sendNotification(Note.RELOAD_INVENTORY);
         super.handleWindowConfirm(param1);
      }
      
      private function getMovableAnimals() : Vector.<AnimalData>
      {
         var _loc1_:Vector.<AnimalData> = new Vector.<AnimalData>();
         var _loc2_:int = 0;
         while(_loc2_ < this.winParams.animals.length)
         {
            if(this.winParams.animals[_loc2_].animalId == this.winParams.babyId)
            {
               _loc1_.push(this.winParams.animals[_loc2_]);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      private function get window() : AnimalToInventoryWindow
      {
         return this.viewComponent as AnimalToInventoryWindow;
      }
      
      private function get content() : AnimalToInventoryContent
      {
         return this.window.getContent() as AnimalToInventoryContent;
      }
      
      override public function dispose() : void
      {
      }
   }
}

