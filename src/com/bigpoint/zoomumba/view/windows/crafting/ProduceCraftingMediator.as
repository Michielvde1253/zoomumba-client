package com.bigpoint.zoomumba.view.windows.crafting
{
   import com.bigpoint.utils.timeManager.TimeFormat;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.items.BlueprintInfoVO;
   import com.bigpoint.zoomumba.model.app.items.ItemStackVO;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoomumba.view.windows.crafting.content.ItemMaterialInfoView;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import components.textfield.labelDisplay.LabelDisplay;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.crafting.ProduceCraftingContent;
   import windows.custom.crafting.ProduceCraftingWindow;
   
   public class ProduceCraftingMediator extends WindowMediator
   {
      public static const NAME:String = "ProduceCraftingMediator";
      
      public static const MAX_MATERIALS:int = 4;
      
      private var _craftingProxy:CraftingProxy;
      
      private var _materialProxy:MaterialProxy;
      
      private var _isInit:Boolean;
      
      private var _produceData:ShopItemData;
      
      private var _blueprintInfoVo:BlueprintInfoVO;
      
      private var _infoBar:MovieClip;
      
      private var _preview:MovieClip;
      
      private var _currencyProxy:CurrencyProxy;
      
      private var _itemMaterialInfoView:Vector.<ItemMaterialInfoView>;
      
      public function ProduceCraftingMediator(param1:ProduceCraftingWindow)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
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
         this._isInit = false;
         this._produceData = param1 as ShopItemData;
         this._blueprintInfoVo = this.craftingProxy.getBlueprintInfoDataByRewardItemId(this._produceData.itemId,this._produceData.categoryId);
         this._itemMaterialInfoView = new Vector.<ItemMaterialInfoView>();
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("CraftingWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this._infoBar = param1.getEmbededMovieClip("Infobar");
         this._preview = param1.getEmbededMovieClip("previewProduce");
         this.content.header_bg.source = param1.getEmbededBitmapData("BackgroundProduce");
         this.content.previewProduce.addChild(this._preview);
         this.content.materialbar.addChild(this._infoBar);
         this.content.characterIcon.source = param1.getEmbededBitmapData("uschi");
         var _loc2_:int = 1;
         while(_loc2_ <= ProduceCraftingMediator.MAX_MATERIALS)
         {
            this._itemMaterialInfoView.push(new ItemMaterialInfoView(_loc2_,this._infoBar["bar" + _loc2_ + "_mc"] as MovieClip,this.content["materialcount" + _loc2_] as LabelDisplay));
            _loc2_++;
         }
         var _loc3_:Sprite = param1.getEmbededSprite("header_icon");
         initDynamicTitle(TextResourceModule.getText("zoo.window.crafting.intro.title"),_loc3_);
         this.initView();
         this.window.preloaderVisibility = false;
         this._isInit = true;
      }
      
      public function getItemMaterialInfoViewById(param1:int) : ItemMaterialInfoView
      {
         var _loc2_:ItemMaterialInfoView = null;
         for each(_loc2_ in this._itemMaterialInfoView)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function initView() : void
      {
         var _loc1_:ItemStackVO = null;
         var _loc2_:ItemMaterialInfoView = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = true;
         var _loc5_:int = 0;
         while(_loc5_ < this._blueprintInfoVo.neededMaterials.length)
         {
            _loc2_ = this.getItemMaterialInfoViewById(_loc5_ + 1);
            _loc1_ = this._blueprintInfoVo.neededMaterials[_loc5_];
            _loc2_.itemVo = _loc1_;
            if(this.materialProxy.getMaterialAmount(_loc1_.itemId) > _loc1_.ammount)
            {
               _loc2_.labelText = _loc1_.ammount + " / " + _loc1_.ammount;
            }
            else
            {
               _loc2_.labelText = this.materialProxy.getMaterialAmount(_loc1_.itemId) + " / " + _loc1_.ammount;
            }
            _loc2_.setIcon(new WrapedSprite(AssetIds.getPreviewAssetId(Categories.MATERIAL,_loc1_.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,45,45));
            if(this.craftingProxy.haveEnoughtMaterial(_loc1_))
            {
               _loc2_.setSlotState(ItemMaterialInfoView.SLOTSTATE_ENOUGHT);
            }
            else
            {
               _loc2_.setSlotState(ItemMaterialInfoView.SLOTSTATE_NEED);
               _loc4_ = false;
            }
            _loc5_++;
         }
         (this._preview["picHolder_mc"] as MovieClip).addChild(new WrapedSprite(AssetIds.getPreviewAssetId(this._produceData.categoryId,this._produceData.itemId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,100,100));
         (this._preview["infobtn_mc"] as MovieClip).buttonMode = true;
         (this._preview["infobtn_mc"] as MovieClip).mouseEnabled = true;
         (this._preview["infobtn_mc"] as MovieClip).addEventListener(MouseEvent.CLICK,this.onInfoClick,false,0,true);
         var _loc6_:String = TextIdHelper.getCardName(this._produceData.categoryId,this._produceData.itemId);
         this.content.cardtitle.text = TextResourceModule.getText(_loc6_);
         var _loc7_:int = this.currencyProxy.petPowns;
         var _loc8_:int = this._blueprintInfoVo.petpaws;
         if(_loc7_ > _loc8_)
         {
            this.content.petpawText.text = String(_loc8_) + " / " + String(_loc8_);
         }
         else
         {
            this.content.petpawText.text = String(_loc7_) + " / " + String(_loc8_);
            _loc4_ = false;
         }
         this.content.bubbleText.text = TextResourceModule.getText("zoo.window.crafting.produce.text");
         this.content.btnBack.label = TextResourceModule.getText("zoo.window.general.prev");
         this.content.btnCraft.label = TextResourceModule.getText("zoo.window.crafting.produce.button");
         this.content.btnCraft.enabled = _loc4_;
         this.content.clockDisplay.text = TimeFormat.secondsToBigTimeString(this._blueprintInfoVo.duration);
         this.content.btnCraft.addEventListener(MouseEvent.CLICK,this.onPressCraftButton);
         this.content.btnBack.addEventListener(MouseEvent.CLICK,this.onPressBackButton);
      }
      
      private function onPressBackButton(param1:MouseEvent) : void
      {
         handleWindowCloseClick();
      }
      
      private function onPressCraftButton(param1:MouseEvent) : void
      {
         this._craftingProxy.netSendStartBlueprintCrafting(this._blueprintInfoVo.blueprintId,Note.OPEN_CRAFTING_WINDOW);
         sendNotification(WinNote.CLOSE_ALL_WINDOWS);
         handleWindowCloseClick();
      }
      
      private function onInfoClick(param1:MouseEvent) : void
      {
         sendNotification(SHOP.SHOPCARD_INFO_CLICKED,this._produceData);
      }
      
      private function onPressCategorieButton(param1:MouseEvent) : void
      {
         var _loc2_:int = parseInt(param1.target.name as String);
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_CHOOSE_WINDOW,"",_loc2_));
         handleWindowCloseClick();
      }
      
      override public function onRemove() : void
      {
         var _loc1_:ItemMaterialInfoView = null;
         if(this.content)
         {
            (this._preview["infobtn_mc"] as MovieClip).removeEventListener(MouseEvent.CLICK,this.onInfoClick);
            this.content.btnCraft.removeEventListener(MouseEvent.CLICK,this.onPressCraftButton);
            this.content.btnBack.removeEventListener(MouseEvent.CLICK,this.onPressBackButton);
            for each(_loc1_ in this._itemMaterialInfoView)
            {
               _loc1_.remove();
            }
            this._itemMaterialInfoView = null;
         }
         super.onRemove();
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.getProxy(CraftingProxy) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      private function get content() : ProduceCraftingContent
      {
         return this.window.getContent() as ProduceCraftingContent;
      }
      
      private function get window() : ProduceCraftingWindow
      {
         return this.viewComponent as ProduceCraftingWindow;
      }
      
      public function get materialProxy() : MaterialProxy
      {
         if(this._materialProxy == null)
         {
            this._materialProxy = facade.getProxy(MaterialProxy) as MaterialProxy;
         }
         return this._materialProxy;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         if(this._currencyProxy == null)
         {
            this._currencyProxy = facade.getProxy(CurrencyProxy) as CurrencyProxy;
         }
         return this._currencyProxy;
      }
   }
}

