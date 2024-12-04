package com.bigpoint.zoomumba.view.windows.inventory
{
   import buttons.tabs.TabButton;
   import com.bigpoint.zoomumba.constants.InventoryConstants;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import components.textfield.textInput.StandardTextInput;
   import custom.card.component.CardGroupHolder;
   import custom.tabs.TabIcon;
   import flash.display.BitmapData;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import org.puremvc.as3.interfaces.INotification;
   import spark.primitives.BitmapImage;
   import windows.core.TabsHGroup;
   import windows.custom.inventoryWindow.InventoryContentCardGroup;
   import windows.custom.inventoryWindow.InventoryWindow;
   import windows.events.WindowCustomEvent;
   
   public class InventoryWindowMediator extends WindowMediator
   {
      public static const NAME:String = "InventoryWindowMediator";
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var inventoryProxy:InventoryProxy;
      
      private var emptyImage:BitmapImage;
      
      private var _playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function InventoryWindowMediator(param1:InventoryWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Note.FORCE_RELOAD_INVENTORY];
      }
      
      override public function onRegister() : void
      {
         this.inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         this._playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case Note.FORCE_RELOAD_INVENTORY:
               this.handleTabChanged(null);
         }
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.addTabsIcons();
         this.window.getTabsGroup().selectedIndex = this.inventoryProxy.currentTab - 1;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_UPDATED,this.handleForceRemove);
         this.window.header.filePath = _loc2_.getHeaderPath("header_inventory");
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.window.preloaderVisibility = false;
         if(this.inventoryProxy.currentTab != this.window.getTabsGroup().selectedIndex + 1)
         {
            this.tabContentText.text = this.searchTitleText;
            this.inventoryProxy.search_text = "";
         }
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.INVENTORY_WINDOW_MODE.toString());
            this.cardGroupHolderMediator = null;
         }
         this.inventoryProxy.currentTab = this.window.getTabsGroup().selectedIndex + 1;
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.tabContent,CardHolderModes.INVENTORY_WINDOW_MODE);
         if(this.cardGroupHolderMediator == null)
         {
            return;
         }
         this.cardGroupHolderMediator.currentPage = this.inventoryProxy.currentPage;
         facade.registerMediator(this.cardGroupHolderMediator);
         this.drawCards();
         this.tabContentText.visible = true;
         this.tabContentText.addEventListener(KeyboardEvent.KEY_UP,this.setText);
         this.tabContentText.addEventListener(FocusEvent.FOCUS_IN,this.onFocusSearchField,false,0,true);
         this.tabContentText.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchField,false,0,true);
         if(this.inventoryProxy.getTabContent().length == 0)
         {
            this.tabContentText.visible = false;
            this.emptyImage = new BitmapImage();
            this.emptyImage.x = -30;
            this.emptyImage.y = 60;
            this.emptyImage.source = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,AssetConfig.INVENTORY_EMPTY);
            this.tabContent.addElement(this.emptyImage);
         }
         if(this.inventoryProxy.search_text != "" && this.inventoryProxy.search_text != this.searchTitleText)
         {
            this.tabContentText.text = this.inventoryProxy.search_text;
            this.cardGroupHolderMediator.searchInCategorie(this.inventoryProxy.search_text,true);
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
         this.inventoryProxy.search_text = this.tabContentText.text;
         if(this.inventoryProxy.search_text == this.searchTitleText)
         {
            this.inventoryProxy.search_text = "";
         }
         this.cardGroupHolderMediator.searchInCategorie(this.inventoryProxy.search_text);
      }
      
      private function handleForceRemove(param1:WindowCustomEvent) : void
      {
         if(this.cardGroupHolderMediator)
         {
            this.inventoryProxy.currentPage = this.cardGroupHolderMediator.currentPage;
            this.cardGroupHolderMediator.forceRemoveItems();
         }
      }
      
      private function drawCards() : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.tabMediator.mode = CardHolderModes.INVENTORY_WINDOW_MODE;
         this.tabMediator.dataProvider = this.inventoryProxy.getTabContent();
      }
      
      private function addTabsIcons() : void
      {
         var _loc2_:TabButton = null;
         var _loc3_:TabIcon = null;
         var _loc5_:int = 0;
         var _loc1_:TabsHGroup = this.window.getTabsGroup() as TabsHGroup;
         var _loc4_:* = this._playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO;
         var _loc6_:int = 0;
         while(_loc6_ < _loc1_.numElements)
         {
            _loc5_ = _loc6_;
            if(_loc4_)
            {
               _loc5_ += 10;
            }
            _loc3_ = new TabIcon();
            _loc2_ = _loc1_.getElementAt(_loc6_) as TabButton;
            _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.INVENTORY_ASSET_FILE,"Icon" + _loc5_);
            switch(_loc6_)
            {
               case InventoryConstants.WINDOW_TAB_ANIMAL:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = -5;
                     _loc3_.bitmap.y = -1;
                  }
                  else
                  {
                     _loc3_.bitmap.x = 1;
                     _loc3_.bitmap.y = -14;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.animals");
                  break;
               case InventoryConstants.WINDOW_TAB_CAGE:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = 0;
                     _loc3_.bitmap.y = -9;
                  }
                  else
                  {
                     _loc3_.bitmap.x = -1;
                     _loc3_.bitmap.y = -9;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.cages");
                  break;
               case InventoryConstants.WINDOW_TAB_STORE:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = 0;
                     _loc3_.bitmap.y = -8;
                  }
                  else
                  {
                     _loc3_.bitmap.x = 0;
                     _loc3_.bitmap.y = -6;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.stores");
                  break;
               case InventoryConstants.WINDOW_TAB_DECO:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = -2;
                     _loc3_.bitmap.y = -3;
                  }
                  else
                  {
                     _loc3_.bitmap.x = 4;
                     _loc3_.bitmap.y = -5;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.deco");
                  break;
               case InventoryConstants.WINDOW_TAB_SPECIAL:
                  _loc3_.bitmap.x = -6;
                  _loc3_.bitmap.y = -5;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.specials");
                  break;
               case InventoryConstants.WINDOW_TAB_ROAD:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = -1;
                     _loc3_.bitmap.y = 2;
                  }
                  else
                  {
                     _loc3_.bitmap.x = 5;
                     _loc3_.bitmap.y = -1;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.roads");
                  break;
               case InventoryConstants.WINDOW_TAB_MATERIAL:
                  _loc3_.bitmap.x = -1;
                  _loc3_.bitmap.y = -1;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.material");
                  break;
            }
            _loc2_.contentGroup.addElement(_loc3_);
            _loc6_++;
         }
      }
      
      private function get window() : InventoryWindow
      {
         return this.viewComponent as InventoryWindow;
      }
      
      private function get tabMediator() : CardGroupHolderMediator
      {
         return this.cardGroupHolderMediator;
      }
      
      private function get tabContent() : CardGroupHolder
      {
         return (this.window.getContent() as InventoryContentCardGroup).cardGroupHolder;
      }
      
      private function get tabContentText() : StandardTextInput
      {
         if(this.window.getContent())
         {
            return (this.window.getContent() as InventoryContentCardGroup).txtsearch;
         }
         return null;
      }
      
      override public function dispose() : void
      {
         if(Boolean(this.emptyImage) && Boolean(this.emptyImage.source))
         {
            (this.emptyImage.source as BitmapData).dispose();
         }
         if(this.cardGroupHolderMediator)
         {
            this.inventoryProxy.currentPage = this.cardGroupHolderMediator.currentPage;
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

