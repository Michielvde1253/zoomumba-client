package com.bigpoint.zoomumba.view.windows.recycling
{
   import com.bigpoint.zoomumba.model.app.resources.AssetLibrary;
   import com.bigpoint.zoomumba.model.app.resources.decoder.SWFAsset;
   import com.bigpoint.zoomumba.model.cards.vo.CardHolderModes;
   import com.bigpoint.zoomumba.model.features.recycling.RecyclingProxy;
   import com.bigpoint.zoomumba.model.features.recycling.vo.RecyclingCardInfoVo;
   import com.bigpoint.zoomumba.model.inventory.InventoryProxy;
   import com.bigpoint.zoomumba.model.parser.vo.RewardItemVo;
   import com.bigpoint.zoomumba.model.parser.vo.RewardItemsVo;
   import com.bigpoint.zoomumba.model.playfield.PlayFieldProxy;
   import com.bigpoint.zoomumba.model.user.material.MaterialProxy;
   import com.bigpoint.zoomumba.view.cards.group.CardGroupHolderMediator;
   import com.bigpoint.zoomumba.view.windowSystem.WindowMediator;
   import com.bigpoint.zoorama.data.settings.MaterialShopData;
   import com.bigpoint.zoorama.utils.configModules.TextResourceModule;
   import org.puremvc.as3.interfaces.INotification;
   import windows.custom.recycling.RecyclingRewardContent;
   import windows.custom.recycling.RecyclingRewardWindow;
   
   public class RecyclingRewardWindowMediator extends WindowMediator
   {
      public static const NAME:String = "RecyclingRewardWindowMediator";
      
      private var window:RecyclingRewardWindow;
      
      private var _recyclingProxy:RecyclingProxy;
      
      private var _inventoryProxy:InventoryProxy;
      
      private var _selectedSlotItem:RecyclingCardInfoVo;
      
      private var _materialProxy:MaterialProxy;
      
      private var _playfieldProxy:PlayFieldProxy;
      
      private var _rewardItems:RewardItemsVo;
      
      private var _cardGroupHolderMediator:CardGroupHolderMediator;
      
      public function RecyclingRewardWindowMediator(param1:RecyclingRewardWindow)
      {
         super(NAME,param1);
         this.window = param1;
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
      }
      
      override public function init(param1:Object) : void
      {
         this._rewardItems = param1 as RewardItemsVo;
         this.window.preloaderVisibility = true;
         AssetLibrary.sendAssetToFunction("RecyclingRewardWindow",this.handleAssetLoad);
      }
      
      private function handleAssetLoad(param1:SWFAsset) : void
      {
         this.content.background.source = param1.getEmbededBitmapData("background");
         this.content.vollAssiToni.source = param1.getEmbededBitmapData("vollassitoni");
         this.content.stars.source = param1.getEmbededBitmapData("stars");
         this.window.preloaderVisibility = false;
         this.content.titletext.text = TextResourceModule.getText("zoo.window.infoLayers.itemreward." + this._rewardItems.rewardViewType + ".title");
         this.content.subtext.text = TextResourceModule.getText("zoo.window.infoLayers.itemreward." + this._rewardItems.rewardViewType + ".info");
         this.createRecyclingCards();
      }
      
      private function createRecyclingCards() : void
      {
         var _loc2_:MaterialShopData = null;
         var _loc3_:RewardItemVo = null;
         if(this._rewardItems.items.length == 1)
         {
            this.content.cardGroupHolder.width = 130;
            this.content.cardGroupHolder.horizontalCenter = 140;
         }
         else if(this._rewardItems.items.length == 2)
         {
            this.content.cardGroupHolder.width = 260;
            this.content.cardGroupHolder.horizontalCenter = 105;
         }
         else
         {
            this.content.cardGroupHolder.width = 390;
            this.content.cardGroupHolder.horizontalCenter = 85;
         }
         if(this._cardGroupHolderMediator == null)
         {
            this._cardGroupHolderMediator = new CardGroupHolderMediator(this.content.cardGroupHolder,CardHolderModes.ITEM_REWARD_MODE);
            facade.registerMediator(this._cardGroupHolderMediator);
            this.content.cardGroupHolder.paginator.entriesPerPage = 3;
         }
         this._cardGroupHolderMediator.forceRemoveItems();
         this._cardGroupHolderMediator.onRemove();
         this._cardGroupHolderMediator.mode = CardHolderModes.ITEM_REWARD_MODE;
         var _loc1_:Vector.<Object> = new Vector.<Object>();
         for each(_loc3_ in this._rewardItems.items)
         {
            _loc2_ = this.playfieldProxy.getMaterialShopDataById(_loc3_.id);
            if(_loc2_)
            {
               _loc2_.count = _loc3_.amount;
               _loc1_.push(_loc2_);
            }
         }
         this._cardGroupHolderMediator.dataProvider = _loc1_;
      }
      
      public function get content() : RecyclingRewardContent
      {
         return this.window.getContent(0) as RecyclingRewardContent;
      }
      
      public function get playfieldProxy() : PlayFieldProxy
      {
         if(this._playfieldProxy == null)
         {
            this._playfieldProxy = facade.getProxy(PlayFieldProxy) as PlayFieldProxy;
         }
         return this._playfieldProxy;
      }
      
      public function get recyclingProxy() : RecyclingProxy
      {
         if(this._recyclingProxy == null)
         {
            this._recyclingProxy = facade.getProxy(RecyclingProxy) as RecyclingProxy;
         }
         return this._recyclingProxy;
      }
      
      public function get inventoryProxy() : InventoryProxy
      {
         if(this._inventoryProxy == null)
         {
            this._inventoryProxy = facade.retrieveProxy(InventoryProxy.NAME) as InventoryProxy;
         }
         return this._inventoryProxy;
      }
      
      public function get materialProxy() : MaterialProxy
      {
         if(this._materialProxy == null)
         {
            this._materialProxy = facade.retrieveProxy(MaterialProxy.NAME) as MaterialProxy;
         }
         return this._materialProxy;
      }
      
      private function removeView() : void
      {
         if(this._cardGroupHolderMediator)
         {
            this._cardGroupHolderMediator.forceRemoveItems();
            this._cardGroupHolderMediator.onRemove();
            facade.removeMediator(CardGroupHolderMediator.NAME + CardHolderModes.ITEM_REWARD_MODE.toString());
            this._cardGroupHolderMediator = null;
         }
      }
      
      override public function dispose() : void
      {
         this.removeView();
         super.dispose();
      }
      
      override public function onRemove() : void
      {
         this.removeView();
         super.onRemove();
      }
   }
}

