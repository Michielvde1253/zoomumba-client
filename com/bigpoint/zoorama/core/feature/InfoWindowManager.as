package com.bigpoint.zoorama.core.feature
{
   import com.bigpoint.utils.notificator.Notifier;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.infoWindow.InfoWindowData;
   import com.bigpoint.zoorama.utils.WindowManager;
   import com.bigpoint.zoorama.view.field.items.Decor;
   import com.bigpoint.zoorama.view.info.InfoWindow;
   import org.puremvc.as3.interfaces.INotification;
   import org.puremvc.as3.patterns.mediator.Mediator;
   
   public class InfoWindowManager extends Mediator
   {
      public static const NAME:String = "InfoWindowManager";
      
      private var notifier:Notifier;
      
      private var windowManager:WindowManager;
      
      private var infoWindow:InfoWindow;
      
      public function InfoWindowManager(param1:Notifier, param2:WindowManager)
      {
         super(NAME);
         this.windowManager = param2;
         this.notifier = new Notifier(param1);
         this.infoWindow = new InfoWindow(this.notifier);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.INVENTORY_ITEM_INFO_WINDOW];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.INVENTORY_ITEM_INFO_WINDOW:
               this.openInfoWindow(param1.getBody() as InfoWindowData);
         }
      }
      
      public function openInfoWindow(param1:InfoWindowData) : void
      {
         var _loc2_:String = AssetConfig.getAssetIdFromItemType(param1.categoryId,param1.itemId);
         this.infoWindow.itemAssetId = _loc2_;
         if(param1.categoryId == Categories.ANIMAL)
         {
            this.infoWindow.itemXmlPath = "zoo.window.shopAnimalInfo.";
            this.infoWindow.isAnimal = true;
         }
         if(param1.categoryId == Categories.CAGE)
         {
            this.infoWindow.itemAssetId = AssetIds.getPreviewAssetId(Categories.CAGE,param1.itemId,param1.level);
            this.infoWindow.itemXmlPath = "zoo.window.shopCageInfo.";
            this.infoWindow.isAnimal = false;
         }
         if(param1.categoryId == Categories.DECOR)
         {
            this.infoWindow.itemXmlPath = "zoo.window.shopDecorationInfo.";
            this.infoWindow.isAnimal = false;
            if(param1.itemId >= Decor.STORAGE_START_ID && param1.itemId < Decor.STORAGE_END_ID && FeatureActiveReference.storage)
            {
               this.infoWindow.itemXmlPath = "zoo.premium.";
               this.infoWindow.isPremium = true;
            }
         }
         if(param1.categoryId == Categories.STORE)
         {
            this.infoWindow.itemXmlPath = "zoo.window.shopStoreInfo.";
            this.infoWindow.isAnimal = false;
         }
         this.windowManager.showWindow(this.infoWindow);
         this.infoWindow.showInfoData(param1);
      }
   }
}

