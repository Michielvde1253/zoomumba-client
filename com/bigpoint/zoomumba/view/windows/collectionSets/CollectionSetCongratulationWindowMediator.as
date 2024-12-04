package com.bigpoint.zoomumba.view.windows.collectionSets
{
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.collectienSets.CollectionSetCongratulationInitParams;
   import com.bigpoint.zoomumba.model.windows.quests.QuestWindowInitParams;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.collectionSets.CollectionSetCongratulationContent;
   import windows.custom.collectionSets.CollectionSetCongratulationWindow;
   
   public class CollectionSetCongratulationWindowMediator extends WindowMediator
   {
      public static const NAME:String = "CollectionSetCongratulationWindowMediator";
      
      private var windowContent:CollectionSetCongratulationContent;
      
      private var collectionId:int = -1;
      
      public function CollectionSetCongratulationWindowMediator(param1:CollectionSetCongratulationWindow)
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
      
      override public function init(param1:Object) : void
      {
         var _loc2_:CollectionSetCongratulationInitParams = param1 as CollectionSetCongratulationInitParams;
         this.collectionId = _loc2_.collectionSetId;
         this.windowContent = (viewComponent as CollectionSetCongratulationWindow).getContent(0) as CollectionSetCongratulationContent;
         if(_loc2_.isFirstTime)
         {
            this.windowContent.header.title.text = TextResourceModule.getText("zoo.window.infoLayers.collectables.firstFinish.title");
            this.windowContent.message.htmlText = TextResourceModule.getTextReplaced("zoo.window.infoLayers.collectables.firstFinish.text",Vector.<TextReplace>([new TextReplace("%collection%",TextIdHelper.getSetName(_loc2_.collectionSetCategoryId,_loc2_.collectionSetItemId))]));
         }
         else
         {
            this.windowContent.header.title.text = TextResourceModule.getText("zoo.window.infoLayers.collectables.finish.title");
            this.windowContent.message.htmlText = TextResourceModule.getTextReplaced("zoo.window.infoLayers.collectables.finish.text",Vector.<TextReplace>([new TextReplace("%collection%",TextIdHelper.getSetName(_loc2_.collectionSetCategoryId,_loc2_.collectionSetItemId))]));
         }
         this.windowContent.viewCollectionButton.label = TextResourceModule.getText("zoo.window.infoLayers.collectables.button.viewCollection");
         this.windowContent.viewCollectionButton.addEventListener(MouseEvent.CLICK,this.handleGoToColectionSet);
         if(_loc2_.isFirstTime)
         {
            AssetLibrary.sendAssetToFunction("collection_set_congratulation",this.handleCongratulationAssets);
         }
         AssetLibrary.sendAssetToFunction(AssetIds.getPreviewAssetForItemVO(_loc2_.collectionSetCategoryId,_loc2_.collectionSetItemId),this.handleCollectionSetTarget);
      }
      
      private function handleGoToColectionSet(param1:MouseEvent) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.QUESTS,"",new QuestWindowInitParams(2,this.collectionId)));
         handleWindowCloseClick();
      }
      
      public function handleCollectionSetTarget(param1:SWFAsset) : void
      {
         this.windowContent.itemsPicContainer.addChild(param1.getEmbededSprite(AssetConfig.DEFAULT_OBJECT_SPR));
      }
      
      private function handleCongratulationAssets(param1:SWFAsset) : void
      {
         this.windowContent.starsContainer.addChild(param1.getEmbededSprite("CongratulationStarsSPR"));
      }
      
      override public function dispose() : void
      {
      }
   }
}

