package com.bigpoint.zoomumba.view.windows.gameItem.info
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.items.CageSpecieBonus;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.utils.configModules.TextReplace;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.radioButton.RadioButtonChildSkin;
   import components.radioButton.RadioButtonSexFemaleSkin;
   import components.radioButton.RadioButtonSexMaleSkin;
   import custom.info.extensions.InfoContentSpecieStatic;
   import flash.display.Sprite;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gameItems.info.infoSpecieStatic.ItemInfoSpecieStaticWindow;
   
   public class ItemInfoSpecieStaticWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemInfoSpecieStaticWindowMediator";
      
      private var cardData:AnimalShopData;
      
      private var userProxy:UserProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var cageShopDataVector:Vector.<CageShopData>;
      
      public function ItemInfoSpecieStaticWindowMediator(param1:ItemInfoSpecieStaticWindow)
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
         this.cardData = param1 as AnimalShopData;
         this.setText();
         this.setVisualInfo();
         this.setPic();
         if(this.cardData.male == 1)
         {
            this.content.radioSex.setStyle("skinClass",RadioButtonSexMaleSkin);
         }
         else if(this.cardData.child == 1)
         {
            this.content.radioSex.setStyle("skinClass",RadioButtonChildSkin);
         }
         else
         {
            this.content.radioSex.setStyle("skinClass",RadioButtonSexFemaleSkin);
         }
         this.content.tier.currentState = "tier_" + this.itemConfigProxy.getShopAnimalSpecieByAnimalId(this.cardData.itemId).tier;
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
         var _loc1_:uint = 0;
         _loc1_ = !!this.cardData.child ? 2 : uint(!this.cardData.male);
         this.content.groupPreview.currentState = "specieStatic";
         this.content.groupPreview.infoLock.level = this.cardData.getUserLevelRequired();
         this.content.groupPreview.infoLock.locked = this.userProxy.userLevel < this.cardData.getUserLevelRequired();
         this.content.groupPreview.infoAttraction.value = this.itemConfigProxy.getShopAnimalSpecie(this.cardData.speciesId).attraction[_loc1_];
         this.content.groupPreview.infoFood.addContent(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,this.itemConfigProxy.getSpecieData(this.cardData.speciesId).foodId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI));
         this.cageShopDataVector = this.itemConfigProxy.getAllCagesBySpecieAsVector(this.cardData.speciesId,true);
         this.content.groupRight.currentState = "specieStatic";
         this.content.groupRight.infoCageSpecies.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.changeCagesHandlers);
         this.content.groupRight.infoCageSpecies.paginator.maxEntries = this.cageShopDataVector.length;
         this.content.groupRight.infoCageSpecies.paginator.currentPage = 0;
      }
      
      private function setPic() : void
      {
         this.content.addContent(new WrapedSprite(this.cardData.picAssetId,AssetConfig.DEFAULT_INFO_SPR));
      }
      
      private function changeCagesHandlers(param1:PaginatorEvent) : void
      {
         var _loc2_:CageShopData = this.cageShopDataVector[param1.page];
         var _loc3_:Sprite = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.CAGE,_loc2_.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,70,50);
         this.content.groupRight.infoCageSpecies.addContent(_loc3_);
         var _loc4_:int = this.itemConfigProxy.getCageSpecieBonus(this.cardData.speciesId,_loc2_.itemId);
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
      
      override public function dispose() : void
      {
         this.cageShopDataVector = null;
         this.content.groupRight.infoCageSpecies.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.changeCagesHandlers);
      }
      
      private function get content() : InfoContentSpecieStatic
      {
         return this.window.getContent(0) as InfoContentSpecieStatic;
      }
      
      private function get window() : ItemInfoSpecieStaticWindow
      {
         return this.viewComponent as ItemInfoSpecieStaticWindow;
      }
   }
}

