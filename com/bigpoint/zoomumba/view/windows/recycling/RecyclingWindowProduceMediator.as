package com.bigpoint.zoomumba.view.windows.recycling
{
   import com.bigpoint.utils.StringHelper;
   import com.bigpoint.utils.functions.AddAssetItem;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.DataNote;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PreloaderTypes;
   import com.bigpoint.zoomumba.constants.Resources;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.UserResources;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.currency.CurrencyProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.model.user.resources.ResourcesProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowParams;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.model.windows.confirmation.extended.BuyConfirmationInitParams;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.assets.AssetIds;
   import com.bigpoint.zoorama.data.LocalizationPath;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.utils.wrapers.WrapedSprite;
   import com.bigpoint.zoorama.view.gui.tooltip.TooltipNewManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.recycling.RecyclingProduceContent;
   import windows.custom.recycling.RecyclingProduceWindow;
   
   public class RecyclingWindowProduceMediator extends WindowMediator
   {
      public static const NAME:String = "RecyclingWindowProduceMediator";
      
      private var window:RecyclingProduceWindow;
      
      private var _recyclingProxy:RecyclingProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _playfieldProxy:PlayFieldProxy;
      
      private var _currencyProxy:CurrencyProxy;
      
      private var _selectedSlotItem:RecyclingCardInfoVo;
      
      private var _materialProxy:MaterialProxy;
      
      private var _resourcesProxy:ResourcesProxy;
      
      private var _produceCount:int;
      
      private var _insertFilter:int;
      
      private var _isInit:Boolean;
      
      private var _superCheckedLayer:Sprite;
      
      private var _boosterSymb:Sprite;
      
      private var _rarSymb:Sprite;
      
      private var _itemConfigProxy:ItemConfigProxy;
      
      public var petPennyImage:Class = RecyclingWindowProduceMediator_petPennyImage;
      
      public var zooDollarImage:Class = RecyclingWindowProduceMediator_zooDollarImage;
      
      public function RecyclingWindowProduceMediator(param1:RecyclingProduceWindow)
      {
         super(NAME,param1);
         this.window = param1;
         this._isInit = false;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.RECYCLING_SLOTS_REFRESHED,DataNote.REAL_MONEY_UPDATED,DataNote.VIRTUAL_MONEY_UPDATED,DataNote.COLLECTABLE_UPDATED,Note.RESOURCES_UPDATED,Note.USER_DATA_UPDATED,GUINote.RECYCLING_PRODUCE_CARD_STEP_EVENT,SHOP.REFRESH_RESOURCES];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.RECYCLING_SLOTS_REFRESHED:
               this.createRecyclingCards();
               break;
            case GUINote.RECYCLING_PRODUCE_CARD_STEP_EVENT:
               this.checkProduceCount(param1.getBody() as int);
               this.calcFilter();
               break;
            case DataNote.REAL_MONEY_UPDATED:
            case DataNote.VIRTUAL_MONEY_UPDATED:
            case DataNote.COLLECTABLE_UPDATED:
            case Note.RESOURCES_UPDATED:
            case Note.USER_DATA_UPDATED:
            case SHOP.REFRESH_RESOURCES:
               this.checkFilter();
               this.checkProduceCount(this._produceCount);
               this.calcFilter();
         }
      }
      
      private function checkFilter() : void
      {
         this.content.filterCounter.value = this.recyclingProxy.boosterAmount;
         if(this.recyclingProxy.boosterAmount > 0)
         {
            this.content.buttonLabel.enabled = true;
         }
         else
         {
            this.content.buttonLabel.enabled = false;
            this.insertFilter = 0;
         }
      }
      
      private function checkProduceCount(param1:int) : void
      {
         var _loc2_:Boolean = true;
         var _loc3_:Number = this.materialShopData.craftVirtual * param1;
         var _loc4_:Number = this.materialShopData.craftTrash * param1;
         if(this.currencyProxy.virtualMoney >= _loc3_ && this.recyclingProxy.trashAmount >= _loc4_)
         {
            this.content.btnRecycle.enabled = true;
         }
         else
         {
            this.content.btnRecycle.enabled = false;
         }
         this._produceCount = param1;
         this.refreshCalcCostPanel();
      }
      
      private function refreshCalcCostPanel() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Number = NaN;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc9_:String = null;
         if(this.materialShopData)
         {
            if(this.materialShopData.craftVirtual > 0)
            {
               this.content.zooDollarImage.source = this.petPennyImage;
               _loc4_ = this.materialShopData.craftVirtual * this._produceCount;
               _loc5_ = StringHelper.numberFormater(this.currencyProxy.virtualMoney,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
               _loc6_ = StringHelper.numberFormater(_loc4_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
               if(Number(this.currencyProxy.virtualMoney) > _loc4_)
               {
                  this.content.zooDollarText.text = _loc6_ + " / " + _loc6_;
               }
               else
               {
                  this.content.zooDollarText.text = _loc5_ + " / " + _loc6_;
               }
            }
            else if(this.materialShopData.craftReal > 0)
            {
               this.content.zooDollarImage.source = this.zooDollarImage;
               _loc7_ = this.materialShopData.craftReal * this._produceCount;
               _loc8_ = StringHelper.numberFormater(this.currencyProxy.realMoney,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
               _loc9_ = StringHelper.numberFormater(_loc7_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
               if(Number(this.currencyProxy.realMoney) > _loc7_)
               {
                  this.content.zooDollarText.text = _loc9_ + " / " + _loc9_;
               }
               else
               {
                  this.content.zooDollarText.text = _loc8_ + " / " + _loc9_;
               }
            }
            _loc1_ = this.materialShopData.craftTrash * this._produceCount;
            _loc2_ = StringHelper.numberFormater(this.recyclingProxy.trashAmount,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            _loc3_ = StringHelper.numberFormater(_loc1_,TextResourceModule.getText(LocalizationPath.NUMBER_THOUSAND_SEPARATOR),int(TextResourceModule.getText(LocalizationPath.NUMBER_DIGITS_SEPARATOR)));
            if(Number(this.recyclingProxy.trashAmount) > _loc1_)
            {
               this.content.trashDollarText.text = _loc3_ + " / " + _loc3_;
            }
            else
            {
               this.content.trashDollarText.text = _loc2_ + " / " + _loc3_;
            }
         }
      }
      
      private function calcFilter() : void
      {
         var _loc1_:int = 0;
         if(this.materialShopData)
         {
            _loc1_ = 0;
            if(this._produceCount <= this.recyclingProxy.recyclingConfigVo.rareDropChance.length)
            {
               if(this.insertFilter == 1)
               {
                  _loc1_ = this.recyclingProxy.recyclingConfigVo.rareDropChanceBooster;
               }
               _loc1_ += int(this.recyclingProxy.recyclingConfigVo.rareDropChance[this._produceCount - 1]);
               this.content.rareChanceText.text = TextResourceModule.getText("zoo.window.recycling.produce.rarechancetext").replace("%percent%",_loc1_);
            }
         }
      }
      
      override public function init(param1:Object) : void
      {
         this._selectedSlotItem = param1 as RecyclingCardInfoVo;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("RecyclingWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:Sprite = AddAssetItem.addSpriteToContainer(_loc2_,"QuestionSPR",AssetConfig.WINDOW_HEADERS,60,-5);
         _loc3_["$right"].width = 450;
         this.content.infoImage.addChild(_loc3_);
         var _loc4_:Sprite = new Sprite();
         var _loc5_:Sprite = AddAssetItem.addSpriteToContainer(_loc4_,"LineSPR",AssetConfig.WINDOW_HEADERS,60,-5);
         _loc5_["$line"].width = 545;
         this.content.middleLine.addChild(_loc5_);
         this.recyclingProxy.getRecylceSlots();
         this.content.introtoptext.text = TextResourceModule.getText(TextIdHelper.getCardName(Categories.MATERIAL,this.materialShopData.itemId));
         this.content.introtext.text = TextResourceModule.getText("zoo.window.recycling.produce.text");
         this.window.preloaderVisibility = false;
         this.createRecyclingCards();
         var _loc6_:Sprite = AssetLibrary.getSprite(AssetConfig.ASSET_COMMONS_SYMBOLS,AssetConfig.COMMONS_ICON_BACK);
         this.content.superFilterBG.addChild(_loc6_);
         this._boosterSymb = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.RESOURCES,Resources.RECYCLING_BOOSTER),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,-1,0.75);
         this.content.superFilterSymbol.addChild(this._boosterSymb);
         this.content.titleSuperFilter.text = TextResourceModule.getText("zoo.window.recycling.produce.superfiltertitle");
         this.content.textSuperFilter.text = TextResourceModule.getText("zoo.window.recycling.produce.superfiltertext").replace("%percent%",this._recyclingProxy.recyclingConfigVo.rareDropChanceBooster);
         this.content.rareChanceText.text = TextResourceModule.getText("zoo.window.recycling.produce.rarechancetext").replace("%percent%",this._recyclingProxy.recyclingConfigVo.rareDropChanceBooster);
         this.content.superFilterRarBG.addChild(param1.getEmbededSprite("bgStar"));
         if(Boolean(this.materialShopData) && Boolean(this.materialShopData.rareDropId))
         {
            this._rarSymb = new WrapedSprite(AssetIds.getPreviewAssetId(Categories.MATERIAL,this.materialShopData.rareDropId),AssetConfig.DEFAULT_OBJECT_SPR,PreloaderTypes.MINI,-1,-1,0.65);
            this.content.superFilterRarBG.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOverRarSymbol);
            this.content.superFilterRarBG.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOutRarSymbol);
            this.content.superFilterRarBG.mouseEnabled = true;
            this.content.superFilterRarSymbol.mouseEnabled = false;
            this.content.superFilterRarSymbol.mouseChildren = false;
            this._rarSymb.mouseEnabled = false;
            this._rarSymb.mouseChildren = false;
            this.content.superFilterRarSymbol.addChild(this._rarSymb);
         }
         this.content.buttonLabel.addEventListener(MouseEvent.CLICK,this.onPressFilterButton);
         this._superCheckedLayer = param1.getEmbededSprite("OverCheckLayer");
         this._superCheckedLayer.mouseEnabled = false;
         this._superCheckedLayer["background_mc"].mouseEnabled = false;
         this.content.superfilterUsed.mouseChildren = false;
         this.content.superfilterUsed.addChild(this._superCheckedLayer);
         this.content.btnRecycle.label = TextResourceModule.getText("zoo.window.recycling.produce.startrecycle");
         this.content.btnBack.label = TextResourceModule.getText("zoo.window.general.prev");
         this.content.btnRecycle.addEventListener(MouseEvent.CLICK,this.onPressRecycleButton);
         this.content.btnBack.addEventListener(MouseEvent.CLICK,this.onPressBackButton);
         this._isInit = true;
         this.insertFilter = 0;
         this.checkFilter();
         this.refreshCalcCostPanel();
      }
      
      private function onMouseOutRarSymbol(param1:MouseEvent) : void
      {
         TooltipNewManager.removeToolTip();
      }
      
      private function onMouseOverRarSymbol(param1:MouseEvent) : void
      {
         var _loc2_:String = TextResourceModule.getText(TextIdHelper.getCardName(Categories.MATERIAL,this.materialShopData.rareDropId));
         TooltipNewManager.setToolTip(this.content.superFilterRarSymbol,_loc2_,false);
      }
      
      private function filterButtonEnabled(param1:Boolean) : void
      {
         if(this.content)
         {
            if(param1)
            {
               this.content.superFilterBG.addEventListener(MouseEvent.MOUSE_OVER,this.onFilterOver,false,0,true);
               this.content.superFilterBG.addEventListener(MouseEvent.MOUSE_OUT,this.onFilterOut,false,0,true);
               this.content.superFilterBG.addEventListener(MouseEvent.MOUSE_UP,this.onFilterClick,false,0,true);
               this.content.superFilterSymbol.addEventListener(MouseEvent.MOUSE_OVER,this.onFilterOver,false,0,true);
               this.content.superFilterSymbol.addEventListener(MouseEvent.MOUSE_OUT,this.onFilterOut,false,0,true);
               this.content.superFilterSymbol.addEventListener(MouseEvent.MOUSE_UP,this.onFilterClick,false,0,true);
               this.content.superFilterSymbol.buttonMode = true;
               this.content.superFilterSymbol.mouseEnabled = true;
               this.content.superFilterBG.buttonMode = true;
               this.content.superFilterBG.mouseEnabled = true;
            }
            else
            {
               this.content.superFilterBG.removeEventListener(MouseEvent.MOUSE_OVER,this.onFilterOver);
               this.content.superFilterBG.removeEventListener(MouseEvent.MOUSE_OUT,this.onFilterOut);
               this.content.superFilterBG.removeEventListener(MouseEvent.MOUSE_UP,this.onFilterClick);
               this.content.superFilterSymbol.removeEventListener(MouseEvent.MOUSE_OVER,this.onFilterOver);
               this.content.superFilterSymbol.removeEventListener(MouseEvent.MOUSE_OUT,this.onFilterOut);
               this.content.superFilterSymbol.removeEventListener(MouseEvent.MOUSE_UP,this.onFilterClick);
               this.content.superFilterSymbol.buttonMode = false;
               this.content.superFilterSymbol.mouseEnabled = false;
               this.content.superFilterBG.buttonMode = false;
               this.content.superFilterBG.mouseEnabled = false;
            }
         }
      }
      
      private function onFilterClick(param1:MouseEvent) : void
      {
         var _loc2_:ShopItemData = this.itemConfigProxy.getItemById(Resources.RECYCLING_BOOSTER,Categories.RESOURCES);
         var _loc3_:* = this.currencyProxy.getCurrency(UserResources.REAL_MONEY) >= _loc2_.getBuyReal();
         _loc2_.price.userResource = UserResources.REAL_MONEY;
         _loc2_.price.userCanBuy = _loc3_;
         _loc2_.price.amount = 1;
         if(_loc2_)
         {
            sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.BUY_CONFIRMATION,"",new BuyConfirmationInitParams(TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.title"),TextResourceModule.getText("zoo.window.confirmation.shop.buyitemreal.info"),_loc2_.getBuyReal()),new WindowParams("",null,"",null,SHOP.SHOPCARD_BUY_CLICKED,_loc2_)));
         }
      }
      
      private function onFilterOut(param1:MouseEvent) : void
      {
         this._boosterSymb.scaleX = 1;
         this._boosterSymb.scaleY = this._boosterSymb.scaleX;
      }
      
      private function onFilterOver(param1:MouseEvent) : void
      {
         this._boosterSymb.scaleX = 1.1;
         this._boosterSymb.scaleY = this._boosterSymb.scaleX;
      }
      
      private function onPressRecycleButton(param1:MouseEvent) : void
      {
         facade.sendNotification(GUINote.RECYCLING_CHOOSE_MATERIAL_CLOSE);
         this.recyclingProxy.startRecyclingMaterial(this._selectedSlotItem.slotDataVo.slotId,this._selectedSlotItem.materialShopData.itemId,this._produceCount,this._insertFilter);
         handleWindowCloseClick();
      }
      
      private function onPressBackButton(param1:MouseEvent) : void
      {
         handleWindowCloseClick();
      }
      
      private function onPressFilterButton(param1:MouseEvent) : void
      {
         if(this.insertFilter == 0)
         {
            this.insertFilter = 1;
         }
         else
         {
            this.insertFilter = 0;
         }
         this.checkProduceCount(this._produceCount);
         this.calcFilter();
      }
      
      private function createRecyclingCards() : void
      {
         var _loc1_:Vector.<Object> = null;
         this._produceCount = 1;
         if(this.cardGroupHolderMediator == null)
         {
            this.cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.RECYCLING_PRODUCE_MODE);
            facade.registerMediator(this.cardGroupHolderMediator);
            this.content.cardGroupHolder.paginator.entriesPerPage = 1;
            this.cardGroupHolderMediator.mode = CardHolderModes.RECYCLING_PRODUCE_MODE;
         }
         if(this.materialShopData)
         {
            _loc1_ = new Vector.<Object>();
            _loc1_.push(this.materialShopData);
            this.cardGroupHolderMediator.dataProvider = _loc1_;
         }
      }
      
      override public function onRemove() : void
      {
         if(this.content)
         {
            this.content.btnRecycle.removeEventListener(MouseEvent.CLICK,this.onPressRecycleButton);
            this.content.btnBack.removeEventListener(MouseEvent.CLICK,this.onPressBackButton);
            this.content.buttonLabel.removeEventListener(MouseEvent.CLICK,this.onPressFilterButton);
            if(this.content.superFilterRarBG)
            {
               this.content.superFilterRarBG.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOverRarSymbol);
               this.content.superFilterRarBG.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOutRarSymbol);
            }
            this.filterButtonEnabled(false);
         }
         this.cardGroupHolderMediator.forceRemoveItems();
         this.cardGroupHolderMediator.onRemove();
         facade.removeMediator(this.cardGroupHolderMediator.getMediatorName());
         this.cardGroupHolderMediator = null;
         super.onRemove();
      }
      
      public function get content() : RecyclingProduceContent
      {
         return this.window.getContent(0) as RecyclingProduceContent;
      }
      
      public function get materialShopData() : MaterialShopData
      {
         if(Boolean(this._selectedSlotItem) && Boolean(this._selectedSlotItem.materialShopData))
         {
            return this._selectedSlotItem.materialShopData;
         }
         return null;
      }
      
      public function get playfieldProxy() : PlayFieldProxy
      {
         if(this._playfieldProxy == null)
         {
            this._playfieldProxy = facade.getProxy(PlayFieldProxy) as PlayFieldProxy;
         }
         return this._playfieldProxy;
      }
      
      public function get currencyProxy() : CurrencyProxy
      {
         if(this._currencyProxy == null)
         {
            this._currencyProxy = facade.getProxy(CurrencyProxy) as CurrencyProxy;
         }
         return this._currencyProxy;
      }
      
      public function get recyclingProxy() : RecyclingProxy
      {
         if(this._recyclingProxy == null)
         {
            this._recyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         }
         return this._recyclingProxy;
      }
      
      public function get resourcesProxy() : ResourcesProxy
      {
         if(this._resourcesProxy == null)
         {
            this._resourcesProxy = facade.getProxy(ResourcesProxy) as ResourcesProxy;
         }
         return this._resourcesProxy;
      }
      
      public function get insertFilter() : int
      {
         return this._insertFilter;
      }
      
      public function set insertFilter(param1:int) : void
      {
         if(this._isInit)
         {
            if(param1 == 1)
            {
               this.content.buttonLabel.label = TextResourceModule.getText("zoo.window.recycling.produce.deletefilter");
               this.filterButtonEnabled(false);
            }
            else
            {
               this.content.buttonLabel.label = TextResourceModule.getText("zoo.window.recycling.produce.insertfilter");
               this.filterButtonEnabled(true);
            }
            this._superCheckedLayer.mouseEnabled = true;
            this._superCheckedLayer.buttonMode = false;
            this._superCheckedLayer.visible = param1 == 1;
            this._insertFilter = param1;
         }
      }
      
      public function get itemConfigProxy() : ItemConfigProxy
      {
         if(this._itemConfigProxy == null)
         {
            this._itemConfigProxy = facade.getProxy(ItemConfigProxy) as ItemConfigProxy;
         }
         return this._itemConfigProxy;
      }
   }
}

