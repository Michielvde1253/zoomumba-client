package com.bigpoint.zoomumba.view.windows.quests.infoWindows
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.ConfigurationModule;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.questsWindow.components.TaskItemsComponent;
   import windows.custom.questsWindow.infoWindows.QuestExampleInfoContent;
   import windows.custom.questsWindow.infoWindows.QuestExampleInfoWindow;
   
   public class QuestExampleInfoWindowMediator extends WindowMediator
   {
      public static const NAME:String = "QuestExampleInfoWindowMediator";
      
      private var windowContent:QuestExampleInfoContent;
      
      public function QuestExampleInfoWindowMediator(param1:QuestExampleInfoWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:* = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function init(param1:Object) : void
      {
         this.windowContent = (viewComponent as QuestExampleInfoWindow).getContent(0) as QuestExampleInfoContent;
         this.windowContent.header.title.text = TextResourceModule.getText("zoo.quests.help.daily.title");
         var _loc2_:TaskItemsComponent = new TaskItemsComponent();
         this.windowContent.taskItemsContainer.addElement(_loc2_);
         _loc2_.action = "feed_all";
         _loc2_.actionMultiplayer.text = "50 x";
         _loc2_.targetContainer.addChild(AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_ALL_ANIMALS_ICON));
         _loc2_.targetContainer.scaleX = 1;
         _loc2_.targetContainer.scaleY = 1;
         var _loc3_:TaskItemsComponent = new TaskItemsComponent();
         this.windowContent.taskItemsContainer.addElement(_loc3_);
         _loc3_.action = "breed";
         _loc3_.targetMultiplayer.text = "2 x";
         _loc3_.targetContainer.addChild(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.ANIMAL,ConfigurationModule.getInstance().getMaleAnimalData(11).animalId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         _loc3_.animalId = 11;
         this.windowContent.info.htmlText = TextResourceModule.getText("zoo.quests.help.daily.description");
      }
      
      override public function dispose() : void
      {
      }
   }
}

