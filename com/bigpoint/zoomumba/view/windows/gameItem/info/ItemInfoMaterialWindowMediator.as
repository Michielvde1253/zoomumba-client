package com.bigpoint.zoomumba.view.windows.gameItem.info
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.model.app.items.ItemVO;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import com.greensock.TweenLite;
   import com.greensock.data.TweenLiteVars;
   import custom.info.extensions.InfoContentMaterial;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.gameItems.info.infoMaterial.ItemInfoMaterialWindow;
   
   public class ItemInfoMaterialWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ItemInfoMaterialWindowMediator";
      
      private var cardData:MaterialShopData;
      
      private var userProxy:UserProxy;
      
      private var itemConfigProxy:ItemConfigProxy;
      
      private var _craftingProxy:CraftingProxy;
      
      private var buildingShopDataVector:Vector.<ItemVO>;
      
      private var _itemVo:ItemVO;
      
      private var _wSprite:Sprite;
      
      private var _toolTip:String;
      
      public var zooDollar:Class = ItemInfoMaterialWindowMediator_zooDollar;
      
      public var petPenny:Class = ItemInfoMaterialWindowMediator_petPenny;
      
      public function ItemInfoMaterialWindowMediator(param1:ItemInfoMaterialWindow)
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
         this.cardData = param1 as MaterialShopData;
         this.setText();
         this.setVisualInfo();
         this.setPic();
      }
      
      private function setText() : void
      {
         this.content.title = this.cardData.localisedTitle;
         this.content.text = TextResourceModule.getText(TextIdHelper.getCardInfo(Categories.MATERIAL,this.cardData.itemId));
         this.content.trashDollarText.text = String(this.cardData.craftTrash);
         if(this.cardData.craftVirtual > 0)
         {
            this.content.zooMoneyImage.source = this.petPenny;
            this.content.zooDollarText.text = String(this.cardData.craftVirtual);
         }
         else if(this.cardData.craftReal > 0)
         {
            this.content.zooMoneyImage.source = this.zooDollar;
            this.content.zooDollarText.text = String(this.cardData.craftReal);
         }
         this.content.timerText.text = TimeFormat.secondsToBigTimeString(this.cardData.craftDuration);
         this.content.switchInfo.text = TextResourceModule.getText("zoo.window.recycling.info.switchInfo");
      }
      
      private function setVisualInfo() : void
      {
         this.content.groupPreview.currentState = "material";
         this.buildingShopDataVector = this.craftingProxy.getRewardsByMaterialId(this.cardData.itemId,false);
         this.content.groupRight.currentState = "material";
         this.content.groupRight.infoMaterialBuild._container.addEventListener(MouseEvent.MOUSE_OVER,this.onItemMouseOver);
         this.content.groupRight.infoMaterialBuild._container.addEventListener(MouseEvent.MOUSE_OUT,this.onItemMouseOut);
         this.content.groupRight.infoMaterialBuild.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.changeBuildingHandlers);
         this.content.groupRight.infoMaterialBuild.paginator.maxEntries = this.buildingShopDataVector.length;
         this.content.groupRight.infoMaterialBuild.paginator.currentPage = 0;
      }
      
      private function onItemMouseOut(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function onItemMouseOver(param1:MouseEvent) : void
      {
         if(this._toolTip != "")
         {
            TooltipNewManager.setToolTip(this.content.groupRight.infoMaterialBuild._container,this._toolTip);
         }
      }
      
      private function setPic() : void
      {
         var _loc1_:DisplayObject = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.MATERIAL,this.cardData.itemId),AssetConfig.DEFAULT_INFO_SPR,0,-1,-1,1);
         _loc1_.y -= 30;
         this.content.addContent(_loc1_);
      }
      
      private function changeBuildingHandlers(param1:PaginatorEvent) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         this._toolTip = "";
         if(this.buildingShopDataVector.length > 0)
         {
            this._itemVo = this.buildingShopDataVector[param1.page];
            this._wSprite = new Sprite();
            _loc2_ = new WrapedSprite(AssetIds.getPreviewAssetId(this._itemVo.category,this._itemVo.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,70,50);
            this._wSprite.addChild(_loc2_);
            if(!this._craftingProxy.hasUserBlueprintByRewardItemId(this._itemVo.itemId,this._itemVo.category))
            {
               TweenLite.to(_loc2_,0,new TweenLiteVars().colorMatrixFilter(16777215,1,0.3).blurFilter(3,3,2,false,false));
               _loc3_ = new WrapedSprite("Decorations","InterrogationMark",PreloaderTypes.MINI,60,40);
               _loc3_.alpha = 1;
               _loc3_.x = -14.3;
               _loc3_.y = -22.5;
               this._wSprite.addChild(_loc3_);
            }
            else
            {
               this._toolTip = TextResourceModule.getText(TextIdHelper.getCardName(this._itemVo.category,this._itemVo.itemId));
            }
            this.content.groupRight.infoMaterialBuild.addContent(this._wSprite);
         }
         else
         {
            this._itemVo = null;
            this._wSprite = new WrapedSprite("Decorations","InterrogationMark",PreloaderTypes.MINI,60,40);
            this._wSprite.x -= this._wSprite.width / 2;
            this._wSprite.y -= this._wSprite.height / 2 + 2.5;
            this.content.groupRight.infoMaterialBuild.addContent(this._wSprite);
         }
         this.content.groupRight.infoMaterialBuild.currentState = "none";
      }
      
      private function setInterrogationIcon() : void
      {
      }
      
      private function get content() : InfoContentMaterial
      {
         return this.window.getContent(0) as InfoContentMaterial;
      }
      
      private function get window() : ItemInfoMaterialWindow
      {
         return this.viewComponent as ItemInfoMaterialWindow;
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      override public function dispose() : void
      {
         this.buildingShopDataVector = null;
         this.content.groupRight.infoCageSpecies.paginator.removeEventListener(PaginatorEvent.CHANGE_PAGE,this.changeBuildingHandlers);
         this.content.groupRight.infoMaterialBuild._container.removeEventListener(MouseEvent.MOUSE_OVER,this.onItemMouseOver);
         this.content.groupRight.infoMaterialBuild._container.removeEventListener(MouseEvent.MOUSE_OUT,this.onItemMouseOut);
      }
   }
}

