package com.bigpoint.zoomumba.view.windows.gameItem.info
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import custom.info.events.InfoSexChangeEvent;
   import custom.info.extensions.InfoContentSpecie;
   import flash.display.Sprite;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gameItems.info.infoSpecie.ItemInfoSpecieWindow;
   
   public class ItemInfoSpecieWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemInfoSpecieWindowMediator";
      
      private var cardData:AnimalSpeciesVO;
      
      private var userProxy:UserProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var cageShopDataVector:Vector.<CageShopData>;
      
      public function ItemInfoSpecieWindowMediator(param1:ItemInfoSpecieWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         this.itemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
      }
      
      override public function init(param1:Object) : void
      {
         this.cardData = param1 as AnimalSpeciesVO;
         this.setText();
         this.setVisualInfo();
         this.setPic();
         this.content.tier.currentState = "tier_" + this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.cardData.maleId).tier;
         this.content.sexChangeGroup.selectedValue = this.cardData.isMaleSelected ? 1 : 0;
         this.content.addEventListener(InfoSexChangeEvent.CHANGED,this.handleSexChanged);
      }
      
      private function handleSexChanged(param1:InfoSexChangeEvent) : void
      {
         this.cardData.isMaleSelected = param1.isMale;
         this.setPic();
      }
      
      private function setText() : void
      {
         var _loc1_:Vector.<TextReplace> = null;
         var _loc2_:Array = null;
         this.content.title = this.cardData.localisedTitle;
         if(this.cardData.localisedInfoReplacers)
         {
            _loc1_ = new Vector.<TextReplace>();
            for each(_loc2_ in this.cardData.localisedInfoReplacers)
            {
               _loc1_.push(new TextReplace(_loc2_[0],_loc2_[1]));
            }
            this.content.text = TextResourceModule.getTextReplaced(this.cardData.localisedInfoId,_loc1_);
         }
         else
         {
            this.content.text = TextResourceModule.getText(this.cardData.localisedInfoId);
         }
      }
      
      private function setVisualInfo() : void
      {
         this.content.groupPreview.currentState = "specie";
         this.content.groupPreview.infoLock.level = this.cardData.getUserLevelRequired();
         this.content.groupPreview.infoLock.locked = this.userProxy.userLevel < this.cardData.getUserLevelRequired();
         this.content.groupPreview.infoAttraction.value = this.cardData.getAttraction();
         this.content.groupPreview.infoFood.addContent(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,this.cardData.foodId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.cageShopDataVector = this.itemConfigProxy.getAllCagesBySpecieAsVector(this.cardData.itemId,true);
         this.content.groupRight.currentState = "specie";
         this.content.groupRight.infoCageSpecies.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.changeCagesHandlers);
         this.content.groupRight.infoCageSpecies.paginator.maxEntries = this.cageShopDataVector.length;
         this.content.groupRight.infoCageSpecies.paginator.currentPage = 0;
      }
      
      private function setPic() : void
      {
         if(this.cardData.isMaleSelected)
         {
            this.content.addContent(new WrapedSprite(this.cardData.maleAssetId,AssetConfig.DEFAULT_INFO_SPR));
         }
         else
         {
            this.content.addContent(new WrapedSprite(this.cardData.femaleAssetId,AssetConfig.DEFAULT_INFO_SPR));
         }
      }
      
      private function changeCagesHandlers(param1:PaginatorEvent) : void
      {
         var _loc2_:CageShopData = this.cageShopDataVector[param1.page];
         var _loc3_:Sprite = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,_loc2_.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,70,50);
         this.content.groupRight.infoCageSpecies.addContent(_loc3_);
         var _loc4_:int = this.itemConfigProxy.getCageSpecieBonus(this.cardData.itemId,_loc2_.itemId);
         switch(_loc4_)
         {
            case CageSpecieBonus.GOOD:
               this.content.groupRight.infoCageSpecies.currentState = "speciesMatches";
               this.content.groupRight.infoCageSpecies.match.currentState = "love";
               this.content.groupRight.infoCageSpecies.match.percentage = 10;
               break;
            case CageSpecieBonus.CRAZY:
               this.content.groupRight.infoCageSpecies.currentState = "speciesMatches";
               this.content.groupRight.infoCageSpecies.match.currentState = "crazy";
               this.content.groupRight.infoCageSpecies.match.percentage = 10;
               break;
            default:
               this.content.groupRight.infoCageSpecies.currentState = "none";
         }
      }
      
      private function get content() : InfoContentSpecie
      {
         return this.window.getContent(0) as InfoContentSpecie;
      }
      
      private function get window() : ItemInfoSpecieWindow
      {
         return this.viewComponent as ItemInfoSpecieWindow;
      }
      
      override public function dispose() : void
      {
         this.cageShopDataVector = null;
         this.content.groupRight.infoCageSpecies.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.changeCagesHandlers);
         this.content.removeEventListener(InfoSexChangeEvent.CHANGED,this.handleSexChanged);
      }
   }
}

