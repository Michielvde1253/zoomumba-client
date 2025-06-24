package com.bigpoint.zoomumba.view.windows.crafting
{
   import buttons.tabs.TabButton;
   import com.bigpoint.zoomumba.constants.CraftingConstants;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.InventoryConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.WinNote;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.crafting.CraftingChooseProxy;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.windowSystem.WindowTypes;
   import com.bigpoint.zoomumba.model.windowSystem.vo.WindowVars;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import components.textfield.textInput.StandardTextInput;
   import custom.card.component.CardGroupHolder;
   import custom.tabs.TabIcon;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import org.puremvc.as3.interfaces.INotification;
   import spark.primitives.BitmapImage;
   import windows.core.TabsHGroup;
   import windows.custom.crafting.ChooseCraftingWindow;
   import windows.custom.crafting.CraftingContentCardGroup;
   import windows.events.WindowCustomEvent;
   
   public class ChooseCraftingMediator extends WindowMediator
   {
      public static const NAME:String = "ChooseCraftingMediator";
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _craftingChooseProxy:CraftingChooseProxy;
      
      private var emptyImage:BitmapImage;
      
      public function ChooseCraftingMediator(param1:ChooseCraftingWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.FORCE_RELOAD_INVENTORY,GUINote.CRAFTING_CHOOSE_PRODUCE_ITEM,GUINote.RECYCLING_CHOOSE_MATERIAL_CLOSE];
      }
      
      override public function onRegister() : void
      {
         var _loc1_:InventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         _loc1_.createTabData();
         super.onRegister();
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.FORCE_RELOAD_INVENTORY:
               this.handleTabChanged(null);
               break;
            case GUINote.CRAFTING_CHOOSE_PRODUCE_ITEM:
               this.openProduceWindow(param1.getBody() as ShopItemData);
               break;
            case GUINote.RECYCLING_CHOOSE_MATERIAL_CLOSE:
               handleWindowCloseClick();
         }
      }
      
      private function openProduceWindow(param1:ShopItemData) : void
      {
         sendNotification(WinNote.OPEN_WINDOW,new WindowVars(WindowTypes.CRAFTING_PRODUCE_WINDOW,"",param1));
      }
      
      override public function init(param1:Object) : void
      {
         this.craftingChooseProxy.reload = true;
         this.window.preloaderVisibility = true;
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         var _loc3_:int = int(param1);
         this.addTabsIcons();
         this.craftingChooseProxy.currentTab = _loc3_ + 1;
         this.window.getTabsGroup().selectedIndex = this.craftingChooseProxy.currentTab - 1;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_UPDATED,this.handleForceRemove);
         AssetLibrary.sendAssetToFunction("CraftingWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         var _loc2_:Sprite = param1.getEmbededSprite("header_icon");
         initDynamicTitle(TextResourceModule.getText("zoo.window.crafting.intro.title"),_loc2_);
         this.window.preloaderVisibility = false;
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.window.preloaderVisibility = false;
         if(this.craftingChooseProxy.currentTab != this.window.getTabsGroup().selectedIndex + 1)
         {
            this.tabContentText.text = this.searchTitleText;
            this.craftingChooseProxy.search_text = "";
         }
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.CRAFTING_CHOOSE_MODE.toString());
            this.cardGroupHolderMediator = null;
         }
         this.craftingChooseProxy.currentTab = this.window.getTabsGroup().selectedIndex + 1;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.tabContent,CardHolderModes.CRAFTING_CHOOSE_MODE);
         if(this.cardGroupHolderMediator == null)
         {
            return;
         }
         this.cardGroupHolderMediator.currentPage = this.craftingChooseProxy.currentPage;
         facade.registerMediator(this.cardGroupHolderMediator);
         this.drawCards();
         this.tabContentText.visible = true;
         this.tabContentText.addEventListener(KeyboardEvent.KEY_UP,this.setText);
         this.tabContentText.addEventListener(FocusEvent.FOCUS_IN,this.onFocusSearchField,false,0,true);
         this.tabContentText.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchField,false,0,true);
         if(this.craftingChooseProxy.getTabContent().length == 0)
         {
            this.tabContentText.visible = false;
            this.emptyImage = new BitmapImage();
            this.emptyImage.x = -30;
            this.emptyImage.y = 60;
            this.emptyImage.source = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,AssetConfig.INVENTORY_EMPTY);
            this.tabContent.addElement(this.emptyImage);
         }
         if(this.craftingChooseProxy.search_text != "" && this.craftingChooseProxy.search_text != this.searchTitleText)
         {
            this.tabContentText.text = this.craftingChooseProxy.search_text;
            this.cardGroupHolderMediator.searchInCategorie(this.craftingChooseProxy.search_text,true);
         }
         else
         {
            this.tabContentText.text = this.searchTitleText;
         }
      }
      
      private function onFocusOutSearchField(param1:FocusEvent) : void
      {
         if(this.tabContentText)
         {
            if(this.tabContentText.text == "")
            {
               this.tabContentText.text = this.searchTitleText;
            }
         }
      }
      
      private function onFocusSearchField(param1:FocusEvent) : void
      {
         if(this.tabContentText.text == this.searchTitleText)
         {
            this.tabContentText.text = "";
         }
      }
      
      private function get searchTitleText() : String
      {
         return TextResourceModule.getText("zoo.shop.search");
      }
      
      private function setText(param1:KeyboardEvent) : void
      {
         this.craftingChooseProxy.search_text = this.tabContentText.text;
         if(this.craftingChooseProxy.search_text == this.searchTitleText)
         {
            this.craftingChooseProxy.search_text = "";
         }
         this.cardGroupHolderMediator.searchInCategorie(this.craftingChooseProxy.search_text);
      }
      
      private function handleForceRemove(param1:WindowCustomEvent) : void
      {
         if(this.cardGroupHolderMediator)
         {
            this.craftingChooseProxy.currentPage = this.cardGroupHolderMediator.currentPage;
            this.cardGroupHolderMediator.forceRemoveItems();
         }
      }
      
      private function drawCards() : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.tabMediator.mode = CardHolderModes.CRAFTING_CHOOSE_MODE;
         this.tabMediator.dataProvider = this.craftingChooseProxy.getTabContent();
      }
      
      private function addTabsIcons() : void
      {
         var _loc2_:TabButton = null;
         var _loc3_:TabIcon = null;
         var _loc1_:TabsHGroup = this.window.getTabsGroup() as TabsHGroup;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numElements)
         {
            _loc3_ = new TabIcon();
            _loc2_ = _loc1_.getElementAt(_loc4_) as TabButton;
            switch(_loc4_)
            {
               case CraftingConstants.CRAFTING_TAB_HABITAT:
                  _loc3_.bitmap.x = -1;
                  _loc3_.bitmap.y = -9;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.cages");
                  _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,"Icon" + InventoryConstants.WINDOW_TAB_CAGE);
                  break;
               case CraftingConstants.CRAFTING_TAB_STORES:
                  _loc3_.bitmap.x = 0;
                  _loc3_.bitmap.y = -6;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.stores");
                  _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,"Icon" + InventoryConstants.WINDOW_TAB_STORE);
                  break;
               case CraftingConstants.CRAFTING_TAB_DECO:
                  _loc3_.bitmap.x = 4;
                  _loc3_.bitmap.y = -5;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.deco");
                  _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,"Icon" + InventoryConstants.WINDOW_TAB_DECO);
                  break;
               case CraftingConstants.CRAFTING_TAB_ROADS:
                  _loc3_.bitmap.x = 5;
                  _loc3_.bitmap.y = -1;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.roads");
                  _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,"Icon" + InventoryConstants.WINDOW_TAB_ROAD);
                  break;
            }
            _loc2_.contentGroup.addElement(_loc3_);
            _loc4_++;
         }
      }
      
      private function get window() : ChooseCraftingWindow
      {
         return this.viewComponent as ChooseCraftingWindow;
      }
      
      private function get tabMediator() : CardGroupHolderMediator
      {
         return this.cardGroupHolderMediator;
      }
      
      private function get tabContent() : CardGroupHolder
      {
         return (this.window.getContent() as CraftingContentCardGroup).cardGroupHolder;
      }
      
      private function get tabContentText() : StandardTextInput
      {
         if(this.window.getContent())
         {
            return (this.window.getContent() as CraftingContentCardGroup).txtsearch;
         }
         return null;
      }
      
      public function get craftingChooseProxy() : CraftingChooseProxy
      {
         if(this._craftingChooseProxy == null)
         {
            this._craftingChooseProxy = facade.retrieveProxy(CraftingChooseProxy.NAME) as CraftingChooseProxy;
         }
         return this._craftingChooseProxy;
      }
      
      override public function dispose() : void
      {
         if(Boolean(this.emptyImage) && Boolean(this.emptyImage.source))
         {
            (this.emptyImage.source as BitmapData).dispose();
         }
         if(this.cardGroupHolderMediator)
         {
            this.craftingChooseProxy.currentPage = this.cardGroupHolderMediator.currentPage;
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.FRIENDS_WINDOW_MODE.toString());
         }
         if(this.tabContentText)
         {
            this.tabContentText.removeEventListener(FocusEvent.FOCUS_IN,this.onFocusSearchField);
            this.tabContentText.removeEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchField);
            this.tabContentText.removeEventListener(KeyboardEvent.KEY_UP,this.setText);
         }
      }
   }
}

