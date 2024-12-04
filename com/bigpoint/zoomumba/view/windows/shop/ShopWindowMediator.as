package com.bigpoint.zoomumba.view.windows.shop
{
   import buttons.extended.ButtonAction;
   import buttons.tabs.TabButton;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.Note;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.settings.AppConfigProxy;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.net.NetHelperProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.Settings;
   import com.bigpoint.zoorama.assets.AssetConfig;
   import com.bigpoint.zoorama.core.feature.tutorials.notices.TutorialNotices;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import com.bigpoint.zoorama.view.gui.mainmenu.MouseToolNotice;
   import components.textfield.textInput.StandardTextInput;
   import custom.card.component.CardGroupHolder;
   import custom.tabs.TabIcon;
   import flash.display.BitmapData;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import general.paginator.PaginatorEvent;
   import org.puremvc.as3.interfaces.INotification;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   import windows.core.TabsHGroup;
   import windows.custom.shop.ShopContentCardGroup;
   import windows.custom.shop.ShopWindow;
   import windows.events.WindowCustomEvent;
   
   public class ShopWindowMediator extends WindowMediator
   {
      public static const NAME:String = "ShopWindowMediator";
      
      private var shopProxy:ShopProxy;
      
      private var cardGroupHolderMediator:CardGroupHolderMediator;
      
      private var _playfieldSettingsProxy:PlayfieldSettingsProxy;
      
      private var _emptyImage:BitmapImage;
      
      private var _buttonAction:ButtonAction;
      
      public function ShopWindowMediator(param1:ShopWindow)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [SHOP.REFRESH_TAB_STARS,SHOP.REFRESH_TAB_ITEMS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case SHOP.REFRESH_TAB_STARS:
               this.refreshTabStars();
               break;
            case SHOP.REFRESH_TAB_ITEMS:
               this.refreshTabItems();
         }
      }
      
      override public function onRegister() : void
      {
         this.shopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         this._playfieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
      }
      
      override public function init(param1:Object) : void
      {
         var _loc2_:NetHelperProxy = facade.retrieveProxy(NetHelperProxy.NAME) as NetHelperProxy;
         this.addTabsIcons();
         this.window.getTabsGroup().selectedIndex = this.shopProxy.currentTab - 1;
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
         this.window.addEventListener(WindowCustomEvent.WINDOW_CONTENT_UPDATED,this.handleForceRemove);
         sendNotification(Note.CHANGE_CURSOR,MouseToolNotice.DEFAULT);
         sendNotification(GUINote.ACTIVATE_SELECT_SUBTOOL);
         this.window.header.filePath = _loc2_.getHeaderPath("header_shop");
         if(Settings.TUTORIAL_ACTIVE)
         {
            (this.window.getTabsGroup() as Group).mouseEnabled = false;
            (this.window.getTabsGroup() as Group).mouseChildren = false;
         }
      }
      
      private function handlePageChange(param1:PaginatorEvent) : void
      {
         this.shopProxy.currentPage = param1.page;
      }
      
      private function handleTabChanged(param1:WindowCustomEvent) : void
      {
         this.window.preloaderVisibility = true;
         if(this.shopProxy.currentTab != this.window.getTabsGroup().selectedIndex + 1)
         {
            this.tabContentText.text = this.searchTitleText;
            this.shopProxy.search_text = "";
         }
         this.shopProxy.currentTab = this.window.getTabsGroup().selectedIndex + 1;
         if(this.cardGroupHolderMediator)
         {
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.SHOP_WINDOW_MODE.toString());
         }
         this.cardGroupHolderMediator = new CardGroupHolderMediator(this.tabContent,CardHolderModes.SHOP_WINDOW_MODE);
         this.cardGroupHolderMediator.currentPage = this.shopProxy.currentPage;
         facade.registerMediator(this.cardGroupHolderMediator);
         this.tabContentText.addEventListener(KeyboardEvent.KEY_UP,this.setText);
         this.tabContentText.addEventListener(FocusEvent.FOCUS_IN,this.onFocusSearchField);
         this.tabContentText.addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOutSearchField);
         var _loc2_:* = this._playfieldSettingsProxy.activePlayfieldType == PlayFieldsTypes.FIELD_TYPE_OCEANWORLD_ZOO;
         if(_loc2_ && (this.shopProxy.getTabContent() == null || this.shopProxy.getTabContent().length == 0))
         {
            this.tabContentText.visible = false;
            this._emptyImage = new BitmapImage();
            this._emptyImage.x = -10;
            this._emptyImage.y = 60;
            this._emptyImage.source = AssetLibrary.getBitmapData(AssetConfig.SHOP_WINDOW,AssetConfig.SHOP_EMPTY);
            this.tabContent.addElement(this._emptyImage);
            this._buttonAction = new ButtonAction();
            this._buttonAction.currentState = "gold";
            this._buttonAction.label.text = TextResourceModule.getText("zoo.shop.tabbar.ocean.empty");
            this._buttonAction.width = 135;
            this._buttonAction.height = 40;
            this._buttonAction.y = 275;
            this._buttonAction.x = 200;
            this._buttonAction.callbackClickFunction = this.goToCity;
            this.tabContent.addElement(this._buttonAction);
         }
         else
         {
            if(Boolean(this._emptyImage) && Boolean(this._emptyImage.source))
            {
               (this._emptyImage.source as BitmapData).dispose();
               this._emptyImage = null;
            }
            this._buttonAction = null;
         }
         this.drawCards();
         if(this.shopProxy.search_text != "" && this.shopProxy.search_text != this.searchTitleText)
         {
            this.tabContentText.text = this.shopProxy.search_text;
            this.cardGroupHolderMediator.searchInCategorie(this.shopProxy.search_text,true);
         }
         else
         {
            this.tabContentText.text = this.searchTitleText;
         }
         this.window.preloaderVisibility = false;
      }
      
      private function goToCity(param1:ButtonAction) : void
      {
         sendNotification(Note.OPEN_MANAGMENT_CENTER);
      }
      
      private function onFocusOutSearchField(param1:FocusEvent) : void
      {
         if(this.tabContentText.text == "")
         {
            this.tabContentText.text = this.searchTitleText;
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
         this.shopProxy.search_text = this.tabContentText.text;
         if(this.shopProxy.search_text == this.searchTitleText)
         {
            this.shopProxy.search_text = "";
         }
         this.cardGroupHolderMediator.searchInCategorie(this.shopProxy.search_text);
      }
      
      private function handleForceRemove(param1:WindowCustomEvent) : void
      {
         if(this.cardGroupHolderMediator)
         {
            this.cardGroupHolderMediator.forceRemoveItems();
         }
      }
      
      private function updateCards() : void
      {
         var _loc1_:ShopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         _loc1_.reload = true;
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.tabMediator.mode = CardHolderModes.SHOP_WINDOW_MODE;
         this.tabMediator.dataProvider = _loc1_.getTabContent();
      }
      
      private function drawCards() : void
      {
         if(!this.cardGroupHolderMediator)
         {
            throw Error("Cards canot be shown - Card group holder is not there!");
         }
         this.tabMediator.mode = CardHolderModes.SHOP_WINDOW_MODE;
         this.tabMediator.currentPage = this.shopProxy.currentPage;
         this.tabMediator.dataProvider = this.shopProxy.getTabContent();
         if(!this.tabContent.paginator.hasEventListener(PaginatorEvent.CHANGE_PAGE))
         {
            this.tabContent.paginator.addEventListener(PaginatorEvent.CHANGE_PAGE,this.handlePageChange);
         }
      }
      
      private function refreshTabItems() : void
      {
         this.updateCards();
      }
      
      private function refreshTabStars() : void
      {
         var _loc2_:TabButton = null;
         var _loc3_:TabIcon = null;
         var _loc1_:TabsHGroup = this.window.getTabsGroup() as TabsHGroup;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numElements)
         {
            _loc3_ = new TabIcon();
            _loc2_ = _loc1_.getElementAt(_loc4_) as TabButton;
            _loc2_.stars.visible = this.shopProxy.tabsWithStars[_loc4_ + 1] != undefined;
            _loc4_++;
         }
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
            _loc3_ = new TabIcon();
            _loc2_ = _loc1_.getElementAt(_loc6_) as TabButton;
            _loc5_ = _loc6_;
            if(_loc4_)
            {
               _loc5_ += 10;
            }
            _loc3_.bitmapSource = AssetLibrary.getBitmapData(AssetConfig.SHOP_WINDOW,"Icon" + _loc5_);
            _loc2_.stars.visible = this.shopProxy.tabsWithStars[_loc6_ + 1] != undefined;
            switch(_loc6_)
            {
               case 0:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = -5;
                     _loc3_.bitmap.y = -1;
                  }
                  else
                  {
                     _loc3_.bitmap.x = 2;
                     _loc3_.bitmap.y = -14;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.animals");
                  break;
               case 1:
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
               case 2:
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
               case 3:
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
               case 4:
                  if(_loc4_)
                  {
                     _loc3_.bitmap.x = -2;
                     _loc3_.bitmap.y = -1;
                  }
                  else
                  {
                     _loc3_.bitmap.x = -1;
                     _loc3_.bitmap.y = -3;
                  }
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.resources");
                  break;
               case 5:
                  _loc3_.bitmap.x = 0;
                  _loc3_.bitmap.y = -7;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.assistants");
                  break;
               case 6:
                  _loc3_.bitmap.x = -6;
                  _loc3_.bitmap.y = -4;
                  _loc2_.toolTip = TextResourceModule.getText("zoo.shop.category.specials");
                  break;
               case 7:
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
            }
            _loc2_.contentGroup.addElement(_loc3_);
            _loc6_++;
         }
      }
      
      override public function onRemove() : void
      {
         if(this.cardGroupHolderMediator)
         {
            this.shopProxy.currentPage = this.cardGroupHolderMediator.currentPage;
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.SHOP_WINDOW_MODE.toString());
         }
      }
      
      private function get tabMediator() : CardGroupHolderMediator
      {
         return this.cardGroupHolderMediator;
      }
      
      private function get tabContent() : CardGroupHolder
      {
         return (this.window.getContent() as ShopContentCardGroup).cardGroupHolder;
      }
      
      private function get tabContentText() : StandardTextInput
      {
         return (this.window.getContent() as ShopContentCardGroup).txtsearch;
      }
      
      private function get window() : ShopWindow
      {
         return this.viewComponent as ShopWindow;
      }
      
      override public function dispose() : void
      {
         if(Boolean(this._emptyImage) && Boolean(this._emptyImage.source))
         {
            this.tabContent.removeElement(this._emptyImage);
            (this._emptyImage.source as BitmapData).dispose();
            this._emptyImage = null;
         }
         if(this._buttonAction)
         {
            this.tabContent.removeElement(this._buttonAction);
            this._buttonAction = null;
         }
         this.window.removeEventListener(WindowCustomEvent.WINDOW_CONTENT_CHANGED,this.handleTabChanged);
      }
      
      override protected function handleWindowCloseClick(param1:WindowCustomEvent = null) : void
      {
         this.sendtutorialNoteficationShopClosed();
         super.handleWindowCloseClick(param1);
      }
      
      private function sendtutorialNoteficationShopClosed() : void
      {
         if((facade.getProxy(AppConfigProxy) as AppConfigProxy).tutorial_active)
         {
            sendNotification(TutorialNotices.SHOP_WINDOW_CLOSED);
         }
      }
   }
}

