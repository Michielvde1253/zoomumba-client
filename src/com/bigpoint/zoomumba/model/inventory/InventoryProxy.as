package com.bigpoint.zoomumba.model.inventory
{
   import com.bigpoint.zoomumba.constants.CARDS;
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.app.gameEvents.GlobalEventProxy;
   import com.bigpoint.zoomumba.model.features.babyCaravan.BabyCaravanProxy;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.gameConfig.vo.AnimalSpeciesVO;
   import com.bigpoint.zoomumba.model.inventory.vo.InventoryTabs;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayfieldSettingsProxy;
   import com.bigpoint.zoorama.data.settings.AnimalShopData;
   import com.bigpoint.zoorama.data.settings.CageShopData;
   import com.bigpoint.zoorama.data.settings.InheritedShopData;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import flash.utils.Dictionary;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class InventoryProxy extends Proxy
   {
      public static const NAME:String = "InventoryProxy";
      
      private static const TAB_COUNT:int = 5;
      
      private var _currentTab:int = 0;
      
      private var _currentPage:int = 0;
      
      private var _search_text:String = "";
      
      private var _inventoryTabs:Vector.<Vector.<Object>>;
      
      private var _reload:Boolean = false;
      
      private var eventProxy:GlobalEventProxy;
      
      private var _playFieldSettingsProxy:PlayfieldSettingsProxy;
      
      public function InventoryProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this._playFieldSettingsProxy = facade.retrieveProxy(PlayfieldSettingsProxy.NAME) as PlayfieldSettingsProxy;
      }
      
      public function get currentPage() : int
      {
         return this._currentPage;
      }
      
      public function set currentPage(param1:int) : void
      {
         this._currentPage = param1;
      }
      
      public function get reload() : Boolean
      {
         return this._reload;
      }
      
      public function set reload(param1:Boolean) : void
      {
         this._reload = param1;
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
      
      public function get currentTab() : int
      {
         if(this._currentTab != InventoryTabs.NONE)
         {
            return this._currentTab;
         }
         return InventoryTabs.ANIMALS;
      }
      
      public function get search_text() : String
      {
         return this._search_text;
      }
      
      public function set search_text(param1:String) : void
      {
         this._search_text = param1;
      }
      
      public function getTabContent() : Vector.<Object>
      {
         if(!this._inventoryTabs || this._reload)
         {
            this.createTabData();
            this._reload = false;
         }
         return this._inventoryTabs[this._currentTab];
      }
      
      public function getTabContentByTab(param1:int) : Vector.<Object>
      {
         if(!this._inventoryTabs || this._reload)
         {
            this.createTabData();
            this._reload = false;
         }
         return this._inventoryTabs[param1];
      }
      
      public function createTabData() : void
      {
         var _loc3_:Vector.<Object> = null;
         var _loc4_:Object = null;
         var _loc5_:InheritedShopData = null;
         this._inventoryTabs = new Vector.<Vector.<Object>>(TAB_COUNT + 1);
         var _loc1_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc2_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         this.normalGroup(_loc1_.getDecoWithConfigList(),InventoryTabs.DECORATIONS);
         this.normalGroup(_loc1_.getShopsWithConfigList(),InventoryTabs.SHOPS);
         this.cagesGroup(_loc1_.getCageWithConfigList(),InventoryTabs.CAGES);
         this.animalGroup(_loc1_.getAnimalWithConfigList(),InventoryTabs.ANIMALS);
         this.normalGroup(_loc1_.getSpecialWithConfigList(),InventoryTabs.SPECIALS);
         this.roadGroup(_loc1_.getRoadsWithConfigList(),InventoryTabs.ROADS);
         this.materialGroup(_loc1_.getMaterialsWithConfigList(),InventoryTabs.MATERIALS);
         for each(_loc3_ in this._inventoryTabs)
         {
            if(_loc3_ != null)
            {
               for each(_loc4_ in _loc3_)
               {
                  for each(_loc5_ in _loc4_)
                  {
                     if(_loc5_ is AnimalSpeciesVO || _loc5_ is AnimalShopData)
                     {
                        _loc5_.translatedTextSpecies = TextIdHelper.getSetName(Categories.SPECIES,(_loc5_ as AnimalShopData).speciesId);
                        _loc5_.cardName = TextIdHelper.getCardName(Categories.SPECIES,(_loc5_ as AnimalShopData).speciesId);
                     }
                     else
                     {
                        _loc5_.cardName = TextIdHelper.getCardName(_loc5_.categoryId,_loc5_.itemId);
                     }
                  }
               }
            }
         }
      }
      
      public function getItemCountById(param1:int, param2:int) : int
      {
         var _loc4_:int = 0;
         var _loc3_:Vector.<Object> = this.getTabContentByTab(param2);
         if(_loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if(ShopItemData(_loc3_[_loc4_]["0"]).itemId == param1)
               {
                  return this.objectCount(_loc3_[_loc4_]);
               }
               _loc4_++;
            }
         }
         return 0;
      }
      
      public function getAnimalCountById(param1:int) : int
      {
         var _loc2_:Vector.<Object> = this.getTabContentByTab(InventoryTabs.ANIMALS);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(AnimalShopData(_loc2_[_loc3_]["0"]).animalId == param1)
            {
               return this.objectCount(_loc2_[_loc3_]);
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function getAnimalUid(param1:int) : int
      {
         var _loc2_:Vector.<Object> = this.getTabContentByTab(InventoryTabs.ANIMALS);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(AnimalShopData(_loc2_[_loc3_]["0"]).animalId == param1)
            {
               return AnimalShopData(_loc2_[_loc3_]["0"]).uniqueId;
            }
            _loc3_++;
         }
         return 0;
      }
      
      public function getAnimalsUIDs(param1:int, param2:uint = 1) : Array
      {
         var _loc3_:Array = [];
         var _loc4_:Vector.<Object> = this.getTabContentByTab(InventoryTabs.ANIMALS);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(AnimalShopData(_loc4_[_loc5_][0]).animalId == param1)
            {
               while(_loc3_.length < param2)
               {
                  _loc3_.push(AnimalShopData(_loc4_[_loc5_][_loc3_.length]).uniqueId);
               }
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      private function objectCount(param1:Object) : int
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         for(_loc3_ in param1)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      private function roadGroup(param1:Vector.<ShopItemData>, param2:int) : void
      {
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         param1 = param1.sort(this.sortByItemId);
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:int = this._playFieldSettingsProxy.activePlayfieldType;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            if(this.allowedInThePlayField(param1[_loc6_],_loc4_))
            {
               _loc9_ = _loc5_[String(param1[_loc6_].itemId + " - " + param1[_loc6_].internalType)];
               if(!_loc9_)
               {
                  _loc5_[String(param1[_loc6_].itemId + " - " + param1[_loc6_].internalType)] = _loc9_ = [];
               }
               _loc9_.push(param1[_loc6_]);
            }
            _loc6_++;
         }
         var _loc7_:Vector.<Object> = new Vector.<Object>();
         for each(_loc8_ in _loc5_)
         {
            _loc7_.push(Object(_loc8_));
         }
         this._inventoryTabs[param2] = _loc7_;
      }
      
      private function materialGroup(param1:Vector.<ShopItemData>, param2:int) : void
      {
         var _loc5_:Array = null;
         var _loc7_:ShopItemData = null;
         param1 = param1.sort(this.sortingIdFunction);
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:int = this._playFieldSettingsProxy.activePlayfieldType;
         var _loc6_:Vector.<Object> = new Vector.<Object>();
         for each(_loc7_ in param1)
         {
            if(this.allowedInThePlayField(_loc7_,_loc4_))
            {
               _loc5_ = new Array();
               _loc5_.push(_loc7_);
               _loc6_.push(Object(_loc5_));
            }
         }
         this._inventoryTabs[param2] = _loc6_;
      }
      
      private function sortingIdFunction(param1:MaterialShopData, param2:MaterialShopData) : Number
      {
         if(param1.itemId.valueOf() < param2.itemId.valueOf())
         {
            return -1;
         }
         if(param1.itemId.valueOf() > param2.itemId.valueOf())
         {
            return 1;
         }
         return 0;
      }
      
      private function normalGroup(param1:Vector.<ShopItemData>, param2:int) : void
      {
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc3_:Vector.<Object> = new Vector.<Object>();
         if(param1 == null)
         {
            this._inventoryTabs[param2] = _loc3_;
            return;
         }
         param1 = param1.sort(this.sortByItemId);
         var _loc4_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc5_:int = this._playFieldSettingsProxy.activePlayfieldType;
         var _loc6_:Dictionary = new Dictionary();
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            if(this.allowedInThePlayField(param1[_loc7_],_loc5_))
            {
               _loc9_ = _loc6_[String(param1[_loc7_].itemId)];
               if(!_loc9_)
               {
                  _loc6_[String(param1[_loc7_].itemId)] = _loc9_ = [];
               }
               _loc9_.push(param1[_loc7_]);
            }
            _loc7_++;
         }
         for each(_loc8_ in _loc6_)
         {
            _loc3_.push(Object(_loc8_));
         }
         this._inventoryTabs[param2] = _loc3_;
      }
      
      private function allowedInThePlayField(param1:InheritedShopData, param2:int) : Boolean
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._playFieldSettingsProxy.managmentCenterActive)
         {
            return true;
         }
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
      
      private function sortByItemId(param1:ShopItemData, param2:ShopItemData) : int
      {
         return 0;
      }
      
      private function animalGroup(param1:Vector.<ShopItemData>, param2:int) : void
      {
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         this.eventProxy = facade.retrieveProxy(GlobalEventProxy.NAME) as GlobalEventProxy;
         var _loc3_:BabyCaravanProxy = facade.retrieveProxy(BabyCaravanProxy.NAME) as BabyCaravanProxy;
         var _loc4_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc5_:int = this._playFieldSettingsProxy.activePlayfieldType;
         var _loc6_:Dictionary = new Dictionary();
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            if(this.allowedInThePlayField(param1[_loc7_],_loc5_))
            {
               _loc11_ = _loc6_[String(param1[_loc7_].itemId)];
               if(!_loc11_)
               {
                  _loc6_[String(param1[_loc7_].itemId)] = _loc11_ = [];
               }
               _loc11_.push(param1[_loc7_]);
            }
            _loc7_++;
         }
         var _loc8_:Vector.<Object> = new Vector.<Object>();
         var _loc9_:Array = new Array();
         for each(_loc10_ in _loc6_)
         {
            if(_loc10_.length > 0 && _loc3_.isBorrowedById(AnimalShopData(_loc10_[0]).speciesId))
            {
               _loc12_ = 0;
               while(_loc12_ < _loc10_.length)
               {
                  if(_loc3_.isBorrowedByUniqueId(InheritedShopData(_loc10_[_loc12_]).uniqueId))
                  {
                     InheritedShopData(_loc10_[_loc12_]).bG = CARDS.CARD_BACKGROUND_STYLE_GREEN;
                     InheritedShopData(_loc10_[_loc12_]).sellable = 0;
                     _loc9_.push(_loc10_[_loc12_]);
                     _loc10_.splice(_loc12_,1);
                  }
                  _loc12_++;
               }
               if(_loc10_.length > 0)
               {
                  _loc8_.push(Object(_loc10_));
               }
            }
            else
            {
               _loc8_.push(Object(_loc10_));
            }
         }
         _loc8_.sort(this.sortAnimal);
         if(_loc9_.length > 0)
         {
            _loc13_ = 0;
            while(_loc13_ < _loc9_.length)
            {
               _loc8_.unshift(new Array(_loc9_[_loc13_]));
               _loc13_++;
            }
         }
         this._inventoryTabs[param2] = _loc8_;
      }
      
      private function sortAnimal(param1:Array, param2:Array) : int
      {
         if(param1.length == 0 || param2.length == 0)
         {
            return 0;
         }
         if(AnimalShopData(param1[0]).animalId < AnimalShopData(param2[0]).animalId)
         {
            return -1;
         }
         if(AnimalShopData(param1[0]).animalId == AnimalShopData(param2[0]).animalId)
         {
            return 0;
         }
         if(AnimalShopData(param1[0]).animalId > AnimalShopData(param2[0]).animalId)
         {
            return 1;
         }
         return 0;
      }
      
      private function cagesGroup(param1:Vector.<ShopItemData>, param2:int) : void
      {
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc3_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc4_:int = this._playFieldSettingsProxy.activePlayfieldType;
         param1 = param1.sort(this.sortByItemId);
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:int = 0;
         while(_loc6_ < param1.length)
         {
            if(this.allowedInThePlayField(param1[_loc6_],_loc4_))
            {
               _loc9_ = _loc5_[String(param1[_loc6_].itemId + "-" + CageShopData(param1[_loc6_]).level)];
               if(!_loc9_)
               {
                  _loc9_ = [];
                  _loc5_[String(String(param1[_loc6_].itemId + "-" + CageShopData(param1[_loc6_]).level))] = _loc9_;
               }
               _loc9_.push(param1[_loc6_]);
            }
            _loc6_++;
         }
         var _loc7_:Vector.<Object> = new Vector.<Object>();
         for each(_loc8_ in _loc5_)
         {
            _loc7_.push(Object(_loc8_));
         }
         this._inventoryTabs[param2] = _loc7_;
      }
      
      private function getTabData(param1:int) : Vector.<Object>
      {
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         return new Vector.<Object>();
      }
   }
}

