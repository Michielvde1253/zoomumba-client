package com.bigpoint.zoomumba.model.shop
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.constants.GUINote;
   import com.bigpoint.zoomumba.constants.MainConstants;
   import com.bigpoint.zoomumba.constants.PlayFieldsTypes;
   import com.bigpoint.zoomumba.constants.SHOP;
   import com.bigpoint.zoomumba.constants.items.ItemInternalTypes;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoomumba.model.shop.vo.ShopItemOrderVO;
   import com.bigpoint.zoomumba.model.shop.vo.ShopTabs;
   import com.bigpoint.zoomumba.model.user.core.UserProxy;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class ShopProxy extends Proxy
   {
      public static const NAME:String = "ShopProxy";
      
      private static const TAB_COUNT:int = 8;
      
      private var _currentTab:int = 0;
      
      private var _reload:Boolean = false;
      
      private var _currentPage:int = 0;
      
      private var lastOpenedTab:int = 1;
      
      private var _search_text:String = "";
      
      public var _tabsWithStars:Dictionary = new Dictionary();
      
      private var _tabOrderNormalVO:Vector.<Vector.<ShopItemOrderVO>>;
      
      private var _tabOrderOceanVO:Vector.<Vector.<ShopItemOrderVO>>;
      
      private var _shopTabsData:Vector.<Vector.<Object>>;
      
      private var _isOceanActive:Boolean;
      
      public function ShopProxy()
      {
         super(NAME,null);
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set currentPage(param1:int) : void
      {
         this._currentPage = param1;
      }
      
      public function set tabOrderNormalVO(param1:Vector.<Vector.<ShopItemOrderVO>>) : void
      {
         this._tabOrderNormalVO = param1;
      }
      
      public function set tabOrderOceanVO(param1:Vector.<Vector.<ShopItemOrderVO>>) : void
      {
         this._tabOrderOceanVO = param1;
      }
      
      public function set reload(param1:Boolean) : void
      {
         this._reload = param1;
      }
      
      public function get currentTab() : int
      {
         if(this._currentTab != ShopTabs.NONE)
         {
            return this._currentTab;
         }
         return ShopTabs.ANIMALS;
      }
      
      public function set currentTab(param1:int) : void
      {
         if(param1 == 0)
         {
            return;
         }
         if(this.currentTab != param1)
         {
            this.currentPage = 0;
         }
         this._currentTab = param1;
      }
      
      public function getTabContent() : Vector.<Object>
      {
         if(!this._shopTabsData || this._reload)
         {
            this.createTabData();
            this._reload = false;
         }
         return this._shopTabsData[this._currentTab];
      }
      
      public function get tabsWithStars() : Dictionary
      {
         return this._tabsWithStars;
      }
      
      public function get search_text() : String
      {
         return this._search_text;
      }
      
      public function set search_text(param1:String) : void
      {
         this._search_text = param1;
      }
      
      public function get tabOrderNormalVO() : Vector.<Vector.<ShopItemOrderVO>>
      {
         return this._tabOrderNormalVO;
      }
      
      public function get tabOrderOceanVO() : Vector.<Vector.<ShopItemOrderVO>>
      {
         return this._tabOrderOceanVO;
      }
      
      public function get isOceanActive() : Boolean
      {
         return this._isOceanActive;
      }
      
      public function set isOceanActive(param1:Boolean) : void
      {
         this._isOceanActive = param1;
      }
      
      public function init() : void
      {
         this.createTabData();
      }
      
      private function setBuildExtentions() : void
      {
         var _loc2_:ShopItemOrderVO = null;
         var _loc1_:int = 0;
         var _loc3_:int = int(this._tabOrderNormalVO[ShopTabs.SPECIALS].length);
         while(_loc1_ < _loc3_)
         {
            _loc1_++;
         }
      }
      
      private function createTabData() : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:Vector.<Vector.<ShopItemOrderVO>> = null;
         var _loc12_:int = 0;
         var _loc13_:ShopItemOrderVO = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:InheritedShopData = null;
         var _loc17_:int = 0;
         this._shopTabsData = new Vector.<Vector.<Object>>(TAB_COUNT + 1);
         var _loc1_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc2_:Vector.<InheritedShopData> = _loc1_.getAllShopItems();
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         var _loc5_:Boolean = false;
         this._tabsWithStars = new Dictionary();
         var _loc6_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc7_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc8_:int = _loc7_.activePlayfieldType;
         if(this._isOceanActive)
         {
            _loc10_ = this._tabOrderOceanVO;
         }
         else
         {
            _loc10_ = this._tabOrderNormalVO;
         }
         var _loc11_:int = 0;
         while(_loc11_ < TAB_COUNT)
         {
            _loc12_ = 0;
            _loc14_ = int(_loc10_[_loc11_].length);
            while(_loc12_ < _loc14_)
            {
               _loc15_ = 0;
               _loc17_ = int(_loc2_.length);
               while(_loc15_ < _loc17_)
               {
                  _loc16_ = _loc2_[_loc15_];
                  _loc9_ = this.allowedInThePlayField(_loc16_,_loc8_);
                  if(_loc9_)
                  {
                     _loc13_ = _loc10_[_loc11_][_loc12_];
                     _loc3_ = _loc13_.itemId;
                     _loc4_ = _loc16_.internalType != ItemInternalTypes.SPECIE ? int(_loc16_["itemId"]) : int(_loc16_["speciesId"]);
                     if(_loc3_ == _loc4_ && _loc16_.internalType == _loc13_.internalType && _loc16_.shopTab == _loc11_ + 1 && _loc16_.onlyDev == 0)
                     {
                        if(_loc16_.internalType == ItemInternalTypes.SPECIE || _loc16_.internalType == ItemInternalTypes.ANIMAL)
                        {
                           if(_loc16_.isEventItem > 0)
                           {
                              this._tabsWithStars[_loc16_.shopTab] = _loc16_.shopTab;
                              _loc5_ = true;
                           }
                        }
                        else if(_loc16_.isEventItem > 0 && _loc16_.buyable == 1)
                        {
                           this._tabsWithStars[_loc16_.shopTab] = _loc16_.shopTab;
                           _loc5_ = true;
                        }
                        if(_loc16_.internalType == ItemInternalTypes.EXPANSION)
                        {
                           _loc16_ = this.filter(_loc16_);
                        }
                        if(_loc16_.getBuyable() == 1)
                        {
                           if(!this._shopTabsData[_loc16_.shopTab])
                           {
                              this._shopTabsData[_loc16_.shopTab] = new Vector.<Object>();
                           }
                           if(_loc16_ is AnimalSpeciesVO)
                           {
                              _loc16_.translatedTextSpecies = TextIdHelper.getSetName(Categories.SPECIES,_loc16_.itemId);
                              _loc16_.cardName = TextIdHelper.getCardName(Categories.SPECIES,_loc16_.itemId);
                           }
                           else
                           {
                              _loc16_.cardName = TextIdHelper.getCardName(_loc16_.categoryId,_loc16_.itemId);
                           }
                           this._shopTabsData[_loc16_.shopTab].push(_loc16_);
                           _loc2_.splice(_loc15_,1);
                           break;
                        }
                     }
                  }
                  _loc15_++;
               }
               _loc12_++;
            }
            _loc11_++;
         }
         this.filterStorageUnits();
         _loc2_ = null;
         if(_loc5_)
         {
            sendNotification(GUINote.SHOW_SHOP_EVENT_STARS);
         }
         else
         {
            sendNotification(GUINote.HIDE_SHOP_EVENT_STARS);
         }
         sendNotification(SHOP.REFRESH_TAB_STARS);
      }
      
      private function filterStorageUnits() : void
      {
      }
      
      private function allowedInThePlayField(param1:InheritedShopData, param2:int) : Boolean
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(Boolean(param1.hasOwnProperty("playfields")) && param1["playfields"].length > 0)
         {
            _loc3_ = param1["playfields"];
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(_loc3_[_loc5_] == param2)
               {
                  return true;
               }
               _loc5_++;
            }
            return false;
         }
         return true;
      }
      
      private function filter(param1:InheritedShopData) : InheritedShopData
      {
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc3_:PlayfieldSettingsProxy = facade.getProxy(PlayfieldSettingsProxy);
         var _loc4_:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
         var _loc5_:int = _loc3_.activePlayfieldType;
         switch(param1.itemId)
         {
            case MainConstants.PREMIUM_ID_FOURTHZOO_EXPANSION:
            case MainConstants.PREMIUM_ID_FOURTHZOO_FULL_EXPANSION:
               if(_loc5_ == PlayFieldsTypes.FIELD_TYPE_RIVER_ZOO && _loc4_.fieldSize < MainConstants.MAX_FIELD_SIZE)
               {
                  param1.buyable = 1;
               }
               else
               {
                  param1.buyable = 0;
               }
               break;
            case MainConstants.PREMIUM_ID_COASTZOO_EXPANSION:
            case MainConstants.PREMIUM_ID_COASTZOO_FULL_EXPANSION:
               if(_loc5_ == PlayFieldsTypes.FIELD_TYPE_COAST_ZOO && _loc4_.fieldSize < MainConstants.MAX_FIELD_SIZE)
               {
                  param1.buyable = 1;
               }
               else
               {
                  param1.buyable = 0;
               }
               break;
            case MainConstants.PREMIUM_ID_FZOO_EXPANSION:
            case MainConstants.PREMIUM_ID_FZOO_FULL_EXPANSION:
               if(_loc5_ == PlayFieldsTypes.FIELD_TYPE_FORGOTTEN_ZOO && _loc4_.fieldSize < MainConstants.MAX_FIELD_SIZE)
               {
                  param1.buyable = 1;
               }
               else
               {
                  param1.buyable = 0;
               }
               break;
            case MainConstants.PREMIUM_ID_MZOO_EXPANSION:
            case MainConstants.PREMIUM_ID_MZOO_FULL_EXPANSION:
               if(_loc5_ == PlayFieldsTypes.FIELD_TYPE_NEW_ZOO && _loc4_.fieldSize < MainConstants.MAX_FIELD_SIZE)
               {
                  param1.buyable = 1;
               }
               else
               {
                  param1.buyable = 0;
               }
               break;
            case MainConstants.PREMIUM_ID_ZOO_EXPANSION:
            case MainConstants.PREMIUM_ID_ZOO_MAX_EXPANSION:
               if(_loc5_ == PlayFieldsTypes.FIELD_TYPE_MAIN_ZOO && _loc4_.fieldSize < MainConstants.MAX_FIELD_SIZE)
               {
                  param1.buyable = 1;
               }
               else
               {
                  param1.buyable = 0;
               }
         }
         return param1;
      }
   }
}

