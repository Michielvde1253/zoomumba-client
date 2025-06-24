package com.bigpoint.zoomumba.model.features.crafting
{
   import com.bigpoint.zoomumba.constants.Categories;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingChooseTabs;
   import com.bigpoint.zoomumba.model.features.crafting.vo.CraftingItemOrderIdsVo;
   import com.bigpoint.zoomumba.model.gameConfig.ItemConfigProxy;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.shop.ShopProxy;
   import com.bigpoint.zoorama.data.settings.ShopItemData;
   import com.bigpoint.zoorama.utils.configModules.TextIdHelper;
   import org.puremvc.as3.patterns.proxy.Proxy;
   
   public class CraftingChooseProxy extends Proxy
   {
      private static const TAB_COUNT:int = 4;
      
      public static const NAME:String = "CraftingChooseProxy";
      
      private var _currentTab:int = 0;
      
      private var _currentPage:int = 0;
      
      private var _search_text:String = "";
      
      private var _reload:Boolean = false;
      
      private var _craftingProxy:CraftingProxy;
      
      private var _shopProxy:ShopProxy;
      
      private var _craftingTabs:Vector.<Vector.<Object>>;
      
      public function CraftingChooseProxy()
      {
         super(NAME,null);
      }
      
      public function getTabContent() : Vector.<Object>
      {
         if(!this._craftingTabs || this._reload)
         {
            this.createTabData();
            this._reload = false;
         }
         return this._craftingTabs[this._currentTab];
      }
      
      public function createTabData() : void
      {
         var _loc9_:int = 0;
         var _loc10_:CraftingItemOrderIdsVo = null;
         var _loc11_:int = 0;
         this._craftingTabs = new Vector.<Vector.<Object>>(TAB_COUNT + 1);
         var _loc1_:int = 0;
         while(_loc1_ < this._craftingTabs.length)
         {
            this._craftingTabs[_loc1_] = new Vector.<Object>();
            _loc1_++;
         }
         var _loc2_:PlayFieldProxy = facade.retrieveProxy(PlayFieldProxy.NAME) as PlayFieldProxy;
         var _loc3_:ItemConfigProxy = facade.retrieveProxy(ItemConfigProxy.NAME) as ItemConfigProxy;
         var _loc4_:Vector.<ShopItemData> = new Vector.<ShopItemData>();
         var _loc5_:Vector.<int> = new Vector.<int>();
         var _loc6_:Vector.<int> = new Vector.<int>();
         var _loc7_:Vector.<int> = new Vector.<int>();
         _loc5_ = this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.DECOR);
         _loc4_ = _loc4_.concat(_loc2_.getDecoWithConfigListByIds(_loc5_));
         _loc5_ = this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.STORE);
         _loc4_ = _loc4_.concat(_loc2_.getShopsWithConfigListByIds(_loc5_));
         _loc5_ = this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.CAGE);
         _loc4_ = _loc4_.concat(_loc2_.getCageWithConfigListByIds(_loc5_));
         _loc6_ = this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.ROAD);
         _loc7_ = this.craftingProxy.getUserBlueprintRewardIdsByCategorie(Categories.TRASHBIN);
         _loc4_ = _loc4_.concat(_loc2_.getRoadsWithConfigListByIds(_loc6_,_loc7_));
         var _loc8_:Vector.<CraftingItemOrderIdsVo> = this.craftingProxy.getUserBlueprintOrderIdVec();
         for each(_loc10_ in _loc8_)
         {
            if(_loc10_.categorieId == Categories.TRASHBIN)
            {
               _loc10_.shopOrder = CraftingChooseTabs.ROADS;
            }
            else
            {
               _loc10_.shopOrder = _loc10_.categorieId;
            }
            _loc9_ = int(_loc4_.length);
            _loc11_ = 0;
            while(_loc11_ < _loc9_)
            {
               if(_loc4_[_loc11_].itemId == _loc10_.itemId && _loc4_[_loc11_].categoryId == _loc10_.categorieId)
               {
                  _loc4_[_loc11_].localizedName = TextIdHelper.getCardName(_loc4_[_loc11_].categoryId,_loc4_[_loc11_].itemId);
                  _loc4_[_loc11_].cardName = _loc4_[_loc11_].localizedName;
                  if(_loc10_.shopOrder == Categories.ROAD)
                  {
                     this._craftingTabs[Categories.TRASHBIN].push(_loc4_[_loc11_] as Object);
                  }
                  else
                  {
                     this._craftingTabs[_loc10_.shopOrder].push(_loc4_[_loc11_] as Object);
                  }
                  _loc4_.splice(_loc11_,1);
                  break;
               }
               _loc11_++;
            }
         }
      }
      
      public function set currentTab(param1:int) : void
      {
         this._currentTab = param1;
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
      
      public function get currentTab() : int
      {
         if(this._currentTab != CraftingChooseTabs.NONE)
         {
            return this._currentTab;
         }
         return CraftingChooseTabs.CAGES;
      }
      
      public function get search_text() : String
      {
         return this._search_text;
      }
      
      public function set search_text(param1:String) : void
      {
         this._search_text = param1;
      }
      
      public function get craftingProxy() : CraftingProxy
      {
         if(this._craftingProxy == null)
         {
            this._craftingProxy = facade.retrieveProxy(CraftingProxy.NAME) as CraftingProxy;
         }
         return this._craftingProxy;
      }
      
      public function get shopProxy() : ShopProxy
      {
         if(this._shopProxy == null)
         {
            this._shopProxy = facade.retrieveProxy(ShopProxy.NAME) as ShopProxy;
         }
         return this._shopProxy;
      }
   }
}

